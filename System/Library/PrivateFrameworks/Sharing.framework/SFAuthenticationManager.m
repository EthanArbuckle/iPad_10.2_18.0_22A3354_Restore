@implementation SFAuthenticationManager

- (SFAuthenticationManager)initWithQueue:(id)a3
{
  id v5;
  SFAuthenticationManager *v6;
  SFAutoUnlockManager *v7;
  SFAutoUnlockManager *autoUnlockManager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAuthenticationManager;
  v6 = -[SFAuthenticationManager init](&v10, sel_init);
  objc_storeStrong((id *)&v6->_queue, a3);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v7 = objc_alloc_init(SFAutoUnlockManager);
    autoUnlockManager = v6->_autoUnlockManager;
    v6->_autoUnlockManager = v7;

    -[SFAutoUnlockManager setDelegate:](v6->_autoUnlockManager, "setDelegate:", v6);
  }

  return v6;
}

- (BOOL)isEnabledForType:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v13;
  const char *v14;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  dispatch_semaphore_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v21 = dispatch_semaphore_create(0);
  switch(a3)
  {
    case 1uLL:
      if (!SFDeviceSupportsSiriWatchAuth())
        goto LABEL_19;
      v9 = +[SFAutoUnlockManager autoUnlockEnabled](SFAutoUnlockManager, "autoUnlockEnabled");
      goto LABEL_15;
    case 2uLL:
      v9 = -[SFAuthenticationManager isSupportedForType:](self, "isSupportedForType:", 2);
      goto LABEL_15;
    case 3uLL:
    case 4uLL:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        authentications_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "feature flag is disabled", buf, 2u);
        }
        goto LABEL_18;
      }
      v9 = -[SFAuthenticationManager checkDynamicStoreForType:](self, "checkDynamicStoreForType:", a3);
LABEL_15:
      v11 = v9;
      goto LABEL_20;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      if ((_os_feature_enabled_impl() & 1) == 0)
      {
        authentications_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "feature flag is disabled", buf, 2u);
        }
LABEL_18:

        goto LABEL_19;
      }
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__SFAuthenticationManager_isEnabledForType___block_invoke;
      v15[3] = &unk_1E4830420;
      v15[4] = &v22;
      v15[5] = &v16;
      v15[6] = a3;
      objc_msgSend(v5, "unlockManagerWithCompletionHandler:", v15);

      v6 = v17[5];
      v7 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v6, v7))
      {
        authentications_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SFAuthenticationManager isEnabledForType:].cold.1();

LABEL_19:
        v11 = 0;
        goto LABEL_20;
      }
      authentications_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v23 + 24))
          v14 = "yes";
        else
          v14 = "no";
        *(_DWORD *)buf = 136315138;
        v27 = v14;
        _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "Returning Oneness enabled: %s", buf, 0xCu);
      }

      v11 = *((_BYTE *)v23 + 24) != 0;
LABEL_20:
      _Block_object_dispose(&v16, 8);

      _Block_object_dispose(&v22, 8);
      return v11;
    default:
      goto LABEL_19;
  }
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  __int128 v7;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__SFAuthenticationManager_isEnabledForType___block_invoke_272;
    v6[3] = &unk_1E48303F8;
    v7 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v3, "listEligibleDevicesForAuthenticationType:completionHandler:", v4, v6);

  }
  else
  {
    authentications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_272(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if (SFDeviceClassCodeGet() == 5 && (objc_msgSend(v8, "canUnlockDevice", (_QWORD)v10) & 1) != 0
          || SFDeviceClassCodeGet() == 1 && objc_msgSend(v8, "unlockEnabled"))
        {
          authentications_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v15 = v8;
            _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Found device that is eligible for Oneness, returning true, device: %@", buf, 0xCu);
          }

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

          goto LABEL_16;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
LABEL_16:

}

- (id)dynamicStorePathForType:(unint64_t)a3
{
  if (a3 - 3 > 1)
    return 0;
  else
    return CFSTR("com.apple.sharing:/Authentications/BioArm/Enabled");
}

- (BOOL)checkDynamicStoreForType:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  CFTypeID v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SFAuthenticationManager dynamicStorePathForType:](self, "dynamicStorePathForType:", a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
LABEL_12:
    LOBYTE(v12) = 0;
    goto LABEL_13;
  }
  v4 = (__CFString *)SCDynamicStoreCopyValue(0, v3);
  v5 = v4;
  if (!v4 || (v6 = CFGetTypeID(v4), v6 != CFDictionaryGetTypeID()))
  {
    authentications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "No value at path: %@", buf, 0xCu);
    }

    if (v5)
      CFRelease(v5);
    goto LABEL_12;
  }
  authentications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Dynamic store enabled state %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), getuid());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[__CFString objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

  }
  else
  {
    v12 = 0;
  }
  authentications_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v17 = v3;
    v18 = 2112;
    v19 = v8;
    v20 = 1024;
    v21 = v12;
    _os_log_debug_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEBUG, "Dynamic store path: %@, uid: %@, enabled: %d", buf, 0x1Cu);
  }

