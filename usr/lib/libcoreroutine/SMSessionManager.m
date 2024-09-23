@implementation SMSessionManager

- (SMSessionManager)initWithAuthorizationManager:(id)a3 biomeManager:(id)a4 contactsManager:(id)a5 defaultsManager:(id)a6 locationManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 messagingService:(id)a11 carPlayAlertManager:(id)a12 observers:(id)a13 activeSessionDetailsDelegate:(id)a14 wristStateManager:(id)a15
{
  id v20;
  id v21;
  void *v22;
  SMSessionManager *v23;
  SMSessionManager *v24;
  SMSessionManagerState *v25;
  SMSessionManagerState *state;
  SMLocalSessionState *v27;
  SMLocalSessionState *localState;
  uint64_t v29;
  NSHashTable *observers;
  id *v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  SMSessionManager *v35;
  NSObject *v36;
  const char *v37;
  SMSessionManager *v38;
  id v40;
  dispatch_queue_t v41;
  id v42;
  RTDefaultsManager *defaultsManager;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  id v71;
  id v73;
  id v74;
  id v75;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  objc_super v89;
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  id v97;
  __int16 v98;
  const __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v85 = a3;
  v73 = a4;
  v84 = a4;
  v83 = a5;
  v82 = a6;
  v74 = a7;
  v20 = a7;
  v75 = a8;
  v80 = a8;
  v21 = a9;
  v87 = a10;
  v79 = a11;
  v88 = a12;
  v86 = a13;
  v78 = a14;
  v77 = a15;
  v81 = v20;
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
    }

    v35 = 0;
    v22 = v87;
    goto LABEL_19;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    v22 = v87;
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: sessionMetricManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
    goto LABEL_18;
  }
  v22 = v87;
  if (!v87)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v37 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_17;
  }
  if (!v88)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "Invalid parameter not satisfying: carPlayAlertManager";
      goto LABEL_17;
    }
LABEL_18:

    v35 = 0;
LABEL_19:
    v38 = self;
    goto LABEL_20;
  }
  v89.receiver = self;
  v89.super_class = (Class)SMSessionManager;
  v23 = -[SMSessionManager init](&v89, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_authorizationManager, a3);
    objc_storeStrong((id *)&v24->_biomeManager, v73);
    objc_storeStrong((id *)&v24->_contactsManager, a5);
    objc_storeStrong((id *)&v24->_defaultsManager, a6);
    objc_storeStrong((id *)&v24->_locationManager, v74);
    objc_storeStrong((id *)&v24->_platform, v75);
    objc_storeStrong((id *)&v24->_sessionMetricManager, a9);
    objc_storeStrong((id *)&v24->_sessionStore, a10);
    v25 = (SMSessionManagerState *)objc_alloc_init(MEMORY[0x1E0D8BA28]);
    state = v24->_state;
    v24->_state = v25;

    v27 = (SMLocalSessionState *)objc_alloc_init(MEMORY[0x1E0D8B990]);
    localState = v24->_localState;
    v24->_localState = v27;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v29 = objc_claimAutoreleasedReturnValue();
    observers = v24->_observers;
    v24->_observers = (NSHashTable *)v29;

    v31 = v24;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (const char *)objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v31);
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v33 = (const char *)objc_msgSend(v40, "UTF8String");

    }
    v41 = dispatch_queue_create(v33, v32);

    v42 = v31[16];
    v31[16] = v41;

    objc_storeStrong(v31 + 34, a11);
    objc_storeStrong(v31 + 36, a12);
    v31[10] = 0;
    v31[31] = 0;
    v31[32] = 0;
    defaultsManager = v24->_defaultsManager;
    v44 = *MEMORY[0x1E0D8BB20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D8BB20]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDefaultsManager objectForKey:value:](defaultsManager, "objectForKey:value:", CFSTR("RTDefaultsSessionManagerCacheReleaseMaxDurationKey"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValue");
    v31[9] = v47;

    if (*((double *)v31 + 9) != v44)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = v31[9];
        *(_DWORD *)buf = 136316162;
        v91 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:]";
        v92 = 2080;
        v93 = "overriding cache release max duration";
        v94 = 2048;
        v95 = *(_QWORD *)&v44;
        v96 = 2048;
        v97 = v49;
        v98 = 2112;
        v99 = CFSTR("RTDefaultsSessionManagerCacheReleaseMaxDurationKey");
        _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }

    }
    objc_msgSend(v31, "defaultsManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x1E0D8BC80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D8BC80]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKey:value:", CFSTR("RTDefaultsSessionManagerSendSessionEndMessageTimeoutKey"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    v31[14] = v54;

    if (*((double *)v31 + 14) != v51)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = v31[14];
        *(_DWORD *)buf = 136316162;
        v91 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:]";
        v92 = 2080;
        v93 = "overriding send session end message timeout";
        v94 = 2048;
        v95 = *(_QWORD *)&v51;
        v96 = 2048;
        v97 = v56;
        v98 = 2112;
        v99 = CFSTR("RTDefaultsSessionManagerSendSessionEndMessageTimeoutKey");
        _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }

    }
    objc_msgSend(v31, "defaultsManager");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&SMMagnetBreakHysteresisCellularTimeInterval);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectForKey:value:", CFSTR("RTDefaultsSessionManagerHysteresisMagnetBreakHysteresisTimeIntervalKey"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "doubleValue");
    v31[13] = v60;

    if (*((double *)v31 + 13) != *(double *)&SMMagnetBreakHysteresisCellularTimeInterval)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        v62 = v31[13];
        *(_DWORD *)buf = 136316162;
        v91 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:]";
        v92 = 2080;
        v93 = "overriding magnetBreak timer interval";
        v94 = 2048;
        v95 = SMMagnetBreakHysteresisCellularTimeInterval;
        v96 = 2048;
        v97 = v62;
        v98 = 2112;
        v99 = CFSTR("RTDefaultsSessionManagerHysteresisMagnetBreakHysteresisTimeIntervalKey");
        _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }

    }
    objc_msgSend(v31, "overrideMagnetBreakIntervalIfNeeded");
    objc_msgSend(v31, "defaultsManager");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x1E0D8BC78];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D8BC78]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectForKey:value:", CFSTR("RTDefaultsSessionManagerHandoffActiveSessionDetailsFetchTimeout"), v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "doubleValue");
    v31[7] = v67;

    if (*((double *)v31 + 7) != v64)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = v31[7];
        *(_DWORD *)buf = 136316162;
        v91 = "-[SMSessionManager initWithAuthorizationManager:biomeManager:contactsManager:defaultsManager:locationManag"
              "er:platform:sessionMetricManager:sessionStore:messagingService:carPlayAlertManager:observers:activeSession"
              "DetailsDelegate:wristStateManager:]";
        v92 = 2080;
        v93 = "overriding active session details fech timeout";
        v94 = 2048;
        v95 = *(_QWORD *)&v64;
        v96 = 2048;
        v97 = v69;
        v98 = 2112;
        v99 = CFSTR("RTDefaultsSessionManagerHandoffActiveSessionDetailsFetchTimeout");
        _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
      }

    }
    objc_storeStrong(v31 + 17, a14);
    objc_msgSend(v31[17], "addObserver:", v31);
    objc_storeStrong(v31 + 42, a15);
    v70 = objc_opt_new();
    v71 = v31[15];
    v31[15] = (id)v70;

    objc_msgSend(v31, "setupWithObservers:", v86);
    v22 = v87;
  }
  v38 = v24;
  v35 = v38;
LABEL_20:

  return v35;
}

- (void)setupWithObservers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SMSessionManager_setupWithObservers___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__SMSessionManager_setupWithObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupWithObservers:", *(_QWORD *)(a1 + 40));
}

- (void)_setupWithObservers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SMSessionStore *sessionStore;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[SMSessionManager _addObserver:](self, "_addObserver:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  sessionStore = self->_sessionStore;
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier addObserver:selector:name:](sessionStore, "addObserver:selector:name:", self, sel_onSessionStoreNotification_, v10);

}

- (void)overrideMagnetBreakIntervalIfNeeded
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SMSessionManager_overrideMagnetBreakIntervalIfNeeded__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __55__SMSessionManager_overrideMagnetBreakIntervalIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_overrideMagnetBreakIntervalIfNeeded");
}

- (void)processResponseToTriggerPromptRemoteControlMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionManager *v9;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, received sessionEndRemoteMessage %@", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaRemoteControlEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_isActiveDevice"))
      {
        v5 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(*(id *)(a1 + 32), "response");
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke_104;
        v12[3] = &unk_1E9297150;
        v13 = *(id *)(a1 + 32);
        objc_msgSend(v5, "_respondToTriggerPromptForSessionID:response:handler:", v6, v7, v12);

        v8 = v13;
        goto LABEL_12;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
      v16 = 2112;
      v17 = v11;
      v10 = "%s,#RemoteControl, the device is not active and received a remoteControl endSessionMessage, %@ skipping any action";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      v10 = "%s,#RemoteControl, invalid sessionEndRemoteMessage: %@";
    }
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s: Zelkova RemoteControl is not enabled", buf, 0xCu);
  }
LABEL_12:

}

void __71__SMSessionManager_processResponseToTriggerPromptRemoteControlMessage___block_invoke_104(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315650;
    v6 = "-[SMSessionManager processResponseToTriggerPromptRemoteControlMessage:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, triggerToPrompt for session with sessionID %@,  served remoteControl request message, %@", (uint8_t *)&v5, 0x20u);

  }
}

- (void)processSessionEndRemoteControlMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionManager *v9;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, received sessionEndRemoteMessage %@", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaRemoteControlEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_isActiveDevice"))
      {
        v5 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(*(id *)(a1 + 32), "sessionEndReason");
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke_106;
        v12[3] = &unk_1E9297150;
        v13 = *(id *)(a1 + 32);
        objc_msgSend(v5, "_endSessionForSessionID:reason:handler:", v6, v7, v12);

        v8 = v13;
        goto LABEL_12;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
      v16 = 2112;
      v17 = v11;
      v10 = "%s,#RemoteControl, the device is not active and received a remoteControl endSessionMessage, %@ skipping any action";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      v10 = "%s,#RemoteControl, invalid sessionEndRemoteMessage: %@";
    }
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s: Zelkova RemoteControl is not enabled", buf, 0xCu);
  }
LABEL_12:

}

void __58__SMSessionManager_processSessionEndRemoteControlMessage___block_invoke_106(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315650;
    v6 = "-[SMSessionManager processSessionEndRemoteControlMessage:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, Ended session with sessionID %@,  served remoteControl request message, %@", (uint8_t *)&v5, 0x20u);

  }
}

- (void)processModifySessionConfigurationRemoteControlMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionManager *v9;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  const char *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, received sessionEndRemoteMessage %@", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaRemoteControlEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "_isActiveDevice");
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "updatedSessionConfiguration");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
          v20 = 2112;
          v21 = v8;
          _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s,#RemoteControl, ready to call _modifySession, remoteControl updatedSessionConfiguration %@", buf, 0x16u);

        }
        v9 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "updatedSessionConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke_107;
        v16[3] = &unk_1E9297150;
        v17 = *(id *)(a1 + 32);
        objc_msgSend(v9, "_modifySessionWithConfiguration:handler:", v10, v16);

        v7 = v17;
        goto LABEL_14;
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v15 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      v12 = "This device is not an active and received a sessionModifyMessage, %@, skipping any action";
      v13 = v7;
      v14 = 12;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
      v20 = 2112;
      v21 = v11;
      v12 = "%s, invalid sessionEndRemoteMessage: %@";
      v13 = v7;
      v14 = 22;
    }
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s: Zelkova RemoteControl is not enabled", buf, 0xCu);
  }
LABEL_14:

}

void __74__SMSessionManager_processModifySessionConfigurationRemoteControlMessage___block_invoke_107(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315650;
    v6 = "-[SMSessionManager processModifySessionConfigurationRemoteControlMessage:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,#RemoteControl, requested to modify session with sessionID %@, remoteControl modifyConfig %@", (uint8_t *)&v5, 0x20u);

  }
}

- (void)processStateSyncMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionManager *v9;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SMSessionManager_processStateSyncMessage___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__SMSessionManager_processStateSyncMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "messagingService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqual:", v6);

    if (v7)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v38 = 136315394;
        v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
        v40 = 2112;
        v41 = v9;
        _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, received state transition message from self, %@", (uint8_t *)&v38, 0x16u);
      }
      goto LABEL_33;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "date");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSObject isAfterDate:](v10, "isAfterDate:", v12))
    {

LABEL_13:
LABEL_14:
      if ((objc_msgSend(*(id *)(a1 + 40), "_isEligibleTransitionFromStateSyncMessage:currentSessionManagerState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)) & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
          v38 = 136315650;
          v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
          v40 = 2112;
          v41 = (uint64_t)v31;
          v42 = 2112;
          v43 = v32;
          _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, stateSyncMessage contains invalid transition, stateSyncMessage.state, %@, current.state, %@", (uint8_t *)&v38, 0x20u);

        }
        goto LABEL_33;
      }
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isActiveState"))
      {
        objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isActiveState") & 1) != 0)
        {
          v18 = objc_msgSend(*(id *)(a1 + 40), "_isEligibleToBecomeNonActiveDeviceForHandoffStateSyncMessage:", *(_QWORD *)(a1 + 32));

          if (v18)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v37 = objc_msgSend(*(id *)(a1 + 32), "stateTransitionType");
              v38 = 136315394;
              v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
              v40 = 2048;
              v41 = v37;
              _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "%s evaluating stateTransitionType %lu", (uint8_t *)&v38, 0x16u);
            }

            v20 = objc_msgSend(*(id *)(a1 + 32), "stateTransitionType");
            if (v20 != 4)
            {
              if (v20 != 2)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v8 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  v36 = *(_QWORD *)(a1 + 32);
                  v38 = 136315394;
                  v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
                  v40 = 2112;
                  v41 = v36;
                  _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, Received a modifying activeDeviceIdentifier stateSyncMessage, %@, that's not transitionType of SMStateTransitionTypeHandoffBecomeActive or SMStateTransitionTypeStateSyncUpdateReq", (uint8_t *)&v38, 0x16u);
                }
                goto LABEL_33;
              }
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "activeDeviceIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "activeDeviceIdentifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = 136315650;
                v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
                v40 = 2112;
                v41 = (uint64_t)v23;
                v42 = 2112;
                v43 = v24;
                _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%s, received state transition message for a different device than expected: %@, current: %@", (uint8_t *)&v38, 0x20u);

              }
              v25 = *(void **)(a1 + 40);
              objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
              v8 = objc_claimAutoreleasedReturnValue();
              v26 = -[NSObject copy](v8, "copy");
              v27 = &__block_literal_global_123;
              v28 = v25;
              v29 = v26;
              v30 = 3;
              goto LABEL_32;
            }
LABEL_31:
            v35 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
            v8 = objc_claimAutoreleasedReturnValue();
            v26 = -[NSObject copy](v8, "copy");
            v28 = v35;
            v29 = v26;
            v30 = 1;
            v27 = 0;
LABEL_32:
            objc_msgSend(v28, "_performStateSyncOriginatedTransitionTo:transitionType:handler:", v29, v30, v27);

LABEL_33:
            return;
          }
        }
        else
        {

        }
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = *(_QWORD *)(a1 + 32);
        v38 = 136315394;
        v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
        v40 = 2112;
        v41 = v34;
        _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%s, notifying for state change in companion device, %@", (uint8_t *)&v38, 0x16u);
      }

      goto LABEL_31;
    }
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isActiveState");

    if (!v13)
      goto LABEL_14;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionManagerState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
      v38 = 136315650;
      v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
      v40 = 2112;
      v41 = (uint64_t)v15;
      v42 = 2112;
      v43 = v16;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, received state transition message with older state: %@, current: %@", (uint8_t *)&v38, 0x20u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "_isEligibleOutOfOrderStateSyncMessage:currentSessionManagerState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v38 = 136315138;
        v39 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, ready to process an out of order message given it's eligible", (uint8_t *)&v38, 0xCu);
      }
      goto LABEL_13;
    }
  }
}

void __44__SMSessionManager_processStateSyncMessage___block_invoke_108(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager processStateSyncMessage:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, becoming Non Active handler  was called, with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)processStateSyncUpdateReqMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionManager *v9;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SMSessionManager_processStateSyncUpdateReqMessage___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__SMSessionManager_processStateSyncUpdateReqMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[SMSessionManager processStateSyncUpdateReqMessage:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, state update requested, %@", (uint8_t *)&v8, 0x16u);
  }

  v4 = objc_alloc(MEMORY[0x1E0D8BA78]);
  objc_msgSend(*(id *)(a1 + 40), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithSessionManagerState:stateTransitionType:", v5, 4);

  objc_msgSend(*(id *)(a1 + 40), "messagingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendIDSMessageToMyDevices:completion:", v6, &__block_literal_global_112);

}

void __53__SMSessionManager_processStateSyncUpdateReqMessage___block_invoke_110(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[SMSessionManager processStateSyncUpdateReqMessage:]_block_invoke";
    v8 = 1024;
    v9 = a2;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, sent state message with success: %d and error: %@", (uint8_t *)&v6, 0x1Cu);
  }

}

- (void)processSessionTypeKeyRelease:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isEligibleToProcessSessionTypeKeyReleaseMessage:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
    -[NSObject setSessionState:](v2, "setSessionState:", 4);
    v3 = objc_alloc(MEMORY[0x1E0D8BA40]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithUpdateReason:triggerCategory:sessionID:", 1, 15, v5);
    -[NSObject setMonitorContext:](v2, "setMonitorContext:", v6);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke_114;
    v13[3] = &unk_1E9297150;
    v7 = *(void **)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v7, "_performStateSyncOriginatedTransitionTo:transitionType:handler:", v2, 1, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v16 = "-[SMSessionManager processSessionTypeKeyRelease:]_block_invoke";
      v17 = 1024;
      v18 = v8;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, isActiveDevice, %{Bool}d, sessionID, %@, message.sessionID, %@, not eligible to process directly SMKeyReleaseMessage, %@", buf, 0x30u);

    }
  }

}

void __49__SMSessionManager_processSessionTypeKeyRelease___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[SMSessionManager processSessionTypeKeyRelease:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, " %s, unable to transition to SMSessionStateCacheReleasedAndUpdating due to, %@", (uint8_t *)&v7, 0x16u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 32);
    v7 = 136315394;
    v8 = "-[SMSessionManager processSessionTypeKeyRelease:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, non active device transition completed for SMKeyReleaseMessage, %@", (uint8_t *)&v7, 0x16u);
  }

}

- (BOOL)_isEligibleToProcessSessionTypeKeyReleaseMessage:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_3;
    v14 = 136315394;
    v15 = "-[SMSessionManager _isEligibleToProcessSessionTypeKeyReleaseMessage:]";
    v16 = 2112;
    v17 = v4;
    v12 = "%s, active device, state transition has already been processed, ignores SMKeyReleaseMessage, %@";
LABEL_12:
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v14, 0x16u);
    goto LABEL_3;
  }
  if (-[SMSessionManagerState sessionState](self->_state, "sessionState") == 4)
    goto LABEL_9;
  if ((-[SMSessionManagerState isEndSessionState](self->_state, "isEndSessionState") & 1) != 0)
    goto LABEL_9;
  -[SMSessionManagerState configuration](self->_state, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v11)
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = 136315394;
    v15 = "-[SMSessionManager _isEligibleToProcessSessionTypeKeyReleaseMessage:]";
    v16 = 2112;
    v17 = v4;
    v12 = "%s, non-active deivce isElibible to process keyReleaseMessage %@";
    goto LABEL_12;
  }
LABEL_3:
  v7 = !v5;

LABEL_10:
  return v7;
}

- (void)processEmergencyContactsNotifiedMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SMSessionManager_processEmergencyContactsNotifiedMessage___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__SMSessionManager_processEmergencyContactsNotifiedMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isActiveState") & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "observers", 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "onRemoteEmergencyContactsNotified:", objc_msgSend(*(id *)(a1 + 40), "triggerCategory"));
        }
        v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice");
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isActiveState");
      *(_DWORD *)buf = 136315650;
      v16 = "-[SMSessionManager processEmergencyContactsNotifiedMessage:]_block_invoke";
      v17 = 1024;
      v18 = v8;
      v19 = 1024;
      v20 = v9;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, not notifying observers, _isActiveDevice: %d, isActiveState: %d", buf, 0x18u);
    }
  }

}

- (id)state
{
  return (id)-[SMSessionManagerState copy](self->_state, "copy");
}

- (id)localState
{
  return (id)-[SMLocalSessionState copy](self->_localState, "copy");
}

- (void)_registerForConnectivityNotifications
{
  const char *v3;
  NSObject *v4;
  _QWORD handler[4];
  id v6;
  int out_token;
  id location;

  objc_initWeak(&location, self);
  out_token = 0;
  -[SMSessionManager _updateUserDisabledConnectivityStatus](self, "_updateUserDisabledConnectivityStatus");
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.commcenter.DataSettingsChangedNotification"), "UTF8String");
  -[SMSessionManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __57__SMSessionManager__registerForConnectivityNotifications__block_invoke;
  handler[3] = &unk_1E929C650;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch(v3, &out_token, v4, handler);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SMSessionManager__registerForConnectivityNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onDataSettingsChangedNotification");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = CFSTR("com.apple.commcenter.DataSettingsChangedNotification");
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Registering for %@", (uint8_t *)&v3, 0xCu);
  }

}

- (void)onDataSettingsChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SMSessionManager_onDataSettingsChangedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __53__SMSessionManager_onDataSettingsChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateUserDisabledConnectivityStatus");
}

- (void)_updateUserDisabledConnectivityStatus
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[SMInitiatorEligibility checkAirplaneModeEnabledWithQueue:](SMInitiatorEligibility, "checkAirplaneModeEnabledWithQueue:", v3);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SMSessionManager _updateUserDisabledConnectivityStatus]";
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s,Session Manager Data Settings Changed, AirplaneMode: %{Bool}d", buf, 0x12u);
  }

  -[SMSessionManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SMSessionManager__updateUserDisabledConnectivityStatus__block_invoke;
  v7[3] = &unk_1E92A5958;
  v8 = v4;
  v7[4] = self;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:](SMInitiatorEligibility, "checkCellularEnabledWithQueue:handler:", v6, v7);

}

void __57__SMSessionManager__updateUserDisabledConnectivityStatus__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v14 = 136315650;
    v15 = "-[SMSessionManager _updateUserDisabledConnectivityStatus]_block_invoke";
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s,Session Manager Data Settings Changed, check cellular eligibility %{Bool}d, error, %@", (uint8_t *)&v14, 0x1Cu);
  }

  if (a2)
    v7 = *(_BYTE *)(a1 + 40) != 0;
  else
    v7 = 1;
  if (v7 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "userDisabledConnectivity"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUserDisabledConnectivity:", v7);
    v8 = (void *)MEMORY[0x1E0D8B8F0];
    objc_msgSend(*(id *)(a1 + 32), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateActivityWithState:localState:shouldNotify:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);

    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForLocalStateChange");
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isMonitoringState"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "state");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isAnomalyState");

        if (!v12)
        {
LABEL_12:
          objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "onUserDisabledConnectivity");

          goto LABEL_13;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_showUserDisabledConnectivityAlert");
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)_showUserDisabledConnectivityAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFDictionary *v17;
  const __CFAllocator *v18;
  __CFUserNotification *v19;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v21;
  __CFRunLoop *Main;
  SInt32 error;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Check In"), &stru_1E92AB3A8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E92AB3A8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Check In requires a cellular connection to respond when prompted. If a network connection is not available, your friend will be notified."), &stru_1E92AB3A8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sessionType");

  if (v11 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Check In requires a cellular connection to keep up with your progress. If Check In cannot determine that you’ve arrived by your original ETA, your friend will be notified."), &stru_1E92AB3A8, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  error = 0;
  v14 = *MEMORY[0x1E0C9B800];
  v24[0] = *MEMORY[0x1E0C9B820];
  v24[1] = v14;
  v25[0] = MEMORY[0x1E0C9AAB0];
  v25[1] = v4;
  v15 = *MEMORY[0x1E0C9B838];
  v24[2] = *MEMORY[0x1E0C9B810];
  v24[3] = v15;
  v25[2] = v8;
  v25[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (const __CFDictionary *)objc_msgSend(v16, "mutableCopy");

  v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v19 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 3uLL, &error, v17);
  RunLoopSource = CFUserNotificationCreateRunLoopSource(v18, v19, (CFUserNotificationCallBack)userDisabledConnectivityAlertCallBack, 0);
  if (RunLoopSource)
  {
    v21 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v21, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v21);
  }
  else
  {
    CFUserNotificationCancel(v19);
  }
  CFRelease(v19);

}

- (void)bootstrapToState
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SMSessionManager_bootstrapToState__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __36__SMSessionManager_bootstrapToState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bootstrapToState");
}

- (void)_bootstrapToState
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  char *v16;
  unint64_t v17;
  _BOOL4 v18;
  _BOOL4 v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  const char *v51;
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
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint8_t buf[4];
  const char *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  const char *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionState");

  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v79 = "-[SMSessionManager _bootstrapToState]";
      v80 = 2112;
      v81 = v6;
      v7 = "%s, Session State is not SMSessionStateUnknown, bootstrap not needed, %@";
LABEL_10:
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, v7, buf, 0x16u);

      goto LABEL_38;
    }
    goto LABEL_38;
  }
  if (-[SMSessionManager sessionStoreAvailability](self, "sessionStoreAvailability") == 2)
  {
    -[SMSessionManager status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v5 = objc_claimAutoreleasedReturnValue();

    -[NSObject activeDeviceIdentifier](v5, "activeDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    -[SMSessionManager setHandoffRebootReconciliationState:](self, "setHandoffRebootReconciliationState:", -[SMSessionManager _evaluateHandoffRebootReconciliationState:](self, "_evaluateHandoffRebootReconciliationState:", v5));
    v13 = -[SMSessionManager _reconciliationDecisionForState:isActiveDevice:](self, "_reconciliationDecisionForState:isActiveDevice:", v5, v12);
    if (v13 == 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", -[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationDecisionToString:", 1);
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v79 = "-[SMSessionManager _bootstrapToState]";
        v80 = 2112;
        v81 = v15;
        v82 = 2112;
        v83 = v16;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, Deferring - Handoff Reboot Reconciliation state, %@, reconciliationDecision, %@", buf, 0x20u);

LABEL_36:
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    v17 = v13;
    v18 = -[SMSessionManager _stateValidForSessionResume:](self, "_stateValidForSessionResume:", v5);
    if (v17 == 2 && v18)
    {
      -[SMSessionManager _transitionToState:transitionType:](self, "_transitionToState:transitionType:", v5, 1);
      -[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:](self, "_handleTransitionToStateAfterBootstrap:isActiveDevice:", v5, v12);
      goto LABEL_32;
    }
    v19 = -[SMSessionManager _stateValidForSendingEndSessionMessage:](self, "_stateValidForSendingEndSessionMessage:", v5);
    if (v17 == 2)
      v20 = v12;
    else
      v20 = 0;
    if (v19 && v20)
    {
      v70 = objc_alloc(MEMORY[0x1E0D8BA28]);
      -[NSObject configuration](v5, "configuration");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject monitorContext](v5, "monitorContext");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject location](v5, "location");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject allowReadToken](v5, "allowReadToken");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject safetyCacheKey](v5, "safetyCacheKey");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject startMessageGUID](v5, "startMessageGUID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject scheduledSendMessageGUID](v5, "scheduledSendMessageGUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject scheduledSendMessageDate](v5, "scheduledSendMessageDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject activeDeviceIdentifier](v5, "activeDeviceIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject estimatedEndDate](v5, "estimatedEndDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject coarseEstimatedEndDate](v5, "coarseEstimatedEndDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v70, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v67, 0, v65, v75, v63, v72, v61, v59, v57, v21, v55, v22, v23,
                      0,
                      7,
                      v24,
                      0);

      -[SMSessionManager _transitionToState:transitionType:](self, "_transitionToState:transitionType:", v25, 1);
      objc_msgSend(v25, "startMessageGUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager sendSessionEndMessageWithReason:associatedGUID:state:](self, "sendSessionEndMessageWithReason:associatedGUID:state:", 7, v26, v25);

      goto LABEL_32;
    }
    if (v17 == 3)
    {
      -[SMSessionManager activeSessionDetails](self, "activeSessionDetails");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = (void *)v27;
        -[SMSessionManager activeSessionDetails](self, "activeSessionDetails");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "activeDeviceIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMSessionManager messagingService](self, "messagingService");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "deviceIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "isEqual:", v32) & 1) != 0)
        {

        }
        else
        {
          -[SMSessionManager activeSessionDetails](self, "activeSessionDetails");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sessionID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject configuration](v5, "configuration");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "sessionID");
          v76 = v29;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v34, "isEqual:", v36);

          if (v73)
          {
            -[SMSessionManager activeSessionDetails](self, "activeSessionDetails");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "activeDeviceIdentifier");
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            v68 = objc_alloc(MEMORY[0x1E0D8BA28]);
            v66 = -[NSObject sessionState](v5, "sessionState");
            -[NSObject configuration](v5, "configuration");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject monitorContext](v5, "monitorContext");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject date](v5, "date");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject location](v5, "location");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject allowReadToken](v5, "allowReadToken");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject safetyCacheKey](v5, "safetyCacheKey");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject startMessageGUID](v5, "startMessageGUID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject scheduledSendMessageGUID](v5, "scheduledSendMessageGUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject scheduledSendMessageDate](v5, "scheduledSendMessageDate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject estimatedEndDate](v5, "estimatedEndDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject coarseEstimatedEndDate](v5, "coarseEstimatedEndDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject sessionStateTransitionDate](v5, "sessionStateTransitionDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager messagingService](self, "messagingService");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "deviceIdentifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = (void *)objc_msgSend(v68, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v66, v64, 0, v62, v60, v58, v74, v71, v56, v54, v53, v77, v52, v38,
                            0,
                            7,
                            v39,
                            v41);

            -[SMSessionManager _transitionToState:transitionType:](self, "_transitionToState:transitionType:", v69, 5);
            goto LABEL_32;
          }
        }
      }
    }
    v42 = objc_alloc(MEMORY[0x1E0D8BA28]);
    if (v5)
    {
      -[NSObject configuration](v5, "configuration");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "deviceIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v42, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v43, 0, 0, v44, 0, 0, 0, 0, 0, 0, v46, 0, 0,
                    0,
                    0,
                    v47,
                    0);

    if (v5)
    -[SMSessionManager _transitionToState:transitionType:](self, "_transitionToState:transitionType:", v48, 1);

LABEL_32:
    -[SMSessionManager defaultsManager](self, "defaultsManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTBootInfo setBootSessionIDWithDefaultsManager:defaultsKey:](RTBootInfo, "setBootSessionIDWithDefaultsManager:defaultsKey:", v49, CFSTR("SMDefaultsBootInfo"));

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
      v51 = "NO";
      v79 = "-[SMSessionManager _bootstrapToState]";
      *(_DWORD *)buf = 136315650;
      if (v50)
        v51 = "YES";
      v80 = 2112;
      v81 = v15;
      v82 = 2080;
      v83 = v51;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, bootstrapping complete with state, %@, activeDevice %s", buf, 0x20u);
      goto LABEL_36;
    }
LABEL_37:

    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    +[RTStore availabilityToString:](RTStore, "availabilityToString:", -[SMSessionManager sessionStoreAvailability](self, "sessionStoreAvailability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v79 = "-[SMSessionManager _bootstrapToState]";
    v80 = 2112;
    v81 = v6;
    v7 = "%s, Deferring - Session Store is not available, %@";
    goto LABEL_10;
  }
LABEL_38:

}

