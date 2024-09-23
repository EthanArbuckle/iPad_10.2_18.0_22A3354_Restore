@implementation SMDaemonClient

- (SMDaemonClient)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_);
}

- (SMDaemonClient)initWithQueue:(id)a3 authorizationManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 platform:(id)a7 initiatorService:(id)a8 messagingService:(id)a9 receiverService:(id)a10 sessionStore:(id)a11 suggestionsManager:(id)a12 suggestionsHelper:(id)a13 suggestionsStore:(id)a14 eligibilityChecker:(id)a15 deviceConfigurationChecker:(id)a16
{
  id v21;
  id v22;
  void *v23;
  void *v24;
  SMDaemonClient *v25;
  SMDaemonClient *v26;
  uint64_t v27;
  RTEntitlementProvider *entitlementProvider;
  NSObject *v29;
  RTAuthorizationManager *authorizationManager;
  uint64_t v31;
  SMDaemonClient *v32;
  NSObject *v33;
  RTAuthorizationManager *v34;
  void *v35;
  RTAuthorizationManager *v36;
  SMDaemonClient *v37;
  NSObject *v38;
  NSObject *v39;
  SMDaemonClient *v40;
  SMDaemonClient *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v48;
  id v50;
  id v51;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  _QWORD block[4];
  SMDaemonClient *v68;
  _QWORD v69[4];
  SMDaemonClient *v70;
  NSObject *v71;
  _QWORD v72[4];
  SMDaemonClient *v73;
  NSObject *v74;
  objc_super v75;
  uint8_t buf[16];

  v21 = a3;
  v55 = a4;
  v57 = a5;
  v50 = a6;
  v66 = a6;
  v65 = a7;
  v51 = a8;
  v64 = a8;
  v53 = a9;
  v63 = a10;
  v62 = a11;
  v61 = a12;
  v60 = a13;
  v59 = a14;
  v58 = a15;
  v22 = a16;
  v54 = v21;
  v56 = v22;
  if (!v21)
  {
    v23 = v55;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v41 = 0;
    v42 = 0;
    v24 = v57;
    goto LABEL_44;
  }
  v23 = v55;
  if (!v55)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    v24 = v57;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: authorizationManager";
LABEL_42:
    _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, v46, buf, 2u);
    goto LABEL_43;
  }
  v24 = v57;
  if (!v57)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_42;
  }
  if (!v66)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_42;
  }
  if (!v65)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: platform";
    goto LABEL_42;
  }
  if (!v64)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: initiatorService";
    goto LABEL_42;
  }
  if (!v63)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: receiverService";
    goto LABEL_42;
  }
  if (!v62)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: sessionStore";
    goto LABEL_42;
  }
  if (!v61)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: suggestionsManager";
    goto LABEL_42;
  }
  if (!v60)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: suggestionsHelper";
    goto LABEL_42;
  }
  if (!v59)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v46 = "Invalid parameter not satisfying: suggestionsStore";
    goto LABEL_42;
  }
  if (!v58)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v46 = "Invalid parameter not satisfying: eligibilityChecker";
      goto LABEL_42;
    }
LABEL_43:

    v41 = 0;
    v42 = v54;
LABEL_44:
    v40 = self;
    v43 = v53;
    goto LABEL_45;
  }
  if (v22)
  {
    v75.receiver = self;
    v75.super_class = (Class)SMDaemonClient;
    v25 = -[SMDaemonClient init](&v75, sel_init);
    v26 = v25;
    if (v25)
    {
      objc_storeStrong((id *)&v25->_queue, a3);
      objc_storeStrong((id *)&v26->_authorizationManager, a4);
      objc_storeStrong((id *)&v26->_defaultsManager, a5);
      objc_storeStrong((id *)&v26->_distanceCalculator, v50);
      objc_storeStrong((id *)&v26->_platform, a7);
      objc_storeStrong((id *)&v26->_initiatorService, v51);
      -[SMInitiatorService addObserverForSessionManager:](v26->_initiatorService, "addObserverForSessionManager:", v26);
      objc_storeStrong((id *)&v26->_sessionStore, a11);
      objc_storeStrong((id *)&v26->_suggestionsManager, a12);
      objc_storeStrong((id *)&v26->_suggestionsHelper, a13);
      objc_storeStrong((id *)&v26->_suggestionsStore, a14);
      +[RTEntitlementProvider safetyMonitorDaemonProtocolEntitlementProvider](RTEntitlementProvider, "safetyMonitorDaemonProtocolEntitlementProvider");
      v27 = objc_claimAutoreleasedReturnValue();
      entitlementProvider = v26->_entitlementProvider;
      v26->_entitlementProvider = (RTEntitlementProvider *)v27;

      objc_storeStrong((id *)&v26->_messagingService, a9);
      objc_storeStrong((id *)&v26->_receiverService, a10);
      -[SMReceiverService addObserver:](v26->_receiverService, "addObserver:", v26);
      objc_storeStrong((id *)&v26->_eligibilityChecker, a15);
      objc_storeStrong((id *)&v26->_deviceConfigurationChecker, a16);
      v29 = dispatch_group_create();
      dispatch_group_enter(v29);
      authorizationManager = v26->_authorizationManager;
      v31 = MEMORY[0x1E0C809B0];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke;
      v72[3] = &unk_1E9297D58;
      v32 = v26;
      v73 = v32;
      v33 = v29;
      v74 = v33;
      -[RTAuthorizationManager fetchRoutineSupportedWithHandler:](authorizationManager, "fetchRoutineSupportedWithHandler:", v72);
      v34 = v26->_authorizationManager;
      +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v57;
      -[RTNotifier addObserver:selector:name:](v34, "addObserver:selector:name:", v32, sel_onAuthorizationNotification_, v35);

      dispatch_group_enter(v33);
      v36 = v26->_authorizationManager;
      v69[0] = v31;
      v69[1] = 3221225472;
      v69[2] = __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_3;
      v69[3] = &unk_1E9297D58;
      v37 = v32;
      v70 = v37;
      v71 = v33;
      v38 = v33;
      -[RTAuthorizationManager fetchRoutineEnabledWithHandler:](v36, "fetchRoutineEnabledWithHandler:", v69);
      -[SMDaemonClient queue](v37, "queue");
      v39 = objc_claimAutoreleasedReturnValue();
      block[0] = v31;
      block[1] = 3221225472;
      block[2] = __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_5;
      block[3] = &unk_1E92977B8;
      v68 = v37;
      dispatch_group_notify(v38, v39, block);

    }
    v40 = v26;
    v41 = v40;
    v43 = v53;
    v42 = v54;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    v43 = v53;
    v42 = v54;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deviceConfigurationChecker", buf, 2u);
    }

    v41 = 0;
    v40 = self;
  }