LABEL_13:
  return v12;
}

- (BOOL)isSupportedForType:(unint64_t)a3
{
  BOOL result;

  switch(a3)
  {
    case 1uLL:
      result = SFDeviceSupportsSiriWatchAuth();
      break;
    case 2uLL:
      result = SFDeviceSupportsNanoWallet();
      break;
    case 3uLL:
    case 4uLL:
      result = SFDeviceSupportsUnlockClassC();
      break;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      result = SFDeviceSupportsMacUnlockPhonePairing();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)listEligibleDevicesForType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  unint64_t v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  authentications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "List eligible devices for %@", buf, 0xCu);
  }

  if (v6)
  {
    if (-[SFAuthenticationManager isSupportedForType:](self, "isSupportedForType:", a3))
    {
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke;
      v19[3] = &unk_1E4830490;
      v21 = a3;
      v20 = v6;
      objc_msgSend(v9, "unlockManagerWithCompletionHandler:", v19);

      v10 = v20;
    }
    else
    {
      authentications_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:].cold.2(a3, v11, v12, v13, v14, v15, v16, v17);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SFKAuthenticationErrorDomain, 19, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, NSObject *))v6 + 2))(v6, v18, v10);

    }
  }
  else
  {
    authentications_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:].cold.1();
  }

}

void __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_282);
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke_283;
    v5[3] = &unk_1E4830468;
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    -[NSObject listEligibleDevicesForAuthenticationType:completionHandler:](v3, "listEligibleDevicesForAuthenticationType:completionHandler:", v4, v5);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
  }

}

void __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

uint64_t __72__SFAuthenticationManager_listEligibleDevicesForType_completionHandler___block_invoke_283(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listCandidateDevicesForType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  unint64_t v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  authentications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "List candidate devices for %@", buf, 0xCu);
  }

  if (v6)
  {
    if (-[SFAuthenticationManager isSupportedForType:](self, "isSupportedForType:", a3))
    {
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke;
      v19[3] = &unk_1E4830490;
      v21 = a3;
      v20 = v6;
      objc_msgSend(v9, "unlockManagerWithCompletionHandler:", v19);

      v10 = v20;
    }
    else
    {
      authentications_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:].cold.2(a3, v11, v12, v13, v14, v15, v16, v17);

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", SFKAuthenticationErrorDomain, 19, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, NSObject *))v6 + 2))(v6, v18, v10);

    }
  }
  else
  {
    authentications_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationManager listEligibleDevicesForType:completionHandler:].cold.1();
  }

}

void __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_284);
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke_285;
    v5[3] = &unk_1E4830468;
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    -[NSObject listEligibleDevicesForAuthenticationType:completionHandler:](v3, "listEligibleDevicesForAuthenticationType:completionHandler:", v4, v5);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();
  }

}

void __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