- (void)_handleTransitionToStateAfterBootstrap:(id)a3 isActiveDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  BOOL v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RTDefaultsSessionManagerPendingSendSessionEndMessageAssociatedGUIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (-[SMSessionManager _stateValidForSendSessionEndMessageRetry:](self, "_stateValidForSendSessionEndMessageRetry:", v6))
    {
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsSessionManagerPendingSendSessionEndMessageReasonKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "-[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:]";
        v30 = 2048;
        v31 = v11;
        v32 = 2112;
        v33 = v8;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, resending session end message, reason, %ld, associatedGUID, %@", buf, 0x20u);
      }

      -[SMSessionManager sendSessionEndMessageWithReason:associatedGUID:state:](self, "sendSessionEndMessageWithReason:associatedGUID:state:", v11, v8, v6);
    }
    else
    {
      -[SMSessionManager _resetPendingSendSessionEndMessage](self, "_resetPendingSendSessionEndMessage");
    }
  }
  else if (-[SMSessionManager _isEligibleToSendStateUpdateReqMessageAfterBootstrap:isActiveDevice:](self, "_isEligibleToSendStateUpdateReqMessageAfterBootstrap:isActiveDevice:", v6, v4))
  {
    objc_msgSend(v6, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v6, "activePairedDeviceIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:]";
          _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%s, Preparing SMSessionStateUpdateReqMessage", buf, 0xCu);
        }

        objc_msgSend(v6, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sessionID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "activeDeviceIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc(MEMORY[0x1E0D8BA80]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v21, "initWithDate:messageID:sessionID:deviceToRequest:", v22, v23, v19, v20);

        -[SMSessionManager messagingService](self, "messagingService");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __74__SMSessionManager__handleTransitionToStateAfterBootstrap_isActiveDevice___block_invoke;
        v26[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
        v27 = v4;
        objc_msgSend(v25, "sendIDSMessageToPairedDevice:completion:", v24, v26);

      }
    }
    else
    {

    }
  }

}

void __74__SMSessionManager__handleTransitionToStateAfterBootstrap_isActiveDevice___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(unsigned __int8 *)(a1 + 32);
    v8 = 136315906;
    v9 = "-[SMSessionManager _handleTransitionToStateAfterBootstrap:isActiveDevice:]_block_invoke";
    v10 = 1024;
    v11 = v7;
    v12 = 1024;
    v13 = a2;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, isActiveDevice, %{Bool}d, just completed bootstrap, sent state update request message with success: %d and error: %@", (uint8_t *)&v8, 0x22u);
  }

}

- (BOOL)_isEligibleToSendStateUpdateReqMessageAfterBootstrap:(id)a3 isActiveDevice:(BOOL)a4
{
  void *v5;
  char v6;

  if (a4)
    return 0;
  objc_msgSend(a3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sessionSupportsHandoff");

  return v6 ^ 1;
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[SMSessionManager queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__SMSessionManager_fetchCurrentSessionStateWithHandler___block_invoke;
    v7[3] = &unk_1E9297678;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __56__SMSessionManager_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v2 + 16))(v2, v3, objc_msgSend(*(id *)(a1 + 32), "_canDeviceModifyState"), 0);

}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[SMSessionManager queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SMSessionManager_fetchCurrentLocalSessionStateWithHandler___block_invoke;
    v7[3] = &unk_1E9297678;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __61__SMSessionManager_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "localState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (id)_getMostRecentSessionState
{
  uint64_t v3;
  SMSessionStore *sessionStore;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, void *);
  void *v34;
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD v38[5];
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE buf[12];
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__167;
  v49 = __Block_byref_object_dispose__167;
  v50 = 0;
  v39 = 0;
  v40 = (id *)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__167;
  v43 = __Block_byref_object_dispose__167;
  v44 = 0;
  v3 = MEMORY[0x1E0C809B0];
  sessionStore = self->_sessionStore;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __46__SMSessionManager__getMostRecentSessionState__block_invoke;
  v38[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v38[4] = a2;
  -[SMSessionStore logStoreWithReason:handler:](sessionStore, "logStoreWithReason:handler:", CFSTR("Running sessionStore logStoreWithReason before _getMostRecentSessionState"), v38);
  v5 = dispatch_semaphore_create(0);
  -[SMSessionManager sessionStore](self, "sessionStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v3;
  v32 = 3221225472;
  v33 = __46__SMSessionManager__getMostRecentSessionState__block_invoke_150;
  v34 = &unk_1E92A59A0;
  v36 = &v45;
  v37 = &v39;
  v7 = v5;
  v35 = v7;
  objc_msgSend(v6, "fetchMostRecentSessionManagerStateWithHandler:", &v31);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v31, v32, v33, v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1055);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v56[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v56, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

    v24 = 0;
  }
  else
  {
LABEL_6:
    v23 = 0;
    v24 = 1;
  }

  v25 = v23;
  if ((v24 & 1) == 0)
    objc_storeStrong(v40 + 5, v23);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = v46[5];
    v28 = v40[5];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SMSessionManager _getMostRecentSessionState]";
    v52 = 2112;
    v53 = v27;
    v54 = 2112;
    v55 = v28;
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, most recent state, %@, error, %@", buf, 0x20u);
  }

  if (v40[5])
    v29 = 0;
  else
    v29 = (id)v46[5];

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v29;
}

void __46__SMSessionManager__getMostRecentSessionState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Finished running sessionStore logStoreWithReason in %@", (uint8_t *)&v4, 0xCu);

  }
}

void __46__SMSessionManager__getMostRecentSessionState__block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_transitionToState:(id)a3 transitionType:(unint64_t)a4
{
  void *v6;
  void (**v7)(void);
  id v8;

  v8 = (id)objc_msgSend(a3, "mutableCopy");
  -[SMSessionManager _stateTransitionDecisionToState:transitionType:](self, "_stateTransitionDecisionToState:transitionType:", v8, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionBlock");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();

}

- (void)_backdoorSetState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (BOOL)_stateValidForSessionResume:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isValidState") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v4, "sessionState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[SMSessionManager _stateValidForSessionResume:]";
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, invalid state for session resume, state, %@", (uint8_t *)&v21, 0x16u);

    }
    goto LABEL_9;
  }
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[RTBootInfo isFirstRunSinceBootWithDefaultsManager:defaultsKey:](RTBootInfo, "isFirstRunSinceBootWithDefaultsManager:defaultsKey:", v5, CFSTR("SMDefaultsBootInfo"));

  if (v6 && (objc_msgSend(v4, "sessionState") == 11 || objc_msgSend(v4, "sessionState") == 10))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v21 = 136315138;
      v22 = "-[SMSessionManager _stateValidForSessionResume:]";
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, ignoring persisted initialized state due to phone reboot", (uint8_t *)&v21, 0xCu);
    }
LABEL_9:

LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsSessionManagerSessionResumeWindowThresholdKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SMSessionManager defaultsManager](self, "defaultsManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("RTDefaultsSessionManagerSessionResumeWindowThresholdKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v16 = *MEMORY[0x1E0D8BC88];
    if (!v4)
      goto LABEL_10;
  }
  objc_msgSend(v4, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v19);
    v9 = v20 <= v16;

  }
  else
  {
    v9 = 0;
  }

LABEL_11:
  return v9;
}

- (BOOL)_stateValidForSendSessionEndMessageRetry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E9329780, &unk_1E9329798, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "sessionState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_stateValidForSendingEndSessionMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329810, &unk_1E9329828, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "sessionState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v8);
      v10 = v9;
      -[SMSessionManager sendSessionEndMessageTimeout](self, "sendSessionEndMessageTimeout");
      v12 = v10 <= v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_updateDestinationForRoundTripSessionConfiguration:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE buf[12];
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__167;
  v61 = __Block_byref_object_dispose__167;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__167;
  v55 = __Block_byref_object_dispose__167;
  v56 = 0;
  v5 = dispatch_semaphore_create(0);
  -[SMSessionManager locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __71__SMSessionManager__updateDestinationForRoundTripSessionConfiguration___block_invoke;
  v46[3] = &unk_1E92A59C8;
  v49 = &v51;
  v50 = &v57;
  v7 = v4;
  v47 = v7;
  v8 = v5;
  v48 = v8;
  objc_msgSend(v6, "fetchCachedLocationWithHandler:", v46);

  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v10);
  v14 = v13;
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1055);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "filteredArrayUsingPredicate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "submitToCoreAnalytics:type:duration:", v19, 1, v14);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v21 = (void *)MEMORY[0x1E0CB35C8];
  v70[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v70, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_retainAutorelease(v23);

  }
  else
  {
LABEL_6:
    v24 = 0;
  }

  v25 = v24;
  if (v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = v58[5];
      v28 = (void *)MEMORY[0x1E0D8BA28];
      -[SMSessionManager state](self, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "convertSessionStateToString:", objc_msgSend(v29, "sessionState"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SMSessionManager _updateDestinationForRoundTripSessionConfiguration:]";
      v64 = 2112;
      v65 = v27;
      v66 = 2112;
      v67 = v30;
      v68 = 2112;
      v69 = v25;
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, current location fetch failed, %@, current state, %@, error, %@", buf, 0x2Au);

    }
  }
  if (v52[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = v58[5];
      v33 = (void *)MEMORY[0x1E0D8BA28];
      -[SMSessionManager state](self, "state");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "convertSessionStateToString:", objc_msgSend(v34, "sessionState"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)v52[5];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SMSessionManager _updateDestinationForRoundTripSessionConfiguration:]";
      v64 = 2112;
      v65 = v32;
      v66 = 2112;
      v67 = v35;
      v68 = 2112;
      v69 = v36;
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%s, current location fetch failed, %@, current state, %@, error, %@", buf, 0x2Au);

    }
  }
  v37 = objc_alloc(MEMORY[0x1E0D8B9F0]);
  objc_msgSend(v7, "conversation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v58[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v7, "sessionSupportsHandoff");
  objc_msgSend(v7, "sosReceivers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v37, "initRoundTripSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:", v38, v39, v40, v41, 0, v42, v43);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v44;
}

void __71__SMSessionManager__updateDestinationForRoundTripSessionConfiguration___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v14 = obj;
  v6 = a2;
  v7 = objc_alloc(MEMORY[0x1E0D8BA00]);
  v8 = *MEMORY[0x1E0D8BC48];
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "destinationMapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "initWithCLLocation:eta:radius:destinationType:destinationMapItem:", v6, 0, 4, v10, v8);

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_invalidateTimer:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[SMSessionManager _invalidateTimer:]";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%s, invalidating timer with identifier, %@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(v3, "invalidate");

}

- (id)_checkDefaultsForCacheReleaseDateWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "cacheReleaseDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "sessionState"))
  {
    case 7:
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RTDefaultsSessionManagerDestinationAnomalyPromptTimerDurationKey");
      goto LABEL_8;
    case 8:
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RTDefaultsSessionManagerRoundTripAnomalyPromptTimerDurationKey");
      goto LABEL_8;
    case 9:
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RTDefaultsSessionManagerTimerEndedPromptTimerDurationKey");
      goto LABEL_8;
    case 14:
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("RTDefaultsSessionManagerWorkoutAnomalyPromptTimerDurationKey");
LABEL_8:
      objc_msgSend(v6, "objectForKey:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_13;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[NSObject doubleValue](v9, "doubleValue");
        v17 = 136315394;
        v18 = "-[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:]";
        v19 = 2048;
        v20 = v12;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, modifying timer duration to cache release to, %f", (uint8_t *)&v17, 0x16u);
      }

      objc_msgSend(v4, "sessionStateTransitionDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject doubleValue](v9, "doubleValue");
      objc_msgSend(v13, "dateByAddingTimeInterval:");
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v14;
LABEL_12:

LABEL_13:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 136315394;
        v18 = "-[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:]";
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, cache release date set to, %@", (uint8_t *)&v17, 0x16u);
      }

      return v5;
    default:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v4, "sessionState"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 136315394;
        v18 = "-[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:]";
        v19 = 2112;
        v20 = v10;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%s, invalid session state, %@", (uint8_t *)&v17, 0x16u);

      }
      goto LABEL_12;
  }
}

- (void)_updateReceiverWithEstimatedEndDate:(id)a3 coarseEstimatedEndDate:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B950]), "initWithSessionID:estimatedEndTime:coarseEstimatedEndTime:", v10, v8, v9);
  -[SMSessionManager messagingService](self, "messagingService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__SMSessionManager__updateReceiverWithEstimatedEndDate_coarseEstimatedEndDate_sessionID___block_invoke;
  v19[3] = &unk_1E929EBE8;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  objc_msgSend(v12, "sendIDSMessage:toConversation:completion:", v11, v15, v19);

}

void __89__SMSessionManager__updateReceiverWithEstimatedEndDate_coarseEstimatedEndDate_sessionID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2)
      v7 = CFSTR("succeeded");
    else
      v7 = CFSTR("failed");
    objc_msgSend(*(id *)(a1 + 32), "stringFromDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = 136316418;
    v12 = "-[SMSessionManager _updateReceiverWithEstimatedEndDate:coarseEstimatedEndDate:sessionID:]_block_invoke";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, estimatedEndDate, %@, coarseEstimatedEndDate, %@, sessionID, %@, error, %@", (uint8_t *)&v11, 0x3Eu);

  }
}

- (void)_updateReceiverWithLowPowerModeWarningStateUpdate:(int64_t)a3 sessionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B9A0]), "initWithSessionID:lowPowerModeWarningState:", v6, a3);
  -[SMSessionManager messagingService](self, "messagingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__SMSessionManager__updateReceiverWithLowPowerModeWarningStateUpdate_sessionID___block_invoke;
  v13[3] = &unk_1E929F6B0;
  v14 = v6;
  v15 = a3;
  v12 = v6;
  objc_msgSend(v8, "sendIDSMessage:toConversation:completion:", v7, v11, v13);

}

void __80__SMSessionManager__updateReceiverWithLowPowerModeWarningStateUpdate_sessionID___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8B928], "convertLowPowerModeWarningStateToString:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 136316162;
    v10 = "-[SMSessionManager _updateReceiverWithLowPowerModeWarningStateUpdate:sessionID:]_block_invoke";
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, send, %{Bool}d, lowPowerModeWarningState, %@, sessionID, %@, error, %@", (uint8_t *)&v9, 0x30u);

  }
}

- (void)setSessionStoreAvailability:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_sessionStoreAvailability != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[RTStore availabilityToString:](RTStore, "availabilityToString:", self->_sessionStoreAvailability);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTStore availabilityToString:](RTStore, "availabilityToString:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v14 = "-[SMSessionManager setSessionStoreAvailability:]";
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Session Store availability change from , %@, to, %@", buf, 0x20u);

    }
    self->_sessionStoreAvailability = a3;
    if (a3 == 2)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[SMSessionManager setSessionStoreAvailability:]";
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Session Store available, fetch sessionManagerStatus", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      -[SMSessionManager sessionStore](self, "sessionStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke;
      v11[3] = &unk_1E92A59F0;
      objc_copyWeak(v12, (id *)buf);
      v12[1] = (id)a2;
      objc_msgSend(v10, "fetchSessionStatusWithHandler:", v11);

      objc_destroyWeak(v12);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __48__SMSessionManager_setSessionStoreAvailability___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke_181;
    block[3] = &unk_1E9299D78;
    v13 = v5;
    v14 = v6;
    v15 = v8;
    dispatch_async(v9, block);

    v10 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@,object has been cleaned up", buf, 0xCu);

    }
  }

}

uint64_t __48__SMSessionManager_setSessionStoreAvailability___block_invoke_181(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  dispatch_semaphore_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  dispatch_time_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v62;
  id obj;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  NSObject *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE buf[12];
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  id v85;
  _QWORD v86[4];

  v86[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    v82 = 2048;
    v83 = v3;
    v84 = 2112;
    v85 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s,fetched %lu sessionManagerStatus with error %@", buf, 0x20u);
  }

  v66 = a1;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setStatus:", v5);

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = *(id *)(a1 + 32);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    if (v6)
    {
      v7 = v6;
      v64 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v74 != v64)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v9, "state");
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = (void *)v10;
            objc_msgSend(v9, "state");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "date");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v66 + 48), "status");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "state");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "date");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v13, "isAfterDate:", v16);

            if (v17)
              objc_msgSend(*(id *)(v66 + 48), "setStatus:", v9);
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      }
      while (v7);
    }

    v18 = v66;
    objc_msgSend(*(id *)(v66 + 48), "setStatusStored:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_getMostRecentSessionState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D8BA30]);
    v21 = (void *)objc_opt_new();
    v22 = (void *)objc_msgSend(v20, "initWithIdentifier:stateQueryDate:lastSessionIDDuringMagnetBreak:state:", v21, 0, 0, v19);
    objc_msgSend(*(id *)(a1 + 48), "setStatus:", v22);

    v23 = dispatch_semaphore_create(0);
    v24 = *(void **)(a1 + 48);
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke_183;
    v77[3] = &unk_1E92977B8;
    v25 = v23;
    v78 = v25;
    objc_msgSend(v24, "updateManagerStatusInStoreWithCompletion:", v77);
    v26 = v25;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v26, v28))
    {
      v65 = v19;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v27);
      v31 = v30;
      v32 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1055);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "filteredArrayUsingPredicate:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "submitToCoreAnalytics:type:duration:", v36, 1, v31);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v38 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0D18598];
      v86[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v86, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 15, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        v42 = objc_retainAutorelease(v41);

      }
      else
      {
        v42 = 0;
      }
      v19 = v65;
    }
    else
    {
      v42 = 0;
    }

    v43 = v42;
    if (v43)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v66 + 48), "state");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke_2";
        v82 = 2112;
        v83 = (uint64_t)v62;
        v84 = 2112;
        v85 = v43;
        _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%s, failed to store session state with timeout, %@, with error, %@", buf, 0x20u);

      }
    }

    v18 = v66;
  }
  if ((unint64_t)objc_msgSend(*(id *)(v18 + 32), "count") >= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
      _os_log_fault_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_FAULT, "%s, more than 1 sessionStatus found", buf, 0xCu);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v46 = *(id *)(v18 + 32);
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v70 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          objc_msgSend(*(id *)(v18 + 48), "status");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "identifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v53, "isEqual:", v54);

          v18 = v66;
          if ((v55 & 1) == 0)
          {
            objc_msgSend(*(id *)(v66 + 48), "sessionStore");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v67[0] = MEMORY[0x1E0C809B0];
            v67[1] = 3221225472;
            v67[2] = __48__SMSessionManager_setSessionStoreAvailability___block_invoke_185;
            v67[3] = &unk_1E9297150;
            v68 = *(id *)(v66 + 48);
            objc_msgSend(v56, "removeSessionManagerStatus:handler:", v51, v67);

          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      }
      while (v48);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(v18 + 48), "status");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "description");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    v82 = 2112;
    v83 = (uint64_t)v59;
    _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_INFO, "%s,loaded sessionManagerStatus %@", buf, 0x16u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_INFO, "%s, Session Store available, Call bootstrapToState", buf, 0xCu);
  }

  return objc_msgSend(*(id *)(v18 + 48), "_bootstrapToState");
}

intptr_t __48__SMSessionManager_setSessionStoreAvailability___block_invoke_183(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __48__SMSessionManager_setSessionStoreAvailability___block_invoke_185(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "status");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315650;
    v8 = "-[SMSessionManager setSessionStoreAvailability:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s,removing sessionManagerStatus %@ with error %@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)_bootstrapHysteresisState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v4);

    -[SMSessionManager setMagnetBreakTimer:](self, "setMagnetBreakTimer:", 0);
  }
  -[SMSessionManager messagingService](self, "messagingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectivePairedDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager _processNearbyEffectivePairedDeviceChanged:](self, "_processNearbyEffectivePairedDeviceChanged:", v6);
}

- (unint64_t)_getEndSessionStateWithReason:(unint64_t)a3
{
  if (a3 - 1 > 8)
    return 1;
  else
    return qword_1D1EEE7E0[a3 - 1];
}

- (void)_postEndAwarenessLiveActivity
{
  id v3;

  -[SMSessionManager state](self, "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager _updateActivityWithState:](self, "_updateActivityWithState:", v3);

}

- (void)_initializeSessionWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SMSessionManager *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  SMSessionManager *v34;
  void *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v37 = v10;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "receiverHandles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v39 = "-[SMSessionManager _initializeSessionWithSessionID:conversation:handler:]";
      v40 = 2112;
      v41 = v8;
      v42 = 2112;
      v43 = v13;
      v44 = 2112;
      v45 = v14;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, transitioning to Initializing, sessionID, %@, handles, %@, groupID, %@", buf, 0x2Au);

    }
    v15 = objc_alloc(MEMORY[0x1E0D8B9F0]);
    LOBYTE(v32) = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled");
    v16 = objc_msgSend(v15, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v9, v8, 0, 0, 0, 0, 0, v32, v9, 0);
    v33 = objc_alloc(MEMORY[0x1E0D8BA20]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "deviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = self;
    v34 = self;
    v22 = (void *)v20;
    -[SMSessionManager messagingService](v21, "messagingService");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "effectivePairedDevice");
    v36 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uniqueIDOverride");
    v25 = v9;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v22, "initWithUUIDString:", v26);
    v28 = v16;
    v29 = v16;
    v30 = (void *)v17;
    v31 = (void *)objc_msgSend(v33, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 10, v29, 0, 0, v17, 0, 0, 0, 0, 0, 0, v18, 0, 0,
                    0,
                    0,
                    v19,
                    v27);

    v9 = v25;
    v8 = v36;

    v11 = v37;
    -[SMSessionManager _performStateTransitionTo:transitionType:handler:](v34, "_performStateTransitionTo:transitionType:handler:", v31, 1, v37);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

- (void)_resetInitializationWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1E0D8BA28];
      -[SMSessionManager state](self, "state");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "convertSessionStateToString:", objc_msgSend(v7, "sessionState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v16 = "-[SMSessionManager _resetInitializationWithHandler:]";
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%s, resetting initialization for previous session with session state, %@, sessionID, %@", buf, 0x20u);

    }
    v12 = -[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
    -[NSObject setSessionState:](v12, "setSessionState:", 1);
    -[NSObject setStartMessageGUID:](v12, "setStartMessageGUID:", 0);
    -[NSObject setScheduledSendMessageGUID:](v12, "setScheduledSendMessageGUID:", 0);
    -[NSObject setScheduledSendMessageDate:](v12, "setScheduledSendMessageDate:", 0);
    -[NSObject setActiveDeviceIdentifier:](v12, "setActiveDeviceIdentifier:", 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __52__SMSessionManager__resetInitializationWithHandler___block_invoke;
    v13[3] = &unk_1E9299358;
    v13[4] = self;
    v14 = v4;
    -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v12, 1, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __52__SMSessionManager__resetInitializationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0D8BA28];
    objc_msgSend(*(id *)(a1 + 32), "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertSessionStateToString:", objc_msgSend(v6, "sessionState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[SMSessionManager _resetInitializationWithHandler:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "%s, resetting initialization finished with sessionState, %@, error, %@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)SessionHandoffRebootReconciliationStateToString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E92A6088[a3 - 1];
}

+ (id)SessionHandoffRebootReconciliationDecisionToString:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E92A60A8[a3 - 1];
}

- (void)storeManagerStatusInStore:(unint64_t)a3 completion:(id)a4
{
  void (**v7)(_QWORD);
  _BOOL4 v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  id v17[3];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(_QWORD))a4;
  v8 = -[SMSessionManager statusStoreInProgress](self, "statusStoreInProgress");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@,Update already in progress", buf, 0xCu);

    }
    -[SMSessionManager setStatusUpdatePending:](self, "setStatusUpdatePending:", 1);
    v7[2](v7);
  }
  else
  {
    if (v10)
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@,storing SessionManagerStatus in store", buf, 0xCu);

    }
    -[SMSessionManager setStatusStoreInProgress:](self, "setStatusStoreInProgress:", 1);
    objc_initWeak((id *)buf, self);
    -[SMSessionManager sessionStore](self, "sessionStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager status](self, "status");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke;
    v15[3] = &unk_1E92A5A18;
    objc_copyWeak(v17, (id *)buf);
    v17[1] = (id)a2;
    v16 = v7;
    v17[2] = (id)a3;
    objc_msgSend(v13, "storeSessionManagerStatus:handler:", v14, v15);

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }

}

void __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@,object has been cleaned up", buf, 0xCu);

    }
    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "setStatusStoreInProgress:", 0);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@,Successfully stored status", buf, 0xCu);

    }
    objc_msgSend(v5, "setStatusStored:", 1);
    if (objc_msgSend(v5, "statusUpdatePending"))
    {
      objc_msgSend(v5, "setStatusUpdatePending:", 0);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke_202;
      v14[3] = &__block_descriptor_40_e5_v8__0l;
      v14[4] = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "updateManagerStatusInStoreWithCompletion:", v14);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v3;
    v19 = 1024;
    v20 = v12;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@,Stored with error %@, retries left %d", buf, 0x1Cu);

  }
  v8 = *(_QWORD *)(a1 + 56);
  if (!v8)
  {
    objc_msgSend(v5, "setStatusUpdatePending:", 0);
LABEL_15:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_16;
  }
  objc_msgSend(v5, "storeManagerStatusInStore:completion:", v8 - 1, *(_QWORD *)(a1 + 32));
LABEL_16:

}

void __57__SMSessionManager_storeManagerStatusInStore_completion___block_invoke_202(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@,Successfully flushed status", (uint8_t *)&v4, 0xCu);

  }
}

- (void)updateManagerStatusInStoreWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SMSessionManager statusStored](self, "statusStored"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@,Attempting to update sessionManagerStatus, transaction,%@", buf, 0x16u);

    }
    -[SMSessionManager sessionStore](self, "sessionStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager status](self, "status");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SMSessionManager_updateManagerStatusInStoreWithCompletion___block_invoke;
    v12[3] = &unk_1E9298100;
    v15 = a2;
    v13 = v6;
    v14 = v5;
    v11 = v6;
    objc_msgSend(v9, "updateSessionManagerStatus:handler:", v10, v12);

  }
  else
  {
    -[SMSessionManager storeManagerStatusInStore:completion:](self, "storeManagerStatusInStore:completion:", 2, v5);
  }

}

void __61__SMSessionManager_updateManagerStatusInStoreWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v7;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@,Update returned error %@, transaction,%@", (uint8_t *)&v9, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@,Successfully updated sessionManagerStatus, transaction,%@", (uint8_t *)&v9, 0x16u);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)checkSessionIDWithSelector:(SEL)a3 sessionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6
    && (-[SMSessionManagerState configuration](self->_state, "configuration"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "sessionID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v6, "isEqual:", v8),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState configuration](self->_state, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sessionID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v19;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v21;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, invalid session ID %@, current sessionID, %@", buf, 0x20u);

    }
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0D8BB70];
    v22 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ cannot be completed since sessionID passed in does not match current sessionID"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 7, v17);

  }
  return v10;
}

- (id)checkSessionIDAndCanDeviceModifyStateWithSelector:(SEL)a3 sessionID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SMSessionManager checkSessionIDWithSelector:sessionID:](self, "checkSessionIDWithSelector:sessionID:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (sel__endSessionForSessionID_reason_handler_ == a3
         || -[SMSessionManager _canDeviceModifyState](self, "_canDeviceModifyState"))
  {
    v9 = 0;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, User requested on non active device with sessionID %@", buf, 0x16u);

    }
    v18 = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ cannot be completed since current device is not active"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v14);

  }
  return v9;
}

- (id)checkSessionStateWithSelector:(SEL)a3 validSessionStates:(id)a4
{
  id v6;
  SMSessionManagerState *state;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  state = self->_state;
  if (state)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionManagerState sessionState](state, "sessionState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if ((objc_msgSend(v6, "containsObject:", v8) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ cannot run as session is not currently in an appropriate state for this function."), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", -[SMSessionManagerState sessionState](self->_state, "sessionState"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D8BB70];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 11, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:(SEL)a3 sessionID:(id)a4 validSessionStates:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a5;
  -[SMSessionManager checkSessionIDAndCanDeviceModifyStateWithSelector:sessionID:](self, "checkSessionIDAndCanDeviceModifyStateWithSelector:sessionID:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[SMSessionManager checkSessionStateWithSelector:validSessionStates:](self, "checkSessionStateWithSelector:validSessionStates:", a3, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)onSessionStoreNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SMSessionManager_onSessionStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__SMSessionManager_onSessionStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onSessionStoreNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[SMSessionManager setSessionStoreAvailability:](self, "setSessionStoreAvailability:", objc_msgSend(v7, "availability"));

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__SMSessionManager_addObserver___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __32__SMSessionManager_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__SMSessionManager_removeObserver___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __35__SMSessionManager_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v7;
    v12 = 2080;
    v13 = "-[SMSessionManager _addObserver:]";
    v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, adding observer, %@", (uint8_t *)&v10, 0x20u);

  }
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)_removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v7;
    v12 = 2080;
    v13 = "-[SMSessionManager _removeObserver:]";
    v14 = 2112;
    v15 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, %s, removing observer, %@", (uint8_t *)&v10, 0x20u);

  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (void)_notifyObserversForStart
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager _registerForNotifications](self, "_registerForNotifications");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "configuration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "onSessionStartedWithConfiguration:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversForBecomingActiveDevice
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager _registerForNotifications](self, "_registerForNotifications");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(v8, "onBecomingActiveDevice:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversForBecomingNonActiveDevice
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(v8, "onBecomingNonActiveDevice:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversForConfigurationChange
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionType");

  if (v5 == 1)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    -[SMSessionManager state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "time");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeBound");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "roundingUpDate:bucketDurationMinute:", v10, *MEMORY[0x1E0D8BB58]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMSessionManager state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "time");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeBound");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager state](self, "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager _updateReceiverWithEstimatedEndDate:coarseEstimatedEndDate:sessionID:](self, "_updateReceiverWithEstimatedEndDate:coarseEstimatedEndDate:sessionID:", v15, v11, v18);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v23);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "configuration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "onSessionChangedWithConfiguration:", v26);

        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v21);
  }

}

- (void)_notifyObserversForSessionResume
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager _registerForNotifications](self, "_registerForNotifications");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "onSessionResumedWithState:forActiveDevice:", v9, -[SMSessionManager _isActiveDevice](self, "_isActiveDevice"));

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversForSessionEndForActiveDevice:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager _unregisterForNotifications](self, "_unregisterForNotifications");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "onSessionEndedForActiveDevice:", v3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyObserversForStateChangeWithTransitionType:(unint64_t)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  NSObject *v51;
  _BYTE v52[128];
  _BYTE buf[12];
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  v4 = dispatch_semaphore_create(0);
  -[SMSessionManager state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager status](self, "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:", v5);

  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __69__SMSessionManager__notifyObserversForStateChangeWithTransitionType___block_invoke;
  v50[3] = &unk_1E92977B8;
  v7 = v4;
  v51 = v7;
  -[SMSessionManager updateManagerStatusInStoreWithCompletion:](self, "updateManagerStatusInStoreWithCompletion:", v50);
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  v45 = v8;
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1055);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = *MEMORY[0x1E0D18598];
  v58[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v58, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_retainAutorelease(v23);

  }
  else
  {
LABEL_6:
    v24 = 0;
  }

  v25 = v24;
  if (v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[SMSessionManager state](self, "state");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SMSessionManager _notifyObserversForStateChangeWithTransitionType:]";
      v54 = 2112;
      v55 = v42;
      v56 = 2112;
      v57 = v25;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%s, failed to store most recent session state with timeout, %@, with error, %@", buf, 0x20u);

    }
  }
  v44 = v25;
  v27 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
  if (v27)
  {
    -[SMSessionManager state](self, "state");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "sessionState") != 10)
    {
      -[SMSessionManager state](self, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "sessionState");

      if (v30 == 11)
        goto LABEL_16;
      v31 = objc_alloc(MEMORY[0x1E0D8BA78]);
      -[SMSessionManager state](self, "state");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v31, "initWithSessionManagerState:stateTransitionType:", v32, a3);

      -[SMSessionManager messagingService](self, "messagingService");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sendIDSMessageToMyDevices:completion:", v28, &__block_literal_global_227);

    }
  }
LABEL_16:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[SMSessionManager observers](self, "observers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v47;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(v34);
        v39 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v38);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v40, "copy");
          objc_msgSend(v39, "onSessionStateChanged:forActiveDevice:", v41, v27);

        }
        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v36);
  }

}

intptr_t __69__SMSessionManager__notifyObserversForStateChangeWithTransitionType___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __69__SMSessionManager__notifyObserversForStateChangeWithTransitionType___block_invoke_226(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315650;
    v7 = "-[SMSessionManager _notifyObserversForStateChangeWithTransitionType:]_block_invoke";
    v8 = 1024;
    v9 = a2;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, sent state sync message with success: %d and error: %@", (uint8_t *)&v6, 0x1Cu);
  }

}