LABEL_45:

  return v41;
}

void __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_2;
  block[3] = &unk_1E9297D30;
  v6 = *(id *)(a1 + 32);
  v8 = a2;
  v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

void __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSupported:", *(unsigned __int8 *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_4;
  block[3] = &unk_1E9297D30;
  v6 = *(id *)(a1 + 32);
  v8 = a2;
  v7 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

void __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __260__SMDaemonClient_initWithQueue_authorizationManager_defaultsManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resume");

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SMDaemonClient executablePath](self, "executablePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%d)"), v4, -[SMDaemonClient processIdentifier](self, "processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *queue;
  id v18;
  id v19;
  objc_class *v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  SMDaemonClient *v25;
  id v26;
  _QWORD *v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "retainArguments");
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__79;
  v29[4] = __Block_byref_object_dispose__79;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v13, v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v15, "UTF8String");
  v30 = (id)os_transaction_create();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v21;
    v33 = 2112;
    v34 = v22;
    _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SMDaemonClient_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_1E9297DA8;
  v28 = a5;
  v24 = v10;
  v25 = self;
  v26 = v9;
  v27 = v29;
  v18 = v9;
  v19 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v29, 8);
}

void __54__SMDaemonClient_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  void *v58;
  _BYTE buf[12];
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "invoke");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "executableName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      v60 = 2112;
      v61 = v9;
      _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_EVENT, v5, "ClientService", "client %@, request %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "executableName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      v60 = 2112;
      v61 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "protocol");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "conformsToProtocol:", v13);

    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 48), "exportedInterface");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replyBlockSignatureForSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    v19 = objc_msgSend(*(id *)(a1 + 40), "supported");
    v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "clientConnection:satisfiesEntitlementRequirementsForInvocation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    if (v16)
    {
      if ((v20 & 1) != 0)
      {
        if ((v19 & 1) != 0)
        {
          if ((_os_feature_enabled_impl() & 1) != 0)
          {
            v21 = objc_msgSend(*(id *)(a1 + 32), "blockArgumentIndex");
            *(_QWORD *)buf = 0;
            objc_msgSend(*(id *)(a1 + 32), "getArgument:atIndex:", buf, v21);
            NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(*(id *)buf, "copy");
            objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
            v49 = v22;
            v50 = v10;
            v51 = v23;
            v24 = v23;
            v25 = v22;
            v52 = (id)__NSMakeSpecialForwardingCaptureBlock();
            objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v52, v21);
            objc_msgSend(*(id *)(a1 + 32), "invoke");
            v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v27 = *(void **)(v26 + 40);
            *(_QWORD *)(v26 + 40) = 0;

          }
          else
          {
            v53 = *MEMORY[0x1E0CB2D50];
            v54 = CFSTR("This feature is not enabled.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 1, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v44, v16);
            v45 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v46 = *(void **)(v45 + 40);
            *(_QWORD *)(v45 + 40) = 0;

          }
        }
        else
        {
          v55 = *MEMORY[0x1E0CB2D50];
          v56 = CFSTR("This operation is not supported on this platform.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 1, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v40, v16);
          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v42 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = 0;

        }
      }
      else
      {
        v57 = *MEMORY[0x1E0CB2D50];
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "executableName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ is not entitled for this operation."), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = (void *)objc_msgSend(v34, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 3, v33);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 40), "executableName");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v47;
          v60 = 2112;
          v61 = v48;
          _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "client, %@, is not entitled for invocation, %@.", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v35, v16);
        v37 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v38 = *(void **)(v37 + 40);
        *(_QWORD *)(v37 + 40) = 0;

      }
    }
    else
    {
      if ((v20 & v19) == 1)
        objc_msgSend(*(id *)(a1 + 32), "invoke");
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = 0;

    }
  }
}

void __54__SMDaemonClient_connection_handleInvocation_isReply___block_invoke_27(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", a1[5]);
    v8 = 138412546;
    v9 = v5;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Sending reply for request \"%@\", latency, %.2f", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v3, "setTarget:", a1[6]);
  objc_msgSend(v3, "invoke");

}

- (void)onAuthorizationNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  SMDaemonClient *v10;
  SEL v11;

  v5 = a3;
  -[SMDaemonClient queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SMDaemonClient_onAuthorizationNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

void __46__SMDaemonClient_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:", objc_msgSend(v5, "enabled"));
  }
  else
  {
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTAuthorizationManagerNotificationConsoleUserDidChange, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      v9 = *(id *)(a1 + 32);
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        v13 = objc_msgSend(v9, "activeUser");
        v14 = CFSTR("NO");
        v19 = 138412802;
        v20 = v11;
        v21 = 2112;
        if (v13)
          v14 = CFSTR("YES");
        v22 = v12;
        v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, client, %@, activeUser, %@", (uint8_t *)&v19, 0x20u);

      }
      if ((objc_msgSend(v9, "activeUser") & 1) == 0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(a1 + 40);
          v19 = 138412546;
          v20 = v16;
          v21 = 2112;
          v22 = v17;
          _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, invalidating connection to client, %@", (uint8_t *)&v19, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "xpcConnection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "invalidate");

      }
    }
  }
}

- (void)shutdown
{
  NSObject *v4;
  _QWORD v5[6];

  -[SMDaemonClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__SMDaemonClient_shutdown__block_invoke;
  v5[3] = &unk_1E9297BF0;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __26__SMDaemonClient_shutdown__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "authorizationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "initiatorService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", *(_QWORD *)(a1 + 32));

}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  -[SMInitiatorService initializeSessionWithConversation:handler:](self->_initiatorService, "initializeSessionWithConversation:handler:", a3, a4);
}

- (void)cancelInitializationWithHandler:(id)a3
{
  -[SMInitiatorService cancelInitializationWithHandler:](self->_initiatorService, "cancelInitializationWithHandler:", a3);
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  -[SMInitiatorService cancelInitializationForSessionID:handler:](self->_initiatorService, "cancelInitializationForSessionID:handler:", a3, a4);
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  -[SMInitiatorService startSessionWithConfiguration:handler:](self->_initiatorService, "startSessionWithConfiguration:handler:", a3, a4);
}

- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
  -[SMInitiatorService initializeAndStartSessionWithConfiguration:handler:](self->_initiatorService, "initializeAndStartSessionWithConfiguration:handler:", a3, a4);
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  -[SMInitiatorService modifySessionWithConfiguration:handler:](self->_initiatorService, "modifySessionWithConfiguration:handler:", a3, a4);
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  -[SMInitiatorService endSessionForSessionID:reason:handler:](self->_initiatorService, "endSessionForSessionID:reason:handler:", a3, a4, a5);
}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  -[SMInitiatorService handoffSessionForSessionID:handler:](self->_initiatorService, "handoffSessionForSessionID:handler:", a3, a4);
}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  -[SMInitiatorService sendSafetyCacheForSessionID:handler:](self->_initiatorService, "sendSafetyCacheForSessionID:handler:", a3, a4);
}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  -[SMInitiatorService respondToTriggerPromptForSessionID:response:handler:](self->_initiatorService, "respondToTriggerPromptForSessionID:response:handler:", a3, a4, a5);
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  -[SMInitiatorService promptDestinationAnomalyVerificationWithContext:handler:](self->_initiatorService, "promptDestinationAnomalyVerificationWithContext:handler:", a3, a4);
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  -[SMInitiatorService promptRoundTripAnomalyVerificationWithContext:handler:](self->_initiatorService, "promptRoundTripAnomalyVerificationWithContext:handler:", a3, a4);
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  -[SMInitiatorService promptTimerEndedVerificationWithContext:handler:](self->_initiatorService, "promptTimerEndedVerificationWithContext:handler:", a3, a4);
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  -[SMInitiatorService promptSafeArrivalWithContext:handler:](self->_initiatorService, "promptSafeArrivalWithContext:handler:", a3, a4);
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  -[SMInitiatorService promptWorkoutAnomalyVerificationWithContext:handler:](self->_initiatorService, "promptWorkoutAnomalyVerificationWithContext:handler:", a3, a4);
}

- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  -[SMInitiatorService sendHeartbeatForSessionID:handler:](self->_initiatorService, "sendHeartbeatForSessionID:handler:", a3, a4);
}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,fetching safety cache receivers", (uint8_t *)&v11, 0x16u);

  }
  -[SMDaemonClient initiatorService](self, "initiatorService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchSOSReceiversWithCompletion:", v5);

}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  -[SMInitiatorService fetchCurrentWorkoutSnapshotWithHandler:](self->_initiatorService, "fetchCurrentWorkoutSnapshotWithHandler:", a3);
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching initiator safety cache", (uint8_t *)&v14, 0x20u);

  }
  -[SMDaemonClient initiatorService](self, "initiatorService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fetchInitiatorSafetyCacheForSessionID:completion:", v7, v8);

}

- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SMDaemonClient receiverService](self, "receiverService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAllReceiverSessionStatusWithCompletion:", v4);

}

- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SMDaemonClient receiverService](self, "receiverService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchReceiverSessionStatusForSessionID:completion:", v7, v6);

}

- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SMDaemonClient receiverService](self, "receiverService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userRequestedCacheDownloadForSessionID:completion:", v7, v6);

}

- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SMDaemonClient receiverService](self, "receiverService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchReceiverSafetyCacheForSessionID:completion:", v7, v6);

}

- (void)detailsViewOpenedForSessionID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SMDaemonClient receiverService](self, "receiverService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsViewOpenedForSessionID:", v4);

}

- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching session receipt", (uint8_t *)&v15, 0x20u);

  }
  -[SMDaemonClient initiatorService](self, "initiatorService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchSessionReceiptForSessionID:completion:", v7, v8);

}

- (void)startMonitoringInitiatorSafetyCacheWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,start monitoring initiator safety cache", buf, 0x16u);

    }
    -[SMDaemonClient setMonitorInitiatorSafetyCache:](self, "setMonitorInitiatorSafetyCache:", 1);
    -[SMDaemonClient initiatorService](self, "initiatorService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", self);

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0, 0, 0, 0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke;
    v12[3] = &unk_1E929F090;
    v12[4] = self;
    v12[5] = a2;
    -[SMDaemonClient fetchCurrentSessionStateWithHandler:](self, "fetchCurrentSessionStateWithHandler:", v12);
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

void __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_34;
    v15[3] = &unk_1E929F068;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "fetchInitiatorSafetyCacheForSessionID:completion:", v8, v15);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,sessionID unavailable,%@", buf, 0x20u);

    }
  }

}

void __65__SMDaemonClient_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_34(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v10 = *(void **)(a1 + 32);
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = a2;
  objc_msgSend(v10, "xpcConnection");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "remoteObjectProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "onInitiatorSafetyCacheChangeForSessionID:phoneCache:watchCache:cacheExpiryDate:cacheReleaseDate:", v15, v14, v13, v12, v11);

}

- (void)stopMonitoringInitiatorSafetyCacheWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,stop monitoring initiator safety cache", (uint8_t *)&v12, 0x16u);

    }
    -[SMDaemonClient setMonitorInitiatorSafetyCache:](self, "setMonitorInitiatorSafetyCache:", 0);
    -[SMDaemonClient initiatorService](self, "initiatorService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:", self);

    v5[2](v5, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)startMonitoringReceiverSessionStatusWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,start monitoring receiver session status", buf, 0x16u);

    }
    -[SMDaemonClient setMonitorReceiverSessionStatus:](self, "setMonitorReceiverSessionStatus:", 1);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__SMDaemonClient_startMonitoringReceiverSessionStatusWithHandler___block_invoke;
    v11[3] = &unk_1E9299DA0;
    v11[4] = self;
    -[SMDaemonClient fetchAllReceiverSessionStatusWithCompletion:](self, "fetchAllReceiverSessionStatusWithCompletion:", v11);
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