void __73__SFAuthenticationManager_listCandidateDevicesForType_completionHandler___block_invoke_285(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SFAuthenticationDevice *v14;
  SFAuthenticationDevice *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        v14 = [SFAuthenticationDevice alloc];
        v15 = -[SFAuthenticationDevice initWith:](v14, "initWith:", v13, (_QWORD)v16);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)osFeatureEnabledForType:(unint64_t)a3
{
  if (a3 - 3 > 4)
    return 1;
  else
    return _os_feature_enabled_impl();
}

- (id)enableForType:(unint64_t)a3 device:(id)a4 passcode:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  authentications_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v11 = CFSTR("Unknown");
    else
      v11 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412546;
    v25 = v11;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1A2830000, v10, OS_LOG_TYPE_DEFAULT, "Begin enabling authentication for %@ on %@", buf, 0x16u);
  }

  if (-[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__SFAuthenticationManager_enableForType_device_passcode___block_invoke;
    v19[3] = &unk_1E48304D8;
    v19[4] = self;
    v23 = a3;
    v20 = v8;
    v21 = v9;
    v14 = v12;
    v22 = v14;
    objc_msgSend(v13, "unlockManagerWithCompletionHandler:", v19);

    v15 = v22;
    v16 = v14;

    v17 = v16;
  }
  else
  {
    authentications_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationManager enableForType:device:passcode:].cold.1();
    v17 = 0;
  }

  return v17;
}

void __57__SFAuthenticationManager_enableForType_device_passcode___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_290);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enableUsingClientProxy:authenticationType:device:passcode:sessionID:", a1[4], a1[8], a1[5], a1[6], a1[7]);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __57__SFAuthenticationManager_enableForType_device_passcode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (id)requestEnablementForType:(unint64_t)a3 withDevice:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticationManager requestEnablementForType:withIDSDeviceID:](self, "requestEnablementForType:withIDSDeviceID:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)requestEnablementForType:(unint64_t)a3 withIDSDeviceID:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  unint64_t v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  authentications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Begin requesting enablement for %@ on %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:", a3))
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__SFAuthenticationManager_requestEnablementForType_withIDSDeviceID___block_invoke;
    v15[3] = &unk_1E4830520;
    v15[4] = self;
    v18 = a3;
    v16 = v6;
    v11 = v9;
    v17 = v11;
    objc_msgSend(v10, "unlockManagerWithCompletionHandler:", v15);

    v12 = v17;
    v13 = v11;

  }
  else
  {
    authentications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationManager requestEnablementForType:withIDSDeviceID:].cold.1();
  }

  return v9;
}

void __68__SFAuthenticationManager_requestEnablementForType_withIDSDeviceID___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_291);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestEnablementUsingClientProxy:authenticationType:device:sessionID:", a1[4], a1[7], a1[5], a1[6]);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __68__SFAuthenticationManager_requestEnablementForType_withIDSDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (id)disableForType:(unint64_t)a3 device:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  authentications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Disabling authentication for %@ on %@", buf, 0x16u);
  }

  if (-[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__SFAuthenticationManager_disableForType_device___block_invoke;
    v16[3] = &unk_1E4830520;
    v16[4] = self;
    v19 = a3;
    v17 = v6;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v10, "unlockManagerWithCompletionHandler:", v16);

    v12 = v18;
    v13 = v11;

    v14 = v13;
  }
  else
  {
    authentications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationManager enableForType:device:passcode:].cold.1();
    v14 = 0;
  }

  return v14;
}

void __49__SFAuthenticationManager_disableForType_device___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_292);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableUsingClientProxy:authenticationType:device:sessionID:", v4, v3, v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    authentications_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __49__SFAuthenticationManager_disableForType_device___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (id)disableForType:(unint64_t)a3 withIDSDeviceID:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  authentications_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v8 = CFSTR("Unknown");
    else
      v8 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Disabling authentication for %@ with deviceID %@", buf, 0x16u);
  }

  if (-[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__SFAuthenticationManager_disableForType_withIDSDeviceID___block_invoke;
    v16[3] = &unk_1E4830520;
    v16[4] = self;
    v19 = a3;
    v17 = v6;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v10, "unlockManagerWithCompletionHandler:", v16);

    v12 = v18;
    v13 = v11;

    v14 = v13;
  }
  else
  {
    authentications_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationManager enableForType:device:passcode:].cold.1();
    v14 = 0;
  }

  return v14;
}