- (void)_updateUnsupportedSeparationStateWithNewState:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[SMLocalSessionState unsupportedDeviceSeparationState](self->_localState, "unsupportedDeviceSeparationState");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "-[SMSessionManager _updateUnsupportedSeparationStateWithNewState:]";
    v12 = 1024;
    v13 = v3;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, newState:%{Bool}d, oldState:%{Bool}d", (uint8_t *)&v10, 0x18u);
  }

  if (-[SMLocalSessionState unsupportedDeviceSeparationState](self->_localState, "unsupportedDeviceSeparationState") != v3)
  {
    -[SMLocalSessionState setUnsupportedDeviceSeparationState:](self->_localState, "setUnsupportedDeviceSeparationState:", v3);
    -[SMSessionManager defaultsManager](self, "defaultsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMLocalSessionState unsupportedDeviceSeparationState](self->_localState, "unsupportedDeviceSeparationState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("RTDefaultsSessionManagerUnsupportedDeviceSeparationKey"));

    -[SMSessionManager _notifyObserversForLocalStateChange](self, "_notifyObserversForLocalStateChange");
    if (v3)
    {
      -[SMSessionManager sessionMetricManager](self, "sessionMetricManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "onUnsupportedDeviceSeparation");

    }
  }
}

- (void)_notifyObserversForLocalStateChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager localState](self, "localState");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(v8, "onLocalSessionStateChanged:", v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversForSecondarySOSTrigger
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");
          objc_msgSend(v9, "onSecondarySOSTriggerWithState:forActiveDevice:", v11, v3);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (BOOL)_isActiveDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeDeviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);
    v13 = "NO";
    v20 = 136315906;
    v21 = "-[SMSessionManager _isActiveDevice]";
    v22 = 2112;
    v23 = v5;
    if (v12)
      v13 = "YES";
    v24 = 2112;
    v25 = v7;
    v26 = 2080;
    v27 = v13;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, activeDeviceIdentifier, %@, messaging service device identifier, %@, result, %s", (uint8_t *)&v20, 0x2Au);

  }
  -[SMSessionManager state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeDeviceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager messagingService](self, "messagingService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqual:", v17);

  return v18;
}

- (BOOL)_canDeviceModifyState
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isActiveState");
    -[SMSessionManager state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[SMSessionManager _canDeviceModifyState]";
    v15 = 1024;
    v16 = v6;
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, isActiveState, %{Bool}d, activeDeviceIdentifier, %@, isActiveDevice, %{Bool}d", (uint8_t *)&v13, 0x22u);

  }
  -[SMSessionManager state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isActiveState"))
  {
    -[SMSessionManager state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDeviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      LOBYTE(v3) = 1;

  }
  else
  {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (void)_notifyObserversForTriggerResponse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SMSessionManager observers](self, "observers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[SMSessionManager state](self, "state");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "onUserTriggerResponse:", objc_msgSend(v9, "userTriggerResponse"));

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SMSessionManager handoffSessionForSessionID:handler:]";
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, request to handoff the session to this device", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__SMSessionManager_handoffSessionForSessionID_handler___block_invoke;
    block[3] = &unk_1E9298DC0;
    v13 = v7;
    block[4] = self;
    v12 = v6;
    dispatch_async(v9, block);

    v10 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __55__SMSessionManager_handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SMSessionManager handoffSessionForSessionID:handler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s: Zelkova Handoff is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0D8BB70];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Zelkova Handoff is not enabled"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v8 = v12;
    v9 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SMSessionManager handoffSessionForSessionID:handler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s: This device is active and thus cannot handoff to itself; skip and do nothing",
        buf,
        0xCu);
    }

    v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v4 = *MEMORY[0x1E0D8BB70];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This device is active and thus cannot handoff to itself; skip and do nothing"),
      *MEMORY[0x1E0CB2D50]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3;
    v8 = v4;
    v9 = 43;
LABEL_9:
    v13 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, v9, v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "_handoffSessionForSessionID:retryCount:handler:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 48));
}

- (void)_handoffSessionForSessionID:(id)a3 retryCount:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  SMSessionManager *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32[3];
  uint8_t v33[16];
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]";
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, Request to handoff session to this device", buf, 0xCu);
    }

    if (-[SMSessionManager _sessionSupportsHandoff](self, "_sessionSupportsHandoff"))
    {
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("RTDefaultsSessionManagerHandoffInProgressKey"));

      -[SMSessionManager state](self, "state");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v13 = objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sessionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (char *)os_signpost_id_make_with_pointer(v13, v16);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1A22000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v17, "SMHandoffSessionCriteriaInitiatorEligibilityCheckLatency", " enableTelemetry=YES ", v33, 2u);
      }

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke;
      v26[3] = &unk_1E92A5A88;
      v32[1] = v17;
      v20 = v12;
      v27 = v20;
      v28 = self;
      objc_copyWeak(v32, (id *)buf);
      v31 = v9;
      v21 = v25;
      v29 = v21;
      v32[2] = (id)a4;
      v30 = v8;
      -[SMSessionManager _checkInitiatorEligibilityWithIsHandoff:completion:](self, "_checkInitiatorEligibilityWithIsHandoff:completion:", 1, v26);

      objc_destroyWeak(v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session State configuration does not support handoff"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 1, v24);

      (*((void (**)(id, NSObject *))v9 + 2))(v9, v21);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  double v10;
  double v11;
  id WeakRetained;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  id v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMHandoffSessionCriteriaInitiatorEligibilityCheckLatency", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v11 = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addMetricForLatencyEligibilityChecks:", v11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      *(_DWORD *)buf = 136315650;
      v46 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]_block_invoke";
      v47 = 2112;
      if (a2)
        v14 = CFSTR("YES");
      v48 = v14;
      v49 = 2112;
      v50 = v5;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, check general initiator eligibility callback, isEligible %@, error %@ ", buf, 0x20u);
    }

    if (v5 || !a2)
    {
      objc_msgSend(WeakRetained, "defaultsManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsSessionManagerHandoffInProgressKey"));

      v30 = *(_QWORD *)(a1 + 64);
      if (v5)
      {
        (*(void (**)(uint64_t, id))(v30 + 16))(v30, v5);
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0D8BB70];
        v43 = *MEMORY[0x1E0CB2D50];
        v44 = CFSTR("initiator eligibility failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 26, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v34);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = *(_QWORD *)(a1 + 80);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1A22000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SMHandoffSessionCheckIfHandoffCriteriaSatisfiedSPILatency", " enableTelemetry=YES ", buf, 2u);
      }

      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke_252;
      v35[3] = &unk_1E92A5A60;
      v41 = *(_QWORD *)(a1 + 80);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v36 = v15;
      v37 = v19;
      v38 = WeakRetained;
      v21 = *(id *)(a1 + 64);
      v22 = *(_QWORD *)(a1 + 88);
      v40 = v21;
      v42 = v22;
      v39 = *(id *)(a1 + 56);
      v23 = v15;
      objc_msgSend(v38, "_checkIfHandoffCriteriaSatisfiedForState:handler:", v20, v35);

    }
  }
  else
  {
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = *MEMORY[0x1E0D8BB70];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("SMSessionManager was destroyed during eligibility check");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 24, v26);

    objc_msgSend(0, "defaultsManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsSessionManagerHandoffInProgressKey"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __67__SMSessionManager__handoffSessionForSessionID_retryCount_handler___block_invoke_252(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 72);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMHandoffSessionCheckIfHandoffCriteriaSatisfiedSPILatency", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v11 = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addMetricForLatencyHandoffCriteria:", v11);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v16 = 136315650;
    v17 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]_block_invoke";
    v18 = 1024;
    *(_DWORD *)v19 = a2;
    v19[2] = 2112;
    *(_QWORD *)&v19[3] = v5;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, handoffCriteriaSatisfied, %{Bool}d, eligibilityError, %@", (uint8_t *)&v16, 0x1Cu);
  }

  if (v5 || !a2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_shouldRetryForHandoffError:retryCount:", v5, *(_QWORD *)(a1 + 80)))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 80);
        v16 = 136315394;
        v17 = "-[SMSessionManager _handoffSessionForSessionID:retryCount:handler:]_block_invoke";
        v18 = 2048;
        *(_QWORD *)v19 = v14;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, Handoff is elibile to retry, pendingRetryCount, %lu, retrying...", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "_startHandoffRetryTimerWithLatency:sessionID:retryCount:handoffCompletion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), 10.0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "defaultsManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsSessionManagerHandoffInProgressKey"));

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_becomeActiveDeviceForSessionWithHandler:", *(_QWORD *)(a1 + 64));
  }

}

- (BOOL)_shouldRetryForHandoffError:(id)a3 retryCount:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = v5;
  if (a4)
    LOBYTE(a4) = objc_msgSend(v5, "code") == 3
              || objc_msgSend(v6, "code") == 4
              || objc_msgSend(v6, "code") == 7
              || objc_msgSend(v6, "code") == 36;

  return a4;
}

- (void)_startHandoffRetryTimerWithLatency:(double)a3 sessionID:(id)a4 retryCount:(unint64_t)a5 handoffCompletion:(id)a6
{
  id v11;
  id v12;
  RTTimer *handoffRetryTimer;
  RTTimer *v14;
  RTTimerManager *timerManager;
  void *v16;
  id v17;
  id v18;
  RTTimer *v19;
  RTTimer *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  SMSessionManager *v29;
  id v30;
  id v31;
  unint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  handoffRetryTimer = self->_handoffRetryTimer;
  if (handoffRetryTimer)
  {
    -[RTTimer invalidate](handoffRetryTimer, "invalidate");
    v14 = self->_handoffRetryTimer;
    self->_handoffRetryTimer = 0;

  }
  timerManager = self->_timerManager;
  -[SMSessionManager queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __94__SMSessionManager__startHandoffRetryTimerWithLatency_sessionID_retryCount_handoffCompletion___block_invoke;
  v28 = &unk_1E9297590;
  v29 = self;
  v17 = v11;
  v30 = v17;
  v32 = a5;
  v18 = v12;
  v31 = v18;
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("SMHandoffRetryTimerIdentifier"), v16, &v25);
  v19 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  v20 = self->_handoffRetryTimer;
  self->_handoffRetryTimer = v19;

  -[RTTimer fireWithInterval:](self->_handoffRetryTimer, "fireWithInterval:", a3, v25, v26, v27, v28, v29);
  -[RTTimer resume](self->_handoffRetryTimer, "resume");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v23;
    v35 = 2112;
    v36 = v24;
    v37 = 2048;
    v38 = a3;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, handoff retry timer interval, %.2f", buf, 0x20u);

  }
}

uint64_t __94__SMSessionManager__startHandoffRetryTimerWithLatency_sessionID_retryCount_handoffCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onHandoffRetryTimerExpiry");
  return objc_msgSend(*(id *)(a1 + 32), "_handoffSessionForSessionID:retryCount:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 48));
}

- (void)_onHandoffRetryTimerExpiry
{
  RTTimer *handoffRetryTimer;

  -[RTTimer invalidate](self->_handoffRetryTimer, "invalidate");
  handoffRetryTimer = self->_handoffRetryTimer;
  self->_handoffRetryTimer = 0;

}

- (BOOL)_isHandoffAllowedInSessionState:(unint64_t)a3
{
  return (a3 < 0xA) & (0x294u >> a3);
}

- (void)_startActiveSessionDetailsTimerWithLatency:(double)a3
{
  RTTimerManager *timerManager;
  void *v7;
  RTTimer *v8;
  RTTimer *activeSessionDetailsTimeoutTimer;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_activeSessionDetailsTimeoutTimer)
    -[SMSessionManager _clearActiveSessionDetailsTimeoutTimer](self, "_clearActiveSessionDetailsTimeoutTimer");
  timerManager = self->_timerManager;
  -[SMSessionManager queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__SMSessionManager__startActiveSessionDetailsTimerWithLatency___block_invoke;
  v14[3] = &unk_1E92977B8;
  v14[4] = self;
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("SMHandoffActiveSessionDetailsTimeoutTimerIdentifier"), v7, v14);
  v8 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  activeSessionDetailsTimeoutTimer = self->_activeSessionDetailsTimeoutTimer;
  self->_activeSessionDetailsTimeoutTimer = v8;

  -[RTTimer fireWithInterval:](self->_activeSessionDetailsTimeoutTimer, "fireWithInterval:", a3);
  -[RTTimer resume](self->_activeSessionDetailsTimeoutTimer, "resume");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, ActiveSessionDetails fetch timeout / interval, %.2f", buf, 0x20u);

  }
}

uint64_t __63__SMSessionManager__startActiveSessionDetailsTimerWithLatency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onActiveSessionDetailsTimeoutTimerExpiry");
}

- (void)_onActiveSessionDetailsTimeoutTimerExpiry
{
  NSObject *v3;
  void *v4;
  RTDefaultsManager *defaultsManager;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager _clearActiveSessionDetailsTimeoutTimer](self, "_clearActiveSessionDetailsTimeoutTimer");
  if (-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState") == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", -[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[SMSessionManager _onActiveSessionDetailsTimeoutTimerExpiry]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s timer expiry and handoffRebootReconciliationState, %@, declaring timeout and ActiveSessionDetailsFetchFailure", (uint8_t *)&v7, 0x16u);

    }
    defaultsManager = self->_defaultsManager;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDefaultsManager setObject:forKey:](defaultsManager, "setObject:forKey:", v6, CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"));

    -[SMSessionManager _bootstrapToState](self, "_bootstrapToState");
  }
}

- (void)_clearActiveSessionDetailsTimeoutTimer
{
  RTTimer *activeSessionDetailsTimeoutTimer;

  -[RTTimer invalidate](self->_activeSessionDetailsTimeoutTimer, "invalidate");
  activeSessionDetailsTimeoutTimer = self->_activeSessionDetailsTimeoutTimer;
  self->_activeSessionDetailsTimeoutTimer = 0;

}

- (void)_checkIfHandoffCriteriaSatisfiedForState:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SMSessionManager *v23;
  id v24;
  id v25;
  uint64_t *v26;
  _QWORD *v27;
  uint8_t buf[16];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  os_signpost_id_t v32;
  _QWORD v33[3];
  char v34;

  v6 = a3;
  v7 = a4;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v9, v12);

  v32 = v13;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v30[3];
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SMHandoffSessionCriteriaFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  -[SMSessionManager activeSessionDetailsDelegate](self, "activeSessionDetailsDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke;
  v21[3] = &unk_1E92A5B28;
  v26 = &v29;
  v18 = v8;
  v22 = v18;
  v23 = self;
  v19 = v6;
  v24 = v19;
  v27 = v33;
  v20 = v7;
  v25 = v20;
  objc_msgSend(v17, "fetchActiveSessionDetailsWithHandler:", v21);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v33, 8);

}

void __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char v29;
  uint8_t buf[16];

  v7 = a2;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SMHandoffSessionCriteriaFetchActiveSessionDetailsCkLatency", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v14 = v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addMetricForLatencyFetchActiveSessionDetailsCK:", v14);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_257;
  block[3] = &unk_1E92A5B00;
  v29 = a3;
  v23 = v7;
  v24 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40);
  v25 = v16;
  v26 = v17;
  v28 = *(_QWORD *)(a1 + 72);
  v21 = *(_OWORD *)(a1 + 56);
  v18 = (id)v21;
  v27 = v21;
  v19 = v8;
  v20 = v7;
  dispatch_async(v15, block);

}

void __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_257(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
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
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheReleasedDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "scheduledSendGUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 88);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v39 = "-[SMSessionManager _checkIfHandoffCriteriaSatisfiedForState:handler:]_block_invoke";
    v40 = 2112;
    v41 = v4;
    v42 = 1024;
    v43 = v3;
    v44 = 2112;
    v45 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, currentActiveSessionDetails %@, fethSuccess, %{Bool}d, read existing CK activeSessionDetails record to determine CK details, fetchError, %@", buf, 0x26u);
  }

  v27 = objc_alloc(MEMORY[0x1E0D8B8E8]);
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "messagingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receiverHandles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "initWithSessionID:activeDeviceIdentifier:cacheReleasedDate:scheduledSendGUID:receiverHandles:", v6, v8, v30, v29, v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SMHandoffSessionCriteriaWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 56), "activeSessionDetailsDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_260;
  v31[3] = &unk_1E92A5AD8;
  v20 = *(_QWORD *)(a1 + 56);
  v32 = v15;
  v33 = v20;
  v21 = *(_QWORD *)(a1 + 80);
  v26 = *(_OWORD *)(a1 + 64);
  v34 = v28;
  v36 = v21;
  v22 = (id)v26;
  v35 = v26;
  v23 = v28;
  v24 = v15;
  objc_msgSend(v19, "writeActiveSessionDetailOnCloudToInitiateHandoff:handler:", v23, v31);

}

void __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_260(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  uint8_t buf[16];

  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMHandoffSessionCriteriaWriteActiveSessionDetailsCKLatency", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v11 = v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addMetricForLatencyWriteActiveSessionDetailsCK:", v11);
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_261;
  block[3] = &unk_1E92A5AB0;
  v13 = *(id *)(a1 + 48);
  v20 = a2;
  v16 = v13;
  v17 = v5;
  v19 = *(_QWORD *)(a1 + 72);
  v18 = *(id *)(a1 + 56);
  v14 = v5;
  dispatch_async(v12, block);

}

uint64_t __69__SMSessionManager__checkIfHandoffCriteriaSatisfiedForState_handler___block_invoke_261(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v9 = 136315906;
    v10 = "-[SMSessionManager _checkIfHandoffCriteriaSatisfiedForState:handler:]_block_invoke";
    v11 = 2112;
    v12 = v4;
    v13 = 1024;
    v14 = v3;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, newCkInitiateHandoffActiveSessionDetails  %@, write operation returned callback, with success %{Bool}d, error %@ ", (uint8_t *)&v9, 0x26u);
  }

  v6 = *(_BYTE *)(a1 + 64);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v6)
    v6 = *(_BYTE *)(v7 + 24) != 0;
  *(_BYTE *)(v7 + 24) = v6;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_checkInitiatorEligibilityWithIsHandoff:(BOOL)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  id v21;
  _QWORD v22[4];
  id v23;
  __int128 *p_buf;
  id v25;
  id location;
  __int128 buf;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v20 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[SMSessionManager _checkInitiatorEligibilityWithIsHandoff:completion:]";
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, check initiator eligibility for handoff", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x2020000000;
  v29 = 0;
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SMSessionManager state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.SafetyMonitor.SessionManager.handoff.InitiatorEligibility.%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_retainAutorelease(v11);
  v12 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
  -[SMSessionManager setInitiatorEligibilityQueue:](self, "setInitiatorEligibilityQueue:", v12);

  objc_initWeak(&location, self);
  -[SMSessionManager initiatorEligibilityQueue](self, "initiatorEligibilityQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager authorizationManager](self, "authorizationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager messagingService](self, "messagingService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "effectivePairedDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager platform](self, "platform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke;
  v22[3] = &unk_1E92A5B78;
  objc_copyWeak(&v25, &location);
  v19 = v5;
  v23 = v19;
  p_buf = &buf;
  +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:](SMInitiatorEligibility, "checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:", v13, v14, v16, v20, v17, v18, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
}

void __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  _QWORD block[4];
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionManager _checkInitiatorEligibilityWithIsHandoff:completion:]_block_invoke";
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s Initiator eligibility check complete, returning to the queue of the SessionManager, error, %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke_267;
    block[3] = &unk_1E92A5B50;
    v16 = WeakRetained;
    v19 = a2;
    v14 = *(_OWORD *)(a1 + 32);
    v9 = (id)v14;
    v18 = v14;
    v17 = v5;
    dispatch_async(v8, block);

    v10 = v16;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v12 = *MEMORY[0x1E0D8BB70];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("SMSessionManager was destroyed before eligibility check");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 24, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __71__SMSessionManager__checkInitiatorEligibilityWithIsHandoff_completion___block_invoke_267(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInitiatorEligibilityQueue:", 0);
  if (*(_QWORD *)(a1 + 64) == 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (BOOL)_isWatchDeviceEligibleForHandoff
{
  _BOOL4 v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[SMSessionManager _isWatchOnWristEligibilityCriteriaSatisfied](self, "_isWatchOnWristEligibilityCriteriaSatisfied");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[SMSessionManager _isWatchDeviceEligibleForHandoff]";
    v7 = 1024;
    v8 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s isWatchOnWrist, %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

- (BOOL)_sessionSupportsHandoff
{
  NSObject *v4;
  objc_class *v5;
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
  _BOOL4 v16;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager state](self, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager state](self, "state");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "sessionSupportsHandoff");
    v9 = (void *)MEMORY[0x1E0D8BA28];
    -[SMSessionManager state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertSessionStateToString:", objc_msgSend(v10, "sessionState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414082;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    v29 = 1024;
    v30 = v18;
    v31 = 2112;
    v32 = v11;
    v33 = 1024;
    v34 = -[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", objc_msgSend(v12, "sessionState"));
    v35 = 1024;
    v36 = -[SMSessionManager _isSessionManagerStateStaleToHandoff](self, "_isSessionManagerStateStaleToHandoff");
    v37 = 1024;
    v38 = objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled");
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, config %d, sessionState, %@, _isHandoffAllowedInSessionState, %{Bool}d, _isSessionManagerStateStaleToHandoff, %{Bool}d, feature %d", buf, 0x42u);

  }
  -[SMSessionManager state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "sessionSupportsHandoff")
    && objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaHandoffEnabled"))
  {
    -[SMSessionManager state](self, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", objc_msgSend(v15, "sessionState")))
    {
      v16 = !-[SMSessionManager _isSessionManagerStateStaleToHandoff](self, "_isSessionManagerStateStaleToHandoff");
    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_isSessionManagerStateStaleToHandoff
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManagerState date](self->_state, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 > 172800.0;

  return v6;
}

- (void)onWristStateChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SMSessionManager queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__SMSessionManager_onWristStateChangeNotification___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v9;
      v14 = 2080;
      v15 = "-[SMSessionManager onWristStateChangeNotification:]";
      v16 = 1024;
      v17 = 2266;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

uint64_t __51__SMSessionManager_onWristStateChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onWristStateChangeNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onWristStateChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SMSessionManager _onWristStateChangeNotification:]";
    v8 = 2048;
    v9 = objc_msgSend(v4, "wristState");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, received wrist state, %ld", (uint8_t *)&v6, 0x16u);
  }

  -[SMSessionManager setWristState:](self, "setWristState:", objc_msgSend(v4, "wristState"));
}

- (BOOL)_isWatchOnWristEligibilityCriteriaSatisfied
{
  return -[SMSessionManager wristState](self, "wristState") == 2;
}

- (BOOL)_isWatchInLowPowerMode
{
  return 1;
}

- (unint64_t)_evaluateHandoffRebootReconciliationState:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  id v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  _QWORD v43[4];
  NSObject *v44;
  uint64_t *v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE buf[40];
  id v54;
  uint64_t v55;
  uint8_t v56[16];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SMSessionManager _stateValidForSessionResume:](self, "_stateValidForSessionResume:", v4))
  {
    v11 = 1;
    goto LABEL_31;
  }
  if (!-[SMSessionManager _isActiveSessionDetailsFetchedFromCloudKitSinceBoot](self, "_isActiveSessionDetailsFetchedFromCloudKitSinceBoot")&& !-[SMSessionManager _isActiveSessionDetailsFetchAttemptFailed](self, "_isActiveSessionDetailsFetchAttemptFailed"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = -[SMSessionManager _isActiveSessionDetailsFetchedFromCloudKitSinceBoot](self, "_isActiveSessionDetailsFetchedFromCloudKitSinceBoot");
      objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v36;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v37;
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsFetchedFromCloudKitSinceBoot, %{Bool}d, setting handoffRebootReconciliationState to, %@", buf, 0x1Cu);

    }
    -[SMSessionManager _startActiveSessionDetailsTimerWithLatency:](self, "_startActiveSessionDetailsTimerWithLatency:", self->_activeSessionDetailsFetchTimeout);
    goto LABEL_28;
  }
  if (-[SMSessionManager _isActiveSessionDetailsOutOfSync](self, "_isActiveSessionDetailsOutOfSync"))
  {
    v5 = -[SMSessionManager _isActiveSessionDetailsFetchAttemptFailed](self, "_isActiveSessionDetailsFetchAttemptFailed");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        v8 = -[SMSessionManager _isActiveSessionDetailsOutOfSync](self, "_isActiveSessionDetailsOutOfSync");
        v9 = -[SMSessionManager _isActiveSessionDetailsFetchAttemptFailed](self, "_isActiveSessionDetailsFetchAttemptFailed");
        objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        *(_WORD *)&buf[24] = 2112;
        *(_QWORD *)&buf[26] = v10;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsOutOfSync, %{Bool}d, _isActiveSessionDetailsFetchAttemptFailed, %{Bool}d setting handoffRebootReconciliationState to, %@", buf, 0x22u);

      }
      v11 = 4;
      goto LABEL_31;
    }
    if (v7)
    {
      v39 = -[SMSessionManager _isActiveSessionDetailsOutOfSync](self, "_isActiveSessionDetailsOutOfSync");
      objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v39;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v40;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsOutOfSync, %{Bool}d, setting handoffRebootReconciliationState to, %@", buf, 0x1Cu);

    }
    -[SMSessionManager activeSessionDetailsDelegate](self, "activeSessionDetailsDelegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "fetchActiveSessionDetailsWithHandler:", &__block_literal_global_271);

    -[SMSessionManager _startActiveSessionDetailsTimerWithLatency:](self, "_startActiveSessionDetailsTimerWithLatency:", self->_activeSessionDetailsFetchTimeout);
LABEL_28:
    v11 = 2;
    goto LABEL_31;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = -[SMSessionManager _isActiveSessionDetailsOutOfSync](self, "_isActiveSessionDetailsOutOfSync");
    objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v14;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, _isActiveSessionDetailsOutOfSync, %{Bool}d, setting handoffRebootReconciliationState to, %@", buf, 0x1Cu);

  }
  v15 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__167;
  *(_QWORD *)&buf[32] = __Block_byref_object_dispose__167;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__167;
  v51 = __Block_byref_object_dispose__167;
  v52 = 0;
  -[SMSessionManager activeSessionDetailsDelegate](self, "activeSessionDetailsDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __62__SMSessionManager__evaluateHandoffRebootReconciliationState___block_invoke;
  v43[3] = &unk_1E92A5BA0;
  v45 = &v47;
  v46 = buf;
  v17 = v15;
  v44 = v17;
  objc_msgSend(v16, "fetchActiveSessionDetailsWithHandler:", v43);

  v18 = v17;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = dispatch_time(0, 2000000000);
  if (!dispatch_semaphore_wait(v18, v20))
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceDate:", v19);
  v23 = v22;
  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1055);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "filteredArrayUsingPredicate:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "submitToCoreAnalytics:type:duration:", v28, 1, v23);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v56 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v56, 2u);
  }

  v30 = (void *)MEMORY[0x1E0CB35C8];
  v55 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v56 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = objc_retainAutorelease(v32);

    v34 = 0;
  }
  else
  {
LABEL_20:
    v33 = 0;
    v34 = 1;
  }

  v38 = v33;
  if ((v34 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v33);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v11 = 4;
  }
  else
  {
    -[SMSessionManager setActiveSessionDetails:](self, "setActiveSessionDetails:", v48[5]);
    v11 = 3;
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(buf, 8);

LABEL_31:
  return v11;
}

void __62__SMSessionManager__evaluateHandoffRebootReconciliationState___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 136315906;
    v17 = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]_block_invoke";
    v18 = 2112;
    v19 = v7;
    v20 = 1024;
    v21 = a3;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, activeSessionDetails record inSync, retrieved activeSessionDetails, %@, success, %{Bool}d, error, %@", (uint8_t *)&v16, 0x26u);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v12 = v7;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v8;
  v15 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__SMSessionManager__evaluateHandoffRebootReconciliationState___block_invoke_270(uint64_t a1, void *a2, int a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315906;
    v10 = "-[SMSessionManager _evaluateHandoffRebootReconciliationState:]_block_invoke";
    v11 = 2112;
    v12 = v6;
    v13 = 1024;
    v14 = a3;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, callback from fetchActiveSessionDetailsWithHandler when CK record got stale (outofSync), activeSessionDetails, %@, success, %{Bool}d, error, %@", (uint8_t *)&v9, 0x26u);
  }

}

- (unint64_t)_reconciliationDecisionForState:(id)a3 isActiveDevice:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v4 || !-[SMSessionManager _isMultiDeviceSetupForLocalState:](self, "_isMultiDeviceSetupForLocalState:", v6))
  {
LABEL_6:
    v8 = 2;
    goto LABEL_7;
  }
  v7 = -[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState");
  if (v7 != 2)
  {
    if (v7 == 3)
    {
      v8 = -[SMSessionManager _reconciliationForDecisionForCKFetchCompleted:](self, "_reconciliationForDecisionForCKFetchCompleted:", v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v8 = 1;
LABEL_7:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", -[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager activeSessionDetails](self, "activeSessionDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[SMSessionManager _reconciliationDecisionForState:isActiveDevice:]";
    v17 = 1024;
    *(_DWORD *)v18 = v4;
    *(_WORD *)&v18[4] = 2112;
    *(_QWORD *)&v18[6] = v13;
    v19 = 2112;
    v20 = v14;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%s, isActiveDevice, %{Bool}d, self.handoffRebootReconciliationState, %@,\n activeSessionDetails, %@,\n sessionManagerState, %@", (uint8_t *)&v15, 0x30u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationDecisionToString:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[SMSessionManager _reconciliationDecisionForState:isActiveDevice:]";
    v17 = 2112;
    *(_QWORD *)v18 = v11;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, bootstrapDecision, %@", (uint8_t *)&v15, 0x16u);

  }
  return v8;
}

- (BOOL)_isMultiDeviceSetupForLocalState:(id)a3
{
  void *v3;

  objc_msgSend(a3, "activePairedDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (unint64_t)_reconciliationForDecisionForCKFetchCompleted:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[SMSessionManager activeSessionDetails](self, "activeSessionDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[SMSessionManager _isLocalStateInSyncWithActiveSessionDetails:deviceSessionManagerState:](self, "_isLocalStateInSyncWithActiveSessionDetails:deviceSessionManagerState:", v5, v4);

  if ((_DWORD)self)
    v6 = 2;
  else
    v6 = 3;

  return v6;
}

- (BOOL)_isLocalStateInSyncWithActiveSessionDetails:(id)a3 deviceSessionManagerState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v9))
  {
    objc_msgSend(v5, "activeDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDeviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v15 = 136315906;
    v16 = "-[SMSessionManager _isLocalStateInSyncWithActiveSessionDetails:deviceSessionManagerState:]";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    v21 = 1024;
    v22 = v12;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, activeSessionDetails %@, deviceSessionManagerState, %@, isLocalStateInSync %{Bool}d", (uint8_t *)&v15, 0x26u);
  }

  return v12;
}

- (void)onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[SMSessionManager onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
    v20 = 2112;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s activeSessionDetails, %@, success, %{Bool}d, error, %@", buf, 0x26u);
  }

  -[SMSessionManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__SMSessionManager_onActiveSessionDetailsFetchAttemptFromCKCompleted_success_error___block_invoke;
  v14[3] = &unk_1E929EBC0;
  v14[4] = self;
  v15 = v8;
  v17 = v6;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

uint64_t __84__SMSessionManager_onActiveSessionDetailsFetchAttemptFromCKCompleted_success_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_onActiveSessionDetailsFetchAttemptFromCKCompleted:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", -[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136316162;
    v16 = "-[SMSessionManager _onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = v6;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s activeSessionDetails, %@, success, %{Bool}d, current handoffRebootReconciliationState, %@,error, %@", (uint8_t *)&v15, 0x30u);

  }
  if (!v9)
  {
    v12 = v8;
    if (v6)
      goto LABEL_8;
  }
  if (!v6 && objc_msgSend(v9, "code", v12) == 11)
  {
    v12 = 0;
LABEL_8:
    -[SMSessionManager setActiveSessionDetails:](self, "setActiveSessionDetails:", v12);
  }
  if (-[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState", v12) == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "SessionHandoffRebootReconciliationStateToString:", -[SMSessionManager handoffRebootReconciliationState](self, "handoffRebootReconciliationState"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315394;
      v16 = "-[SMSessionManager _onActiveSessionDetailsFetchAttemptFromCKCompleted:success:error:]";
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, handoffRebootReconciliationState, %@, ActiveSessionDetails fetch attempt completed, clearing ActiveSessionDetailsTimeoutTimer, calling _bootstrapToState", (uint8_t *)&v15, 0x16u);

    }
    -[SMSessionManager _clearActiveSessionDetailsTimeoutTimer](self, "_clearActiveSessionDetailsTimeoutTimer");
    -[SMSessionManager _bootstrapToState](self, "_bootstrapToState");
  }

}