void __66__SMDaemonClient_startMonitoringReceiverSessionStatusWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "remoteObjectProxy");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "onReceiverSessionStatusChangeForSessionID:sessionStatus:", v11, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)stopMonitoringReceiverSessionStatusWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,stop monitoring receiver session status", (uint8_t *)&v11, 0x16u);

    }
    -[SMDaemonClient setMonitorReceiverSessionStatus:](self, "setMonitorReceiverSessionStatus:", 0);
    v5[2](v5, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)startMonitoringReceiverSafetyCacheWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,start monitoring receiver safety cache", buf, 0x16u);

    }
    -[SMDaemonClient setMonitorReceiverSafetyCache:](self, "setMonitorReceiverSafetyCache:", 1);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0, 0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke;
    v11[3] = &unk_1E9299DA0;
    v11[4] = self;
    -[SMDaemonClient fetchAllReceiverSessionStatusWithCompletion:](self, "fetchAllReceiverSessionStatusWithCompletion:", v11);
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

void __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v8, "sessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2;
        v12[3] = &unk_1E929F0B8;
        v12[4] = *(_QWORD *)(a1 + 32);
        v12[5] = v8;
        objc_msgSend(v9, "fetchReceiverSafetyCacheForSessionID:completion:", v10, v12);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __64__SMDaemonClient_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "xpcConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "onReceiverSafetyCacheChangeForSessionID:phoneCache:watchCache:", v9, v7, v6);

}

- (void)stopMonitoringReceiverSafetyCacheWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,stop monitoring receiver safety cache", (uint8_t *)&v11, 0x16u);

    }
    -[SMDaemonClient setMonitorReceiverSafetyCache:](self, "setMonitorReceiverSafetyCache:", 0);
    v5[2](v5, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", (uint8_t *)&v11, 2u);
    }

  }
}

- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v13)
  {
    -[SMDaemonClient queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__SMDaemonClient_onInitiatorSafetyCacheChangeForSessionID_phoneCache_watchCache_cacheExpiryDate_cacheReleaseDate___block_invoke;
    block[3] = &unk_1E92989D0;
    block[4] = self;
    v26 = a2;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    v24 = v16;
    v25 = v17;
    dispatch_async(v18, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }

  }
}

void __114__SMDaemonClient_onInitiatorSafetyCacheChangeForSessionID_phoneCache_watchCache_cacheExpiryDate_cacheReleaseDate___block_invoke(uint64_t a1)
{
  char v1;
  NSObject *v2;
  _BOOL4 v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id obj;
  id obja;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(*(id *)(a1 + 32), "monitorInitiatorSafetyCache");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
  if ((v1 & 1) != 0)
  {
    if (v3)
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      v53 = v5;
      v54 = 2112;
      v55 = v6;
      v56 = 2112;
      v57 = v7;
      v58 = 2112;
      v59 = v8;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,sending initiator safety cache update to sessionID, %@, phoneCache, %@", buf, 0x2Au);

    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "locationsDuringSession");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 80));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v53 = v17;
            v54 = 2112;
            v55 = v18;
            v56 = 2048;
            v57 = (void *)(v11 + i);
            v58 = 2112;
            v59 = v14;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, phoneCache location %lu, %@", buf, 0x2Au);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        v11 += i;
      }
      while (v10);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 40);
      v24 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      v53 = v21;
      v54 = 2112;
      v55 = v22;
      v56 = 2112;
      v57 = v23;
      v58 = 2112;
      v59 = v24;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,sending initiator safety cache update to sessionID, %@, watchCache, %@", buf, 0x2Au);

    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "locationsDuringSession");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(obja);
          v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 80));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v53 = v33;
            v54 = 2112;
            v55 = v34;
            v56 = 2048;
            v57 = (void *)(v27 + j);
            v58 = 2112;
            v59 = v30;
            _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@, watchCache location %lu, %@", buf, 0x2Au);

          }
        }
        v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        v27 += j;
      }
      while (v26);
    }

    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxy](v2, "remoteObjectProxy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "onInitiatorSafetyCacheChangeForSessionID:phoneCache:watchCache:cacheExpiryDate:cacheReleaseDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    goto LABEL_27;
  }
  if (v3)
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v53 = v35;
    v54 = 2112;
    v55 = v37;
    v56 = 2112;
    v57 = v38;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,not monitoring initiator safety cache for sessionID, %@", buf, 0x20u);

LABEL_27:
  }

}

- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4
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
    v12 = "Invalid parameter not satisfying: sessionStatus";
    goto LABEL_10;
  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SMDaemonClient_onReceiverSessionStatusChangeForSessionID_sessionStatus___block_invoke;
  v13[3] = &unk_1E9298238;
  v13[4] = self;
  v16 = a2;
  v14 = v7;
  v15 = v9;
  dispatch_async(v10, v13);

LABEL_8:
}

void __74__SMDaemonClient_onReceiverSessionStatusChangeForSessionID_sessionStatus___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "monitorReceiverSessionStatus");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v13 = 138413058;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@,%@,sessionID:%@,sending receiver session status update to client,%@", (uint8_t *)&v13, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxy](v3, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "onReceiverSessionStatusChangeForSessionID:sessionStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_7;
  }
  if (v4)
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@,%@,not monitoring receiver session status", (uint8_t *)&v13, 0x16u);

LABEL_7:
  }

}

- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  SEL v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    -[SMDaemonClient queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__SMDaemonClient_onReceiverSafetyCacheChangeForSessionID_phoneCache_watchCache___block_invoke;
    block[3] = &unk_1E92978E8;
    block[4] = self;
    v18 = a2;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    dispatch_async(v12, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }

  }
}

void __80__SMDaemonClient_onReceiverSafetyCacheChangeForSessionID_phoneCache_watchCache___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "monitorReceiverSafetyCache");
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v14 = 138413314;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@,%@,sessionID:%@,sending receiver safety cache update to client,phoneCache,%@,watchCache,%@", (uint8_t *)&v14, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteObjectProxy](v3, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "onReceiverSafetyCacheChangeForSessionID:phoneCache:watchCache:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    goto LABEL_7;
  }
  if (v4)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@,%@,not monitoring receiver safety cache", (uint8_t *)&v14, 0x16u);