void __58__SFAuthenticationManager_disableForType_withIDSDeviceID___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_293);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableUsingClientProxy:authenticationType:device:sessionID:", a1[4], a1[7], a1[5], a1[6]);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __58__SFAuthenticationManager_disableForType_withIDSDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (id)authenticateForType:(unint64_t)a3
{
  SFAuthenticationOptions *v5;
  void *v6;

  v5 = objc_alloc_init(SFAuthenticationOptions);
  -[SFAuthenticationManager authenticateForType:withOptions:](self, "authenticateForType:withOptions:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)authenticateForType:(unint64_t)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  char v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  authentications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v9 = CFSTR("Unknown");
    else
      v9 = off_1E48307F0[a3];
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Begin authentication for %@", buf, 0xCu);
  }

  if (-[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:", a3))
  {
    v10 = _os_feature_enabled_impl();
    if (a3 != 1 || (v10 & 1) != 0)
    {
      +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__SFAuthenticationManager_authenticateForType_withOptions___block_invoke;
      v14[3] = &unk_1E4830520;
      v14[4] = self;
      v17 = a3;
      v15 = v7;
      v16 = v6;
      objc_msgSend(v12, "unlockManagerWithCompletionHandler:", v14);

      goto LABEL_14;
    }
    -[SFAuthenticationManager autoUnlockManager](self, "autoUnlockManager");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject attemptAutoUnlockForSiri](v11, "attemptAutoUnlockForSiri");
  }
  else
  {
    authentications_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Feature Flag disabled", buf, 2u);
    }
  }

LABEL_14:
  return v7;
}

void __59__SFAuthenticationManager_authenticateForType_withOptions___block_invoke(_QWORD *a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_295_0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authenticateUsingClientProxy:type:sessionID:options:", a1[4], a1[7], a1[5], a1[6]);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __59__SFAuthenticationManager_authenticateForType_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (void)cancelAuthenticationSessionWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SFAuthenticationManager_cancelAuthenticationSessionWithID___block_invoke;
    v7[3] = &unk_1E482EC68;
    v8 = v4;
    objc_msgSend(v5, "unlockManagerWithCompletionHandler:", v7);

  }
  else
  {
    -[SFAuthenticationManager autoUnlockManager](self, "autoUnlockManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelAutoUnlock");

  }
}

void __61__SFAuthenticationManager_cancelAuthenticationSessionWithID___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_296_0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelAuthenticationSessionWithID:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __61__SFAuthenticationManager_cancelAuthenticationSessionWithID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (void)waitForApprovalRequestsForType:(unint64_t)a3
{
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[16];

  v5 = -[SFAuthenticationManager osFeatureEnabledForType:](self, "osFeatureEnabledForType:");
  authentications_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v7, OS_LOG_TYPE_DEFAULT, "Client registered for approval requests", buf, 2u);
    }

    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__SFAuthenticationManager_waitForApprovalRequestsForType___block_invoke;
    v8[3] = &unk_1E48305A8;
    v8[4] = self;
    v8[5] = a3;
    -[NSObject unlockManagerWithCompletionHandler:](v7, "unlockManagerWithCompletionHandler:", v8);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[SFAuthenticationManager waitForApprovalRequestsForType:].cold.1();
  }

}