- (BOOL)_isActiveSessionDetailsFetchAttemptFailed
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchFailureDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5 < 1800.0;

  }
  else
  {
    v6 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("NO");
    if (v6)
      v9 = CFSTR("YES");
    v10 = 136315394;
    v11 = "-[SMSessionManager _isActiveSessionDetailsFetchAttemptFailed]";
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails,  fetch attempt, didFail, %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (BOOL)_isActiveSessionDetailsOutOfSync
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[SMSessionManager _isActiveSessionDetailsLocalRecordExpired](self, "_isActiveSessionDetailsLocalRecordExpired"))
    v3 = 1;
  else
    v3 = !-[SMSessionManager _isActiveSessionDetailsFetchedFromCloudKitSinceBoot](self, "_isActiveSessionDetailsFetchedFromCloudKitSinceBoot");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v7 = 136315394;
    v8 = "-[SMSessionManager _isActiveSessionDetailsOutOfSync]";
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isOutOfSync, %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)_isActiveSessionDetailsLocalRecordExpired
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchSuccessDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5 < 1800.0;

  }
  else
  {
    v6 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = CFSTR("YES");
    if (v6)
      v9 = CFSTR("NO");
    v10 = 136315394;
    v11 = "-[SMSessionManager _isActiveSessionDetailsLocalRecordExpired]";
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isExpired, %@", (uint8_t *)&v10, 0x16u);
  }

  return !v6;
}

- (BOOL)_isActiveSessionDetailsFetchedFromCloudKitSinceBoot
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSafetyCacheActiveSessionDetailsFetchedFromCloudKitSinceBootKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    v8 = 136315394;
    v9 = "-[SMSessionManager _isActiveSessionDetailsFetchedFromCloudKitSinceBoot]";
    v10 = 2112;
    v11 = v7;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s, ActiveSessionDetails isRecordFetchedFromCKSinceBoot, %@", (uint8_t *)&v8, 0x16u);
  }

  return v4;
}

- (id)_stateTransitionDecisionToState:(id)a3 transitionType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  SMSessionStateTransitionDecision *v19;
  SMSessionStateTransitionDecision *v20;
  void *v21;
  SMSessionStateTransitionDecision *v22;
  void *v23;
  NSObject *v24;
  SMSessionManagerState *state;
  SMSessionStateTransitionDecision *v26;
  uint64_t v27;
  SMSessionStateTransitionDecision *v28;
  SMSessionStateTransitionDecision *v29;
  NSObject *v30;
  uint64_t v31;
  SMSessionStateTransitionDecision *v32;
  uint64_t v33;
  SMSessionStateTransitionDecision *v34;
  uint64_t v35;
  SMSessionStateTransitionDecision *v36;
  uint64_t v37;
  SMSessionStateTransitionDecision *v38;
  SMSessionStateTransitionDecision *v39;
  SMSessionStateTransitionDecision *v40;
  NSObject *v41;
  uint64_t v42;
  SMSessionStateTransitionDecision *v43;
  SMSessionStateTransitionDecision *v44;
  SMSessionStateTransitionDecision *v45;
  SMSessionStateTransitionDecision *v46;
  SMSessionStateTransitionDecision *v47;
  SMSessionStateTransitionDecision *v48;
  SMSessionStateTransitionDecision *v49;
  SMSessionStateTransitionDecision *v50;
  SMSessionStateTransitionDecision *v51;
  SMSessionStateTransitionDecision *v52;
  SMSessionStateTransitionDecision *v53;
  SMSessionStateTransitionDecision *v54;
  SMSessionStateTransitionDecision *v55;
  SMSessionStateTransitionDecision *v56;
  SMSessionStateTransitionDecision *v57;
  SMSessionStateTransitionDecision *v58;
  SMSessionStateTransitionDecision *v59;
  void *v61;
  uint64_t v62;
  _QWORD v63[5];
  id v64;
  unint64_t v65;
  _QWORD v66[5];
  id v67;
  unint64_t v68;
  _QWORD v69[5];
  id v70;
  unint64_t v71;
  _QWORD v72[5];
  id v73;
  unint64_t v74;
  _QWORD v75[5];
  id v76;
  unint64_t v77;
  _QWORD v78[5];
  id v79;
  unint64_t v80;
  _QWORD v81[5];
  id v82;
  uint64_t v83;
  _QWORD v84[5];
  id v85;
  uint64_t v86;
  _QWORD v87[5];
  id v88;
  uint64_t v89;
  _QWORD v90[5];
  id v91;
  unint64_t v92;
  _QWORD v93[5];
  id v94;
  unint64_t v95;
  _QWORD v96[5];
  id v97;
  unint64_t v98;
  _QWORD v99[5];
  id v100;
  unint64_t v101;
  _QWORD v102[5];
  id v103;
  unint64_t v104;
  _QWORD v105[5];
  id v106;
  unint64_t v107;
  _QWORD v108[5];
  id v109;
  unint64_t v110;
  _QWORD v111[5];
  id v112;
  unint64_t v113;
  _QWORD v114[5];
  id v115;
  unint64_t v116;
  _QWORD v117[5];
  id v118;
  unint64_t v119;
  _QWORD v120[5];
  id v121;
  unint64_t v122;
  _QWORD v123[5];
  id v124;
  unint64_t v125;
  _QWORD v126[5];
  id v127;
  unint64_t v128;
  _QWORD v129[5];
  id v130;
  unint64_t v131;
  _QWORD v132[5];
  id v133;
  unint64_t v134;
  _QWORD v135[5];
  id v136;
  unint64_t v137;
  _QWORD v138[5];
  id v139;
  unint64_t v140;
  _QWORD v141[5];
  id v142;
  unint64_t v143;
  _QWORD v144[5];
  id v145;
  unint64_t v146;
  uint8_t buf[4];
  const char *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  id v152;
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v148 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]";
    v149 = 2112;
    v150 = (uint64_t)v8;
    v151 = 2112;
    v152 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, attempting state transition from state, %@, to state, %@", buf, 0x20u);

  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2)
    goto LABEL_6;
  -[SMSessionManager state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionState");
  v11 = objc_msgSend(v6, "sessionState");

  if (v10 == v11)
  {
    -[SMSessionManager state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", objc_msgSend(v12, "sessionState"));

    if (v13)
    {
LABEL_6:
      -[SMSessionManager state](self, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "sessionState");

      switch(v15)
      {
        case 0:
          switch(objc_msgSend(v6, "sessionState"))
          {
            case 1:
              v55 = [SMSessionStateTransitionDecision alloc];
              v144[0] = MEMORY[0x1E0C809B0];
              v144[1] = 3221225472;
              v144[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2;
              v144[3] = &unk_1E9297BC8;
              v144[4] = self;
              v145 = v6;
              v146 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v55, "initWithIsAllowed:actionBlock:", 1, v144);
              v21 = v145;
              goto LABEL_74;
            case 2:
              v56 = [SMSessionStateTransitionDecision alloc];
              v138[0] = MEMORY[0x1E0C809B0];
              v138[1] = 3221225472;
              v138[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4;
              v138[3] = &unk_1E9297BC8;
              v138[4] = self;
              v139 = v6;
              v140 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v56, "initWithIsAllowed:actionBlock:", 1, v138);
              v21 = v139;
              goto LABEL_74;
            case 4:
              v57 = [SMSessionStateTransitionDecision alloc];
              v129[0] = MEMORY[0x1E0C809B0];
              v129[1] = 3221225472;
              v129[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7;
              v129[3] = &unk_1E9297BC8;
              v129[4] = self;
              v130 = v6;
              v131 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v57, "initWithIsAllowed:actionBlock:", 1, v129);
              v21 = v130;
              goto LABEL_74;
            case 7:
            case 8:
            case 9:
              v26 = [SMSessionStateTransitionDecision alloc];
              v135[0] = MEMORY[0x1E0C809B0];
              v135[1] = 3221225472;
              v135[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5;
              v135[3] = &unk_1E9297BC8;
              v135[4] = self;
              v136 = v6;
              v137 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v26, "initWithIsAllowed:actionBlock:", 1, v135);
              v21 = v136;
              goto LABEL_74;
            case 10:
            case 11:
              v50 = [SMSessionStateTransitionDecision alloc];
              v141[0] = MEMORY[0x1E0C809B0];
              v141[1] = 3221225472;
              v141[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3;
              v141[3] = &unk_1E9297BC8;
              v141[4] = self;
              v142 = v6;
              v143 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v50, "initWithIsAllowed:actionBlock:", 1, v141);
              v21 = v142;
              goto LABEL_74;
            case 12:
              v58 = [SMSessionStateTransitionDecision alloc];
              v126[0] = MEMORY[0x1E0C809B0];
              v126[1] = 3221225472;
              v126[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8;
              v126[3] = &unk_1E9297BC8;
              v126[4] = self;
              v127 = v6;
              v128 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v58, "initWithIsAllowed:actionBlock:", 1, v126);
              v21 = v127;
              goto LABEL_74;
            case 14:
              v59 = [SMSessionStateTransitionDecision alloc];
              v132[0] = MEMORY[0x1E0C809B0];
              v132[1] = 3221225472;
              v132[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6;
              v132[3] = &unk_1E9297BC8;
              v132[4] = self;
              v133 = v6;
              v134 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v59, "initWithIsAllowed:actionBlock:", 1, v132);
              v21 = v133;
              goto LABEL_74;
            default:
              v22 = [SMSessionStateTransitionDecision alloc];
              v23 = &__block_literal_global_280;
              goto LABEL_70;
          }
        case 1:
          v27 = objc_msgSend(v6, "sessionState");
          v28 = [SMSessionStateTransitionDecision alloc];
          if (v27 == 10)
          {
            v123[0] = MEMORY[0x1E0C809B0];
            v123[1] = 3221225472;
            v123[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_10;
            v123[3] = &unk_1E9297BC8;
            v123[4] = self;
            v124 = v6;
            v125 = a4;
            v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v28, "initWithIsAllowed:actionBlock:", 1, v123);
            v21 = v124;
            goto LABEL_74;
          }
          v23 = &__block_literal_global_281;
          goto LABEL_37;
        case 2:
          switch(objc_msgSend(v6, "sessionState"))
          {
            case 1:
              v51 = [SMSessionStateTransitionDecision alloc];
              v111[0] = MEMORY[0x1E0C809B0];
              v111[1] = 3221225472;
              v111[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_17;
              v111[3] = &unk_1E9297BC8;
              v111[4] = self;
              v112 = v6;
              v113 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v51, "initWithIsAllowed:actionBlock:", 1, v111);
              v21 = v112;
              goto LABEL_74;
            case 2:
              v52 = [SMSessionStateTransitionDecision alloc];
              v99[0] = MEMORY[0x1E0C809B0];
              v99[1] = 3221225472;
              v99[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_21;
              v99[3] = &unk_1E9297BC8;
              v99[4] = self;
              v100 = v6;
              v101 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v52, "initWithIsAllowed:actionBlock:", 1, v99);
              v21 = v100;
              goto LABEL_74;
            case 4:
              v53 = [SMSessionStateTransitionDecision alloc];
              v102[0] = MEMORY[0x1E0C809B0];
              v102[1] = 3221225472;
              v102[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_20;
              v102[3] = &unk_1E9297BC8;
              v102[4] = self;
              v103 = v6;
              v104 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v53, "initWithIsAllowed:actionBlock:", 1, v102);
              v21 = v103;
              goto LABEL_74;
            case 7:
            case 8:
            case 9:
            case 14:
              v29 = [SMSessionStateTransitionDecision alloc];
              v105[0] = MEMORY[0x1E0C809B0];
              v105[1] = 3221225472;
              v105[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_19;
              v105[3] = &unk_1E9297BC8;
              v105[4] = self;
              v106 = v6;
              v107 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v29, "initWithIsAllowed:actionBlock:", 1, v105);
              v21 = v106;
              goto LABEL_74;
            case 12:
              v54 = [SMSessionStateTransitionDecision alloc];
              v108[0] = MEMORY[0x1E0C809B0];
              v108[1] = 3221225472;
              v108[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_18;
              v108[3] = &unk_1E9297BC8;
              v108[4] = self;
              v109 = v6;
              v110 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v54, "initWithIsAllowed:actionBlock:", 1, v108);
              v21 = v109;
              goto LABEL_74;
            default:
              v22 = [SMSessionStateTransitionDecision alloc];
              v23 = &__block_literal_global_285;
              goto LABEL_70;
          }
        case 4:
          v31 = objc_msgSend(v6, "sessionState");
          switch(v31)
          {
            case 12:
              v48 = [SMSessionStateTransitionDecision alloc];
              v93[0] = MEMORY[0x1E0C809B0];
              v93[1] = 3221225472;
              v93[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_287;
              v93[3] = &unk_1E9297BC8;
              v93[4] = self;
              v94 = v6;
              v95 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v48, "initWithIsAllowed:actionBlock:", 1, v93);
              v21 = v94;
              goto LABEL_74;
            case 4:
              v49 = [SMSessionStateTransitionDecision alloc];
              v90[0] = MEMORY[0x1E0C809B0];
              v90[1] = 3221225472;
              v90[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_288;
              v90[3] = &unk_1E9297BC8;
              v90[4] = self;
              v91 = v6;
              v92 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v49, "initWithIsAllowed:actionBlock:", 1, v90);
              v21 = v91;
              goto LABEL_74;
            case 1:
              v32 = [SMSessionStateTransitionDecision alloc];
              v96[0] = MEMORY[0x1E0C809B0];
              v96[1] = 3221225472;
              v96[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_286;
              v96[3] = &unk_1E9297BC8;
              v96[4] = self;
              v97 = v6;
              v98 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v32, "initWithIsAllowed:actionBlock:", 1, v96);
              v21 = v97;
              goto LABEL_74;
          }
          v22 = [SMSessionStateTransitionDecision alloc];
          v23 = &__block_literal_global_290;
          goto LABEL_70;
        case 7:
        case 8:
        case 9:
          -[SMSessionManager state](self, "state");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "sessionState");
          v18 = objc_msgSend(v6, "sessionState");

          if (v17 == v18)
          {
            switch(a4)
            {
              case 1uLL:
                v19 = [SMSessionStateTransitionDecision alloc];
                v81[0] = MEMORY[0x1E0C809B0];
                v81[1] = 3221225472;
                v81[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8_293;
                v81[3] = &unk_1E9297BC8;
                v81[4] = self;
                v82 = v6;
                v83 = 1;
                v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v19, "initWithIsAllowed:actionBlock:", 1, v81);
                v21 = v82;
                goto LABEL_74;
              case 2uLL:
                v39 = [SMSessionStateTransitionDecision alloc];
                v87[0] = MEMORY[0x1E0C809B0];
                v87[1] = 3221225472;
                v87[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6_291;
                v87[3] = &unk_1E9297BC8;
                v87[4] = self;
                v88 = v6;
                v89 = 2;
                v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v39, "initWithIsAllowed:actionBlock:", 1, v87);
                v21 = v88;
                goto LABEL_74;
              case 3uLL:
                v40 = [SMSessionStateTransitionDecision alloc];
                v84[0] = MEMORY[0x1E0C809B0];
                v84[1] = 3221225472;
                v84[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_292;
                v84[3] = &unk_1E9297BC8;
                v84[4] = self;
                v85 = v6;
                v86 = 3;
                v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v40, "initWithIsAllowed:actionBlock:", 1, v84);
                v21 = v85;
                goto LABEL_74;
              case 5uLL:
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "SMStateTransitionTypeNonActiveBootstrapWaitStateSync self transition, Unexpected transition, it should have never happened", buf, 2u);
                }

                goto LABEL_46;
              default:
                goto LABEL_46;
            }
          }
          goto LABEL_46;
        case 10:
          v33 = objc_msgSend(v6, "sessionState");
          if (v33 == 11 || v33 == 1)
          {
            v34 = [SMSessionStateTransitionDecision alloc];
            v120[0] = MEMORY[0x1E0C809B0];
            v120[1] = 3221225472;
            v120[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_12;
            v120[3] = &unk_1E9297BC8;
            v120[4] = self;
            v121 = v6;
            v122 = a4;
            v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v34, "initWithIsAllowed:actionBlock:", 1, v120);
            v21 = v121;
            goto LABEL_74;
          }
          v22 = [SMSessionStateTransitionDecision alloc];
          v23 = &__block_literal_global_282;
          goto LABEL_70;
        case 11:
          v35 = objc_msgSend(v6, "sessionState");
          if (v35 == 2)
          {
            v38 = [SMSessionStateTransitionDecision alloc];
            v114[0] = MEMORY[0x1E0C809B0];
            v114[1] = 3221225472;
            v114[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_15;
            v114[3] = &unk_1E9297BC8;
            v114[4] = self;
            v115 = v6;
            v116 = a4;
            v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v38, "initWithIsAllowed:actionBlock:", 1, v114);
            v21 = v115;
            goto LABEL_74;
          }
          if (v35 == 1)
          {
            v36 = [SMSessionStateTransitionDecision alloc];
            v117[0] = MEMORY[0x1E0C809B0];
            v117[1] = 3221225472;
            v117[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_14;
            v117[3] = &unk_1E9297BC8;
            v117[4] = self;
            v118 = v6;
            v119 = a4;
            v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v36, "initWithIsAllowed:actionBlock:", 1, v117);
            v21 = v118;
            goto LABEL_74;
          }
          v22 = [SMSessionStateTransitionDecision alloc];
          v23 = &__block_literal_global_283;
          goto LABEL_70;
        case 12:
          v37 = objc_msgSend(v6, "sessionState");
          v28 = [SMSessionStateTransitionDecision alloc];
          if (v37 == 1)
          {
            v63[0] = MEMORY[0x1E0C809B0];
            v63[1] = 3221225472;
            v63[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_301;
            v63[3] = &unk_1E9297BC8;
            v63[4] = self;
            v64 = v6;
            v65 = a4;
            v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v28, "initWithIsAllowed:actionBlock:", 1, v63);
            v21 = v64;
            goto LABEL_74;
          }
          v23 = &__block_literal_global_303;
LABEL_37:
          v22 = v28;
          goto LABEL_70;
        case 14:
LABEL_46:
          v42 = objc_msgSend(v6, "sessionState");
          if (v42 <= 3)
          {
            if (v42 == 1)
            {
              v47 = [SMSessionStateTransitionDecision alloc];
              v78[0] = MEMORY[0x1E0C809B0];
              v78[1] = 3221225472;
              v78[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_294;
              v78[3] = &unk_1E9297BC8;
              v78[4] = self;
              v79 = v6;
              v80 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v47, "initWithIsAllowed:actionBlock:", 1, v78);
              v21 = v79;
              goto LABEL_74;
            }
            if (v42 == 2)
            {
              v44 = [SMSessionStateTransitionDecision alloc];
              v72[0] = MEMORY[0x1E0C809B0];
              v72[1] = 3221225472;
              v72[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_296;
              v72[3] = &unk_1E9297BC8;
              v72[4] = self;
              v73 = v6;
              v74 = a4;
              v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v44, "initWithIsAllowed:actionBlock:", 1, v72);
              v21 = v73;
              goto LABEL_74;
            }
          }
          else
          {
            switch(v42)
            {
              case 4:
                v45 = [SMSessionStateTransitionDecision alloc];
                v69[0] = MEMORY[0x1E0C809B0];
                v69[1] = 3221225472;
                v69[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_297;
                v69[3] = &unk_1E9297BC8;
                v69[4] = self;
                v70 = v6;
                v71 = a4;
                v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v45, "initWithIsAllowed:actionBlock:", 1, v69);
                v21 = v70;
                goto LABEL_74;
              case 12:
                v46 = [SMSessionStateTransitionDecision alloc];
                v75[0] = MEMORY[0x1E0C809B0];
                v75[1] = 3221225472;
                v75[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_295;
                v75[3] = &unk_1E9297BC8;
                v75[4] = self;
                v76 = v6;
                v77 = a4;
                v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v46, "initWithIsAllowed:actionBlock:", 1, v75);
                v21 = v76;
                goto LABEL_74;
              case 14:
                v43 = [SMSessionStateTransitionDecision alloc];
                v66[0] = MEMORY[0x1E0C809B0];
                v66[1] = 3221225472;
                v66[2] = __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5_298;
                v66[3] = &unk_1E9297BC8;
                v66[4] = self;
                v67 = v6;
                v68 = a4;
                v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v43, "initWithIsAllowed:actionBlock:", 1, v66);
                v21 = v67;
LABEL_74:

                goto LABEL_75;
            }
          }
          v22 = [SMSessionStateTransitionDecision alloc];
          v23 = &__block_literal_global_300_0;
          goto LABEL_70;
        default:
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
          {
            -[SMSessionManager state](self, "state");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "sessionState");
            *(_DWORD *)buf = 136315394;
            v148 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]";
            v149 = 2048;
            v150 = v62;
            _os_log_fault_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_FAULT, "%s, UNHANDLED FROM STATE, %lu", buf, 0x16u);

          }
          v22 = [SMSessionStateTransitionDecision alloc];
          v23 = &__block_literal_global_305;
          goto LABEL_70;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      state = self->_state;
      *(_DWORD *)buf = 136315650;
      v148 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]";
      v149 = 2112;
      v150 = (uint64_t)state;
      v151 = 2112;
      v152 = v6;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, invalid and not allowed for a handoff operation", buf, 0x20u);
    }

    v22 = [SMSessionStateTransitionDecision alloc];
    v23 = &__block_literal_global_279;
  }
  else
  {
    v22 = [SMSessionStateTransitionDecision alloc];
    v23 = &__block_literal_global_277_0;
  }
LABEL_70:
  v20 = -[SMSessionStateTransitionDecision initWithIsAllowed:actionBlock:](v22, "initWithIsAllowed:actionBlock:", 0, v23);
LABEL_75:

  return v20;
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  objc_msgSend(*(id *)(a1 + 32), "_bootstrapHysteresisState");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  objc_msgSend(*(id *)(a1 + 32), "_bootstrapHysteresisState");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  if (*(_QWORD *)(a1 + 48) != 5)
    objc_msgSend(*(id *)(a1 + 32), "_setupAnomalyAlertsOnResume");
  objc_msgSend(*(id *)(a1 + 32), "_bootstrapHysteresisState");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  objc_msgSend(*(id *)(a1 + 32), "_setupAnomalyAlertsOnResume");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  objc_msgSend(*(id *)(a1 + 32), "_bootstrapHysteresisState");
  objc_msgSend(*(id *)(a1 + 32), "_reconnectCarouselSessionAndSetupTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionResume");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_15(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStart");
  objc_msgSend(MEMORY[0x1E0D8B8F0], "startActivityWithState:localState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onSessionStartedWithState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_17(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(*(id *)(a1 + 32), "_postEndAwarenessLiveActivity");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

void __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_postAnomalyAlert");
  objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "monitorContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDeclareAnomalyForTriggerCategory:", objc_msgSend(v5, "triggerCategory"));

}

void __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_checkDefaultsForCacheReleaseDateWithState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_postCacheReleaseAndUpdatingWithTargetDate:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));

}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_21(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 136315394;
    v13 = "-[SMSessionManager _stateTransitionDecisionToState:transitionType:]_block_invoke_21";
    v14 = 1024;
    v15 = v5 ^ 1;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, isSessionConfigChanged, %{Bool}d", (uint8_t *)&v12, 0x12u);
  }

  v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v7;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", *(_QWORD *)(a1 + 48));
  v10 = *(_QWORD *)(a1 + 48);
  if (v10 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForBecomingNonActiveDevice");
  }
  else if (v10 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForBecomingActiveDevice");
  }
  else if (v10 == 1 && (v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForConfigurationChange");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_286(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(*(id *)(a1 + 32), "_stopPlayingCacheReleaseAndUpdatingSound");
  objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_287(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stopPlayingCacheReleaseAndUpdatingSound");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(*(id *)(a1 + 32), "_postEndAwarenessLiveActivity");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_288(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForBecomingNonActiveDevice");
  }
  else if (v5 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForBecomingActiveDevice");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_6_291(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForBecomingActiveDevice");
  objc_msgSend(*(id *)(a1 + 32), "_bootstrapHysteresisState");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_292(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForBecomingNonActiveDevice");
  objc_msgSend(*(id *)(a1 + 32), "_teardownAnomalyAlerts");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_8_293(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_294(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_teardownAnomalyAlerts");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_2_295(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_teardownAnomalyAlerts");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSessionEndForActiveDevice:", objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"));
  objc_msgSend(*(id *)(a1 + 32), "_initializeUserDisabledConnectivityWatchDefault");
  objc_msgSend(*(id *)(a1 + 32), "_postEndAwarenessLiveActivity");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_3_296(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_teardownAnomalyAlerts");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForTriggerResponse");
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForConfigurationChange");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

void __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_4_297(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_teardownAnomalyAlerts");
  objc_msgSend(*(id *)(a1 + 32), "_checkDefaultsForCacheReleaseDateWithState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForTriggerResponse");
  objc_msgSend(*(id *)(a1 + 32), "_postCacheReleaseAndUpdatingWithTargetDate:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));

}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_5_298(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

uint64_t __67__SMSessionManager__stateTransitionDecisionToState_transitionType___block_invoke_7_301(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateScreenLockMonitor");
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForStateChangeWithTransitionType:", 1);
  objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsAndUpdatesUponStateTransitionWithType:", *(_QWORD *)(a1 + 48));
}

- (void)_setPendingSendSessionEndMessageWithReason:(unint64_t)a3 associatedGUID:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "-[SMSessionManager _setPendingSendSessionEndMessageWithReason:associatedGUID:]";
    v13 = 2048;
    v14 = a3;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, reason, %ld, associatedGUID, %@", (uint8_t *)&v11, 0x20u);
  }

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("RTDefaultsSessionManagerPendingSendSessionEndMessageReasonKey"));

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v6, CFSTR("RTDefaultsSessionManagerPendingSendSessionEndMessageAssociatedGUIDKey"));

}

- (void)_resetPendingSendSessionEndMessage
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SMSessionManager _resetPendingSendSessionEndMessage]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionManagerPendingSendSessionEndMessageReasonKey"));

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionManagerPendingSendSessionEndMessageAssociatedGUIDKey"));

}

- (void)_setupTimerAndLockMonitorForEndAwareness
{
  void *v3;
  void *v4;
  RTXPCTimerAlarm *v5;
  void *v6;
  uint64_t v7;
  RTXPCTimerAlarm *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  SMScreenLockMonitor *v26;
  void *v27;
  id v28;
  SMScreenLockMonitor *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(id *, int);
  void *v36;
  SMSessionManager *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[6];
  id v42;
  _QWORD v43[5];
  id v44;
  id location;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager endAwarenessBeforeUnlockXPCTimerAlarm](self, "endAwarenessBeforeUnlockXPCTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v3);

  -[SMSessionManager _invalidateScreenLockMonitor](self, "_invalidateScreenLockMonitor");
  objc_initWeak(&location, self);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__167;
  v43[4] = __Block_byref_object_dispose__167;
  -[SMSessionManagerState configuration](self->_state, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v44 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [RTXPCTimerAlarm alloc];
  -[SMSessionManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke;
  v41[3] = &unk_1E92A5D68;
  v41[4] = self;
  objc_copyWeak(&v42, &location);
  v41[5] = v43;
  v8 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v5, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.safetyMonitor.sessionManager.endAwarenessBeforeUnlock"), v6, v41);
  -[SMSessionManager setEndAwarenessBeforeUnlockXPCTimerAlarm:](self, "setEndAwarenessBeforeUnlockXPCTimerAlarm:", v8);

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsSessionManagerEndAwarenessBeforeUnlockTimerDurationKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMSessionManager defaultsManager](self, "defaultsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsSessionManagerEndAwarenessBeforeUnlockTimerDurationKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

  }
  else
  {
    v14 = *MEMORY[0x1E0D8BB68];
  }
  -[SMSessionManager state](self, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sessionStateTransitionDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingTimeInterval:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager endAwarenessBeforeUnlockXPCTimerAlarm](self, "endAwarenessBeforeUnlockXPCTimerAlarm");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v18, "fireWithDate:error:", v17, &v40);
  v19 = v40;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager endAwarenessBeforeUnlockXPCTimerAlarm](self, "endAwarenessBeforeUnlockXPCTimerAlarm");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v47 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]";
    v48 = 2112;
    v49 = v22;
    v50 = 2112;
    v51 = v17;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%s, %@, set with end date, %@", buf, 0x20u);

  }
  if (v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      -[SMSessionManager endAwarenessBeforeUnlockXPCTimerAlarm](self, "endAwarenessBeforeUnlockXPCTimerAlarm");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v47 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]";
      v48 = 2112;
      v49 = v31;
      v50 = 2112;
      v51 = v32;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "%s, %@, unable to start timer error, %@", buf, 0x20u);

    }
  }
  -[SMSessionManagerState configuration](self->_state, "configuration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sessionID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  v26 = [SMScreenLockMonitor alloc];
  -[SMSessionManager queue](self, "queue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  v34 = 3221225472;
  v35 = __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_310;
  v36 = &unk_1E92A5D90;
  objc_copyWeak(&v39, (id *)buf);
  v37 = self;
  v28 = v25;
  v38 = v28;
  v29 = -[SMScreenLockMonitor initWithQueue:handler:](v26, "initWithQueue:handler:", v27, &v33);
  -[SMSessionManager setScreenLockMonitor:](self, "setScreenLockMonitor:", v29, v33, v34, v35, v36, v37);

  objc_destroyWeak(&v39);
  objc_destroyWeak((id *)buf);

  objc_destroyWeak(&v42);
  _Block_object_dispose(v43, 8);

  objc_destroyWeak(&location);
}

void __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "endAwarenessBeforeUnlockXPCTimerAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@ expired in SMSessionManager", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_invalidateScreenLockMonitor");
  objc_msgSend(WeakRetained, "endAwarenessBeforeUnlockXPCTimerAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateTimer:", v6);

  objc_msgSend(WeakRetained, "terminateSessionWithSessionID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_310(id *a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "NO";
    if (a2)
      v6 = "YES";
    *(_DWORD *)buf = 136315394;
    v22 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]_block_invoke";
    v23 = 2080;
    v24 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, screen lock status changed isDeviceLocked, %s", buf, 0x16u);
  }

  if ((a2 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_invalidateScreenLockMonitor");
    objc_msgSend(WeakRetained, "endAwarenessBeforeUnlockXPCTimerAlarm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_invalidateTimer:", v7);

    objc_msgSend(a1[4], "defaultsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsSessionManagerEndAwarenessAfterUnlockTimerDurationKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1[4], "defaultsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsSessionManagerEndAwarenessAfterUnlockTimerDurationKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

    }
    else
    {
      v13 = *MEMORY[0x1E0D8BB60];
    }
    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    objc_msgSend(WeakRetained, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_313;
    v18[3] = &unk_1E9297540;
    v16 = a1[5];
    v17 = a1[4];
    v19 = v16;
    v20 = v17;
    dispatch_after(v14, v15, v18);

  }
}

uint64_t __60__SMSessionManager__setupTimerAndLockMonitorForEndAwareness__block_invoke_313(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SMSessionManager _setupTimerAndLockMonitorForEndAwareness]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%s, terminating session after awareness, sessionID, %@", (uint8_t *)&v5, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_terminateSessionWithSessionID:", *(_QWORD *)(a1 + 32));
}

- (void)_setUpCacheReleaseTimer
{
  void *v3;
  RTXPCTimerAlarm *v4;
  uint64_t v5;
  void *v6;
  RTXPCTimerAlarm *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id location;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SMSessionManager cacheReleaseXPCTimerAlarm](self, "cacheReleaseXPCTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v3);

  objc_initWeak(&location, self);
  v4 = [RTXPCTimerAlarm alloc];
  v5 = cacheReleaseXPCTimerAlarmIdentifier;
  -[SMSessionManager queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__SMSessionManager__setUpCacheReleaseTimer__block_invoke;
  v17[3] = &unk_1E9299C38;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  v7 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v4, "initWithIdentifier:queue:handler:", v5, v6, v17);
  -[SMSessionManager setCacheReleaseXPCTimerAlarm:](self, "setCacheReleaseXPCTimerAlarm:", v7);

  -[SMSessionManager state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionStateTransitionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager cacheReleaseMaxDuration](self, "cacheReleaseMaxDuration");
  objc_msgSend(v9, "dateByAddingTimeInterval:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager cacheReleaseXPCTimerAlarm](self, "cacheReleaseXPCTimerAlarm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "fireWithDate:error:", v10, &v16);
  v12 = v16;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SMSessionManager _setUpCacheReleaseTimer]";
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, timer set with end date, %@", buf, 0x16u);
  }

  if (v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v12, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionManager _setUpCacheReleaseTimer]";
      v22 = 2112;
      v23 = v15;
      _os_log_fault_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_FAULT, "%s cacheReleaseXPCTimerAlarm fireWithDate hit error: %@", buf, 0x16u);

    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __43__SMSessionManager__setUpCacheReleaseTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "cacheReleaseXPCTimerAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SMSessionManager _setUpCacheReleaseTimer]_block_invoke";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, %@ expired in SMSessionManager", (uint8_t *)&v9, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cacheReleaseXPCTimerAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateTimer:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_endSessionForSessionID:reason:handler:", v8, 3, &__block_literal_global_316);

}