LABEL_7:
  }

}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[SMDaemonClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SMDaemonClient_onSessionStateChanged_forActiveDevice___block_invoke;
  block[3] = &unk_1E9297D30;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __56__SMDaemonClient_onSessionStateChanged_forActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStateChanged:forActiveDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)onSessionResumedWithState:(id)a3 forActiveDevice:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SMDaemonClient onSessionResumedWithState:forActiveDevice:]";
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, SessionManager resumed to state", buf, 0xCu);
  }

  -[SMDaemonClient queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMDaemonClient_onSessionResumedWithState_forActiveDevice___block_invoke;
  block[3] = &unk_1E9297D30;
  block[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  dispatch_async(v8, block);

}

uint64_t __60__SMDaemonClient_onSessionResumedWithState_forActiveDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionStateChanged:forActiveDevice:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  SMDaemonClient *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[SMDaemonClient monitorSessionState](self, "monitorSessionState"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "sending session state, %@, to client, %@", (uint8_t *)&v10, 0x16u);
    }

    -[SMDaemonClient xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "onSessionStateChanged:forActiveDevice:withError:", v6, v4, 0);

  }
}

- (void)onLocalSessionStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMDaemonClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SMDaemonClient_onLocalSessionStateChanged___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__SMDaemonClient_onLocalSessionStateChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLocalSessionStateChanged:", *(_QWORD *)(a1 + 40));
}

- (void)_onLocalSessionStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  SMDaemonClient *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SMDaemonClient monitorLocalSessionState](self, "monitorLocalSessionState"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = self;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "sending session state, %@, to client, %@", (uint8_t *)&v8, 0x16u);
    }

    -[SMDaemonClient xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "onLocalSessionStateChanged:withError:", v4, 0);

  }
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@,%@,message:%@,toConversation:%@", buf, 0x2Au);

  }
  -[SMDaemonClient queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SMDaemonClient_sendIDSMessage_toConversation_completion___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = a2;
  v17 = v11;
  v18 = v10;
  v19 = v9;
  dispatch_async(v16, block);

}

void __59__SMDaemonClient_sendIDSMessage_toConversation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendIDSMessage:toConversation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 56);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@,%@,message:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__SMDaemonClient_sendIDSMessageToMyDevices_completion___block_invoke;
  v16[3] = &unk_1E9297590;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v19 = a2;
  v14 = v8;
  v15 = v7;
  dispatch_async(v13, v16);

}

void __55__SMDaemonClient_sendIDSMessageToMyDevices_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendIDSMessageToMyDevices:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@,%@,message:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SMDaemonClient_sendIDSMessageToPairedDevice_completion___block_invoke;
  v16[3] = &unk_1E9297590;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v19 = a2;
  v14 = v8;
  v15 = v7;
  dispatch_async(v13, v16);

}

void __58__SMDaemonClient_sendIDSMessageToPairedDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendIDSMessageToPairedDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@,%@,message:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__SMDaemonClient_sendIDSMessageToMyNearbyDevices_completion___block_invoke;
  v16[3] = &unk_1E9297590;
  v16[4] = self;
  v17 = v7;
  v18 = v8;
  v19 = a2;
  v14 = v8;
  v15 = v7;
  dispatch_async(v13, v16);

}

void __61__SMDaemonClient_sendIDSMessageToMyNearbyDevices_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendIDSMessageToMyNearbyDevices:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SEL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v36 = v20;
    v37 = 2112;
    v38 = v21;
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v14;
    v43 = 2112;
    v44 = v15;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@,%@,message:%@,associatedGUID:%@,toConversation:%@", buf, 0x34u);

  }
  -[SMDaemonClient queue](self, "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SMDaemonClient_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E929F0E0;
  block[4] = self;
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = a2;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  v27 = v13;
  dispatch_async(v22, block);

}

void __89__SMDaemonClient_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMadridMessage:associatedGUID:toConversation:summaryText:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 72);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v8);

  }
}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  SEL v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v35 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringFromDate");
    v25 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v48 = v23;
    v49 = 2112;
    v50 = v24;
    v51 = 2112;
    v52 = v37;
    v53 = 2112;
    v54 = v25;
    v55 = 2112;
    v56 = v35;
    v57 = 2112;
    v58 = v26;
    v59 = 2112;
    v60 = v18;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@,%@,message:%@,messageGUID:%@,associatedGUID:%@,sendDate:%@,toConversation:%@", buf, 0x48u);

    v15 = v25;
    v16 = v35;
  }

  -[SMDaemonClient queue](self, "queue");
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__SMDaemonClient_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_1E929F108;
  block[4] = self;
  v39 = v37;
  v40 = v15;
  v41 = v16;
  v42 = v17;
  v43 = v18;
  v44 = v19;
  v45 = v20;
  v46 = a2;
  v28 = v20;
  v29 = v19;
  v30 = v18;
  v31 = v17;
  v32 = v16;
  v33 = v15;
  v34 = v37;
  dispatch_async(v27, block);

}

void __128__SMDaemonClient_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:summaryText:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 88);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v8);

  }
}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@,%@,messageGUID:%@,toConversation:%@", buf, 0x2Au);

  }
  -[SMDaemonClient queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__SMDaemonClient_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = a2;
  v17 = v11;
  v18 = v10;
  v19 = v9;
  dispatch_async(v16, block);

}

void __82__SMDaemonClient_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancelMadridMessageSendForMessageGUID:toConversation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
    v4 = *(_QWORD *)(a1 + 56);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D8BB70];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = CFSTR("messagingService nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v8);

  }
}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  SEL v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    v36 = 1024;
    v37 = v7;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@,%@,messageURL:%@,messageGUID:%@,success:%d,error:%@", buf, 0x3Au);

  }
  -[SMDaemonClient queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __60__SMDaemonClient_iMessageSendFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_1E929F130;
  v22[4] = self;
  v23 = v11;
  v27 = v7;
  v24 = v12;
  v25 = v13;
  v26 = a2;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  dispatch_async(v18, v22);

}

void __60__SMDaemonClient_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageSendFor:guid:successful:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  SEL v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    v36 = 1024;
    v37 = v7;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@,%@,messageURL:%@,messageGUID:%@,success:%d,error:%@", buf, 0x3Au);

  }
  -[SMDaemonClient queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__SMDaemonClient_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_1E929F130;
  v22[4] = self;
  v23 = v11;
  v27 = v7;
  v24 = v12;
  v25 = v13;
  v26 = a2;
  v19 = v13;
  v20 = v12;
  v21 = v11;
  dispatch_async(v18, v22);

}

void __78__SMDaemonClient_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageScheduledSendScheduledFor:guid:successful:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  SEL v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    v29 = 1024;
    v30 = v6;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@,%@,messageGUID:%@,success:%d,error:%@", buf, 0x30u);

  }
  -[SMDaemonClient queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SMDaemonClient_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
  block[3] = &unk_1E92978C0;
  block[4] = self;
  v19 = v9;
  v22 = v6;
  v20 = v10;
  v21 = a2;
  v16 = v10;
  v17 = v9;
  dispatch_async(v15, block);

}