void __58__SFAuthenticationManager_waitForApprovalRequestsForType___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_297);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerForApprovalRequestsUsingClientProxy:forType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __58__SFAuthenticationManager_waitForApprovalRequestsForType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (void)startObservingForAuthenticationStateChanges:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  SFAuthenticationStateChangesObserver *v8;
  void *v9;
  void *v10;
  SFAuthenticationStateChangesObserver *v11;
  _QWORD v12[4];
  SFAuthenticationStateChangesObserver *v13;

  v6 = a4;
  v7 = a3;
  -[SFAuthenticationManager stopObservingForAuthenticationStateChanges](self, "stopObservingForAuthenticationStateChanges");
  v8 = -[SFAuthenticationStateChangesObserver initWithObserver:queue:]([SFAuthenticationStateChangesObserver alloc], "initWithObserver:queue:", v7, v6);

  -[SFAuthenticationStateChangesObserver identifier](v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticationManager setLatestAuthenticationStateChangeObserverIdentifier:](self, "setLatestAuthenticationStateChangeObserverIdentifier:", v9);

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__SFAuthenticationManager_startObservingForAuthenticationStateChanges_queue___block_invoke;
  v12[3] = &unk_1E482EC68;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "unlockManagerWithCompletionHandler:", v12);

}

void __77__SFAuthenticationManager_startObservingForAuthenticationStateChanges_queue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_299);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startObservingAuthentationStateChangesWithObserver:forIdentifier:", v3, v4);

  }
  else
  {
    authentications_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __77__SFAuthenticationManager_startObservingForAuthenticationStateChanges_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (void)stopObservingForAuthenticationStateChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[SFAuthenticationManager latestAuthenticationStateChangeObserverIdentifier](self, "latestAuthenticationStateChangeObserverIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFAuthenticationManager latestAuthenticationStateChangeObserverIdentifier](self, "latestAuthenticationStateChangeObserverIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAuthenticationManager setLatestAuthenticationStateChangeObserverIdentifier:](self, "setLatestAuthenticationStateChangeObserverIdentifier:", 0);
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__SFAuthenticationManager_stopObservingForAuthenticationStateChanges__block_invoke;
    v7[3] = &unk_1E482EC68;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "unlockManagerWithCompletionHandler:", v7);

  }
}

void __69__SFAuthenticationManager_stopObservingForAuthenticationStateChanges__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_300);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopObservingAuthentationStateChangesForIdentifier:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __69__SFAuthenticationManager_stopObservingForAuthenticationStateChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (BOOL)declinedToEnableForType:(unint64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  authentications_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 8)
      v5 = CFSTR("Unknown");
    else
      v5 = off_1E48307F0[a3];
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Stub for declinedToEnableForType:%@", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)manager:(id)a3 beganAttemptWithDevice:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[SFAuthenticationManager queue](self, "queue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SFAuthenticationManager_manager_beganAttemptWithDevice___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(v5, block);

}

void __58__SFAuthenticationManager_manager_beganAttemptWithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manager:didStartAuthenticationForSessionWithID:", v4, v5);

  }
}

- (void)manager:(id)a3 completedUnlockWithDevice:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[SFAuthenticationManager queue](self, "queue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SFAuthenticationManager_manager_completedUnlockWithDevice___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(v5, block);

}

void __61__SFAuthenticationManager_manager_completedUnlockWithDevice___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manager:didCompleteAuthenticationForSessionWithID:", v4, v5);

  }
}

- (void)manager:(id)a3 failedAttemptWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SFAuthenticationManager *v10;

  v5 = a4;
  -[SFAuthenticationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SFAuthenticationManager_manager_failedAttemptWithError___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __58__SFAuthenticationManager_manager_failedAttemptWithError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "code") == 218
    && (objc_msgSend(*(id *)(a1 + 40), "delegate"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_opt_respondsToSelector(),
        v2,
        (v3 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "manager:didCompleteAuthenticationForSessionWithID:", v4, v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "manager:didFailAuthenticationForSessionWithID:error:", v8, v5, *(_QWORD *)(a1 + 32));
  }

}