void __43__SMSessionManager__setUpCacheReleaseTimer__block_invoke_315(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "localizedDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 136315394;
      v6 = "-[SMSessionManager _setUpCacheReleaseTimer]_block_invoke";
      v7 = 2112;
      v8 = v4;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%s, error ending session: %@", (uint8_t *)&v5, 0x16u);

    }
  }

}

- (void)_postCacheReleaseAndUpdatingWithTargetDate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[SMSessionManager _postCacheReleaseAndUpdatingWithTargetDate:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  if (-[SMSessionManager _shouldAlertNowWithTargetAlertDate:](self, "_shouldAlertNowWithTargetAlertDate:", v4))
  {
    -[SMSessionManager state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager _updateActivityWithState:](self, "_updateActivityWithState:", v6);

    v7 = (void *)MEMORY[0x1E0D8BA40];
    -[SMSessionManager state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "monitorContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isSOSTriggerCategory:", objc_msgSend(v9, "triggerCategory"));

    if ((v7 & 1) == 0)
      -[SMSessionManager _playCacheReleaseAndUpdatingSound](self, "_playCacheReleaseAndUpdatingSound");
    -[SMSessionManager carPlayAlertManager](self, "carPlayAlertManager");
    v10 = objc_claimAutoreleasedReturnValue();
    -[SMSessionManager state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postCarPlayNotificationForNotificationType:sessionManagerState:handler:](v10, "postCarPlayNotificationForNotificationType:sessionManagerState:handler:", 5, v11, 0);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[SMSessionManager _postCacheReleaseAndUpdatingWithTargetDate:]";
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%s, current time exceeds the alert target allowance, target date, %@", (uint8_t *)&v12, 0x16u);
    }
  }

}

- (void)_playCacheReleaseAndUpdatingSound
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 700000000);
  -[SMSessionManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

void __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_stopPlayingCacheReleaseAndUpdatingSound");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF738]), "initWithType:", 18);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.wav"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExternalToneFileURL:", v4);

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///System/Library/PrivateFrameworks/SafetyMonitor.framework/v4_level3_urgent_ML.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExternalVibrationPatternFileURL:", v5);

  objc_msgSend(v3, "setShouldIgnoreRingerSwitch:", 1);
  objc_msgSend(*v2, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsSessionManagerShouldIgnoreRingerSwitchKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "setShouldIgnoreRingerSwitch:", objc_msgSend(v7, "BOOLValue"));
  objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCacheReleaseTLAlert:", v8);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SMSessionManager _playCacheReleaseAndUpdatingSound]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "%s, playing cache release sound alertConfiguration,%@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "cacheReleaseTLAlert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke_322;
  v11[3] = &unk_1E92A2B58;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v10, "playWithCompletionHandler:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __53__SMSessionManager__playCacheReleaseAndUpdatingSound__block_invoke_322(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromTLAlertPlaybackCompletionType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v8;
    v12 = 2080;
    v13 = "-[SMSessionManager _playCacheReleaseAndUpdatingSound]_block_invoke";
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "%@, %s, cache release play completion called, playbackCompletionType, %@, error, %@", (uint8_t *)&v10, 0x2Au);

  }
}

- (void)_stopPlayingCacheReleaseAndUpdatingSound
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SMSessionManager cacheReleaseTLAlert](self, "cacheReleaseTLAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[SMSessionManager _stopPlayingCacheReleaseAndUpdatingSound]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEFAULT, "%s, stopping cache release sound alert,%@", (uint8_t *)&v7, 0x16u);

  }
  -[SMSessionManager cacheReleaseTLAlert](self, "cacheReleaseTLAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SMSessionManager cacheReleaseTLAlert](self, "cacheReleaseTLAlert");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

    -[SMSessionManager setCacheReleaseTLAlert:](self, "setCacheReleaseTLAlert:", 0);
  }
}

- (BOOL)_shouldAlertNowWithTargetAlertDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  const __CFString *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 300.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:value:", CFSTR("RTDefaultsSessionManagerCacheReleaseAlertDelayAllowanceKey"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v4);
  v12 = v11;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = CFSTR("NO");
    v16 = 136315906;
    v17 = "-[SMSessionManager _shouldAlertNowWithTargetAlertDate:]";
    v18 = 2112;
    v19 = v4;
    if (v12 <= v9)
      v15 = CFSTR("YES");
    v20 = 2048;
    v21 = v9;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "%s, targetDate, %@, allowance, %f, shouldAlert, %@", (uint8_t *)&v16, 0x2Au);
  }

  return v12 <= v9;
}

- (void)_postAnomalyAlert
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[SMSessionManager _postAnomalyAlert]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v17, 0xCu);
  }

  -[SMSessionManager state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPromptState");

  if ((v5 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    -[SMSessionManager state](self, "state");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[SMSessionManager _postAnomalyAlert]";
    v19 = 2112;
    v20 = v16;
    _os_log_fault_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_FAULT, "%s, unexpected state for anomaly alert, %@", (uint8_t *)&v17, 0x16u);
LABEL_14:

    goto LABEL_15;
  }
  -[SMSessionManager state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionStateTransitionDate");
  v7 = objc_claimAutoreleasedReturnValue();

  -[SMSessionManager state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "sessionState") == 9)
  {
    -[SMSessionManager state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "time");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeBound");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_8;
    -[SMSessionManager state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "time");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeBound");
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = v15;
  }

LABEL_8:
  if (!-[SMSessionManager _shouldAlertNowWithTargetAlertDate:](self, "_shouldAlertNowWithTargetAlertDate:", v7))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[SMSessionManager _postAnomalyAlert]";
      v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%s, current time exceeds the alert target allowance, target date, %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_14;
  }
  -[SMSessionManager _setupAnomalyAlerts](self, "_setupAnomalyAlerts");
LABEL_15:

}

- (void)_teardownAnomalyAlerts
{
  void *v3;
  void *v4;

  -[SMSessionManager anomalyAlertManager](self, "anomalyAlertManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSessionManager anomalyAlertManager](self, "anomalyAlertManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stop");

    -[SMSessionManager setAnomalyAlertManager:](self, "setAnomalyAlertManager:", 0);
  }
}

- (void)_setupAnomalyAlerts
{
  SMAnomalyAlertManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SMAnomalyAlertManager *v8;
  id v9;

  -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
  v3 = [SMAnomalyAlertManager alloc];
  -[SMSessionManager queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager carPlayAlertManager](self, "carPlayAlertManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SMAnomalyAlertManager initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:](v3, "initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:", v4, v5, v6, v7);
  -[SMSessionManager setAnomalyAlertManager:](self, "setAnomalyAlertManager:", v8);

  -[SMSessionManager anomalyAlertManager](self, "anomalyAlertManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "start");

}

- (void)_setupAnomalyAlertsOnResume
{
  SMAnomalyAlertManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SMAnomalyAlertManager *v8;
  id v9;

  -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
  v3 = [SMAnomalyAlertManager alloc];
  -[SMSessionManager queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager carPlayAlertManager](self, "carPlayAlertManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SMAnomalyAlertManager initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:](v3, "initWithQueue:anomalyState:defaultsManager:carPlayAlertManager:", v4, v5, v6, v7);
  -[SMSessionManager setAnomalyAlertManager:](self, "setAnomalyAlertManager:", v8);

  -[SMSessionManager anomalyAlertManager](self, "anomalyAlertManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");

}

- (void)_setupTimerForAnomaly
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  RTXPCTimerAlarm *v7;
  void *v8;
  RTXPCTimerAlarm *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id location;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[SMSessionManager _setupTimerForAnomaly]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSessionManager state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPromptState");

  if ((v5 & 1) != 0)
  {
    -[SMSessionManager checkInXPCTimerAlarm](self, "checkInXPCTimerAlarm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v6);

    objc_initWeak(&location, self);
    v7 = [RTXPCTimerAlarm alloc];
    -[SMSessionManager queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41__SMSessionManager__setupTimerForAnomaly__block_invoke;
    v20[3] = &unk_1E9299C38;
    v20[4] = self;
    objc_copyWeak(&v21, &location);
    v9 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v7, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.safetyMonitor.sessionManager.checkInTimerAlarm"), v8, v20);
    -[SMSessionManager setCheckInXPCTimerAlarm:](self, "setCheckInXPCTimerAlarm:", v9);

    -[SMSessionManager state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:](self, "_checkDefaultsForCacheReleaseDateWithState:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMSessionManager checkInXPCTimerAlarm](self, "checkInXPCTimerAlarm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v12, "fireWithDate:error:", v11, &v19);
    v13 = v19;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SMSessionManager _setupTimerForAnomaly]";
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, timer set with end date, %@", buf, 0x16u);
    }

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v13, "localizedDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v24 = "-[SMSessionManager _setupTimerForAnomaly]";
        v25 = 2112;
        v26 = v18;
        _os_log_fault_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_FAULT, "%s checkInXPCTimerAlarm fireWithDate hit error: %@", buf, 0x16u);

      }
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      -[SMSessionManager state](self, "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v24 = "-[SMSessionManager _setupTimerForAnomaly]";
      v25 = 2112;
      v26 = v17;
      _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "%s, unexpected state for anomaly alert, %@", buf, 0x16u);

    }
  }
}

void __41__SMSessionManager__setupTimerForAnomaly__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "checkInXPCTimerAlarm");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[SMSessionManager _setupTimerForAnomaly]_block_invoke";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, %@ expired in SMSessionManager", (uint8_t *)&v9, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "checkInXPCTimerAlarm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateTimer:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_respondToTriggerPromptForSessionID:response:handler:", v8, 1, &__block_literal_global_327);

}

void __41__SMSessionManager__setupTimerForAnomaly__block_invoke_326(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager _setupTimerForAnomaly]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, respondToTriggerPromptWithResponse, error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (BOOL)_performStateTransitionTo:(id)a3 transitionType:(unint64_t)a4 handler:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  char v35;
  void (**v36)(void);
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, _QWORD))a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)MEMORY[0x1E0D8BA28];
    -[SMSessionManager state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertSessionStateToString:", objc_msgSend(v13, "sessionState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v9, "sessionState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v56 = "-[SMSessionManager _performStateTransitionTo:transitionType:handler:]";
    v57 = 2048;
    v58 = a4;
    v59 = 2112;
    v60 = v14;
    v61 = 2112;
    v62 = v15;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, Attempting state transition type %ld from %@ to %@", buf, 0x2Au);

  }
  -[SMSessionManager state](self, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v16, "sessionState");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDate:", v17);

  -[SMSessionManager state](self, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "sessionState");
  v20 = objc_msgSend(v9, "sessionState");

  if (v19 != v20)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSessionStateTransitionDate:", v21);

  }
  if (a4 == 1)
  {
    -[SMSessionManager messagingService](self, "messagingService");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deviceIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveDeviceIdentifier:", v23);

  }
  -[SMSessionManager lastLocation](self, "lastLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timestamp");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager lastLocation](self, "lastLocation");
    v28 = a2;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timestamp");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timeIntervalSinceDate:", v30);
    v32 = v31;

    a2 = v28;
    if (v32 <= 60.0)
    {
      -[SMSessionManager lastLocation](self, "lastLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLocation:", v33);

      goto LABEL_12;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "setLocation:", 0);
LABEL_12:
  -[SMSessionManager _stateTransitionDecisionToState:transitionType:](self, "_stateTransitionDecisionToState:transitionType:", v9, a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isAllowed");
  if ((v35 & 1) != 0)
  {
    -[SMSessionManager logSignPostForStateTransition:](self, "logSignPostForStateTransition:", v9);
    objc_msgSend(v34, "actionBlock");
    v36 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v36[2]();

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", v52);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v9, "sessionState"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v56 = "-[SMSessionManager _performStateTransitionTo:transitionType:handler:]";
      v57 = 2112;
      v58 = (unint64_t)v38;
      v59 = 2112;
      v60 = v39;
      _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%s, Successful state transition from %@ to %@", buf, 0x20u);

    }
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v48 = (void *)MEMORY[0x1E0D8BA28];
      -[SMSessionManager state](self, "state");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "convertSessionStateToString:", objc_msgSend(v49, "sessionState"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v9, "sessionState"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v56 = "-[SMSessionManager _performStateTransitionTo:transitionType:handler:]";
      v57 = 2112;
      v58 = (unint64_t)v50;
      v59 = 2112;
      v60 = v51;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%s, Invalid transition from %@ to %@", buf, 0x20u);

    }
    if (v10)
    {
      v53 = *MEMORY[0x1E0CB2D50];
      v41 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@, cannot be completed due illegal state transition"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = (void *)objc_msgSend(v45, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 16, v44);
      ((void (**)(id, void *))v10)[2](v10, v46);

    }
  }

  return v35;
}

- (void)_performStateSyncOriginatedTransitionTo:(id)a3 transitionType:(unint64_t)a4 handler:(id)a5
{
  NSObject *v9;
  void (**v10)(id, void *);
  SMSessionManagerState **p_state;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  NSObject *v39;
  SMSessionManagerState *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  NSObject *v79;
  __int16 v80;
  NSObject *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  p_state = &self->_state;
  v12 = -[SMSessionManagerState isEqual:](self->_state, "isEqual:", v9);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
      v78 = 2112;
      v79 = v9;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%s, identical state sync state transition requested, %@", buf, 0x16u);
    }
LABEL_77:

    goto LABEL_78;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v15 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
    v78 = 2112;
    v79 = v15;
    v80 = 2112;
    v81 = v9;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, state transition originated by a state sync message, %@, to state, %@", buf, 0x20u);

  }
  if (a4 != 3)
  {
    if (a4 == 2)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%s, SMStateTransitionTypeHandoffBecomeActive should never reach this method", buf, 0xCu);
      }

      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0D8BB70];
      v74 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Parameter TypeHandoffBecomeActive"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 7, v20);

LABEL_20:
      v10[2](v10, v21);
LABEL_21:

      goto LABEL_78;
    }
LABEL_13:
    v14 = -[SMSessionManagerState copy](self->_state, "copy");
    objc_storeStrong((id *)&self->_state, a3);
    -[SMSessionManager _notifyObserversForStateChangeWithTransitionType:](self, "_notifyObserversForStateChangeWithTransitionType:", a4);
    v25 = -[SMSessionManager _isRemoteSessionEndForPreviousState:nextState:](self, "_isRemoteSessionEndForPreviousState:nextState:", v14, v9);
    switch(-[NSObject sessionState](v14, "sessionState"))
    {
      case 1:
      case 10:
      case 11:
        v32 = -[NSObject sessionState](v9, "sessionState");
        if (v32 > 0xE)
          goto LABEL_26;
        if (((1 << v32) & 0x5390) != 0)
          goto LABEL_24;
        if (v32 == 2)
        {
          -[NSObject activePairedDeviceIdentifier](v9, "activePairedDeviceIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionManager messagingService](self, "messagingService");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "deviceIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v47, "isEqual:", v49)
            && -[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby"))
          {
            -[NSObject startMessageGUID](v9, "startMessageGUID");
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
                v78 = 2112;
                v79 = v14;
                v80 = 2112;
                v81 = v9;
                _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, calling _handleMagnetConnect to evaluate if a handoff is needed", buf, 0x20u);
              }

              -[SMSessionManager _handleMagnetConnect:](self, "_handleMagnetConnect:", 3);
            }
          }
          else
          {

          }
          -[SMSessionManager sessionMetricManager](self, "sessionMetricManager");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "onSessionStartedWithState:", v9);

LABEL_24:
          -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v33);

          if (v34)
            objc_msgSend(MEMORY[0x1E0D8B8F0], "startActivityWithState:localState:", v9, self->_localState);
        }
LABEL_26:
        switch(-[NSObject sessionState](v9, "sessionState"))
        {
          case 0:
          case 1:
            goto LABEL_54;
          case 2:
            if (a4 == 3)
            {
              -[SMSessionManager _notifyObserversForBecomingNonActiveDevice](self, "_notifyObserversForBecomingNonActiveDevice");
            }
            else
            {
              if (a4 != 1)
                goto LABEL_75;
              -[NSObject activePairedDeviceIdentifier](v9, "activePairedDeviceIdentifier");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMSessionManager messagingService](self, "messagingService");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "deviceIdentifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v55, "isEqual:", v57)
                || !-[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby"))
              {
                goto LABEL_63;
              }
              -[NSObject startMessageGUID](v14, "startMessageGUID");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              if (v58)
              {

LABEL_63:
                goto LABEL_64;
              }
              -[NSObject startMessageGUID](v9, "startMessageGUID");
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              if (v69)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
                  v78 = 2112;
                  v79 = v14;
                  v80 = 2112;
                  v81 = v9;
                  _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, calling _handleMagnetConnect to evaluate if a handoff is needed", buf, 0x20u);
                }

                -[SMSessionManager _handleMagnetConnect:](self, "_handleMagnetConnect:", 3);
              }
LABEL_64:
              -[SMSessionManager state](self, "state");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", v37, 0);
LABEL_71:

            }
            break;
          case 4:
            -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v59);

            if (v60)
              goto LABEL_70;
            goto LABEL_75;
          case 7:
          case 8:
          case 9:
          case 14:
            -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v35);

            if (!v36)
              goto LABEL_75;
            -[SMSessionManager _postAnomalyAlert](self, "_postAnomalyAlert");
            -[SMSessionManager sessionMetricManager](self, "sessionMetricManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManagerState monitorContext](self->_state, "monitorContext");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "onDeclareAnomalyForTriggerCategory:", objc_msgSend(v38, "triggerCategory"));

            goto LABEL_71;
          case 12:
            objc_storeStrong((id *)&self->_state, a3);
            -[SMSessionManager state](self, "state");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", v61, 1);

            goto LABEL_74;
          default:
            goto LABEL_75;
        }
        goto LABEL_75;
      case 2:
        goto LABEL_26;
      case 4:
      case 7:
      case 8:
      case 9:
        v26 = -[NSObject sessionState](v14, "sessionState");
        if (v26 == -[NSObject sessionState](v9, "sessionState"))
        {
          if (a4 == 3)
            -[SMSessionManager _notifyObserversForBecomingNonActiveDevice](self, "_notifyObserversForBecomingNonActiveDevice");
        }
        else if (-[NSObject sessionState](v9, "sessionState") == 4)
        {
          -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v41);

          if (v42)
          {
            -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
            -[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:](self, "_checkDefaultsForCacheReleaseDateWithState:", v14);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager _postCacheReleaseAndUpdatingWithTargetDate:](self, "_postCacheReleaseAndUpdatingWithTargetDate:", v43);

          }
        }
        else
        {
          if (-[NSObject sessionState](v9, "sessionState") == 2)
          {
LABEL_55:
            -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v52);

            if (v53)
            {
              -[SMSessionManager state](self, "state");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", v54, 0);

              -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
            }
LABEL_75:
            -[SMSessionManager _performActionsAndUpdatesUponStateTransitionWithType:](self, "_performActionsAndUpdatesUponStateTransitionWithType:", a4);
            if (v10)
              v10[2](v10, 0);
            goto LABEL_77;
          }
          if (-[NSObject isEndSessionState](v9, "isEndSessionState"))
          {
            -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v44);

            if (v45)
            {
              -[SMSessionManager state](self, "state");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", v46, 1);

              -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
            }
            -[SMSessionManager _notifyObserversForSessionEndForActiveDevice:](self, "_notifyObserversForSessionEndForActiveDevice:", -[SMSessionManager _isActiveDevice](self, "_isActiveDevice"));
          }
        }
        if (v25)
          objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
        goto LABEL_75;
      case 12:
        if (-[NSObject sessionState](v9, "sessionState") == 1)
        {
          -[SMSessionManager _clearHysteresisState](self, "_clearHysteresisState");
          objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
        }
        else
        {
          -[SMSessionManager state](self, "state");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", v51, 0);

        }
        goto LABEL_53;
      case 14:
LABEL_53:
        switch(-[NSObject sessionState](v9, "sessionState"))
        {
          case 0:
          case 14:
            goto LABEL_75;
          case 1:
LABEL_54:
            -[SMSessionManager _clearHysteresisState](self, "_clearHysteresisState");
            objc_msgSend(MEMORY[0x1E0D8B8F0], "endActivities");
            goto LABEL_74;
          case 2:
            goto LABEL_55;
          case 4:
            -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v62);

            if (!v63)
              goto LABEL_75;
            -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
LABEL_70:
            -[SMSessionManager _checkDefaultsForCacheReleaseDateWithState:](self, "_checkDefaultsForCacheReleaseDateWithState:", v14);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager _postCacheReleaseAndUpdatingWithTargetDate:](self, "_postCacheReleaseAndUpdatingWithTargetDate:", v37);
            goto LABEL_71;
          case 12:
            -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v64);

            if (v65)
            {
              -[SMSessionManager state](self, "state");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", v66, 1);

              -[SMSessionManager _teardownAnomalyAlerts](self, "_teardownAnomalyAlerts");
            }
LABEL_74:
            -[SMSessionManager _notifyObserversForSessionEndForActiveDevice:](self, "_notifyObserversForSessionEndForActiveDevice:", -[SMSessionManager _isActiveDevice](self, "_isActiveDevice"));
            goto LABEL_75;
          default:
            goto LABEL_64;
        }
      default:
        goto LABEL_75;
    }
  }
  -[SMSessionManager state](self, "state");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "sessionState");
  v24 = -[NSObject sessionState](v9, "sessionState");

  if (v23 != v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[SMSessionManager state](self, "state");
      v68 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
      v78 = 2112;
      v79 = v68;
      v80 = 2112;
      v81 = v9;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%s, SMStateTransitionTypeHandoffBecomeNonActive; invalid state transition from %@ to %@",
        buf,
        0x20u);

    }
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = *MEMORY[0x1E0D8BB70];
    v72 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid State Transition HandoffBecomeNonActive"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 16, v31);

    if (!v10)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (-[SMSessionManager _isHandoffAllowedInSessionState:](self, "_isHandoffAllowedInSessionState:", -[SMSessionManagerState sessionState](self->_state, "sessionState")))
  {
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    v40 = *p_state;
    *(_DWORD *)buf = 136315650;
    v77 = "-[SMSessionManager _performStateSyncOriginatedTransitionTo:transitionType:handler:]";
    v78 = 2112;
    v79 = v40;
    v80 = 2112;
    v81 = v9;
    _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%s, state transition from state, %@, to state, %@, invalid and not allowed for a handoff operation", buf, 0x20u);
  }

  if (v10)
    v10[2](v10, 0);
LABEL_78:

}

- (BOOL)_isRemoteSessionEndForPreviousState:(id)a3 nextState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a4;
  objc_msgSend(a3, "activeDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager messagingService](self, "messagingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v9))
  {
    objc_msgSend(v6, "activeDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", v12) & 1) != 0)
      v13 = 0;
    else
      v13 = objc_msgSend(v6, "isEndSessionState");

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_performActionsAndUpdatesUponStateTransitionWithType:(unint64_t)a3
{
  -[SMSessionManager _updateTimersUponStateTransition:](self, "_updateTimersUponStateTransition:", a3);
  -[SMSessionManager _updateLocationObserverUponStateTransition](self, "_updateLocationObserverUponStateTransition");
  -[SMSessionManager _updateConnectivityAndStatusSignalsObserverUponStateTransition](self, "_updateConnectivityAndStatusSignalsObserverUponStateTransition");
}

- (void)logSignPostForStateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SMSessionManager state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_26;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v7, v10);

  -[SMSessionManager state](self, "state");
  v12 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject sessionState](v12, "sessionState") != 11)
    goto LABEL_7;
  v13 = objc_msgSend(v4, "sessionState");

  if (v13 == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v14, v16);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v17 = objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v18 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(v4, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sessionTypeToString:", objc_msgSend(v19, "sessionType"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v20, "UTF8String");
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v4, "sessionState"));
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v42 = 136446466;
      v43 = v21;
      v44 = 2082;
      v45 = objc_msgSend(v22, "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_1D1A22000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMSessionDuration", " enableTelemetry=YES {sessionType:%{public, signpost.telemetry:string1}s, currentState:%{public, signpost.telemetry:string2}s}", (uint8_t *)&v42, 0x16u);

    }
LABEL_7:

  }
  if (objc_msgSend(v4, "sessionState") == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = v11 - 1;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = (void *)MEMORY[0x1E0D8BA28];
      -[SMSessionManager state](self, "state");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertSessionStateToString:", objc_msgSend(v27, "sessionState"));
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v29 = objc_msgSend(v28, "UTF8String");
      v42 = 136446210;
      v43 = v29;
      _os_signpost_emit_with_name_impl(&dword_1D1A22000, v24, OS_SIGNPOST_INTERVAL_END, v11, "SMSessionDuration", " enableTelemetry=YES {currentState:%{public, signpost.telemetry:string2}s}", (uint8_t *)&v42, 0xCu);

    }
  }
  else
  {
    v25 = v11 - 1;
  }
  v30 = (void *)MEMORY[0x1E0D8BA28];
  -[SMSessionManager state](self, "state");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "convertSessionStateToString:", objc_msgSend(v31, "sessionState"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(v4, "sessionState"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    v36 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    v37 = objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    v42 = 136446722;
    v43 = v36;
    v44 = 2082;
    v45 = v37;
    v46 = 2112;
    v47 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v35, OS_SIGNPOST_INTERVAL_END, v11, "SMSessionStateTransition", " enableTelemetry=YES {currentSessionState:%{public, signpost.telemetry:string1}s, nextSessionState:%{public, signpost.telemetry:string2}s, nextState:%@}", (uint8_t *)&v42, 0x20u);
  }

  if (objc_msgSend(v4, "sessionState") != 1
    || objc_msgSend(v4, "sessionState")
    || objc_msgSend(v4, "sessionState") != 11
    || objc_msgSend(v4, "sessionState") != 10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      v40 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
      v41 = objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
      v42 = 136446722;
      v43 = v40;
      v44 = 2082;
      v45 = v41;
      v46 = 2112;
      v47 = v4;
      _os_signpost_emit_with_name_impl(&dword_1D1A22000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMSessionStateTransition", " enableTelemetry=YES {currentSessionState:%{public, signpost.telemetry:string1}s, nextSessionState:%{public, signpost.telemetry:string2}s, nextState:%@}", (uint8_t *)&v42, 0x20u);
    }

  }
LABEL_26:

}

- (void)_updateConnectivityAndStatusSignalsObserverUponStateTransition
{
  NSObject *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SMSessionManager _updateConnectivityAndStatusSignalsObserverUponStateTransition]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, updating connectivity and status observers signals", (uint8_t *)&v8, 0xCu);
  }

  -[SMSessionManager state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionState");

  if (v5 > 0xE)
    goto LABEL_10;
  if (((1 << v5) & 0x4394) != 0)
  {
    -[SMSessionManager messagingService](self, "messagingService");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject startSubscriptionOnNearbyDevicesChanged](v6, "startSubscriptionOnNearbyDevicesChanged");
LABEL_6:

    return;
  }
  if (((1 << v5) & 0x1003) != 0)
  {
    -[SMSessionManager messagingService](self, "messagingService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelSubscriptionOnNearbyDevicesChanged");

    -[SMSessionManager _clearHysteresisState](self, "_clearHysteresisState");
    return;
  }
  if (((1 << v5) & 0xC00) == 0)
  {
LABEL_10:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[SMSessionManager _updateConnectivityAndStatusSignalsObserverUponStateTransition]";
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%s, should never reach this code path, logging error.", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_6;
  }
}

- (void)_updateLocationObserverUponStateTransition
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  __objc2_class *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v22 = 136315394;
    v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
    v24 = 1024;
    v25 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, updating location observers, isActiveDevice, %{Bool}d", (uint8_t *)&v22, 0x12u);
  }

  if (v3)
  {
    -[SMSessionManager state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sessionState");

    if (v6 <= 0xE)
    {
      if (((1 << v6) & 0x4384) != 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v22 = 136315138;
          v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
          _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, Added rhythmic non waking GNSS location observer", (uint8_t *)&v22, 0xCu);
        }

        -[SMSessionManager locationManager](self, "locationManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObserver:", self);

        -[SMSessionManager locationManager](self, "locationManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking;
LABEL_21:
        -[__objc2_class notificationName](v10, "notificationName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObserver:selector:name:", self, sel_onLocationNotification_, v20);

        -[SMSessionManager locationManager](self, "locationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObserver:selector:name:", self, sel_onLocationNotification_, v21);

        goto LABEL_22;
      }
      if (((1 << v6) & 0xC00) != 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v22 = 136315138;
          v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
          _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, Added GNSS location observer", (uint8_t *)&v22, 0xCu);
        }

        -[SMSessionManager locationManager](self, "locationManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObserver:", self);

        -[SMSessionManager locationManager](self, "locationManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = RTLocationManagerNotificationLocationsAccuracyBest;
        goto LABEL_21;
      }
      if (v6 == 4)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v22 = 136315138;
          v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
          _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%s, Added rhythmic waking GNSS location observer", (uint8_t *)&v22, 0xCu);
        }

        -[SMSessionManager locationManager](self, "locationManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObserver:", self);

        -[SMSessionManager locationManager](self, "locationManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = RTLocationManagerNotificationLocationsAccuracyRhythmicWaking;
        goto LABEL_21;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
      v12 = "%s, Stopped location observer";
      v13 = v11;
      v14 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v22 = 136315394;
      v23 = "-[SMSessionManager _updateLocationObserverUponStateTransition]";
      v24 = 1024;
      v25 = 0;
      v12 = "%s, Stopped location observer because isActiveDevice, %{Bool}d";
      v13 = v11;
      v14 = 18;
LABEL_11:
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v22, v14);
    }
  }

  -[SMSessionManager locationManager](self, "locationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:", self);
LABEL_22:

}

- (void)_updateTimersUponStateTransition:(unint64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
  -[SMSessionManager state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SMSessionManager _isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:](self, "_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:", v7);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 136315906;
    v14 = "-[SMSessionManager _updateTimersUponStateTransition:]";
    v15 = 1024;
    v16 = v5;
    v17 = 1024;
    v18 = v8;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, updating timers upon state transition, isActiveDevice, %{Bool}d, isEffectivePairedDeviceSameAsActiveDevice, %{Bool}d, transitionType, %ld", (uint8_t *)&v13, 0x22u);
  }

  -[SMSessionManager state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sessionState");

  switch(v11)
  {
    case 0:
    case 1:
    case 2:
      -[SMSessionManager _invalidateSessionManagerXPCTimerAlarms](self, "_invalidateSessionManagerXPCTimerAlarms");
      -[SMSessionManager _invalidateScreenLockMonitor](self, "_invalidateScreenLockMonitor");
      break;
    case 4:
      -[SMSessionManager _invalidateSessionManagerXPCTimerAlarms](self, "_invalidateSessionManagerXPCTimerAlarms");
      -[SMSessionManager _invalidateScreenLockMonitor](self, "_invalidateScreenLockMonitor");
      if (v5)
        -[SMSessionManager _setUpCacheReleaseTimer](self, "_setUpCacheReleaseTimer");
      break;
    case 7:
    case 8:
    case 9:
    case 14:
      -[SMSessionManager _invalidateSessionManagerXPCTimerAlarms](self, "_invalidateSessionManagerXPCTimerAlarms");
      -[SMSessionManager _invalidateScreenLockMonitor](self, "_invalidateScreenLockMonitor");
      if (v5)
        -[SMSessionManager _setupTimerForAnomaly](self, "_setupTimerForAnomaly");
      break;
    case 10:
    case 11:
      return;
    case 12:
      -[SMSessionManager _invalidateSessionManagerXPCTimerAlarms](self, "_invalidateSessionManagerXPCTimerAlarms");
      -[SMSessionManager _invalidateScreenLockMonitor](self, "_invalidateScreenLockMonitor");
      if (v5 || v8)
        -[SMSessionManager _setupTimerAndLockMonitorForEndAwareness](self, "_setupTimerAndLockMonitorForEndAwareness");
      break;
    default:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315138;
        v14 = "-[SMSessionManager _updateTimersUponStateTransition:]";
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%s, should never reach this code path, logging error.", (uint8_t *)&v13, 0xCu);
      }

      break;
  }
}