void __70__SMDaemonClient_iMessageScheduledSendCancelFor_successful_withError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageScheduledSendCancelFor:successful:withError:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageScheduledSendTriggeredFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,messageGUID:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SMDaemonClient_iMessageScheduledSendTriggeredFor___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __52__SMDaemonClient_iMessageScheduledSendTriggeredFor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageScheduledSendTriggeredFor:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  SEL v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    v31 = 1024;
    v32 = v5;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@,%@,messageUrl:%@,handle:%@,fromMe:%d", buf, 0x30u);

  }
  -[SMDaemonClient queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SMDaemonClient_iMessageReceived_fromHandle_fromMe___block_invoke;
  block[3] = &unk_1E92978C0;
  block[4] = self;
  v19 = v9;
  v22 = v5;
  v20 = v10;
  v21 = a2;
  v16 = v10;
  v17 = v9;
  dispatch_async(v15, block);

}

void __53__SMDaemonClient_iMessageReceived_fromHandle_fromMe___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageReceived:fromHandle:fromMe:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageDeletedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,messageUrls:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SMDaemonClient_iMessageDeletedFor___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __37__SMDaemonClient_iMessageDeletedFor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageDeletedFor:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageConversationDeletedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,receiverHandles:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SMDaemonClient_iMessageConversationDeletedFor___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __49__SMDaemonClient_iMessageConversationDeletedFor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagingService");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "messagingService"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "messagingService");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iMessageConversationDeletedFor:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@,%@,messagingService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SMDaemonClient_iMessageGroupMembershipChangedFor___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __52__SMDaemonClient_iMessageGroupMembershipChangedFor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initiatorService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "initiatorService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageGroupMembershipChangedFor:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SMDaemonClient_iMessageGroupDisplayNameChangedFor___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __53__SMDaemonClient_iMessageGroupDisplayNameChangedFor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initiatorService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "initiatorService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageGroupDisplayNameChangedFor:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);

    }
  }
}

- (void)iMessageGroupPhotoChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SMDaemonClient_iMessageGroupPhotoChangedFor___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __47__SMDaemonClient_iMessageGroupPhotoChangedFor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initiatorService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "initiatorService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iMessageGroupPhotoChangedFor:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);

    }
  }
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID:%@", buf, 0x20u);

  }
  -[SMDaemonClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SMDaemonClient_kickedFromIMessageGroupWith___block_invoke;
  block[3] = &unk_1E9297BC8;
  block[4] = self;
  v13 = v5;
  v14 = a2;
  v11 = v5;
  dispatch_async(v10, block);

}

void __46__SMDaemonClient_kickedFromIMessageGroupWith___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initiatorService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "initiatorService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "kickedFromIMessageGroupWith:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@,%@,initiatorService nil", buf, 0x16u);

    }
  }
}

- (void)startMonitoringSessionStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  SMDaemonClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start monitoring session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    -[SMDaemonClient setMonitorSessionState:](self, "setMonitorSessionState:", 1);
    -[SMDaemonClient fetchCurrentSessionStateWithHandler:](self, "fetchCurrentSessionStateWithHandler:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)stopMonitoringSessionStateWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *v6;
  int v7;
  SMDaemonClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stop monitoring session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    -[SMDaemonClient setMonitorSessionState:](self, "setMonitorSessionState:", 0);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[SMDaemonClient initiatorService](self, "initiatorService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke;
    v8[3] = &unk_1E929F180;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "fetchCurrentSessionStateWithHandler:", v8);

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

void __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[5];
  id v15;
  id v16;
  __int128 v17;
  char v18;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke_2;
  block[3] = &unk_1E929F158;
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v18 = a3;
  v16 = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, block);

}

uint64_t __54__SMDaemonClient_fetchCurrentSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 72))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = *(_QWORD *)(a1 + 48);
    v10 = 138413314;
    v11 = v3;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, client, %@, state, %@, canDeviceModifyState, %@, error, %@", (uint8_t *)&v10, 0x34u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)startMonitoringLocalSessionStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  SMDaemonClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start monitoring local session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    -[SMDaemonClient setMonitorLocalSessionState:](self, "setMonitorLocalSessionState:", 1);
    -[SMDaemonClient fetchCurrentLocalSessionStateWithHandler:](self, "fetchCurrentLocalSessionStateWithHandler:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)stopMonitoringLocalSessionStateWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  NSObject *v6;
  int v7;
  SMDaemonClient *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stop monitoring local session state for client, %@", (uint8_t *)&v7, 0xCu);
    }

    -[SMDaemonClient setMonitorLocalSessionState:](self, "setMonitorLocalSessionState:", 0);
    v4[2](v4, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    -[SMDaemonClient initiatorService](self, "initiatorService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke;
    v8[3] = &unk_1E929F1A8;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "fetchCurrentLocalSessionStateWithHandler:", v8);

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

void __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[5];
  id v13;
  id v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke_2;
  block[3] = &unk_1E9297910;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __59__SMDaemonClient_fetchCurrentLocalSessionStateWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138413058;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, client, %@, state, %@, error, %@", (uint8_t *)&v8, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
{
  -[SMSuggestionsStore fetchSuggestionsWithOptions:handler:](self->_suggestionsStore, "fetchSuggestionsWithOptions:handler:", a3, a4);
}

- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
  -[SMSuggestionsStore fetchSuggestionsCountWithOptions:handler:](self->_suggestionsStore, "fetchSuggestionsCountWithOptions:handler:", a3, a4);
}

- (void)clearSuggestionsWithHandler:(id)a3
{
  -[SMSuggestionsStore clearSuggestionsWithHandler:](self->_suggestionsStore, "clearSuggestionsWithHandler:", a3);
}

- (void)storeSuggestions:(id)a3 handler:(id)a4
{
  -[SMSuggestionsStore storeSuggestions:handler:](self->_suggestionsStore, "storeSuggestions:handler:", a3, a4);
}

- (void)storeSessionManagerStates:(id)a3 handler:(id)a4
{
  -[SMSessionStore storeSessionManagerStates:handler:](self->_sessionStore, "storeSessionManagerStates:handler:", a3, a4);
}

- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4
{
  -[SMSessionStore storeSessionMonitorStates:handler:](self->_sessionStore, "storeSessionMonitorStates:handler:", a3, a4);
}

- (void)storeSessionConfigurations:(id)a3 handler:(id)a4
{
  -[SMSessionStore storeSessionConfigurations:handler:](self->_sessionStore, "storeSessionConfigurations:handler:", a3, a4);
}

- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4
{
  -[SMSessionStore storeTriggerDestinationStates:handler:](self->_sessionStore, "storeTriggerDestinationStates:handler:", a3, a4);
}

- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
  -[SMSessionStore fetchSessionManagerStatesWithOptions:handler:](self->_sessionStore, "fetchSessionManagerStatesWithOptions:handler:", a3, a4);
}

- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  -[SMSessionStore fetchSessionConfigurationsWithOptions:handler:](self->_sessionStore, "fetchSessionConfigurationsWithOptions:handler:", a3, a4);
}

- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
  -[SMSessionStore fetchMostRecentSessionMonitorStateWithSessionID:handler:](self->_sessionStore, "fetchMostRecentSessionMonitorStateWithSessionID:handler:", a3, a4);
}

- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
  -[SMSessionStore fetchTriggerDestinationStateWithSessionID:handler:](self->_sessionStore, "fetchTriggerDestinationStateWithSessionID:handler:", a3, a4);
}

- (void)clearSessionsWithHandler:(id)a3
{
  -[SMSessionStore clearSessionsWithHandler:](self->_sessionStore, "clearSessionsWithHandler:", a3);
}

- (void)clearSessionMonitorStatesWithHandler:(id)a3
{
  -[SMSessionStore clearSessionMonitorStatesWithHandler:](self->_sessionStore, "clearSessionMonitorStatesWithHandler:", a3);
}

- (void)clearTriggerDestinationStatesWithHandler:(id)a3
{
  -[SMSessionStore clearTriggerDestinationStatesWithHandler:](self->_sessionStore, "clearTriggerDestinationStatesWithHandler:", a3);
}

- (void)checkInitiatorEligibilityWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;

  v5 = a3;
  -[SMDaemonClient queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient authorizationManager](self, "authorizationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient messagingService](self, "messagingService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient platform](self, "platform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke;
  v13[3] = &unk_1E9298578;
  v14 = v5;
  v15 = a2;
  v13[4] = self;
  v12 = v5;
  +[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:](SMInitiatorEligibility, "checkInitiatorEligibilityWithQueue:authorizationManager:effectivePairedDevice:isHandoff:defaultsManager:platform:handler:", v6, v7, v9, 0, v10, v11, v13);

}

void __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke_2;
  block[3] = &unk_1E9299248;
  v13 = a2;
  v11 = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __55__SMDaemonClient_checkInitiatorEligibilityWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    initiatorEligiblityStatusToString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, eligibilityStatus, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkConversationEligibility:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  SMEligibilityChecker *eligibilityChecker;
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SMDaemonClient checkConversationEligibility:handler:]";
    v19 = 1024;
    v20 = 1377;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SMDaemonClient checkConversationEligibility:handler:]";
      v19 = 1024;
      v20 = 1378;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  eligibilityChecker = self->_eligibilityChecker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke;
  v14[3] = &unk_1E9298578;
  v15 = v9;
  v16 = a2;
  v14[4] = self;
  v13 = v9;
  -[SMEligibilityChecker checkConversationEligibility:handler:](eligibilityChecker, "checkConversationEligibility:handler:", v7, v14);

}

void __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke_2;
  block[3] = &unk_1E9299248;
  v13 = a2;
  v11 = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __55__SMDaemonClient_checkConversationEligibility_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8B938], "convertEligibilityTypeToString:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, receiver eligibility, %@, fetchError %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkHasSimWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMDaemonClient queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SMDaemonClient_checkHasSimWithHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __41__SMDaemonClient_checkHasSimWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SMInitiatorEligibility checkHasSimWithQueue:](SMInitiatorEligibility, "checkHasSimWithQueue:", v2);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("no");
    if (v3)
      v7 = CFSTR("yes");
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, has sime, %@", (uint8_t *)&v9, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  SMDeviceConfigurationChecker *deviceConfigurationChecker;
  id v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SMDaemonClient fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:]";
      v14 = 1024;
      v15 = 1411;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  deviceConfigurationChecker = self->_deviceConfigurationChecker;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v9[3] = &unk_1E9298578;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v8 = v5;
  -[SMDeviceConfigurationChecker fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:](deviceConfigurationChecker, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v9);

}

void __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2;
  block[3] = &unk_1E9299248;
  v13 = a2;
  v11 = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __78__SMDaemonClient_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8B928], "convertLowPowerModeWarningStateToString:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, device configuration low power mode state, %@, fetchError %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)checkEligibilityOfDestination:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "-[SMDaemonClient checkEligibilityOfDestination:completionHandler:]";
    v17 = 1024;
    v18 = 1431;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", (uint8_t *)&v15, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[SMDaemonClient checkEligibilityOfDestination:completionHandler:]";
      v17 = 1024;
      v18 = 1432;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }

  }
LABEL_10:
  -[SMDaemonClient initiatorService](self, "initiatorService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient distanceCalculator](self, "distanceCalculator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient queue](self, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMTriggerDestination checkEligibilityOfDestination:locationManager:distanceCalculator:queue:completionHandler:](SMTriggerDestination, "checkEligibilityOfDestination:locationManager:distanceCalculator:queue:completionHandler:", v6, v12, v13, v14, v8);

}

- (void)calculateDistanceToDestination:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "-[SMDaemonClient calculateDistanceToDestination:completionHandler:]";
    v17 = 1024;
    v18 = 1445;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", (uint8_t *)&v15, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[SMDaemonClient calculateDistanceToDestination:completionHandler:]";
      v17 = 1024;
      v18 = 1446;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v15, 0x12u);
    }

  }
LABEL_10:
  -[SMDaemonClient initiatorService](self, "initiatorService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient distanceCalculator](self, "distanceCalculator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient queue](self, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMTriggerDestination calculateDistanceToDestination:locationManager:distanceCalculator:queue:handler:](SMTriggerDestination, "calculateDistanceToDestination:locationManager:distanceCalculator:queue:handler:", v6, v12, v13, v14, v8);

}

