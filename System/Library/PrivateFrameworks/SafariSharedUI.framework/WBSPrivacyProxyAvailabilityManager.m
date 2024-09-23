@implementation WBSPrivacyProxyAvailabilityManager

- (BOOL)isPrivacyProxyActive
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  if (!-[WBSPrivacyProxyAvailabilityManager isPrivacyProxyFreeTierAvailable](self, "isPrivacyProxyFreeTierAvailable"))
    return 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_isPrivacyProxyActiveOnDefaultNetwork && self->_privacyProxyServiceStatus == 1;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPrivacyProxyFreeTierAvailable
{
  return 1;
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t privacyProxyTrafficBitfield;
  _BOOL4 isPrivacyProxyOnInICloudSettings;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  privacyProxyTrafficBitfield = self->_privacyProxyTrafficBitfield;
  isPrivacyProxyOnInICloudSettings = self->_isPrivacyProxyOnInICloudSettings;
  os_unfair_lock_unlock(p_lock);
  if ((privacyProxyTrafficBitfield & 8) == 0 || !isPrivacyProxyOnInICloudSettings)
    return (privacyProxyTrafficBitfield >> 2) & 1;
  else
    return 2;
}

- (WBSPrivacyProxyAvailabilityManager)init
{
  WBSPrivacyProxyAvailabilityManager *v2;
  WBSPrivacyProxyAvailabilityManager *v3;
  id v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *notificationQueue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  WBSPrivacyProxyAvailabilityManager *v20;
  WBSPrivacyProxyAvailabilityManager *v21;
  _QWORD block[4];
  WBSPrivacyProxyAvailabilityManager *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WBSPrivacyProxyAvailabilityManager;
  v2 = -[WBSPrivacyProxyAvailabilityManager init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSPrivacyProxyAvailabilityManager.%@.%p.internalQueue"), objc_opt_class(), v2);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSPrivacyProxyAvailabilityManager.%@.%p.notificationQueue"), objc_opt_class(), v3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isPrivacyProxyOnInICloudSettings = objc_msgSend(v10, "BOOLForKey:", *MEMORY[0x1E0D8A518]);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isPrivacyProxyPaidTierUnavailableInUserCountry = objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E0D8A520]);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E0D8A528]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_privacyProxyTrafficBitfield = objc_msgSend(v13, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E0D8A500]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_privacyProxyAccountType = objc_msgSend(v15, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safari_numberForKey:", *MEMORY[0x1E0D8A510]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_privacyProxyServiceStatus = objc_msgSend(v17, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_isPrivacyProxyActiveOnDefaultNetwork = objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x1E0D8A508]);

    v19 = v3->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke;
    block[3] = &unk_1E5441CB8;
    v20 = v3;
    v24 = v20;
    dispatch_async(v19, block);
    v21 = v20;

  }
  return v3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)_isPrivacyProxyActiveForInterface:(id)a3 networkStatuses:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "type") == 4 || !objc_msgSend(v5, "type"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "networkType", (_QWORD)v17);
          if (v12 == 3)
          {
            if (objc_msgSend(v5, "type") == 3)
            {
              objc_msgSend(v5, "interfaceName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "networkName");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqualToString:", v14);

              if ((v15 & 1) != 0)
              {
LABEL_21:
                LOBYTE(v8) = objc_msgSend(v11, "networkStatus") == 1;
                goto LABEL_22;
              }
            }
          }
          else if (v12 == 2)
          {
            if (objc_msgSend(v5, "type") == 2)
              goto LABEL_21;
          }
          else if (v12 == 1 && objc_msgSend(v5, "type") == 1)
          {
            goto LABEL_21;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_22:

  }
  return v8;
}

uint64_t __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("WBSPrivacyProxyChangeNotification"), *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2;
  v2[3] = &unk_1E5441CB8;
  v3 = v1;
  objc_msgSend(v3, "_updatePrivacyProxyStateWithCompletionHandler:", v2);

}

- (void)_updatePrivacyProxyStateWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_group_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD activity_block[4];
  NSObject *v14;
  dispatch_group_t v15;
  WBSPrivacyProxyAvailabilityManager *v16;
  id v17;
  os_signpost_id_t v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = dispatch_group_create();
  WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A840B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Update iCloud Private Relay State", (const char *)&unk_1A84E7B6B, buf, 2u);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke;
  activity_block[3] = &unk_1E54452C8;
  v14 = v9;
  v15 = v5;
  v17 = v4;
  v18 = v7;
  v16 = self;
  v10 = v4;
  v11 = v5;
  v12 = v9;
  _os_activity_initiate(&dword_1A840B000, "Update iCloud Private Relay State", OS_ACTIVITY_FLAG_DETACHED, activity_block);

}