- (void)_invalidateSessionManagerXPCTimerAlarms
{
  void *v3;
  void *v4;
  id v5;

  -[SMSessionManager cacheReleaseXPCTimerAlarm](self, "cacheReleaseXPCTimerAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v3);

  -[SMSessionManager checkInXPCTimerAlarm](self, "checkInXPCTimerAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v4);

  -[SMSessionManager endAwarenessBeforeUnlockXPCTimerAlarm](self, "endAwarenessBeforeUnlockXPCTimerAlarm");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v5);

}

- (void)_invalidateScreenLockMonitor
{
  void *v3;
  void *v4;
  SMScreenLockMonitor *screenLockMonitor;

  -[SMSessionManager screenLockMonitor](self, "screenLockMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSessionManager screenLockMonitor](self, "screenLockMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_unregisterForLockNotification");

    screenLockMonitor = self->_screenLockMonitor;
    self->_screenLockMonitor = 0;

  }
}

- (void)_updateLastLocationWithLocations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  SMSessionManager *v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      v21 = v6;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        objc_msgSend(v9, "horizontalAccuracy");
        if (v10 <= 100.0)
        {
          objc_msgSend(v9, "timestamp");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            -[SMSessionManager lastLocation](self, "lastLocation");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timestamp");
            v13 = objc_claimAutoreleasedReturnValue();
            if (!v13)
            {

LABEL_12:
              -[SMSessionManager setLastLocation:](self, "setLastLocation:", v9);
              goto LABEL_13;
            }
            v25 = (void *)v13;
            -[SMSessionManager lastLocation](self, "lastLocation");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timestamp");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "timestamp");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "laterDate:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager lastLocation](self, "lastLocation");
            v16 = v4;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timestamp");
            v18 = v7;
            v19 = self;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v15, "isEqualToDate:", v20);

            self = v19;
            v7 = v18;

            v4 = v16;
            v6 = v21;

            if ((v22 & 1) == 0)
              goto LABEL_12;
          }
        }
LABEL_13:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

}

- (void)onLocationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionManager *v9;

  v4 = a3;
  -[SMSessionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SMSessionManager_onLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__SMSessionManager_onLocationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "leechedLocations");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateLastLocationWithLocations:", v6);

  }
}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[SMSessionManager initializeSessionWithConversation:handler:]";
    v7 = 1024;
    v8 = 4004;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Unsupported (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

}

- (void)initializeSessionWithSessionID:(id)a3 conversation:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  NSObject *v15;
  SMSessionManager *v16;
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    -[SMSessionManager queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke;
    block[3] = &unk_1E9298750;
    v15 = v9;
    v16 = self;
    v18 = v11;
    v17 = v10;
    v19 = a2;
    dispatch_async(v12, block);

    v13 = v15;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  void *v38;
  int8x16_t v39;
  _QWORD v40[4];
  int8x16_t v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
    v54 = 2112;
    v55 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, User requested to initialize a session with sessionID %@", buf, 0x16u);
  }

  v4 = *(void **)(a1 + 32);
  if (!v4
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "configuration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "sessionID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isEqual:", v6),
        v6,
        v5,
        v7))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v31 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "sessionID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
      v54 = 2112;
      v55 = v31;
      v56 = 2112;
      v57 = v33;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current session ID, %@", buf, 0x20u);

    }
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0D8BB70];
    v50 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid session ID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v51;
    v14 = &v50;
LABEL_16:
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    v21 = v10;
    v22 = 7;
LABEL_17:
    v23 = (void *)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, v22, v19);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  if (!*(_QWORD *)(a1 + 48) || (conversationHandlesValid() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v34 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
      v54 = 2112;
      v55 = v34;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%s, invalid conversation %@", buf, 0x16u);
    }

    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = *MEMORY[0x1E0D8BB70];
    v48 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid conversation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v11;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = &v49;
    v14 = &v48;
    goto LABEL_16;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "_canDeviceModifyState") & 1) != 0)
  {
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState");
    if ((unint64_t)(v15 - 10) < 3)
    {
      v16 = *(void **)(a1 + 40);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke_346;
      v40[3] = &unk_1E929E520;
      v43 = *(id *)(a1 + 56);
      v39 = *(int8x16_t *)(a1 + 32);
      v17 = (id)v39.i64[0];
      v41 = vextq_s8(v39, v39, 8uLL);
      v42 = *(id *)(a1 + 48);
      objc_msgSend(v16, "_resetInitializationWithHandler:", v40);

      return;
    }
    if (v15 != 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
        v54 = 2112;
        v55 = v38;
        _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%s, session already running in state %@", buf, 0x16u);

      }
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v37 = *MEMORY[0x1E0D8BB70];
      v44 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Session is active"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v36;
      v21 = v37;
      v22 = 23;
      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 40), "_initializeSessionWithSessionID:conversation:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "-[SMSessionManager initializeSessionWithSessionID:conversation:handler:]_block_invoke";
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%s, User requested to initialize session on non active device", buf, 0xCu);
    }

    v46 = *MEMORY[0x1E0CB2D50];
    v25 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ cannot be completed since current device is not active"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v28);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t __72__SMSessionManager_initializeSessionWithSessionID_conversation_handler___block_invoke_346(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_initializeSessionWithSessionID:conversation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)cancelInitializationWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[SMSessionManager queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SMSessionManager_cancelInitializationWithHandler___block_invoke;
    block[3] = &unk_1E9298E88;
    block[4] = self;
    v10 = a2;
    v9 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __52__SMSessionManager_cancelInitializationWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[SMSessionManager cancelInitializationWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, User requested to cancel session initialization", buf, 0xCu);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "_canDeviceModifyState") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionState") == 10
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionState") == 11)
    {
      v3 = objc_alloc(MEMORY[0x1E0D8BA20]);
      objc_msgSend(*(id *)(a1 + 32), "state");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "messagingService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "deviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v3, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v5, 0, 0, v6, 0, 0, 0, 0, 0, 0, v8, 0, 0,
                      0,
                      0,
                      v9,
                      0);

      objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v10, 1, *(_QWORD *)(a1 + 40));
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionState"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v26 = "-[SMSessionManager cancelInitializationWithHandler:]_block_invoke";
        v27 = 2112;
        v28 = v22;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%s, session is not in Initializing or Ready, current state, %@", buf, 0x16u);

      }
      v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v19 = *MEMORY[0x1E0D8BB70];
      v23 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not in Initializing or Ready state"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 16, v21);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SMSessionManager cancelInitializationWithHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%s, User requested to cancel session initialization for non active device", buf, 0xCu);
    }

    v29 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ cannot be completed since current device is not active"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  SMSessionManager *v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[SMSessionManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__SMSessionManager_cancelInitializationForSessionID_handler___block_invoke;
    v11[3] = &unk_1E9297590;
    v12 = v7;
    v13 = self;
    v14 = v8;
    v15 = a2;
    dispatch_async(v9, v11);

    v10 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __61__SMSessionManager_cancelInitializationForSessionID_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
    v46 = 2112;
    v47 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, User requested to cancel session initialization for sessionID %@", buf, 0x16u);
  }

  v4 = *(void **)(a1 + 32);
  if (!v4
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "configuration"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "sessionID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v4, "isEqual:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v30 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "configuration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "sessionID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
      v46 = 2112;
      v47 = v30;
      v48 = 2112;
      v49 = v32;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current sessionID, %@", buf, 0x20u);

    }
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0D8BB70];
    v42 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid session ID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17;
    v22 = v18;
    v23 = 7;
    goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "_canDeviceModifyState") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState") == 10
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState") == 11)
    {
      v8 = objc_alloc(MEMORY[0x1E0D8BA20]);
      objc_msgSend(*(id *)(a1 + 40), "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "messagingService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v8, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 1, v10, 0, 0, v11, 0, 0, 0, 0, 0, 0, v13, 0, 0,
                      0,
                      0,
                      v14,
                      0);

      objc_msgSend(*(id *)(a1 + 40), "_performStateTransitionTo:transitionType:handler:", v15, 1, *(_QWORD *)(a1 + 48));
      goto LABEL_13;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
      v46 = 2112;
      v47 = v37;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%s, session is not in Initializing or Ready, current state, %@", buf, 0x16u);

    }
    v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v35 = *MEMORY[0x1E0D8BB70];
    v38 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not in Initializing or Ready state"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v34;
    v22 = v35;
    v23 = 16;
LABEL_12:
    v15 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, v23, v20);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v36 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v45 = "-[SMSessionManager cancelInitializationForSessionID:handler:]_block_invoke";
    v46 = 2112;
    v47 = v36;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%s, User requested to cancel session initialization on non active device for sessionID %@", buf, 0x16u);
  }

  v40 = *MEMORY[0x1E0CB2D50];
  v25 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ cannot be completed since current device is not active"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v29 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v15);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

LABEL_13:
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SMSessionManager endSessionForSessionID:reason:handler:]";
      v19 = 2048;
      v20 = a4;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, User requested to end session with reason %lu", buf, 0x16u);
    }

    -[SMSessionManager queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke;
    v13[3] = &unk_1E9297590;
    v13[4] = self;
    v14 = v8;
    v16 = a4;
    v15 = v9;
    dispatch_async(v11, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_2;
    v21[3] = &unk_1E9297AA8;
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(id *)(a1 + 48);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v5;
    objc_msgSend(v2, "_endSessionForSessionID:reason:handler:", v3, v4, v21);
    v6 = v22;
  }
  else if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaRemoteControlEnabled"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_3;
    v19[3] = &unk_1E9297AA8;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v10;
    objc_msgSend(v7, "_endSessionForSessionID:reason:handler:", v8, v9, v19);
    v6 = v20;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SMSessionManager endSessionForSessionID:reason:handler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s: This device is not active and Zelkova RemoteControl is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0D8BB70];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This device is not active and RemoteControl is not enabled;"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 1, v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "code");
    objc_msgSend(v6, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 3, 0, v17, v18);

  }
}

void __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 3, 1, v6, v7);
}

void __58__SMSessionManager_endSessionForSessionID_reason_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 3, 2, v6, v7);
}

- (void)_endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  void (**v30)(id, void *);
  unint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[SMSessionManager _endSessionForSessionID:reason:handler:]";
      v34 = 2048;
      v35 = a4;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, User requested to end session with reason %lu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, &unk_1E9329810, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    -[SMSessionManager checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:](self, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", a2, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v10[2](v10, v13);
    }
    else
    {
      -[SMSessionManagerState startMessageGUID](self->_state, "startMessageGUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[SMSessionManager _getEndSessionStateWithReason:](self, "_getEndSessionStateWithReason:", a4);
      v21 = objc_alloc(MEMORY[0x1E0D8BA20]);
      -[SMSessionManager state](self, "state");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "monitorContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v9;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager messagingService](self, "messagingService");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v22, v14, 0, v20, v15, 0, 0, 0, 0, 0, 0, v17, 0, 0,
                      0,
                      a4,
                      v18,
                      0);

      -[SMSessionManager _setPendingSendSessionEndMessageWithReason:associatedGUID:](self, "_setPendingSendSessionEndMessageWithReason:associatedGUID:", a4, v26);
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __59__SMSessionManager__endSessionForSessionID_reason_handler___block_invoke;
      v28[3] = &unk_1E92984B0;
      v31 = a4;
      v28[4] = self;
      v29 = v26;
      v30 = v10;
      v19 = v26;
      -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v23, 1, v28);

      v9 = v27;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __59__SMSessionManager__endSessionForSessionID_reason_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!v8)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3 != 9)
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sendSessionEndMessageWithReason:associatedGUID:state:", v3, v5, v6);

      objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "onSessionTerminatedWithReason:", *(_QWORD *)(a1 + 56));

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_endRemoteSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a5;
  v9 = a3;
  -[SMSessionManager messagingService](self, "messagingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager messagingService](self, "messagingService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager platform](self, "platform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "convertRTPlatformToIDSDeviceType:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BA18]), "initWithSessionEndReason:sessionID:sourceDeviceType:sourceDeviceID:", a4, v9, v15, v12);
  -[SMSessionManager messagingService](self, "messagingService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__SMSessionManager__endRemoteSessionForSessionID_reason_handler___block_invoke;
  v19[3] = &unk_1E9298398;
  v19[4] = self;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "sendIDSMessageToMyNearbyDevices:completion:", v16, v19);

}

void __65__SMSessionManager__endRemoteSessionForSessionID_reason_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2)
      v7 = CFSTR("succeeded");
    else
      v7 = CFSTR("failed");
    objc_msgSend(*(id *)(a1 + 32), "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[SMSessionManager _endRemoteSessionForSessionID:reason:handler:]_block_invoke";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, sessionID, %@, error, %@", (uint8_t *)&v12, 0x2Au);

  }
  if (a2)
    v11 = 0;
  else
    v11 = v5;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11);

}

- (void)terminateSessionWithSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Received termination", buf, 2u);
  }

  -[SMSessionManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SMSessionManager_terminateSessionWithSessionID___block_invoke;
  v8[3] = &unk_1E9297540;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

uint64_t __50__SMSessionManager_terminateSessionWithSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateSessionWithSessionID:", *(_QWORD *)(a1 + 40));
}

- (void)_terminateSessionWithSessionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SMSessionManager _canDeviceModifyState](self, "_canDeviceModifyState"))
  {
    -[SMSessionManagerState configuration](self->_state, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

    if ((v7 & 1) != 0)
    {
      v8 = -[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
      -[NSObject setSessionState:](v8, "setSessionState:", 1);
      -[NSObject setStartMessageGUID:](v8, "setStartMessageGUID:", 0);
      -[NSObject setScheduledSendMessageGUID:](v8, "setScheduledSendMessageGUID:", 0);
      -[NSObject setScheduledSendMessageDate:](v8, "setScheduledSendMessageDate:", 0);
      -[NSObject setActiveDeviceIdentifier:](v8, "setActiveDeviceIdentifier:", 0);
      -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v8, 1, 0);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[SMSessionManagerState configuration](self->_state, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v11;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "sessionID %@ does not match current configuration sessionID %@", (uint8_t *)&v12, 0x16u);

      }
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Received termination request from a device that cannot modify state", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SMSessionManager modifySessionWithConfiguration:handler:]";
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, User requested to modify session", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke;
    block[3] = &unk_1E9296F70;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(v9, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_2;
    v19[3] = &unk_1E9297AA8;
    v4 = *(id *)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v4;
    objc_msgSend(v2, "_modifySessionWithConfiguration:handler:", v3, v19);
    v5 = v20;
  }
  else if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaRemoteControlEnabled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_3;
    v17[3] = &unk_1E9297AA8;
    v8 = *(id *)(a1 + 48);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v8;
    objc_msgSend(v6, "_modifyRemoteSessionWithConfiguration:handler:", v7, v17);
    v5 = v18;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SMSessionManager modifySessionWithConfiguration:handler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s: This device is not active and Zelkova RemoteControl is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D8BB70];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This device is not active and RemoteControl is not enabled;"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 1, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "code");
    objc_msgSend(v5, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 1, 0, v15, v16);

  }
}

void __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 1, 1, v6, v7);
}

void __59__SMSessionManager_modifySessionWithConfiguration_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 1, 2, v6, v7);
}

- (void)_modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:](self, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", a2, v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v8[2](v8, v11);
LABEL_8:

      goto LABEL_9;
    }
    if ((objc_msgSend(MEMORY[0x1E0D8B9F0], "configurationIsValid:", v7) & 1) != 0)
    {
      v11 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
      objc_msgSend(v11, "setSessionState:", 2);
      objc_msgSend(v11, "setConfiguration:", v7);
      -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v11, 1, v8);
      goto LABEL_8;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSessionManager _modifySessionWithConfiguration:handler:]";
      v22 = 2112;
      v23 = v17;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%s, invalid configuration, %@", buf, 0x16u);

    }
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s cannot be completed. Provided configuration is not valid."), "-[SMSessionManager _modifySessionWithConfiguration:handler:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 7, v14);
    v8[2](v8, v16);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }
LABEL_9:

}

- (void)_modifyRemoteSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SMSessionManager *v20;
  id v21;

  v6 = a4;
  v7 = a3;
  -[SMSessionManager messagingService](self, "messagingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager messagingService](self, "messagingService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager platform](self, "platform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "convertRTPlatformToIDSDeviceType:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BA38]), "initWithSourceDeviceType:sourceDeviceID:updatedSessionConfiguration:", v13, v10, v7);
  -[SMSessionManager messagingService](self, "messagingService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__SMSessionManager__modifyRemoteSessionWithConfiguration_handler___block_invoke;
  v18[3] = &unk_1E92A5DF8;
  v19 = v14;
  v20 = self;
  v21 = v6;
  v16 = v6;
  v17 = v14;
  objc_msgSend(v15, "sendIDSMessageToMyDevices:completion:", v17, v18);

}

void __66__SMSessionManager__modifyRemoteSessionWithConfiguration_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2)
      v7 = CFSTR("succeeded");
    else
      v7 = CFSTR("failed");
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316162;
    v14 = "-[SMSessionManager _modifyRemoteSessionWithConfiguration:handler:]_block_invoke";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Succeeded, %@, sendIDSMesssage modifyConfig, %@,sessionID, %@, error, %@", (uint8_t *)&v13, 0x34u);

  }
  if (a2)
    v12 = 0;
  else
    v12 = v5;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12);

}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SMSessionManager sendSafetyCacheForSessionID:handler:]";
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, User requested release", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__SMSessionManager_sendSafetyCacheForSessionID_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __56__SMSessionManager_sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
    objc_msgSend(v3, "setSessionState:", 4);
    objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v3, 1, *(_QWORD *)(a1 + 48));

  }
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, configuration, %@", buf, 0x16u);

    }
    -[SMSessionManager queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke;
    v13[3] = &unk_1E9297590;
    v13[4] = self;
    v14 = v7;
    v16 = a2;
    v15 = v8;
    dispatch_async(v11, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD block[4];
  id v28;
  uint64_t v29;
  id v30;
  _BYTE *v31;
  _QWORD v32[4];
  NSObject *v33;
  _BYTE *v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sessionState") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSameSession:", *(_QWORD *)(a1 + 40));

    if (v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, configuration, %@, Trying to start session we already started, mark as success", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      return;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E9329840, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v10, v12, v9);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if ((objc_msgSend(MEMORY[0x1E0D8B9F0], "configurationIsValid:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v13 = dispatch_group_create();
    objc_msgSend(*(id *)(a1 + 40), "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__167;
    v37 = __Block_byref_object_dispose__167;
    v38 = 0;
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      dispatch_group_enter(v13);
      objc_msgSend(v14, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_2;
      v32[3] = &unk_1E92A1538;
      v34 = buf;
      v33 = v13;
      +[SMMessagingUtilities queryChatWithGroupID:queue:handler:](SMMessagingUtilities, "queryChatWithGroupID:queue:handler:", v17, v18, v32);

    }
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_3;
    block[3] = &unk_1E92A5E20;
    v20 = *(id *)(a1 + 40);
    v31 = buf;
    v21 = *(_QWORD *)(a1 + 32);
    v28 = v20;
    v29 = v21;
    v30 = *(id *)(a1 + 48);
    dispatch_group_notify(v13, v19, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSessionManager startSessionWithConfiguration:handler:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%s, invalid configuration, %@", buf, 0x16u);

    }
    v39 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s cannot be completed. Provided configuration is not valid."), "-[SMSessionManager startSessionWithConfiguration:handler:]_block_invoke");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = objc_msgSend(v25, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 7, v24);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "displayName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __58__SMSessionManager_startSessionWithConfiguration_handler___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;

  v2 = objc_alloc(MEMORY[0x1E0D8B918]);
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receiverHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v2, "initWithReceiverHandles:identifier:displayName:", v4, v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "mutableCopy");
  objc_msgSend(v7, "setSessionState:", 2);
  v25 = objc_alloc(MEMORY[0x1E0D8B9F0]);
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(*(id *)(a1 + 32), "sessionType");
  objc_msgSend(*(id *)(a1 + 32), "time");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userResponseSafeDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "sessionSupportsHandoff");
  objc_msgSend(*(id *)(a1 + 32), "sosReceivers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = v14;
  v16 = (void *)objc_msgSend(v25, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v26, v8, v9, v10, v11, v12, v13, v24, v15, objc_msgSend(*(id *)(a1 + 32), "sessionWorkoutType"));
  objc_msgSend(v7, "setConfiguration:", v16);

  if (objc_msgSend(*(id *)(a1 + 32), "sessionType") == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateDestinationForRoundTripSessionConfiguration:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConfiguration:", v17);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "sessionType") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eta");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "etaDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEstimatedEndDate:", v20);

    objc_msgSend(*(id *)(a1 + 32), "destination");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "eta");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "coarseEtaDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCoarseEstimatedEndDate:", v23);

    objc_msgSend(v7, "setEstimatedEndDateStatus:", 1);
  }
  objc_msgSend(*(id *)(a1 + 40), "_performStateTransitionTo:transitionType:handler:", v7, 1, *(_QWORD *)(a1 + 48));

}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SMSessionManager respondToTriggerPromptForSessionID:response:handler:]";
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, User responded to trigger prompt", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke;
    v13[3] = &unk_1E9297590;
    v13[4] = self;
    v14 = v8;
    v16 = a4;
    v15 = v9;
    dispatch_async(v11, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2;
    v21[3] = &unk_1E9297AA8;
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(id *)(a1 + 48);
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = v5;
    objc_msgSend(v2, "_respondToTriggerPromptForSessionID:response:handler:", v3, v4, v21);
    v6 = v22;
  }
  else if (objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaRemoteControlEnabled"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_3;
    v19[3] = &unk_1E9297AA8;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v10;
    objc_msgSend(v7, "_respondToTriggerPromptWithRemoteControlSessionID:response:handler:", v8, v9, v19);
    v6 = v20;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SMSessionManager respondToTriggerPromptForSessionID:response:handler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s: This device is not active and Zelkova RemoteControl is not enabled; skip and do nothing",
        buf,
        0xCu);
    }

    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v13 = *MEMORY[0x1E0D8BB70];
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This device is not active and RemoteControl is not enabled;"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, 1, v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "code");
    objc_msgSend(v6, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 2, 0, v17, v18);

  }
}

void __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 2, 1, v6, v7);
}

void __72__SMSessionManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "code");
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "onUserActionWithRemoteCommand:remoteCommandType:error:errorDomain:", 2, 2, v6, v7);
}

- (void)_respondToTriggerPromptWithRemoteControlSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a5;
  v9 = a3;
  -[SMSessionManager messagingService](self, "messagingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager messagingService](self, "messagingService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager platform](self, "platform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "convertRTPlatformToIDSDeviceType:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B9D0]), "initWithTriggerPromptResponse:sessionID:sourceDeviceType:sourceDeviceID:", a4, v9, v15, v12);
  -[SMSessionManager messagingService](self, "messagingService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __87__SMSessionManager__respondToTriggerPromptWithRemoteControlSessionID_response_handler___block_invoke;
  v19[3] = &unk_1E9298398;
  v19[4] = self;
  v20 = v8;
  v18 = v8;
  objc_msgSend(v17, "sendIDSMessageToMyDevices:completion:", v16, v19);

}

void __87__SMSessionManager__respondToTriggerPromptWithRemoteControlSessionID_response_handler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2)
      v7 = CFSTR("succeeded");
    else
      v7 = CFSTR("failed");
    objc_msgSend(*(id *)(a1 + 32), "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[SMSessionManager _respondToTriggerPromptWithRemoteControlSessionID:response:handler:]_block_invoke";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, sessionID, %@, error, %@", (uint8_t *)&v12, 0x2Au);

  }
  if (a2)
    v11 = 0;
  else
    v11 = v5;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11);

}

- (void)_respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
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
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint8_t buf[4];
  const char *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v84 = "-[SMSessionManager _respondToTriggerPromptForSessionID:response:handler:]";
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, User responded to trigger prompt", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    -[SMSessionManager checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:](self, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", a2, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v10[2](v10, v13);
LABEL_31:

      goto LABEL_32;
    }
    -[SMSessionManager state](self, "state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sessionState");

    switch(v15)
    {
      case 7:
        if (a4 == 1)
          goto LABEL_25;
        if (a4 != 2)
        {
          if (a4 == 3)
            goto LABEL_24;
          v81 = *MEMORY[0x1E0CB2D50];
          v16 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromSelector(a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ cannot be completed due invalid response type"), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v18;
          v19 = (void *)MEMORY[0x1E0C99D80];
          v20 = &v82;
          v21 = &v81;
          goto LABEL_27;
        }
        v69 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
        objc_msgSend(v69, "setSessionState:", 2);
        objc_msgSend(v69, "setUserTriggerResponse:", 2);
        -[SMSessionManager state](self, "state");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "configuration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_alloc(MEMORY[0x1E0D8B9F0]);
        objc_msgSend(v32, "conversation");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sessionID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "destination");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "sessionStartDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v32, "sessionSupportsHandoff");
        objc_msgSend(v32, "sosReceivers");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v67, "initDestinationBoundSessionConfigurationWithConversation:sessionID:destination:sessionStartDate:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:", v65, v61, v63, v33, v71, v59, v34);

        objc_msgSend(v69, "setConfiguration:", v35);
        -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v69, 1, v10);

        goto LABEL_31;
      case 8:
        switch(a4)
        {
          case 1:
            goto LABEL_25;
          case 2:
            goto LABEL_28;
          case 3:
            goto LABEL_24;
        }
        v79 = *MEMORY[0x1E0CB2D50];
        v22 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ cannot be completed due invalid response type"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v18;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = &v80;
        v21 = &v79;
        goto LABEL_27;
      case 9:
        switch(a4)
        {
          case 1:
            goto LABEL_25;
          case 2:
            v36 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
            objc_msgSend(v36, "setSessionState:", 2);
            v68 = v36;
            objc_msgSend(v36, "setUserTriggerResponse:", 2);
            -[SMSessionManager defaultsManager](self, "defaultsManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKey:", CFSTR("RTDefaultsSessionManagerTimerExtensionPeriodKey"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              -[SMSessionManager defaultsManager](self, "defaultsManager");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectForKey:", CFSTR("RTDefaultsSessionManagerTimerExtensionPeriodKey"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "doubleValue");
              v42 = v41;

            }
            else
            {
              v42 = *MEMORY[0x1E0D8BC90];
            }
            -[SMSessionManager state](self, "state");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "configuration");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "time");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "timeBound");
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v47 = objc_alloc(MEMORY[0x1E0D8BA88]);
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v66, v42);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = (void *)objc_msgSend(v47, "initWithTimeBound:", v48);

            v57 = objc_alloc(MEMORY[0x1E0D8B9F0]);
            -[SMSessionManager state](self, "state");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "configuration");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "conversation");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager state](self, "state");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "configuration");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "sessionID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionManager state](self, "state");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "configuration");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v55, "sessionSupportsHandoff");
            -[SMSessionManager state](self, "state");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "configuration");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "sosReceivers");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_msgSend(v57, "initTimeBoundSessionConfigurationWithConversation:sessionID:time:sessionSupportsHandoff:sosReceivers:", v70, v49, v72, v50, v53);

            v24 = v68;
            objc_msgSend(v68, "setConfiguration:", v54);
            -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v68, 1, v10);

            goto LABEL_30;
          case 3:
            goto LABEL_24;
        }
        v77 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ cannot be completed due invalid response type"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v18;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = &v78;
        v21 = &v77;
        goto LABEL_27;
      case 14:
        switch(a4)
        {
          case 1:
LABEL_25:
            v24 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
            objc_msgSend(v24, "setSessionState:", 4);
            v25 = v24;
            v26 = 1;
            break;
          case 2:
LABEL_28:
            v24 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
            objc_msgSend(v24, "setSessionState:", 2);
            v25 = v24;
            v26 = 2;
            break;
          case 3:
LABEL_24:
            v24 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
            objc_msgSend(v24, "setSessionState:", 4);
            v25 = v24;
            v26 = 3;
            break;
          default:
            v75 = *MEMORY[0x1E0CB2D50];
            v43 = (void *)MEMORY[0x1E0CB3940];
            NSStringFromSelector(a2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ cannot be completed due invalid response type"), v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = v18;
            v19 = (void *)MEMORY[0x1E0C99D80];
            v20 = &v76;
            v21 = &v75;
LABEL_27:
            objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v30 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 7, v28);
            v10[2](v10, v30);

            goto LABEL_31;
        }
        objc_msgSend(v25, "setUserTriggerResponse:", v26);
        -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v24, 1, v10);
LABEL_30:

        goto LABEL_31;
      default:
        v73 = *MEMORY[0x1E0CB2D50];
        v27 = (void *)MEMORY[0x1E0CB3940];
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@ cannot be completed due invalid state for response"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v18;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = &v74;
        v21 = &v73;
        goto LABEL_27;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_32:

}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, _QWORD);

  v10 = (void (**)(id, void *, _QWORD))a3;
  -[SMSessionManager state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActiveState");

  if (v5)
  {
    -[SMSessionManager state](self, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sosReceivers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "receiverHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  v10[2](v10, v9, 0);

}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  uint64_t (*v4)(uint64_t, uint64_t);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[4];
  NSObject *v24;
  _BYTE *v25;
  uint8_t v26[4];
  const char *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SMSessionManager iMessageGroupMembershipChangedFor:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v29 = v4;
      LOWORD(v30) = 2048;
      *(_QWORD *)((char *)&v30 + 2) = objc_msgSend(v10, "sessionState");
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, current session groupID, %@, membership changed for groupID, %@, session state, %lu", buf, 0x2Au);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__167;
    *(_QWORD *)&v30 = __Block_byref_object_dispose__167;
    *((_QWORD *)&v30 + 1) = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (!-[SMSessionManager _canDeviceModifyState](self, "_canDeviceModifyState"))
      goto LABEL_7;
    -[SMSessionManager state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v4);

    if (v15)
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      -[SMSessionManager queue](self, "queue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke;
      v23[3] = &unk_1E92A1538;
      v25 = buf;
      v19 = v16;
      v24 = v19;
      +[SMMessagingUtilities queryChatWithGroupID:queue:handler:](SMMessagingUtilities, "queryChatWithGroupID:queue:handler:", v4, v17, v23);

      -[SMSessionManager queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke_368;
      v22[3] = &unk_1E92977E0;
      v22[4] = self;
      v22[5] = buf;
      dispatch_group_notify(v19, v20, v22);

    }
    else
    {
LABEL_7:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v26 = 136315138;
        v27 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]";
        _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "%s, membership change ignored", v26, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", buf, 2u);
    }

  }
}

void __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "handles");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]_block_invoke";
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, found chat with handles, %@", buf, 0x16u);

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v3, "handles", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "address");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke_368(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sosReceivers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = MEMORY[0x1E0C9AA60];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B960]), "initWithPrimaryHandle:secondaryHandles:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13), v12);
        objc_msgSend(v7, "addObject:", v14);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v10);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    v30 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]_block_invoke";
    v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, updating conversation with receivers, %@", buf, 0x16u);
  }

  v17 = objc_alloc(MEMORY[0x1E0D8B918]);
  v18 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithReceiverHandles:identifier:displayName:", v18, v19, v20);

  +[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyMappedToHandlesInConversation2:](SMMessagingUtilities, "conversationFromHandlesInConversation1:canonicallyMappedToHandlesInConversation2:", v21, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[SMMessagingUtilities conversationFromHandlesInConversation1:canonicallyIntersectedWithHandlesInConversation2:](SMMessagingUtilities, "conversationFromHandlesInConversation1:canonicallyIntersectedWithHandlesInConversation2:", v24, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateSessionWithConversation:sosReceivers:handler:", v22, v23, &__block_literal_global_372_0);

}

void __54__SMSessionManager_iMessageGroupMembershipChangedFor___block_invoke_371(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[SMSessionManager iMessageGroupMembershipChangedFor:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%s, conversation receiver update failed due to, %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "-[SMSessionManager kickedFromIMessageGroupWith:]";
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v4;
      v25 = 2048;
      v26 = objc_msgSend(v10, "sessionState");
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, current session groupID, %@, unjoined from groupID, %@, session state, %lu", (uint8_t *)&v19, 0x2Au);

    }
    if (!-[SMSessionManager _canDeviceModifyState](self, "_canDeviceModifyState"))
      goto LABEL_7;
    -[SMSessionManager state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v4);

    if (v15)
    {
      -[SMSessionManager state](self, "state");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject configuration](v16, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager _endSessionForSessionID:reason:handler:](self, "_endSessionForSessionID:reason:handler:", v18, 9, &__block_literal_global_373);

    }
    else
    {
LABEL_7:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v19 = 136315138;
        v20 = "-[SMSessionManager kickedFromIMessageGroupWith:]";
        _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%s, initiator unjoin ignored", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", (uint8_t *)&v19, 2u);
    }
  }

}