- (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMDaemonClient estimateEtaToDestination:transportType:completionHandler:]";
      v20 = 1024;
      v21 = 1460;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
    }

    if (a4)
    {
LABEL_3:
      if (v9)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SMDaemonClient estimateEtaToDestination:transportType:completionHandler:]";
    v20 = 1024;
    v21 = 1461;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: transportType (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMDaemonClient estimateEtaToDestination:transportType:completionHandler:]";
      v20 = 1024;
      v21 = 1462;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  -[SMDaemonClient initiatorService](self, "initiatorService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient distanceCalculator](self, "distanceCalculator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMDaemonClient queue](self, "queue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SMTriggerDestination estimateEtaToDestination:transportType:locationManager:defaultsManager:distanceCalculator:queue:handler:](SMTriggerDestination, "estimateEtaToDestination:transportType:locationManager:defaultsManager:distanceCalculator:queue:handler:", v8, a4, v14, v15, v16, v17, v9);

}

- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5
{
  -[SMSuggestionsManager runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:handler:](self->_suggestionsManager, "runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:handler:", a3, a4, a5);
}

- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  -[SMSuggestionsManager fetchSuggestedSessionConfigurationWithHandler:](self->_suggestionsManager, "fetchSuggestedSessionConfigurationWithHandler:", a3);
}

- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  -[SMSuggestionsManager fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:](self->_suggestionsManager, "fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:", a3);
}

- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  -[SMSuggestionsManager launchSessionInitiationUIWithConfiguration:handler:](self->_suggestionsManager, "launchSessionInitiationUIWithConfiguration:handler:", a3, a4);
}

- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4
{
  -[SMSuggestionsManager showSuggestionsDetectionUIWithSuggestion:handler:](self->_suggestionsManager, "showSuggestionsDetectionUIWithSuggestion:handler:", a3, a4);
}

- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  -[SMSuggestionsManager shouldShowKeyboardSuggestionsForInitiator:receiver:handler:](self->_suggestionsManager, "shouldShowKeyboardSuggestionsForInitiator:receiver:handler:", a3, a4, a5);
}

- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  -[SMSuggestionsManager shouldShowTipKitSuggestionsForInitiator:receiver:handler:](self->_suggestionsManager, "shouldShowTipKitSuggestionsForInitiator:receiver:handler:", a3, a4, a5);
}

- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3
{
  -[SMSuggestionsManager fetchShouldShowProactiveSuggestionsWithHandler:](self->_suggestionsManager, "fetchShouldShowProactiveSuggestionsWithHandler:", a3);
}

- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4
{
  -[SMSuggestionsManager showAlwaysOnPromptWithConfiguration:handler:](self->_suggestionsManager, "showAlwaysOnPromptWithConfiguration:handler:", a3, a4);
}

- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  -[SMSuggestionsHelper fetchMostLikelyReceiverHandlesWithHandler:](self->_suggestionsHelper, "fetchMostLikelyReceiverHandlesWithHandler:", a3);
}

- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  -[SMSuggestionsHelper fetchMostLikelySessionDestinationsWithHandler:](self->_suggestionsHelper, "fetchMostLikelySessionDestinationsWithHandler:", a3);
}

- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  -[SMSuggestionsHelper fetchNumFavoriteRecipientsWithReceiverHandles:handler:](self->_suggestionsHelper, "fetchNumFavoriteRecipientsWithReceiverHandles:handler:", a3, a4);
}

- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  -[SMSuggestionsHelper fetchNumEmergencyRecipientsWithReceiverHandles:handler:](self->_suggestionsHelper, "fetchNumEmergencyRecipientsWithReceiverHandles:handler:", a3, a4);
}

- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  -[SMSuggestionsHelper fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:](self->_suggestionsHelper, "fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:", a3, a4);
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  -[SMInitiatorService respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:](self->_initiatorService, "respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:", a3, a4, a5, a6);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)setExecutablePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)executableName
{
  return self->_executableName;
}

- (void)setExecutableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (RTEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementProvider, a3);
}

- (SMInitiatorService)initiatorService
{
  return self->_initiatorService;
}

- (void)setInitiatorService:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorService, a3);
}

- (BOOL)monitorInitiatorSafetyCache
{
  return self->_monitorInitiatorSafetyCache;
}

- (void)setMonitorInitiatorSafetyCache:(BOOL)a3
{
  self->_monitorInitiatorSafetyCache = a3;
}

- (BOOL)monitorReceiverSessionStatus
{
  return self->_monitorReceiverSessionStatus;
}

- (void)setMonitorReceiverSessionStatus:(BOOL)a3
{
  self->_monitorReceiverSessionStatus = a3;
}

- (BOOL)monitorReceiverSafetyCache
{
  return self->_monitorReceiverSafetyCache;
}

- (void)setMonitorReceiverSafetyCache:(BOOL)a3
{
  self->_monitorReceiverSafetyCache = a3;
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (BOOL)monitorSessionState
{
  return self->_monitorSessionState;
}

- (void)setMonitorSessionState:(BOOL)a3
{
  self->_monitorSessionState = a3;
}

- (BOOL)monitorLocalSessionState
{
  return self->_monitorLocalSessionState;
}

- (void)setMonitorLocalSessionState:(BOOL)a3
{
  self->_monitorLocalSessionState = a3;
}

- (SMSuggestionsManager)suggestionsManager
{
  return self->_suggestionsManager;
}

- (void)setSuggestionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsManager, a3);
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (void)setSuggestionsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsHelper, a3);
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (void)setSuggestionsStore:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsStore, a3);
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (void)setMessagingService:(id)a3
{
  objc_storeStrong((id *)&self->_messagingService, a3);
}

- (SMReceiverService)receiverService
{
  return self->_receiverService;
}

- (void)setReceiverService:(id)a3
{
  objc_storeStrong((id *)&self->_receiverService, a3);
}

- (SMEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (void)setEligibilityChecker:(id)a3
{
  objc_storeStrong((id *)&self->_eligibilityChecker, a3);
}

- (SMDeviceConfigurationChecker)deviceConfigurationChecker
{
  return self->_deviceConfigurationChecker;
}

- (void)setDeviceConfigurationChecker:(id)a3
{
  objc_storeStrong((id *)&self->_deviceConfigurationChecker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceConfigurationChecker, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_receiverService, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_suggestionsManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_initiatorService, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_executableName, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