uint64_t __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "_registerForPrivacyProxyChangeNotifications");
  return objc_msgSend(*(id *)(a1 + 32), "_registerForDefaultNetworkInterfaceChangeNotifications");
}

- (void)_registerForPrivacyProxyChangeNotifications
{
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, a2, a3, "Failed to listen to privacy proxy configuration change notification: %i", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_registerForDefaultNetworkInterfaceChangeNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 7, 0);

}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id PrivacyProxyClientClass;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD *v28;
  uint8_t *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  _QWORD *v38;
  uint8_t *v39;
  _QWORD v40[4];
  id v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  _QWORD *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD *v52;
  os_signpost_id_t v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[3];
  char v61;
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[3];
  char v66;
  _QWORD v67[3];
  char v68;

  v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A840B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Query iCloud Feature Availability", (const char *)&unk_1A84E7B6B, buf, 2u);
  }

  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  v61 = 0;
  *(_QWORD *)buf = 0;
  v55 = buf;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__15;
  v58 = __Block_byref_object_dispose__15;
  v59 = 0;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D8A0D0], "porcupineAvailabilityObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_19;
  v49[3] = &unk_1E5445228;
  v52 = v67;
  v50 = *(id *)(a1 + 40);
  v51 = *(id *)(a1 + 32);
  v53 = v2;
  objc_msgSend(v5, "getFeatureEligibilityWithCompletionHandler:", v49);

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  PrivacyProxyClientClass = getPrivacyProxyClientClass();
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  v46[0] = v6;
  v46[1] = 3221225472;
  v46[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_21;
  v46[3] = &unk_1E5445250;
  v47 = v8;
  v48 = v65;
  objc_msgSend(PrivacyProxyClientClass, "getUserTier:completionHandler:", v9, v46);
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v10 = getPrivacyProxyClientClass();
  v11 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_23;
  v43[3] = &unk_1E5445250;
  v44 = v11;
  v45 = v64;
  objc_msgSend(v10, "getTrafficState:completionandler:", v12, v43);
  getPrivacyProxyClientClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v13 = getPrivacyProxyClientClass();
    v14 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
    v40[0] = v6;
    v40[1] = 3221225472;
    v40[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_26;
    v40[3] = &unk_1E5445250;
    v41 = v14;
    v42 = v63;
    objc_msgSend(v13, "getPrivacyProxyAccountType:completionHandler:", v15, v40);

  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v16 = getPrivacyProxyClientClass();
  v17 = *(void **)(a1 + 40);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  v36[0] = v6;
  v36[1] = 3221225472;
  v36[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27;
  v36[3] = &unk_1E5445278;
  v37 = v17;
  v38 = v62;
  v39 = buf;
  objc_msgSend(v16, "getServiceStatus:completionHandler:", v18, v36);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(NSObject **)(v19 + 16);
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_29;
  v25[3] = &unk_1E54452A0;
  v28 = v60;
  v29 = buf;
  v25[4] = v19;
  v30 = v67;
  v31 = v65;
  v32 = v64;
  v33 = v63;
  v34 = v62;
  v21 = *(NSObject **)(a1 + 40);
  v22 = *(id *)(a1 + 32);
  v24 = *(void **)(a1 + 56);
  v23 = *(_QWORD *)(a1 + 64);
  v26 = v22;
  v35 = v23;
  v27 = v24;
  dispatch_group_notify(v21, v20, v25);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27_cold_1(v7);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "serviceStatus");
    objc_msgSend(v5, "networkStatuses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_23_cold_1(v6);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v7 = *MEMORY[0x1E0CB2CB8];
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v10, "isEqualToPath:", v9) & 1) == 0)
      -[WBSPrivacyProxyAvailabilityManager _updatePrivacyProxyStateWithCompletionHandler:](self, "_updatePrivacyProxyStateWithCompletionHandler:", 0);
  }

}

+ (WBSPrivacyProxyAvailabilityManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WBSPrivacyProxyAvailabilityManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (WBSPrivacyProxyAvailabilityManager *)(id)sharedManager_manager_0;
}

void __51__WBSPrivacyProxyAvailabilityManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_privacyProxyConfigurationChangeNotificationToken);
  notify_cancel(self->_privacyProxyServiceStatusChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)WBSPrivacyProxyAvailabilityManager;
  -[WBSPrivacyProxyAvailabilityManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isPrivacyProxyOnForEitherTier
{
  return -[WBSPrivacyProxyAvailabilityManager state](self, "state") != 0;
}

- (BOOL)isPrivacyProxyOnInICloudSettings
{
  WBSPrivacyProxyAvailabilityManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isPrivacyProxyOnInICloudSettings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isUserAccountInSubscriberTierForPrivacyProxy
{
  os_unfair_lock_s *p_lock;
  unint64_t privacyProxyAccountType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  privacyProxyAccountType = self->_privacyProxyAccountType;
  os_unfair_lock_unlock(p_lock);
  return privacyProxyAccountType == 2;
}

- (BOOL)isPrivacyProxyRestrictedToTrackersByUser
{
  _BOOL4 v3;

  v3 = -[WBSPrivacyProxyAvailabilityManager isPrivacyProxyOnInICloudSettings](self, "isPrivacyProxyOnInICloudSettings");
  if (v3)
    LOBYTE(v3) = -[WBSPrivacyProxyAvailabilityManager state](self, "state") == 1;
  return v3;
}

- (BOOL)isPrivacyProxySetToTrackersAndWebsites
{
  _BOOL4 v3;

  v3 = -[WBSPrivacyProxyAvailabilityManager isPrivacyProxyOnInICloudSettings](self, "isPrivacyProxyOnInICloudSettings");
  if (v3)
    LOBYTE(v3) = -[WBSPrivacyProxyAvailabilityManager state](self, "state") == 2;
  return v3;
}

- (BOOL)isPrivacyProxyPaidTierUnavailableInUserCountry
{
  WBSPrivacyProxyAvailabilityManager *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isPrivacyProxyPaidTierUnavailableInUserCountry;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)shouldPromptUsersToTurnOnPrivateRelayForSafari
{
  if (-[WBSPrivacyProxyAvailabilityManager isPrivacyProxyPaidTierUnavailableInUserCountry](self, "isPrivacyProxyPaidTierUnavailableInUserCountry"))
  {
    return 0;
  }
  if (-[WBSPrivacyProxyAvailabilityManager isPrivacyProxyOnInICloudSettings](self, "isPrivacyProxyOnInICloudSettings"))
    return -[WBSPrivacyProxyAvailabilityManager state](self, "state") != 2;
  return -[WBSPrivacyProxyAvailabilityManager isUserAccountInSubscriberTierForPrivacyProxy](self, "isUserAccountInSubscriberTierForPrivacyProxy");
}

- (BOOL)shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy
{
  return !-[WBSPrivacyProxyAvailabilityManager isPrivacyProxyPaidTierUnavailableInUserCountry](self, "isPrivacyProxyPaidTierUnavailableInUserCountry");
}

- (BOOL)isPrivacyProxyRoutingUnencryptedTrafficInEnhancedPrivacyMode
{
  os_unfair_lock_s *p_lock;
  unint64_t privacyProxyTrafficBitfield;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  privacyProxyTrafficBitfield = self->_privacyProxyTrafficBitfield;
  os_unfair_lock_unlock(p_lock);
  return (privacyProxyTrafficBitfield >> 18) & 1;
}

- (void)setPrivacyProxyEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = a4;
  v6 = -[WBSPrivacyProxyAvailabilityManager isUserAccountInSubscriberTierForPrivacyProxy](self, "isUserAccountInSubscriberTierForPrivacyProxy");
  v7 = 2;
  if (!v4)
    v7 = 0;
  if (v6)
    v8 = v7;
  else
    v8 = v4;
  -[WBSPrivacyProxyAvailabilityManager setPrivacyProxyState:completionHandler:](self, "setPrivacyProxyState:completionHandler:", v8, v9);

}

- (void)setPrivacyProxyState:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke;
  block[3] = &unk_1E5445200;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id PrivacyProxyClientClass;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t v39;
  _QWORD block[4];
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  v4 = *(_QWORD *)(v2 + 48);
  v5 = *(unsigned __int8 *)(v2 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 8));
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v3 & 0xFFFFFFFFFFFFFFF3;
  if (v6)
    v7 = v3;
  if (v6 == 1)
    v7 = v3 & 0xFFFFFFFFFFFFFFF3 | 4;
  if (v6 == 2)
    v8 = v3 | 0xC;
  else
    v8 = v7;
  if (v5)
    v9 = 0;
  else
    v9 = v4 == 2;
  v11 = v9 && v6 == 2;
  if (v3 != v8 || (v11 & 1) != 0)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v43 = v8;
      _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_DEFAULT, "Changing state to 0x%llx", buf, 0xCu);
    }
    v21 = dispatch_group_create();
    v22 = v21;
    if (v11)
    {
      dispatch_group_enter(v21);
      PrivacyProxyClientClass = getPrivacyProxyClientClass();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_13;
      v37[3] = &unk_1E54451B0;
      v25 = v22;
      v26 = *(_QWORD *)(a1 + 32);
      v38 = v25;
      v39 = v26;
      objc_msgSend(PrivacyProxyClientClass, "setUserTier:queue:completionHandler:", 2, v24, v37);

    }
    dispatch_group_enter(v22);
    v27 = getPrivacyProxyClientClass();
    v28 = *(void **)(a1 + 40);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_15;
    v32[3] = &unk_1E54451D8;
    v33 = v22;
    v30 = v28;
    v34 = *(_QWORD *)(a1 + 32);
    v35 = v30;
    v36 = v8;
    v31 = v22;
    objc_msgSend(v27, "setTrafficState:proxyTraffic:queue:completionHandler:", 3932191, v8, v29, v32);
    dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    if (*(_QWORD *)(a1 + 40))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_2;
      block[3] = &unk_1E54423D0;
      v41 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    v12 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