void __48__SMSessionManager_kickedFromIMessageGroupWith___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[SMSessionManager kickedFromIMessageGroupWith:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%s, failed to end session on initiator unjoin due to error, %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  uint64_t (*v4)(uint64_t, uint64_t);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[4];
  NSObject *v24;
  _BYTE *v25;
  uint8_t v26[4];
  const char *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v29 = v4;
      LOWORD(v30) = 2048;
      *(_QWORD *)((char *)&v30 + 2) = objc_msgSend(v10, "sessionState");
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, current session groupID, %@, displayName changed for groupID, %@, session state, %lu", buf, 0x2Au);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v29 = __Block_byref_object_copy__167;
    *(_QWORD *)&v30 = __Block_byref_object_dispose__167;
    *((_QWORD *)&v30 + 1) = 0;
    if (!-[SMSessionManager _canDeviceModifyState](self, "_canDeviceModifyState"))
      goto LABEL_7;
    -[SMSessionManager state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v4);

    if (v15)
    {
      v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      -[SMSessionManager queue](self, "queue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke;
      v23[3] = &unk_1E92A1538;
      v25 = buf;
      v19 = v16;
      v24 = v19;
      +[SMMessagingUtilities queryChatWithGroupID:queue:handler:](SMMessagingUtilities, "queryChatWithGroupID:queue:handler:", v4, v17, v23);

      -[SMSessionManager queue](self, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke_374;
      v22[3] = &unk_1E92977E0;
      v22[4] = self;
      v22[5] = buf;
      dispatch_group_notify(v19, v20, v22);

    }
    else
    {
LABEL_7:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v26 = 136315138;
        v27 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]";
        _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "%s, displayName change ignored", v26, 0xCu);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: groupID", buf, 2u);
    }

  }
}

void __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, found chat with displayName, %@", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v3, "displayName");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke_374(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v15 = 136315394;
    v16 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]_block_invoke";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, updating state with new conversation displayName, %@", (uint8_t *)&v15, 0x16u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D8B918]);
  objc_msgSend(v4, "receiverHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithReceiverHandles:identifier:displayName:", v8, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sosReceivers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_updateSessionWithConversation:sosReceivers:handler:", v10, v14, &__block_literal_global_376);

}

void __55__SMSessionManager_iMessageGroupDisplayNameChangedFor___block_invoke_375(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[SMSessionManager iMessageGroupDisplayNameChangedFor:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%s, conversation display name update failed due to, %@", (uint8_t *)&v4, 0x16u);
    }

  }
}

- (void)_updateSessionWithConversation:(id)a3 sosReceivers:(id)a4 handler:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v23;
  id v24;

  v23 = a5;
  v21 = a4;
  v20 = a3;
  -[SMSessionManager state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  -[SMSessionManager state](self, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = objc_alloc(MEMORY[0x1E0D8B9F0]);
  objc_msgSend(v24, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sessionStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v24, "sessionType");
  objc_msgSend(v24, "time");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "destination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "userResponseSafeDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v24, "sessionSupportsHandoff");
  v18 = (void *)objc_msgSend(v11, "initWithConversation:sessionID:sessionStartDate:sessionType:time:destination:userResponseSafeDate:sessionSupportsHandoff:sosReceivers:sessionWorkoutType:", v20, v12, v13, v14, v15, v16, v17, v19, v21, objc_msgSend(v24, "sessionWorkoutType"));

  objc_msgSend(v10, "setConfiguration:", v18);
  -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v10, 1, v23);

}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:handler:]";
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for destination anomaly prompt with handler", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__SMSessionManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __76__SMSessionManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionType");

    if (v8 == 2)
    {
      v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      objc_msgSend(v9, "setSessionState:", 7);
      objc_msgSend(v9, "setMonitorContext:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v9, 1, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionTypeToString:", objc_msgSend(v12, "sessionType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s cannot run for sessionType %@"), "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:handler:]_block_invoke", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v19;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D8BB70];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:handler:]";
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for destination anomaly prompt with handler", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__SMSessionManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __74__SMSessionManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionType");

    if (v8 == 3)
    {
      v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      objc_msgSend(v9, "setSessionState:", 8);
      objc_msgSend(v9, "setMonitorContext:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v9, 1, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionTypeToString:", objc_msgSend(v12, "sessionType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s cannot run for sessionType %@"), "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:handler:]_block_invoke", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v19;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D8BB70];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[SMSessionManager promptTimerEndedVerificationWithContext:handler:]";
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for timer ended prompt with handler", buf, 0xCu);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__SMSessionManager_promptTimerEndedVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __68__SMSessionManager_promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionType");

    if (v8 == 1)
    {
      v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      objc_msgSend(v9, "setSessionState:", 9);
      objc_msgSend(v9, "setMonitorContext:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v9, 1, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionTypeToString:", objc_msgSend(v12, "sessionType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s cannot run for sessionType %@"), "-[SMSessionManager promptTimerEndedVerificationWithContext:handler:]_block_invoke", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v19;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D8BB70];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:handler:]";
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for workout anoamly with handler, context, %@", buf, 0x16u);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__SMSessionManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __72__SMSessionManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionType");

    if (v8 == 4)
    {
      v9 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      objc_msgSend(v9, "setSessionState:", 14);
      objc_msgSend(v9, "setMonitorContext:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v9, 1, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionTypeToString:", objc_msgSend(v12, "sessionType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s cannot run for sessionType %@"), "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:handler:]_block_invoke", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = v19;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D8BB70];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (void)promptWorkoutSessionEndVerificationWithContext:(id)a3 handlers:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SMSessionManager promptWorkoutSessionEndVerificationWithContext:handlers:]";
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for watch anoamly with handler, context, %@", buf, 0x16u);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E9329828, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionType");

    if (v8 == 4)
    {
      v9 = *(id **)(a1 + 32);
      objc_msgSend(v9[1], "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke_379;
      v23[3] = &unk_1E9297568;
      v24 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_endSessionForSessionID:reason:handler:", v11, 8, v23);

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionTypeToString:", objc_msgSend(v14, "sessionType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%s cannot run for sessionType %@"), "-[SMSessionManager promptWorkoutSessionEndVerificationWithContext:handlers:]_block_invoke", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v22;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D8BB70];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __76__SMSessionManager_promptWorkoutSessionEndVerificationWithContext_handlers___block_invoke_379(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136446466;
    v6 = "-[SMSessionManager promptWorkoutSessionEndVerificationWithContext:handlers:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%{public}s, end session result, %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SMSessionManager promptSafeArrivalWithContext:handler:]";
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received prompt request for safe arrival with handler, context, %@", buf, 0x16u);
    }

    -[SMSessionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke;
    v12[3] = &unk_1E9297590;
    v12[4] = self;
    v15 = a2;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

void __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "sessionType");

    if (v8 == 2)
    {
      v9 = *(id **)(a1 + 32);
      objc_msgSend(v9[1], "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke_380;
      v23[3] = &unk_1E9297568;
      v24 = *(id *)(a1 + 48);
      objc_msgSend(v9, "_endSessionForSessionID:reason:handler:", v11, 1, v23);

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0D8B9F0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionTypeToString:", objc_msgSend(v14, "sessionType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%s cannot run for sessionType %@"), "-[SMSessionManager promptSafeArrivalWithContext:handler:]_block_invoke", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_DWORD *)buf = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v22;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@, current state, %@", buf, 0x16u);
      }

      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D8BB70];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __57__SMSessionManager_promptSafeArrivalWithContext_handler___block_invoke_380(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136446466;
    v6 = "-[SMSessionManager promptSafeArrivalWithContext:handler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%{public}s, end session result, %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)onSessionStartMessageSendResultWithMessage:(id)a3 messageGUID:(id)a4 success:(BOOL)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  BOOL v22;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: message";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_7;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: messageGUID";
    goto LABEL_10;
  }
  -[SMSessionManager queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__SMSessionManager_onSessionStartMessageSendResultWithMessage_messageGUID_success_error___block_invoke;
  v17[3] = &unk_1E929F130;
  v17[4] = self;
  v21 = a2;
  v18 = v11;
  v19 = v12;
  v22 = a5;
  v20 = v13;
  dispatch_async(v14, v17);

LABEL_8:
}

void __89__SMSessionManager_onSessionStartMessageSendResultWithMessage_messageGUID_success_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkSessionIDAndCanDeviceModifyStateWithSelector:sessionID:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startMessageGUID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startMessageGUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = objc_msgSend(v8, "isEqual:", v9);

      if ((v8 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v19 = 136315138;
          v20 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
          _os_log_fault_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_FAULT, "%s, Received a second start message GUID for the same session", (uint8_t *)&v19, 0xCu);
        }
        goto LABEL_12;
      }
    }
    v10 = *(unsigned __int8 *)(a1 + 72);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
        -[NSObject setStartMessageGUID:](v16, "setStartMessageGUID:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v16, 1, &__block_literal_global_382);
LABEL_12:

        goto LABEL_13;
      }
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315650;
      v20 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, Start message %@ successfully sent for session %@", (uint8_t *)&v19, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 56);
      v19 = 136315906;
      v20 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v18;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%s, Start message %@ failed to send for session %@ with error %@", (uint8_t *)&v19, 0x2Au);
    }

    goto LABEL_11;
  }
LABEL_13:

}

void __89__SMSessionManager_onSessionStartMessageSendResultWithMessage_messageGUID_success_error___block_invoke_381(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager onSessionStartMessageSendResultWithMessage:messageGUID:success:error:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, completed state update with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)onScheduledSendMessageScheduledForSessionID:(id)a3 guid:(id)a4 date:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: sessionID";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_12;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: guid";
    goto LABEL_11;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "Invalid parameter not satisfying: date";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  -[SMSessionManager queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SMSessionManager_onScheduledSendMessageScheduledForSessionID_guid_date___block_invoke;
  block[3] = &unk_1E92978E8;
  block[4] = self;
  v20 = a2;
  v17 = v9;
  v18 = v10;
  v19 = v12;
  dispatch_async(v13, block);

LABEL_13:
}

void __74__SMSessionManager_onScheduledSendMessageScheduledForSessionID_guid_date___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scheduledSendMessageGUID");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scheduledSendMessageGUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v6, "isEqualToString:", v7);

      if ((v6 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scheduledSendMessageGUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136315650;
          v14 = "-[SMSessionManager onScheduledSendMessageScheduledForSessionID:guid:date:]_block_invoke";
          v15 = 2112;
          v16 = v11;
          v17 = 2112;
          v18 = v12;
          _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, mismatch of Scheduled Send GUID, old GUID, %@, new GUID, %@", buf, 0x20u);

        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v14 = "-[SMSessionManager onScheduledSendMessageScheduledForSessionID:guid:date:]_block_invoke";
          _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "%s, mismatch of Scheduled Send GUID", buf, 0xCu);
        }

      }
    }
    v10 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
    objc_msgSend(v10, "setScheduledSendMessageGUID:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v10, "setScheduledSendMessageDate:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v10, 1, &__block_literal_global_384_0);

  }
}

void __74__SMSessionManager_onScheduledSendMessageScheduledForSessionID_guid_date___block_invoke_383(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager onScheduledSendMessageScheduledForSessionID:guid:date:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, completed state update with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)onScheduledSendMessageCanceledForSessionID:(id)a3 guid:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: sessionID";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, v12, buf, 2u);
    goto LABEL_7;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = "Invalid parameter not satisfying: guid";
    goto LABEL_10;
  }
  -[SMSessionManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__SMSessionManager_onScheduledSendMessageCanceledForSessionID_guid___block_invoke;
  v13[3] = &unk_1E9298238;
  v13[4] = self;
  v16 = a2;
  v14 = v7;
  v15 = v9;
  dispatch_async(v10, v13);

LABEL_8:
}

void __68__SMSessionManager_onScheduledSendMessageCanceledForSessionID_guid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "checkSessionIDAndCanDeviceModifyStateWithSelector:sessionID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scheduledSendMessageGUID");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      && (v4 = (void *)v3,
          v5 = *(void **)(a1 + 48),
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scheduledSendMessageGUID"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v5) = objc_msgSend(v5, "isEqualToString:", v6),
          v6,
          v4,
          (v5 & 1) == 0))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "scheduledSendMessageGUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 48);
        v12 = 136315650;
        v13 = "-[SMSessionManager onScheduledSendMessageCanceledForSessionID:guid:]_block_invoke";
        v14 = 2112;
        v15 = v10;
        v16 = 2112;
        v17 = v11;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, mismatch of Scheduled Send GUID, old GUID, %@, new GUID, %@", (uint8_t *)&v12, 0x20u);

      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v12 = 136315138;
        v13 = "-[SMSessionManager onScheduledSendMessageCanceledForSessionID:guid:]_block_invoke";
        _os_log_fault_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_FAULT, "%s, mismatch of Scheduled Send GUID", (uint8_t *)&v12, 0xCu);
      }

    }
    else
    {
      v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      objc_msgSend(v7, "setScheduledSendMessageDate:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v7, 1, &__block_literal_global_386_0);

    }
  }

}

void __68__SMSessionManager_onScheduledSendMessageCanceledForSessionID_guid___block_invoke_385(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager onScheduledSendMessageCanceledForSessionID:guid:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, completed state update with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)onScheduledSendForSessionID:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMSessionManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SMSessionManager_onScheduledSendForSessionID___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __48__SMSessionManager_onScheduledSendForSessionID___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  __int128 v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__SMSessionManager_onScheduledSendForSessionID___block_invoke_2;
  v2[3] = &unk_1E9297628;
  v3 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v1, "_onScheduledSendForSessionID:handler:", (id)v3, v2);

}

void __48__SMSessionManager_onScheduledSendForSessionID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "SMSessionManager,%@,sessionID:%@,returned with error,%@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)_onScheduledSendForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(id, void *);
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[SMSessionManager _onScheduledSendForSessionID:handler:]";
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Received scheduled send event for sessionID:%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, &unk_1E9329810, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    -[SMSessionManager checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:](self, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", a2, v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v8[2](v8, v11);
    }
    else
    {
      v12 = (void *)-[SMSessionManagerState mutableCopy](self->_state, "mutableCopy");
      objc_msgSend(v12, "setSessionState:", 4);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BA40]), "initWithUpdateReason:triggerCategory:sessionID:", 1, 15, v7);
      objc_msgSend(v12, "setMonitorContext:", v13);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__SMSessionManager__onScheduledSendForSessionID_handler___block_invoke;
      v14[3] = &unk_1E9297568;
      v15 = v8;
      -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v12, 1, v14);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }
  }

}

void __57__SMSessionManager__onScheduledSendForSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SMSessionManager _onScheduledSendForSessionID:handler:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, " %s, unable to transition to SMSessionStateCacheReleasedAndUpdating due to, %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)promptDirectTriggerWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[SMSessionManager promptDirectTriggerWithContext:]";
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Received prompt request for direct trigger", buf, 0xCu);
  }

  -[SMSessionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v10 = v5;
  v11 = a2;
  v8 = v5;
  dispatch_async(v7, block);

}

void __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _QWORD v20[5];
  char v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isActiveDevice")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isActiveState") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, &unk_1E9329810, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[SMSessionManager promptDirectTriggerWithContext:]_block_invoke";
        v27 = 2112;
        v28 = v6;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%s, %@", buf, 0x16u);
      }
    }
    else
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
      -[NSObject setSessionState:](v7, "setSessionState:", 4);
      -[NSObject setMonitorContext:](v7, "setMonitorContext:", *(_QWORD *)(a1 + 40));
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sessionState") == 4)
      {
        v16 = (void *)MEMORY[0x1E0D8BA40];
        -[NSObject monitorContext](v7, "monitorContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isSOSTriggerCategory:", objc_msgSend(v17, "triggerCategory"));

      }
      else
      {
        v18 = 0;
      }
      v19 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_390;
      v20[3] = &unk_1E92A5F30;
      v21 = v18;
      v20[4] = v19;
      objc_msgSend(v19, "_performStateTransitionTo:transitionType:handler:", v7, 1, v20);
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
    v2 = v12;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8B948]), "initWithSessionID:triggerCategory:", v2, objc_msgSend(*(id *)(a1 + 40), "triggerCategory"));
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_2;
    v22[3] = &unk_1E92A5F08;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v23 = v14;
    v24 = v15;
    objc_msgSend(v13, "sendIDSMessageToMyNearbyDevices:completion:", v6, v22);

    v7 = v23;
  }

}

void __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a2)
      v7 = CFSTR("succeeded");
    else
      v7 = CFSTR("failed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "triggerCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136316162;
    v13 = "-[SMSessionManager promptDirectTriggerWithContext:]_block_invoke_2";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, send, %@, triggerCategory, %@, sessionID, %@, error, %@", (uint8_t *)&v12, 0x34u);

  }
}

void __51__SMSessionManager_promptDirectTriggerWithContext___block_invoke_390(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[SMSessionManager promptDirectTriggerWithContext:]_block_invoke";
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%s, unable to complete state transition for secondary SOS trigger", (uint8_t *)&v5, 0xCu);
    }

  }
  else if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversForSecondarySOSTrigger");
  }

}

- (void)updateUserWithContext:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SMSessionManager updateUserWithContext:]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Received prompt for safety session update", (uint8_t *)&v4, 0xCu);
  }

}

- (void)updateUserWithTriggerContext:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SMSessionManager updateUserWithTriggerContext:]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Received update with trigger context", (uint8_t *)&v4, 0xCu);
  }

}

- (void)promptSafeArrivalWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SMSessionManager promptSafeArrivalWithContext:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, Received safe arrival, context, %@", (uint8_t *)&v6, 0x16u);
  }

  -[SMSessionManager promptSafeArrivalWithContext:handler:](self, "promptSafeArrivalWithContext:handler:", v4, &__block_literal_global_391);
}

void __49__SMSessionManager_promptSafeArrivalWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager promptSafeArrivalWithContext:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, completed, error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)promptEstimatedEndDateUpdateWithContext:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[SMSessionManager promptEstimatedEndDateUpdateWithContext:]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, context, %@", buf, 0x16u);
  }

  -[SMSessionManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMSessionManager_promptEstimatedEndDateUpdateWithContext___block_invoke;
  block[3] = &unk_1E9297BC8;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

void __60__SMSessionManager_promptEstimatedEndDateUpdateWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E93297B0, &unk_1E93297C8, &unk_1E93297E0, &unk_1E93297F8, &unk_1E9329828, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkSessionIDCanDeviceModifyStateAndSessionStateWithSelector:sessionID:validSessionStates:", v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SMSessionManager promptEstimatedEndDateUpdateWithContext:]_block_invoke";
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%s, %@", buf, 0x16u);
    }

  }
  else
  {
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "estimatedEndDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEstimatedEndDate:", v9);

    objc_msgSend(*(id *)(a1 + 40), "coarseEstimatedEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "setCoarseEstimatedEndDate:", v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "estimatedEndDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCoarseEstimatedEndDate:", v11);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "estimatedEndDateStatus") == 2)
      v12 = 3;
    else
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "estimatedEndDateStatus");
    objc_msgSend(v8, "setEstimatedEndDateStatus:", v12);
    objc_msgSend(v8, "setMonitorContext:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_performStateTransitionTo:transitionType:handler:", v8, 1, 0);
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "estimatedEndDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "coarseEstimatedEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_updateReceiverWithEstimatedEndDate:coarseEstimatedEndDate:sessionID:", v14, v15, v18);

  }
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for destination anomaly verification", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionManager promptDestinationAnomalyVerificationWithContext:handler:](self, "promptDestinationAnomalyVerificationWithContext:handler:", v4, &__block_literal_global_392);
}

void __68__SMSessionManager_promptDestinationAnomalyVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager promptDestinationAnomalyVerificationWithContext:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for round trip anomaly verification", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionManager promptRoundTripAnomalyVerificationWithContext:handler:](self, "promptRoundTripAnomalyVerificationWithContext:handler:", v4, &__block_literal_global_393);
}

void __66__SMSessionManager_promptRoundTripAnomalyVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager promptRoundTripAnomalyVerificationWithContext:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)promptTimerEndedVerificationWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SMSessionManager promptTimerEndedVerificationWithContext:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for timer ended verification", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionManager promptTimerEndedVerificationWithContext:handler:](self, "promptTimerEndedVerificationWithContext:handler:", v4, &__block_literal_global_394);
}

void __60__SMSessionManager_promptTimerEndedVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager promptTimerEndedVerificationWithContext:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "%s, Received prompt request for workout anomaly verification", (uint8_t *)&v6, 0xCu);
  }

  -[SMSessionManager promptWorkoutAnomalyVerificationWithContext:handler:](self, "promptWorkoutAnomalyVerificationWithContext:handler:", v4, &__block_literal_global_395);
}

void __64__SMSessionManager_promptWorkoutAnomalyVerificationWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSessionManager promptWorkoutAnomalyVerificationWithContext:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s completed with error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)onDeletedMessage:(id)a3 handler:(id)a4
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
  -[SMSessionManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SMSessionManager_onDeletedMessage_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __45__SMSessionManager_onDeletedMessage_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeletedMessage:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_onDeletedMessage:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD);
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[SMSessionManager _onDeletedMessage:handler:]";
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "SMSessionManager,%s,currentSessionID,%@,message,%@", buf, 0x20u);

  }
  -[SMSessionManager state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isActiveState"))
    goto LABEL_8;
  -[SMSessionManager state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqual:", v16))
  {

LABEL_8:
    goto LABEL_9;
  }
  v17 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");

  if (!v17)
  {
LABEL_9:
    v7[2](v7, 0);
    goto LABEL_10;
  }
  -[SMSessionManager state](self, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __46__SMSessionManager__onDeletedMessage_handler___block_invoke;
  v21[3] = &unk_1E9299358;
  v21[4] = self;
  v22 = v7;
  -[SMSessionManager _endSessionForSessionID:reason:handler:](self, "_endSessionForSessionID:reason:handler:", v20, 2, v21);

LABEL_10:
}

void __46__SMSessionManager__onDeletedMessage_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[SMSessionManager _onDeletedMessage:handler:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "SMSessionManager,%s,sessionID:%@, end session due to message deletion with error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)onDeletedConversation:(id)a3 handler:(id)a4
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
  -[SMSessionManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SMSessionManager_onDeletedConversation_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __50__SMSessionManager_onDeletedConversation_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDeletedConversation:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_onDeletedConversation:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  void (**v22)(id, _QWORD);
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "receiverHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[SMSessionManager _onDeletedConversation:handler:]";
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "SMSessionManager,%s,currentSessionID,%@,receiverHandles,%@", buf, 0x20u);

  }
  -[SMSessionManager state](self, "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isActiveState"))
    goto LABEL_8;
  -[SMSessionManager state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SMMessagingUtilities handlesInConversation1:canonicallyEqualsHandlesInConversation2:](SMMessagingUtilities, "handlesInConversation1:canonicallyEqualsHandlesInConversation2:", v16, v6))
  {

LABEL_8:
    goto LABEL_9;
  }
  v17 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");

  if (!v17)
  {
LABEL_9:
    v7[2](v7, 0);
    goto LABEL_10;
  }
  -[SMSessionManager state](self, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sessionID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __51__SMSessionManager__onDeletedConversation_handler___block_invoke;
  v21[3] = &unk_1E9299358;
  v21[4] = self;
  v22 = v7;
  -[SMSessionManager _endSessionForSessionID:reason:handler:](self, "_endSessionForSessionID:reason:handler:", v20, 2, v21);

LABEL_10:
}

void __51__SMSessionManager__onDeletedConversation_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[SMSessionManager _onDeletedConversation:handler:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "SMSessionManager,%s,sessionID:%@, end session due to conversation deletion with error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sessionInitializedWithSessionID:(id)a3 allowReadToken:(id)a4 safetyCacheKey:(id)a5 scheduledSendMessageGUID:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD block[4];
  NSObject *v21;
  SMSessionManager *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v17)
  {
    -[SMSessionManager queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __125__SMSessionManager_sessionInitializedWithSessionID_allowReadToken_safetyCacheKey_scheduledSendMessageGUID_completionHandler___block_invoke;
    block[3] = &unk_1E92991A8;
    v21 = v13;
    v22 = self;
    v26 = v17;
    v23 = v14;
    v24 = v15;
    v25 = v16;
    v27 = a2;
    dispatch_async(v18, block);

    v19 = v21;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __125__SMSessionManager_sessionInitializedWithSessionID_allowReadToken_safetyCacheKey_scheduledSendMessageGUID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "configuration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "sessionID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v2, "isEqual:", v4),
        v4,
        v3,
        (v5 & 1) == 0))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v21 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v48 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      v49 = 2112;
      v50 = v21;
      v51 = 2112;
      v52 = v23;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%s, invalid session ID %@, current sessionID, %@", buf, 0x20u);

    }
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = *MEMORY[0x1E0D8BB70];
    v45 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid session ID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v46;
    v12 = &v45;
    goto LABEL_12;
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%s, missing allowReadToken", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = *MEMORY[0x1E0D8BB70];
    v43 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing allowReadToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v44;
    v12 = &v43;
    goto LABEL_12;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%s, missing safetyCacheKey", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = *MEMORY[0x1E0D8BB70];
    v41 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing safetyCacheKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v42;
    v12 = &v41;
    goto LABEL_12;
  }
  if (!*(_QWORD *)(a1 + 64))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%s, missing scheduledSendMessageGUID", buf, 0xCu);
    }

    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = *MEMORY[0x1E0D8BB70];
    v39 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing scheduledSendMessageGUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v40;
    v12 = &v39;
LABEL_12:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v7;
    v15 = v8;
    v16 = 7;
LABEL_13:
    v17 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v16, v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "_canDeviceModifyState") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState") == 10)
    {
      objc_msgSend(*(id *)(a1 + 40), "_sessionInitializedWithAllowReadToken:safetyCacheKey:scheduledSendMessageGUID:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      return;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D8BA28], "convertSessionStateToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "sessionState"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v48 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:co"
            "mpletionHandler:]_block_invoke";
      v49 = 2112;
      v50 = v34;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%s, session is not in Initializing, current state, %@", buf, 0x16u);

    }
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = *MEMORY[0x1E0D8BB70];
    v35 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not in Initializing state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v32;
    v15 = v33;
    v16 = 16;
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[SMSessionManager sessionInitializedWithSessionID:allowReadToken:safetyCacheKey:scheduledSendMessageGUID:comp"
          "letionHandler:]_block_invoke";
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%s, User requested to complete session initialization on non active device", buf, 0xCu);
  }

  v37 = *MEMORY[0x1E0CB2D50];
  v25 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(*(SEL *)(a1 + 80));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ cannot be completed since current device is not active"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v30 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 11, v28);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_sessionInitializedWithAllowReadToken:(id)a3 safetyCacheKey:(id)a4 scheduledSendMessageGUID:(id)a5 completionHandler:(id)a6
{
  SMSessionManagerState *state;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  state = self->_state;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (id)-[SMSessionManagerState mutableCopy](state, "mutableCopy");
  objc_msgSend(v15, "setSessionState:", 11);
  objc_msgSend(v15, "setAllowReadToken:", v14);

  objc_msgSend(v15, "setSafetyCacheKey:", v13);
  objc_msgSend(v15, "setScheduledSendMessageGUID:", v12);

  -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v15, 1, v11);
}

- (void)sendSessionEndMessageWithReason:(unint64_t)a3 associatedGUID:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v36;
  _QWORD block[5];
  id v38;
  id v39;
  id v40;
  _QWORD *v41;
  SEL v42;
  _QWORD v43[5];
  NSObject *v44;
  _QWORD *v45;
  SEL v46;
  _QWORD v47[5];
  id v48;

  v31 = a4;
  v7 = a5;
  v32 = objc_alloc(MEMORY[0x1E0D8BA10]);
  objc_msgSend(v7, "configuration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sessionType");
  objc_msgSend(v7, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "destinationType");
  v36 = v7;
  objc_msgSend(v7, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "destination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "destinationMapItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v32, "initWithSessionID:sessionEndReason:sessionType:destinationType:destinationMapItem:", v8, a3, v10, v13, v16);

  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__167;
  v47[4] = __Block_byref_object_dispose__167;
  objc_msgSend(v17, "summaryText");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_group_create();
  v19 = MEMORY[0x1E0C809B0];
  if (a3 == 1)
  {
    objc_msgSend(v36, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "destination");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "destinationType");

    if (v22 == 4)
    {
      dispatch_group_enter(v18);
      v23 = (void *)MEMORY[0x1E0D8B9C0];
      objc_msgSend(v36, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "destination");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "destinationMapItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v19;
      v43[1] = 3221225472;
      v43[2] = __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke;
      v43[3] = &unk_1E92A5FF8;
      v43[4] = self;
      v45 = v47;
      v46 = a2;
      v44 = v18;
      objc_msgSend(v23, "fetchDestinationNameFromMapItem:completionHandler:", v26, v43);

    }
  }
  -[SMSessionManager queue](self, "queue");
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_408;
  block[3] = &unk_1E929A048;
  block[4] = self;
  v38 = v17;
  v39 = v31;
  v40 = v36;
  v41 = v47;
  v42 = a2;
  v28 = v36;
  v29 = v31;
  v30 = v17;
  dispatch_group_notify(v18, v27, block);

  _Block_object_dispose(v47, 8);
}

void __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,Unable to fetch destination name due to error %@", (uint8_t *)&v14, 0x20u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8B9E0], "safeArrivalMessageWithCustomizedSummaryForDestination:", a2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#NotificationDeliveryRequest, fetchDestinationNameFromMapItem %@", (uint8_t *)&v14, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_408(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_2;
  v13[3] = &unk_1E92A6020;
  v13[4] = *(_QWORD *)(a1 + 32);
  v13[5] = v7;
  objc_msgSend(v2, "sendMadridMessage:associatedGUID:toConversation:summaryText:completion:", v3, v4, v6, v8, v13);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 56), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v15 = "-[SMSessionManager sendSessionEndMessageWithReason:associatedGUID:state:]_block_invoke";
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, Sent iMessage to conversation, %@, message, %@", buf, 0x20u);

  }
}

void __73__SMSessionManager_sendSessionEndMessageWithReason_associatedGUID_state___block_invoke_2(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = "failure";
    v10 = 138412802;
    v11 = v8;
    if (a3)
      v9 = "success";
    v12 = 2080;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "SMSessionManager,%@,sendMessage returned with status,%s,error,%@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_resetPendingSendSessionEndMessage");

}

- (void)processNearbyEffectivePairedDeviceChanged:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMSessionManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMSessionManager_processNearbyEffectivePairedDeviceChanged___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __62__SMSessionManager_processNearbyEffectivePairedDeviceChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v11 = 138413058;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,effectivePairedDevice changed %@", (uint8_t *)&v11, 0x2Au);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_processNearbyEffectivePairedDeviceChanged:", *(_QWORD *)(a1 + 40));
}

- (void)_processNearbyEffectivePairedDeviceChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  _BOOL4 v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  objc_class *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  void *v63;
  char *v64;
  objc_class *v65;
  id v66;
  void *v67;
  RTXPCTimerAlarm *v68;
  void *v69;
  id v70;
  RTXPCTimerAlarm *v71;
  double magnetBreakTimerInterval;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  char *v82;
  objc_class *v83;
  id v84;
  id v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  char *v90;
  objc_class *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  id v99;
  void *v100;
  id v101;
  id *v102;
  void *v103;
  void *v104;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  id v110;
  SMSessionManager *v111;
  id v112[2];
  id location;
  uint8_t buf[4];
  const char *v115;
  __int16 v116;
  id v117;
  __int16 v118;
  _BYTE v119[30];
  void *v120;
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v106 = a3;
  if (v106)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v106, "name");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v106, "isNearby");
      -[SMSessionManager state](self, "state");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "configuration");
      v102 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "sessionID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager status](self, "status");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastSessionIDDuringMagnetBreak");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager state](self, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isActiveState");
      -[SMSessionManager state](self, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316930;
      v115 = "-[SMSessionManager _processNearbyEffectivePairedDeviceChanged:]";
      v116 = 2112;
      v117 = v100;
      v118 = 1024;
      *(_DWORD *)v119 = v98;
      *(_WORD *)&v119[4] = 2112;
      *(_QWORD *)&v119[6] = v5;
      *(_WORD *)&v119[14] = 2112;
      *(_QWORD *)&v119[16] = v7;
      *(_WORD *)&v119[24] = 1024;
      *(_DWORD *)&v119[26] = v8 != 0;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v10;
      HIWORD(v120) = 2112;
      v121 = v11;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, effectivePairedDevice, %@, effectivePairedDevice.nearby, %{Bool}d, sessionID, %@, lastSessionIDDuringMagnetBreak, %@, magnetBreakTimer, %{Bool}d, is state active state, %{Bool}d, state, %@", buf, 0x46u);

    }
    -[SMSessionManager state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isActiveState");

    if ((v13 & 1) != 0 && !-[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby"))
    {
      -[SMSessionManager defaultsManager](self, "defaultsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("RTDefaultsSessionManagerUnsupportedDeviceSeparationKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");

      -[SMSessionManager _updateUnsupportedSeparationStateWithNewState:](self, "_updateUnsupportedSeparationStateWithNewState:", v19);
    }
    else
    {
      -[SMSessionManager _updateUnsupportedSeparationStateWithNewState:](self, "_updateUnsupportedSeparationStateWithNewState:", 0);
      v14 = (void *)MEMORY[0x1E0D8B8F0];
      -[SMSessionManager state](self, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateActivityWithState:localState:shouldNotify:", v15, self->_localState, 0);

    }
    v20 = -[SMSessionManager _shouldExitHysteresisState:nearbyDeviceConnected:](self, "_shouldExitHysteresisState:nearbyDeviceConnected:", -[SMSessionManager _getCurrentHysteresisStateType](self, "_getCurrentHysteresisStateType"), -[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby"));
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "configuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sessionID");
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[SMSessionManager _getCurrentHysteresisStateType](self, "_getCurrentHysteresisStateType");
      v29 = -[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby");
      *(_DWORD *)buf = 138413570;
      v115 = v24;
      v116 = 2112;
      v117 = v26;
      v118 = 2112;
      *(_QWORD *)v119 = v27;
      *(_WORD *)&v119[8] = 2048;
      *(_QWORD *)&v119[10] = v28;
      *(_WORD *)&v119[18] = 1024;
      *(_DWORD *)&v119[20] = v29;
      *(_WORD *)&v119[24] = 1024;
      *(_DWORD *)&v119[26] = v20;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, hysteresisState, %lu, isNearbyDeviceConnected, %d, shouldExitHysteresisState, %d", buf, 0x36u);

    }
    if (v20)
    {
      -[SMSessionManager _cancelMagnetBreakTimerAndExitHysteresisState](self, "_cancelMagnetBreakTimerAndExitHysteresisState");
      goto LABEL_39;
    }
    -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        -[SMSessionManager state](self, "state");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "configuration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sessionID");
        v34 = (char *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[SMSessionManager _getCurrentHysteresisStateType](self, "_getCurrentHysteresisStateType");
        v39 = -[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby");
        *(_DWORD *)buf = 138413314;
        v115 = v34;
        v116 = 2112;
        v117 = v36;
        v118 = 2112;
        *(_QWORD *)v119 = v37;
        *(_WORD *)&v119[8] = 2048;
        *(_QWORD *)&v119[10] = v38;
        *(_WORD *)&v119[18] = 1024;
        *(_DWORD *)&v119[20] = v39;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, hysteresisState, %lu, isNearbyDeviceConnected, %d, already processing a magnetEvent, waiting for the XPC timer to finish hysteresis, returning", buf, 0x30u);

      }
LABEL_19:

      goto LABEL_39;
    }
    -[SMSessionManager state](self, "state");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isActiveState");

    if ((v41 & 1) == 0)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        -[SMSessionManager state](self, "state");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "configuration");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "sessionID");
        v48 = (char *)objc_claimAutoreleasedReturnValue();
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v115 = v48;
        v116 = 2112;
        v117 = v50;
        v118 = 2112;
        *(_QWORD *)v119 = v51;
        _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,The session is no longer active", buf, 0x20u);

      }
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "uniqueIDOverride");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)objc_msgSend(v42, "initWithUUIDString:", v43);

    -[SMSessionManager state](self, "state");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "activeDeviceIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "isEqual:", v45))
    {

    }
    else
    {
      -[SMSessionManager state](self, "state");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "activePairedDeviceIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v104, "isEqual:", v53);

      if ((v54 & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
        {
          -[SMSessionManager state](self, "state");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "configuration");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "sessionID");
          v90 = (char *)objc_claimAutoreleasedReturnValue();
          v91 = (objc_class *)objc_opt_class();
          NSStringFromClass(v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionManager state](self, "state");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "activeDeviceIdentifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMSessionManager state](self, "state");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "activePairedDeviceIdentifier");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v115 = v90;
          v116 = 2112;
          v117 = v92;
          v118 = 2112;
          *(_QWORD *)v119 = v93;
          *(_WORD *)&v119[8] = 2112;
          *(_QWORD *)&v119[10] = v104;
          *(_WORD *)&v119[18] = 2112;
          *(_QWORD *)&v119[20] = v95;
          *(_WORD *)&v119[28] = 2112;
          v120 = v97;
          _os_log_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,Ignoring changed device %@, activeDeviceIdentifier %@, activePairedDeviceIdentifier %@", buf, 0x3Eu);

        }
        goto LABEL_38;
      }
    }
    objc_initWeak(&location, self);
    -[SMSessionManager state](self, "state");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "configuration");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "sessionID");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (objc_class *)objc_opt_class();
    NSStringFromClass(v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SMSessionManager _isEffectivePairedDeviceNearby](self, "_isEffectivePairedDeviceNearby"))
      v60 = 1;
    else
      v60 = 2;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "configuration");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "sessionID");
      v64 = (char *)objc_claimAutoreleasedReturnValue();
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      v66 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v115 = v64;
      v116 = 2112;
      v117 = v66;
      v118 = 2112;
      *(_QWORD *)v119 = v67;
      *(_WORD *)&v119[8] = 2048;
      *(_QWORD *)&v119[10] = v60;
      _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,Entering hysteresis state %lu", buf, 0x2Au);

    }
    -[SMSessionManager _setHysteresisState:](self, "_setHysteresisState:", v60);
    v68 = [RTXPCTimerAlarm alloc];
    -[SMSessionManager queue](self, "queue");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = MEMORY[0x1E0C809B0];
    v108[1] = 3221225472;
    v108[2] = __63__SMSessionManager__processNearbyEffectivePairedDeviceChanged___block_invoke;
    v108[3] = &unk_1E92A03A8;
    objc_copyWeak(v112, &location);
    v99 = v57;
    v109 = v99;
    v70 = v59;
    v112[1] = (id)a2;
    v101 = v70;
    v110 = v70;
    v111 = self;
    v71 = -[RTXPCTimerAlarm initWithIdentifier:queue:handler:](v68, "initWithIdentifier:queue:handler:", CFSTR("com.apple.routined.magnetBreakTimer"), v69, v108);
    -[SMSessionManager setMagnetBreakTimer:](self, "setMagnetBreakTimer:", v71);

    magnetBreakTimerInterval = self->_magnetBreakTimerInterval;
    -[SMSessionManager defaultsManager](self, "defaultsManager");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKey:", CFSTR("RTDefaultsSessionManagerHysteresisMagnetEventDateKey"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "dateByAddingTimeInterval:", magnetBreakTimerInterval);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0;
    v77 = objc_msgSend(v75, "fireWithDate:error:", v76, &v107);
    v78 = v107;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      -[SMSessionManager state](self, "state");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "configuration");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "sessionID");
      v82 = (char *)objc_claimAutoreleasedReturnValue();
      v83 = (objc_class *)objc_opt_class();
      NSStringFromClass(v83);
      v84 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v85 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "localizedDescription");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v115 = v82;
      v116 = 2112;
      v117 = v84;
      v118 = 2112;
      *(_QWORD *)v119 = v85;
      *(_WORD *)&v119[8] = 1024;
      *(_DWORD *)&v119[10] = v77;
      *(_WORD *)&v119[14] = 2112;
      *(_QWORD *)&v119[16] = v86;
      _os_log_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,magnetBreak timer scheduled %d with error, %@", buf, 0x30u);

    }
    objc_destroyWeak(v112);

    objc_destroyWeak(&location);
LABEL_38:

    goto LABEL_39;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: effectivePairedDevice", buf, 2u);
  }

LABEL_39:
}

void __63__SMSessionManager__processNearbyEffectivePairedDeviceChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_8;
  objc_msgSend(WeakRetained, "state");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_8;
  v5 = (void *)v4;
  objc_msgSend(v3, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActiveState");

  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(v3, "_isEffectivePairedDeviceNearby");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413058;
      v21 = v12;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 1024;
      v27 = v8;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,magnetBreak timer fired deviceIsNearby %d", (uint8_t *)&v20, 0x26u);

    }
    objc_msgSend(v3, "_cancelMagnetBreakTimerAndExitHysteresisState");
    if ((v8 & 1) != 0)
      objc_msgSend(v3, "_handleMagnetConnect:", 1);
    else
      objc_msgSend(v3, "_handleMagnetBreak");
  }
  else
  {
LABEL_8:
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,The session is no longer active after magnetBreak timer fire", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(v3, "_cancelMagnetBreakTimerAndExitHysteresisState");
  }

}

- (BOOL)_shouldExitHysteresisState:(unint64_t)a3 nearbyDeviceConnected:(BOOL)a4
{
  BOOL v4;

  v4 = !a4;
  if (a3 != 1)
    v4 = 0;
  if (a3 == 2)
    return a4;
  else
    return v4;
}

- (void)_cancelMagnetBreakTimerAndExitHysteresisState
{
  void *v3;
  void *v4;

  -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSessionManager magnetBreakTimer](self, "magnetBreakTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager _invalidateTimer:](self, "_invalidateTimer:", v4);

    -[SMSessionManager setMagnetBreakTimer:](self, "setMagnetBreakTimer:", 0);
  }
  -[SMSessionManager _clearHysteresisState](self, "_clearHysteresisState");
}

- (BOOL)_isEffectivePairedDeviceNearby
{
  void *v2;
  void *v3;
  char v4;

  -[SMSessionManager messagingService](self, "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNearby");

  return v4;
}

- (BOOL)_isEffectivePairedDeviceSameAsActiveDeviceWithIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  v6 = [v4 alloc];
  -[SMSessionManager messagingService](self, "messagingService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectivePairedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIDOverride");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithUUIDString:", v9);
  v11 = objc_msgSend(v5, "compare:", v10);

  return v11 == 0;
}

- (unint64_t)_getCurrentHysteresisStateType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSessionManagerHysteresisEventTypeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

- (void)_setHysteresisState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RTDefaultsSessionManagerHysteresisEventTypeKey"));

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("RTDefaultsSessionManagerHysteresisMagnetEventDateKey"));

}

- (void)_clearHysteresisState
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, clearing hysteresis state", (uint8_t *)&v13, 0x20u);

  }
  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", &unk_1E9329858, CFSTR("RTDefaultsSessionManagerHysteresisEventTypeKey"));

  -[SMSessionManager defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionManagerHysteresisMagnetEventDateKey"));

  -[SMSessionManager _updateUnsupportedSeparationStateWithNewState:](self, "_updateUnsupportedSeparationStateWithNewState:", 0);
}

- (void)_handleMagnetBreakPhone
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v7;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,handle magnetBreak phone noop; nothing to do, watch should try to bec"
      "ome the active device ",
      (uint8_t *)&v23,
      0x20u);

  }
  if (!-[SMSessionManager _isActiveDevice](self, "_isActiveDevice"))
  {
    -[SMSessionManager state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "sessionType");

    if (v13 == 4)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[SMSessionManager state](self, "state");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sessionID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v17;
        v25 = 2112;
        v26 = v19;
        v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, magnet break for workout session on phone", (uint8_t *)&v23, 0x20u);

      }
      -[SMSessionManager _updateUnsupportedSeparationStateWithNewState:](self, "_updateUnsupportedSeparationStateWithNewState:", 1);
      v21 = (void *)MEMORY[0x1E0D8B8F0];
      -[SMSessionManager state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateActivityWithState:localState:shouldNotify:", v22, self->_localState, 1);

    }
  }
}

- (void)_handleMagnetConnectPhone:(int64_t)a3
{
  SMHandoffMetricsManager *v6;
  SMHandoffMetricsManager *handoffMetrics;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SMSessionManager *v22;
  os_signpost_id_t v23;
  SEL v24;
  uint8_t buf[16];

  v6 = objc_alloc_init(SMHandoffMetricsManager);
  handoffMetrics = self->_handoffMetrics;
  self->_handoffMetrics = v6;

  -[SMHandoffMetricsManager startMetricsCollection](self->_handoffMetrics, "startMetricsCollection");
  -[SMHandoffMetricsManager addMetricHandoffReason:](self->_handoffMetrics, "addMetricHandoffReason:", a3);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v9, v12);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMHandoffSessionLatency", " enableTelemetry=YES ", buf, 2u);
  }

  -[SMSessionManager state](self, "state");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __46__SMSessionManager__handleMagnetConnectPhone___block_invoke;
  v20[3] = &unk_1E92A6048;
  v21 = v8;
  v22 = self;
  v23 = v13;
  v24 = a2;
  v19 = v8;
  -[SMSessionManager handoffSessionForSessionID:handler:](self, "handoffSessionForSessionID:handler:", v18, v20);

}

void __46__SMSessionManager__handleMagnetConnectPhone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMHandoffSessionLatency", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v9 = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addMetricForLatencyHandoffEndToEnd:", v9);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v25 = v13;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v3;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@, phone device handle magnetConnect finished with error %@ ", buf, 0x2Au);

  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(*(id *)(v17 + 24), "addMetricErrorCode:", objc_msgSend(v3, "code"));
    v18 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(v3, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addMetricErrorDomain:", v19);

    v20 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v21 = 0;
  }
  else
  {
    v20 = *(void **)(v17 + 24);
    v21 = 1;
  }
  objc_msgSend(v20, "addMetricSucceeded:", v21);
  v22 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v23 = 0;
  objc_msgSend(v22, "submitMetricsWithError:", &v23);

}

- (BOOL)_isEligibleOutOfOrderStateSyncMessage:(id)a3 currentSessionManagerState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  const char *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
    LOWORD(v14) = 0;
    v12 = "Invalid parameter not satisfying: stateSyncMessage";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v14) = 0;
    v12 = "Invalid parameter not satisfying: currentSessionManagerState";
    goto LABEL_18;
  }
  if (-[SMSessionManager _isEligibleRecentHandoffMessage:currentSessionManagerState:](self, "_isEligibleRecentHandoffMessage:currentSessionManagerState:", v6, self->_state))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SMSessionManager _isEligibleOutOfOrderStateSyncMessage:currentSessionManagerState:]";
      v16 = 2112;
      v17 = v6;
      v11 = "%s, received state transition message type SMStateTransitionTypeHandoffBecomeActive, with older state, but w"
            "ithin accepted delta, stateSyncMessage, %@";
LABEL_15:
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (!-[SMSessionManager _isEligibleOutOfOrderEndSessionMessage:currentSessionManagerState:](self, "_isEligibleOutOfOrderEndSessionMessage:currentSessionManagerState:", v6, self->_state))
    {
      v10 = 0;
      goto LABEL_11;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SMSessionManager _isEligibleOutOfOrderStateSyncMessage:currentSessionManagerState:]";
      v16 = 2112;
      v17 = v6;
      v11 = "%s, received state transition message to endState, with older date, but within accepted delta and same sessi"
            "onID, stateSyncMessage, %@";
      goto LABEL_15;
    }
  }
LABEL_10:

LABEL_11:
  return v10;
}

- (BOOL)_isEligibleOutOfOrderEndSessionMessage:(id)a3 currentSessionManagerState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  __int16 v20;
  __int16 v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v15 = 0;
      goto LABEL_15;
    }
    v21 = 0;
    v17 = "Invalid parameter not satisfying: stateSyncMessage";
    v18 = (uint8_t *)&v21;
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_10;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v20 = 0;
    v17 = "Invalid parameter not satisfying: currentSessionManagerState";
    v18 = (uint8_t *)&v20;
    goto LABEL_17;
  }
  objc_msgSend(v5, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v10))
  {
    objc_msgSend(v7, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionManagerState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isAfterDate:", v13) && objc_msgSend(v7, "isActiveState"))
    {
      objc_msgSend(v5, "sessionManagerState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEndSessionState");

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

LABEL_15:
  return v15;
}

- (BOOL)_isEligibleRecentHandoffMessage:(id)a3 currentSessionManagerState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  int v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v13 = "Invalid parameter not satisfying: stateSyncMessage";
LABEL_11:
      v14 = v12;
      v15 = 2;
LABEL_12:
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v23, v15);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      v13 = "Invalid parameter not satisfying: currentSessionManagerState";
      goto LABEL_11;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(v5, "stateTransitionType") != 2)
  {
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v5, "sessionManagerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isAfterDate:", v10))
  {

    goto LABEL_14;
  }
  v11 = objc_msgSend(v7, "isActiveState");

  if ((v11 & 1) == 0)
  {
LABEL_14:
    objc_msgSend(v7, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v17);
    v19 = v18;

    v20 = -v19;
    if (v19 >= 0.0)
      v20 = v19;
    if (v20 < 10.0)
      goto LABEL_17;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v23 = 134217984;
    v24 = v19;
    v13 = "Out of order SMStateTransitionTypeHandoffBecomeActive, interval %f";
    v14 = v12;
    v15 = 12;
    goto LABEL_12;
  }
LABEL_17:
  v21 = 1;
LABEL_21:

  return v21;
}

- (BOOL)_isEligibleTransitionFromStateSyncMessage:(id)a3 currentSessionManagerState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "sessionManagerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:", v11) || !objc_msgSend(v6, "isEndSessionState"))
  {

    goto LABEL_8;
  }
  v12 = objc_msgSend(v7, "isEndSessionState");

  if ((v12 & 1) != 0)
  {
LABEL_8:
    v14 = 1;
    goto LABEL_9;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[SMSessionManager _isEligibleTransitionFromStateSyncMessage:currentSessionManagerState:]";
    v18 = 1024;
    v19 = -[SMSessionManager _isActiveDevice](self, "_isActiveDevice");
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, stateSyncMessage invalid transition, NotActive State -> Active State, isActiveDevice, %{Bool}d", (uint8_t *)&v16, 0x12u);
  }

  v14 = 0;
LABEL_9:

  return v14;
}

- (BOOL)_isEligibleToBecomeNonActiveDeviceForHandoffStateSyncMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  objc_class *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMSessionManagerState activeDeviceIdentifier](self->_state, "activeDeviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionManagerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SMSessionManager state](self, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v13;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SessionManager,Initiator,sessionID:%@,%@,%@, not mismatching in the active device identifier and not eligible for handoff", (uint8_t *)&v25, 0x20u);
LABEL_10:

      goto LABEL_7;
    }
    goto LABEL_7;
  }
  -[SMSessionManagerState configuration](self->_state, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SMSessionManager state](self, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = v13;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      v31 = 2112;
      v32 = v24;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SessionManager,Initiator,sessionID:%@,%@,%@,receiving a handoff message for a different session, stateSyncMessage.sessionID %@", (uint8_t *)&v25, 0x2Au);

      goto LABEL_10;
    }
LABEL_7:

    v21 = 0;
    goto LABEL_8;
  }
  v21 = 1;
LABEL_8:

  return v21;
}

- (void)_becomeActiveDeviceForSessionWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char *v15;
  objc_class *v16;
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
  id v32;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  SMSessionManager *v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  _BYTE v52[18];
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SMSessionManager messagingService](self, "messagingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[SMSessionManager state](self, "state");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "configuration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "sessionID");
      v39 = (char *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v39;
      v51 = 2112;
      *(_QWORD *)v52 = v41;
      *(_WORD *)&v52[8] = 2112;
      *(_QWORD *)&v52[10] = v42;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "#SessionManager,Initiator,sessionID:%@,%@,%@,Already the active device for the session device", buf, 0x20u);

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SMSessionManager state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionID");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSessionManager messagingService](self, "messagingService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v50 = v15;
    v51 = 2112;
    *(_QWORD *)v52 = v17;
    *(_WORD *)&v52[8] = 2112;
    *(_QWORD *)&v52[10] = v18;
    v53 = 2112;
    v54 = v20;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#SessionManager,Initiator,sessionID:%@,%@,%@,Becoming the active device, deviceIdentifier, %@", buf, 0x2Au);

  }
  -[SMSessionManager state](self, "state");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  -[SMSessionManager messagingService](self, "messagingService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "deviceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActiveDeviceIdentifier:", v24);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionManager messagingService](self, "messagingService");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "effectivePairedDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uniqueIDOverride");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v25, "initWithUUIDString:", v28);
  objc_msgSend(v22, "setActivePairedDeviceIdentifier:", v29);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDate:", v30);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __61__SMSessionManager__becomeActiveDeviceForSessionWithHandler___block_invoke;
  v46 = &unk_1E9299358;
  v47 = self;
  v32 = v5;
  v48 = v32;
  v33 = -[SMSessionManager _performStateTransitionTo:transitionType:handler:](self, "_performStateTransitionTo:transitionType:handler:", v22, 2, &v43);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v43, v44, v45, v46, v47);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSinceDate:", v31);
    *(_DWORD *)buf = 136315650;
    v50 = "-[SMSessionManager _becomeActiveDeviceForSessionWithHandler:]";
    v51 = 1024;
    *(_DWORD *)v52 = v33;
    *(_WORD *)&v52[4] = 2048;
    *(_QWORD *)&v52[6] = v36;
    _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "%s, handoff finished, %{Bool}d, latency, %.2f", buf, 0x1Cu);

  }
}

void __61__SMSessionManager__becomeActiveDeviceForSessionWithHandler___block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTDefaultsSessionManagerHandoffInProgressKey"));

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SMSessionManager _becomeActiveDeviceForSessionWithHandler:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s state transition complete, error %@", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_FAULT, "Given that we have gotten the successful handoff criteria (CK record etc) this error should not happen. error, %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_updateActivityWithState:(id)a3
{
  -[SMSessionManager _updateActivityWithState:shouldNotify:](self, "_updateActivityWithState:shouldNotify:", a3, 1);
}

- (void)_updateActivityWithState:(id)a3 shouldNotify:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[SMLocalSessionState unsupportedDeviceSeparationState](self->_localState, "unsupportedDeviceSeparationState");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[SMSessionManager _updateActivityWithState:shouldNotify:]";
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%s,state,%@, disconnected,%{Bool}d", (uint8_t *)&v10, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0D8B8F0], "updateActivityWithState:localState:shouldNotify:", v6, self->_localState, v4);

}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *);
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  const char *aSelector;
  SMSessionManager *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  if (v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v81 = "-[SMSessionManager respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:]";
      v82 = 2112;
      v83 = v11;
      v84 = 2112;
      v85 = v12;
      v86 = 2112;
      v87 = v13;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, notification identifier, %@, session identifier, %@, action identifier, %@,", buf, 0x2Au);
    }

    v69 = self;
    if (v11)
    {
      v16 = 0;
    }
    else
    {
      v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v18 = *MEMORY[0x1E0D8BB70];
      v78 = *MEMORY[0x1E0CB2D50];
      v19 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@, missing notification identifier"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 7, v22);

      self = v69;
      v14[2](v14, v16);
    }
    v67 = v11;
    if (!v12)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v24 = *MEMORY[0x1E0D8BB70];
      v76 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@, missing session identifier"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 7, v28);

      self = v69;
      v14[2](v14, (void *)v29);
      v16 = (void *)v29;
    }
    aSelector = a2;
    -[SMSessionManagerState configuration](self->_state, "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "sessionID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v12, "isEqualToString:", v32);

    v66 = v12;
    if ((v33 & 1) == 0)
    {
      v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D8BB70];
      v74 = *MEMORY[0x1E0CB2D50];
      v35 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(aSelector);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManagerState configuration](self->_state, "configuration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "sessionID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "UUIDString");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v12;
      v41 = (void *)v39;
      objc_msgSend(v35, "stringWithFormat:", CFSTR("%@, session identifier, %@, does not match sessionId from config, %@"), v36, v40, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v42;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
      v43 = v13;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v65, "initWithDomain:code:userInfo:", v34, 7, v44);

      v13 = v43;
      self = v69;

      v14[2](v14, (void *)v45);
      v16 = (void *)v45;
    }
    if (!v13)
    {
      v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v47 = *MEMORY[0x1E0D8BB70];
      v72 = *MEMORY[0x1E0CB2D50];
      v48 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(aSelector);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "stringWithFormat:", CFSTR("%@, missing action identifier"), v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 7, v51);

      v13 = 0;
      v14[2](v14, (void *)v52);
      v16 = (void *)v52;
    }
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D8BB28]) & 1) != 0
      || objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D8BB30]))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v81 = "-[SMSessionManager respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:]";
        _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "%s, executing code path for extend", buf, 0xCu);
      }

      -[SMSessionManagerState configuration](self->_state, "configuration");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "sessionID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSessionManager respondToTriggerPromptForSessionID:response:handler:](self, "respondToTriggerPromptForSessionID:response:handler:", v55, 2, v14);

    }
    else
    {
      v56 = v13;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v81 = "-[SMSessionManager respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:]";
        _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_INFO, "%s, action identifier to code path mapping is invalid", buf, 0xCu);
      }

      v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v59 = *MEMORY[0x1E0D8BB70];
      v70 = *MEMORY[0x1E0CB2D50];
      v60 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(aSelector);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "stringWithFormat:", CFSTR("%@, action identifier to code path mapping is invalid"), v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 7, v63);

      v14[2](v14, (void *)v64);
      v16 = (void *)v64;
      v13 = v56;
    }

    v12 = v66;
    v11 = v67;
  }

}

- (SMActiveSessionDetails)activeSessionDetails
{
  return self->_activeSessionDetails;
}

- (void)setActiveSessionDetails:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionDetails, a3);
}

- (RTTimer)activeSessionDetailsTimeoutTimer
{
  return self->_activeSessionDetailsTimeoutTimer;
}

- (void)setActiveSessionDetailsTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionDetailsTimeoutTimer, a3);
}

- (double)activeSessionDetailsFetchTimeout
{
  return self->_activeSessionDetailsFetchTimeout;
}

- (void)setActiveSessionDetailsFetchTimeout:(double)a3
{
  self->_activeSessionDetailsFetchTimeout = a3;
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManager, a3);
}

- (double)cacheReleaseMaxDuration
{
  return self->_cacheReleaseMaxDuration;
}

- (void)setCacheReleaseMaxDuration:(double)a3
{
  self->_cacheReleaseMaxDuration = a3;
}

- (int64_t)cachedInitiatorEligibilty
{
  return self->_cachedInitiatorEligibilty;
}

- (void)setCachedInitiatorEligibilty:(int64_t)a3
{
  self->_cachedInitiatorEligibilty = a3;
}

- (RTTimer)handoffRetryTimer
{
  return self->_handoffRetryTimer;
}

- (void)setHandoffRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_handoffRetryTimer, a3);
}

- (OS_dispatch_queue)initiatorEligibilityQueue
{
  return self->_initiatorEligibilityQueue;
}

- (void)setInitiatorEligibilityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorEligibilityQueue, a3);
}

- (double)magnetBreakTimerInterval
{
  return self->_magnetBreakTimerInterval;
}

- (void)setMagnetBreakTimerInterval:(double)a3
{
  self->_magnetBreakTimerInterval = a3;
}

- (double)sendSessionEndMessageTimeout
{
  return self->_sendSessionEndMessageTimeout;
}

- (void)setSendSessionEndMessageTimeout:(double)a3
{
  self->_sendSessionEndMessageTimeout = a3;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SMActiveSessionZoneProtocol)activeSessionDetailsDelegate
{
  return self->_activeSessionDetailsDelegate;
}

- (void)setActiveSessionDetailsDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessionDetailsDelegate, a3);
}

- (RTXPCTimerAlarm)checkInXPCTimerAlarm
{
  return self->_checkInXPCTimerAlarm;
}

- (void)setCheckInXPCTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_checkInXPCTimerAlarm, a3);
}

- (RTXPCTimerAlarm)magnetBreakTimer
{
  return self->_magnetBreakTimer;
}

- (void)setMagnetBreakTimer:(id)a3
{
  objc_storeStrong((id *)&self->_magnetBreakTimer, a3);
}

- (RTXPCTimerAlarm)cacheReleaseXPCTimerAlarm
{
  return self->_cacheReleaseXPCTimerAlarm;
}

- (void)setCacheReleaseXPCTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_cacheReleaseXPCTimerAlarm, a3);
}

- (RTXPCTimerAlarm)endAwarenessBeforeUnlockXPCTimerAlarm
{
  return self->_endAwarenessBeforeUnlockXPCTimerAlarm;
}

- (void)setEndAwarenessBeforeUnlockXPCTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_endAwarenessBeforeUnlockXPCTimerAlarm, a3);
}

- (RTXPCTimerAlarm)endCarouselSessionXPCTimerAlarm
{
  return self->_endCarouselSessionXPCTimerAlarm;
}

- (void)setEndCarouselSessionXPCTimerAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_endCarouselSessionXPCTimerAlarm, a3);
}

- (SMScreenLockMonitor)screenLockMonitor
{
  return self->_screenLockMonitor;
}

- (void)setScreenLockMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_screenLockMonitor, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionMetricManager, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (unint64_t)sessionStoreAvailability
{
  return self->_sessionStoreAvailability;
}

- (unint64_t)handoffRebootReconciliationState
{
  return self->_handoffRebootReconciliationState;
}

- (void)setHandoffRebootReconciliationState:(unint64_t)a3
{
  self->_handoffRebootReconciliationState = a3;
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationAwarenessManager, a3);
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (void)setMessagingService:(id)a3
{
  objc_storeStrong((id *)&self->_messagingService, a3);
}

- (RTStarkManager)starkManager
{
  return self->_starkManager;
}

- (void)setStarkManager:(id)a3
{
  objc_storeStrong((id *)&self->_starkManager, a3);
}

- (SMCarPlayAlertManager)carPlayAlertManager
{
  return self->_carPlayAlertManager;
}

- (void)setCarPlayAlertManager:(id)a3
{
  objc_storeStrong((id *)&self->_carPlayAlertManager, a3);
}

- (SMAnomalyAlertManager)anomalyAlertManager
{
  return self->_anomalyAlertManager;
}

- (void)setAnomalyAlertManager:(id)a3
{
  objc_storeStrong((id *)&self->_anomalyAlertManager, a3);
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (SMSessionManagerStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (BOOL)statusStored
{
  return self->_statusStored;
}

- (void)setStatusStored:(BOOL)a3
{
  self->_statusStored = a3;
}

- (BOOL)statusStoreInProgress
{
  return self->_statusStoreInProgress;
}

- (void)setStatusStoreInProgress:(BOOL)a3
{
  self->_statusStoreInProgress = a3;
}

- (BOOL)statusUpdatePending
{
  return self->_statusUpdatePending;
}

- (void)setStatusUpdatePending:(BOOL)a3
{
  self->_statusUpdatePending = a3;
}

- (TLAlert)cacheReleaseTLAlert
{
  return self->_cacheReleaseTLAlert;
}

- (void)setCacheReleaseTLAlert:(id)a3
{
  objc_storeStrong((id *)&self->_cacheReleaseTLAlert, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTWatchWristStateManager)wristStateManager
{
  return self->_wristStateManager;
}

- (void)setWristStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_wristStateManager, a3);
}

- (unint64_t)wristState
{
  return self->_wristState;
}

- (void)setWristState:(unint64_t)a3
{
  self->_wristState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wristStateManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_cacheReleaseTLAlert, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_anomalyAlertManager, 0);
  objc_storeStrong((id *)&self->_carPlayAlertManager, 0);
  objc_storeStrong((id *)&self->_starkManager, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_screenLockMonitor, 0);
  objc_storeStrong((id *)&self->_endCarouselSessionXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_endAwarenessBeforeUnlockXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_cacheReleaseXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_magnetBreakTimer, 0);
  objc_storeStrong((id *)&self->_checkInXPCTimerAlarm, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsDelegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_initiatorEligibilityQueue, 0);
  objc_storeStrong((id *)&self->_handoffRetryTimer, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_activeSessionDetailsTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_activeSessionDetails, 0);
  objc_storeStrong((id *)&self->_handoffMetrics, 0);
  objc_storeStrong((id *)&self->_localState, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