- (void)enabledAuthenticationSessionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  authentications_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication enablement completed for %@", buf, 0xCu);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SFAuthenticationManager_enabledAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __62__SFAuthenticationManager_enabledAuthenticationSessionWithID___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didEnableAuthenticationForSessionWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)failedToEnableDeviceForSessionID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  authentications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client enablement for authentication failed for %@ error: %@", buf, 0x16u);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SFAuthenticationManager_failedToEnableDeviceForSessionID_error___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __66__SFAuthenticationManager_failedToEnableDeviceForSessionID_error___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didFailToEnableDeviceForSessionWithID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)disabledAuthenticationSessionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  authentications_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication disablement completed for %@", buf, 0xCu);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__SFAuthenticationManager_disabledAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __63__SFAuthenticationManager_disabledAuthenticationSessionWithID___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didDisableAuthenticationForSessionWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)failedToDisableDeviceForSessionID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  authentications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client disablement for authentication failed for %@ error: %@", buf, 0x16u);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFAuthenticationManager_failedToDisableDeviceForSessionID_error___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __67__SFAuthenticationManager_failedToDisableDeviceForSessionID_error___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didFailToDisableDeviceForSessionWithID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)startedAuthenticationSessionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  authentications_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication started for %@", buf, 0xCu);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SFAuthenticationManager_startedAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __62__SFAuthenticationManager_startedAuthenticationSessionWithID___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didStartAuthenticationForSessionWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)completedAuthenticationSessionWithID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  authentications_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Notifying client authentication completed for %@", buf, 0xCu);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__SFAuthenticationManager_completedAuthenticationSessionWithID___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __64__SFAuthenticationManager_completedAuthenticationSessionWithID___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didCompleteAuthenticationForSessionWithID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)failedAuthenticationSessionWithID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  authentications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client authentication failed for %@ error: %@", buf, 0x16u);
  }

  -[SFAuthenticationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFAuthenticationManager_failedAuthenticationSessionWithID_error___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __67__SFAuthenticationManager_failedAuthenticationSessionWithID_error___block_invoke(uint64_t a1)
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
    objc_msgSend(v4, "manager:didFailAuthenticationForSessionWithID:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)receivedApproveRequestForSessionID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  authentications_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_DEFAULT, "Notifying client of incoming approve request for sessionID %@ for %@", buf, 0x16u);

  }
  -[SFAuthenticationManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2;
    v15[3] = &unk_1E4830638;
    v8 = &v16;
    v16 = v5;
    objc_msgSend(v4, "manager:didReceiveRequestToApproveForSessionID:info:completionHandler:", v6, v16, v7, v15);
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      return;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_322;
    v13[3] = &unk_1E482F150;
    v8 = &v14;
    v14 = v10;
    objc_msgSend(v4, "manager:didReceiveRequestToApproveForSessionWithID:info:completionHandler:", v11, v14, v12, v13);
  }

}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_3;
  v10[3] = &unk_1E4830610;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "unlockManagerWithCompletionHandler:", v10);

}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_3(_QWORD *a1, void *a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_318);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportUserApprovalWithACMToken:error:sessionID:", a1[4], a1[5], a1[6]);

  }
  else
  {
    authentications_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_322(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2_323;
  v8[3] = &unk_1E4830680;
  v11 = a2;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v6, "unlockManagerWithCompletionHandler:", v8);

}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_2_323(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_325_0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(v5, "reportUserApprovalWithACMToken:error:sessionID:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    authentications_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1();

  }
}

void __67__SFAuthenticationManager_receivedApproveRequestForSessionID_info___block_invoke_3_324(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  authentications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1();

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SFAuthenticationManagerDelegate)delegate
{
  return (SFAuthenticationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFAutoUnlockManager)autoUnlockManager
{
  return self->_autoUnlockManager;
}

- (NSUUID)latestAuthenticationStateChangeObserverIdentifier
{
  return self->_latestAuthenticationStateChangeObserverIdentifier;
}

- (void)setLatestAuthenticationStateChangeObserverIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_latestAuthenticationStateChangeObserverIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAuthenticationStateChangeObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)isEnabledForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Timed out waiting for completion, returning that oneness is not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Missing proxy object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __44__SFAuthenticationManager_isEnabledForType___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, v0, v1, "Failed to retrieve remote object: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)listEligibleDevicesForType:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Missing completion handler, returning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)listEligibleDevicesForType:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a2, a3, "%@ is unsupported, not calling into sharing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)enableForType:device:passcode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)requestEnablementForType:withIDSDeviceID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Feature Flag Not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)waitForApprovalRequestsForType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Feature flag not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