uint64_t __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_13_cold_1(v4);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_15_cold_1(v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = *(_QWORD *)(a1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_16;
    v7[3] = &unk_1E5443108;
    v6 = *(void **)(a1 + 48);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_16(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("WBSPrivacyProxyChangeNotification"), *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_19(uint64_t a1, char a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 ^ 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v3 = *(id *)(a1 + 40);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A840B000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Query iCloud Feature Availability", (const char *)&unk_1A84E7B6B, v6, 2u);
  }

}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_21_cold_1(v6);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_26_cold_1(v6);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  BOOL v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (_QWORD *)MEMORY[0x1E0D8A508];
  if (v4)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isPrivacyProxyActiveForInterface:networkStatuses:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "safari_BOOLForKey:defaultValue:", *v5, 1);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v7 = objc_msgSend(*(id *)(a1 + 32), "initialized");
  v8 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = !v7
     || v8 != *(unsigned __int8 *)(v9 + 33)
     || *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != *(unsigned __int8 *)(v9 + 32)
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) != *(_QWORD *)(v9 + 40)
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) != *(_QWORD *)(v9 + 48)
     || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) != *(_QWORD *)(v9 + 56)
     || *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != *(unsigned __int8 *)(v9 + 64);
  *(_BYTE *)(v9 + 33) = v8;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *MEMORY[0x1E0D8A520]);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *MEMORY[0x1E0D8A518]);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *MEMORY[0x1E0D8A528]);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *MEMORY[0x1E0D8A500]);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInteger:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), *MEMORY[0x1E0D8A510]);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBool:forKey:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *v5);

  objc_msgSend(*(id *)(a1 + 32), "setInitialized:", 1);
  v17 = *(id *)(a1 + 40);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 112);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A840B000, v18, OS_SIGNPOST_INTERVAL_END, v19, "Update iCloud Private Relay State", (const char *)&unk_1A84E7B6B, buf, 2u);
  }

  v20 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(v21 + 40);
    LODWORD(v21) = *(unsigned __int8 *)(v21 + 32);
    *(_DWORD *)buf = 134218240;
    v27 = v22;
    v28 = 1024;
    v29 = v21;
    _os_log_impl(&dword_1A840B000, v20, OS_LOG_TYPE_INFO, "Traffic state has changed: 0x%llx, Subscriber tier has changed: %i", buf, 0x12u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_31;
  block[3] = &unk_1E5441D80;
  v25 = v10;
  block[4] = *(_QWORD *)(a1 + 32);
  v24 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __81__WBSPrivacyProxyAvailabilityManager__registerForPrivacyProxyChangeNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Received configuration changed notification", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrivacyProxyStateWithCompletionHandler:", 0);
}

uint64_t __81__WBSPrivacyProxyAvailabilityManager__registerForPrivacyProxyChangeNotifications__block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXPrivacyProxy();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Received service status changed notification", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePrivacyProxyStateWithCompletionHandler:", 0);
}

+ (void)openPrivateRelayICloudSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/INTERNET_PRIVACY&learnMore=true"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __42__WBSPrivacyProxyAvailabilityManager_init__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "Initial update state has completed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A840B000, a1, a3, "State hasn't changed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_13_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Failed to set user privacy proxy tier to Subscriber: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __77__WBSPrivacyProxyAvailabilityManager_setPrivacyProxyState_completionHandler___block_invoke_15_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Failed to change privacy proxy state: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_21_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Failed to query privacy proxy tier: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_23_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Failed to query privacy proxy state: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_26_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Failed to query privacy proxy account type: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __84__WBSPrivacyProxyAvailabilityManager__updatePrivacyProxyStateWithCompletionHandler___block_invoke_27_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_1A840B000, v3, v4, "Failed to query privacy proxy service status: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

@end
