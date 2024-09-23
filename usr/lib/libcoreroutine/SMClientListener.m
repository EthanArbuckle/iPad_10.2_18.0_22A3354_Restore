@implementation SMClientListener

- (SMClientListener)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_authorizationManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_);
}

- (SMClientListener)initWithDefaultsManager:(id)a3 authorizationManager:(id)a4 distanceCalculator:(id)a5 platform:(id)a6 initiatorService:(id)a7 messagingService:(id)a8 receiverService:(id)a9 sessionStore:(id)a10 suggestionsManager:(id)a11 suggestionsHelper:(id)a12 suggestionsStore:(id)a13 eligibilityChecker:(id)a14 deviceConfigurationChecker:(id)a15
{
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  SMClientListener *v24;
  uint64_t v25;
  NSXPCInterface *frameworkInterface;
  uint64_t v27;
  NSXPCInterface *daemonInterface;
  NSXPCInterface *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  NSXPCInterface *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSXPCInterface *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSXPCInterface *v53;
  void *v54;
  NSXPCInterface *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSXPCInterface *v60;
  void *v61;
  NSXPCInterface *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  NSXPCInterface *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  NSXPCInterface *v70;
  void *v71;
  NSXPCInterface *v72;
  void *v73;
  NSXPCInterface *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  NSXPCInterface *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  NSXPCInterface *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  NSXPCInterface *v86;
  void *v87;
  NSXPCInterface *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  NSXPCInterface *v92;
  void *v93;
  NSXPCInterface *v94;
  void *v95;
  NSXPCInterface *v96;
  void *v97;
  NSXPCInterface *v98;
  void *v99;
  SMClientListener *v100;
  SMClientListener *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  NSObject *v105;
  const char *v106;
  NSObject *v108;
  uint64_t v109;
  id v111;
  SMClientListener *v113;
  id v114;
  void *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  objc_super v126;
  uint8_t buf[16];

  v125 = a3;
  v111 = a4;
  v20 = a4;
  v116 = a5;
  v124 = a6;
  v123 = a7;
  v122 = a8;
  v121 = a9;
  v114 = a10;
  v120 = a11;
  v119 = a12;
  v118 = a13;
  v117 = a14;
  v21 = a15;
  v115 = v21;
  if (!v125)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v104, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v101 = 0;
    v102 = 0;
    v22 = v116;
    goto LABEL_41;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    v22 = v116;
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: authorizationManager";
LABEL_39:
    _os_log_error_impl(&dword_1D1A22000, v105, OS_LOG_TYPE_ERROR, v106, buf, 2u);
    goto LABEL_40;
  }
  v22 = v116;
  if (!v116)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_39;
  }
  if (!v124)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: platform";
    goto LABEL_39;
  }
  if (!v123)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: initiatorService";
    goto LABEL_39;
  }
  if (!v122)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: messagingService";
    goto LABEL_39;
  }
  if (!v121)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: receiverService";
    goto LABEL_39;
  }
  if (!v120)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: suggestionsManager";
    goto LABEL_39;
  }
  if (!v119)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: suggestionsHelper";
    goto LABEL_39;
  }
  if (!v118)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    *(_WORD *)buf = 0;
    v106 = "Invalid parameter not satisfying: suggestionsStore";
    goto LABEL_39;
  }
  if (!v117)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v106 = "Invalid parameter not satisfying: eligibilityChecker";
      goto LABEL_39;
    }
LABEL_40:

    v101 = 0;
    v102 = v125;
LABEL_41:
    v100 = self;
    v103 = v114;
    goto LABEL_42;
  }
  if (v21)
  {
    v23 = *MEMORY[0x1E0D8BBC0];
    v126.receiver = self;
    v126.super_class = (Class)SMClientListener;
    v24 = -[RTXPCListener initWithMachServiceName:](&v126, sel_initWithMachServiceName_, v23);
    if (v24)
    {
      v113 = v24;
      objc_storeStrong((id *)&v24->_defaultsManager, a3);
      objc_storeStrong((id *)&v113->_authorizationManager, v111);
      objc_storeStrong((id *)&v113->_distanceCalculator, a5);
      objc_storeStrong((id *)&v113->_platform, a6);
      objc_storeStrong((id *)&v113->_initiatorService, a7);
      objc_storeStrong((id *)&v113->_sessionStore, a10);
      objc_storeStrong((id *)&v113->_suggestionsManager, a11);
      objc_storeStrong((id *)&v113->_suggestionsHelper, a12);
      objc_storeStrong((id *)&v113->_suggestionsStore, a13);
      objc_storeStrong((id *)&v113->_messagingService, a8);
      objc_storeStrong((id *)&v113->_receiverService, a9);
      objc_storeStrong((id *)&v113->_eligibilityChecker, a14);
      objc_storeStrong((id *)&v113->_deviceConfigurationChecker, a15);
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFD0C748);
      v25 = objc_claimAutoreleasedReturnValue();
      frameworkInterface = v113->_frameworkInterface;
      v113->_frameworkInterface = (NSXPCInterface *)v25;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCA6A40);
      v27 = objc_claimAutoreleasedReturnValue();
      daemonInterface = v113->_daemonInterface;
      v113->_daemonInterface = (NSXPCInterface *)v27;

      v29 = v113->_daemonInterface;
      v30 = (void *)MEMORY[0x1E0C99E60];
      v31 = objc_opt_class();
      v32 = objc_opt_class();
      v33 = objc_opt_class();
      v34 = objc_opt_class();
      v35 = objc_opt_class();
      objc_msgSend(v30, "setWithObjects:", v31, v32, v33, v34, v35, objc_opt_class(), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v29, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_startSessionWithConfiguration_handler_, 0, 0);

      v37 = v113->_daemonInterface;
      v38 = (void *)MEMORY[0x1E0C99E60];
      v39 = objc_opt_class();
      v40 = objc_opt_class();
      v41 = objc_opt_class();
      v42 = objc_opt_class();
      v43 = objc_opt_class();
      objc_msgSend(v38, "setWithObjects:", v39, v40, v41, v42, v43, objc_opt_class(), 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v37, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_modifySessionWithConfiguration_handler_, 0, 0);

      v45 = v113->_daemonInterface;
      v46 = (void *)MEMORY[0x1E0C99E60];
      v47 = objc_opt_class();
      v48 = objc_opt_class();
      v49 = objc_opt_class();
      v50 = objc_opt_class();
      v51 = objc_opt_class();
      objc_msgSend(v46, "setWithObjects:", v47, v48, v49, v50, v51, objc_opt_class(), 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v45, "setClasses:forSelector:argumentIndex:ofReply:", v52, sel_checkInitiatorEligibilityWithHandler_, 0, 0);

      v53 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v53, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_checkHasSimWithHandler_, 0, 0);

      v55 = v113->_daemonInterface;
      v56 = (void *)MEMORY[0x1E0C99E60];
      v57 = objc_opt_class();
      v58 = objc_opt_class();
      v109 = objc_opt_class();
      v22 = v116;
      objc_msgSend(v56, "setWithObjects:", v57, v58, v109, objc_opt_class(), 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v55, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_checkConversationEligibility_handler_, 0, 0);

      v60 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v60, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler_, 0, 0);

      v62 = v113->_daemonInterface;
      v63 = (void *)MEMORY[0x1E0C99E60];
      v64 = objc_opt_class();
      objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v62, "setClasses:forSelector:argumentIndex:ofReply:", v65, sel_storeSuggestions_handler_, 0, 0);

      v66 = v113->_daemonInterface;
      v67 = (void *)MEMORY[0x1E0C99E60];
      v68 = objc_opt_class();
      objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v66, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_storeSessionManagerStates_handler_, 0, 0);

      v70 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v70, "setClasses:forSelector:argumentIndex:ofReply:", v71, sel_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler_, 0, 0);

      v72 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v72, "setClasses:forSelector:argumentIndex:ofReply:", v73, sel_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler_, 0, 0);

      v74 = v113->_daemonInterface;
      v75 = (void *)MEMORY[0x1E0C99E60];
      v76 = objc_opt_class();
      objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v74, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_fetchNumFavoriteRecipientsWithReceiverHandles_handler_, 0, 0);

      v78 = v113->_daemonInterface;
      v79 = (void *)MEMORY[0x1E0C99E60];
      v80 = objc_opt_class();
      objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v78, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_fetchNumEmergencyRecipientsWithReceiverHandles_handler_, 0, 0);

      v82 = v113->_daemonInterface;
      v83 = (void *)MEMORY[0x1E0C99E60];
      v84 = objc_opt_class();
      objc_msgSend(v83, "setWithObjects:", v84, objc_opt_class(), 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v82, "setClasses:forSelector:argumentIndex:ofReply:", v85, sel_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler_, 0, 0);

      v86 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v86, "setClasses:forSelector:argumentIndex:ofReply:", v87, sel_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler_, 0, 0);

      v88 = v113->_daemonInterface;
      v89 = (void *)MEMORY[0x1E0C99E60];
      v90 = objc_opt_class();
      objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v88, "setClasses:forSelector:argumentIndex:ofReply:", v91, sel_iMessageDeletedFor_, 0, 0);

      v92 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v92, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_iMessageGroupMembershipChangedFor_, 0, 0);

      v94 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v94, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_iMessageGroupDisplayNameChangedFor_, 0, 0);

      v96 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v96, "setClasses:forSelector:argumentIndex:ofReply:", v97, sel_iMessageGroupPhotoChangedFor_, 0, 0);

      v98 = v113->_daemonInterface;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v98, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_kickedFromIMessageGroupWith_, 0, 0);

      -[RTXPCListener setup](v113, "setup");
      v24 = v113;
    }
    v100 = v24;
    v101 = v100;
    v102 = v125;
    v103 = v114;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v108 = objc_claimAutoreleasedReturnValue();
    v102 = v125;
    v103 = v114;
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v108, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deviceConfigurationChecker", buf, 2u);
    }

    v101 = 0;
    v100 = self;
  }
LABEL_42:

  return v101;
}

- (void)_setup
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SMClientListener;
  -[RTXPCListener _setup](&v2, sel__setup);
}

- (id)handleClientConnection:(id)a3
{
  id v4;
  SMDaemonClient *v5;
  void *v6;
  SMDaemonClient *v7;

  v4 = a3;
  v5 = [SMDaemonClient alloc];
  -[RTXPCListener queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SMDaemonClient initWithQueue:authorizationManager:defaultsManager:distanceCalculator:platform:initiatorService:messagingService:receiverService:sessionStore:suggestionsManager:suggestionsHelper:suggestionsStore:eligibilityChecker:deviceConfigurationChecker:](v5, "initWithQueue:authorizationManager:defaultsManager:distanceCalculator:platform:initiatorService:messagingService:receiverService:sessionStore:suggestionsManager:suggestionsHelper:suggestionsStore:eligibilityChecker:deviceConfigurationChecker:", v6, self->_authorizationManager, self->_defaultsManager, self->_distanceCalculator, self->_platform, self->_initiatorService, self->_messagingService, self->_receiverService, self->_sessionStore, self->_suggestionsManager, self->_suggestionsHelper, self->_suggestionsStore, self->_eligibilityChecker, self->_deviceConfigurationChecker);

  -[SMClientListener _setupConnection:forClient:](self, "_setupConnection:forClient:", v4, v7);
  return v7;
}

- (void)_setupConnection:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  _QWORD v18[4];
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "suspend");
  -[RTXPCListener queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setQueue:", v8);

  objc_msgSend(v6, "setRemoteObjectInterface:", self->_frameworkInterface);
  objc_msgSend(v6, "setExportedInterface:", self->_daemonInterface);
  objc_msgSend(v6, "setExportedObject:", v7);
  objc_initWeak(&location, v7);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__SMClientListener__setupConnection_forClient___block_invoke;
  v18[3] = &unk_1E92983E8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v6, "setInterruptionHandler:", v18);
  objc_initWeak(&from, self);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __47__SMClientListener__setupConnection_forClient___block_invoke_277;
  v14[3] = &unk_1E92A3F78;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  objc_msgSend(v6, "setInvalidationHandler:", v14);
  objc_msgSend(v6, "resume");
  +[RTXPC executablePathOfConnection:](RTXPC, "executablePathOfConnection:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExecutablePath:", v10);

  objc_msgSend(v7, "executablePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExecutableName:", v12);

  objc_msgSend(v7, "setProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));
  objc_msgSend(v7, "setXpcConnection:", v6);
  objc_msgSend(v7, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", v7);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __47__SMClientListener__setupConnection_forClient___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "executableName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc interruption", (uint8_t *)&v4, 0xCu);

  }
}

void __47__SMClientListener__setupConnection_forClient___block_invoke_277(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "executableName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "client, %@, handle xpc invalidation", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);
  objc_msgSend(WeakRetained, "setProcessIdentifier:", 0);
  objc_msgSend(WeakRetained, "setExecutablePath:", 0);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "handleDisconnectionForDaemonClient:", WeakRetained);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  int v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  _BYTE v23[18];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v21 = 0;
    v6 = +[RTXPC clientCodeSignatureIsValid:error:](RTXPC, "clientCodeSignatureIsValid:error:", v5, &v21);
    v7 = v21;
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_msgSend(v5, "processIdentifier");
        -[RTXPCListener machServiceName](self, "machServiceName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v23 = v17;
        *(_WORD *)&v23[4] = 2112;
        *(_QWORD *)&v23[6] = v18;
        _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "listener received incoming connection from pid %d, for service, %@", buf, 0x12u);

      }
      -[SMClientListener handleClientConnection:](self, "handleClientConnection:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v9 = v10;
        -[RTXPCListener connectedClients](self, "connectedClients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v9);

        _rt_log_facility_get_os_log(RTLogFacilityConnection);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[RTXPCListener machServiceName](self, "machServiceName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v23 = v9;
          *(_WORD *)&v23[8] = 2112;
          *(_QWORD *)&v23[10] = v13;
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "client connected, %@, to service, %@", buf, 0x16u);

        }
        -[RTXPCListener logClients](self, "logClients");
        v14 = 1;
        goto LABEL_18;
      }
      _rt_log_facility_get_os_log(RTLogFacilityConnection);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v19 = objc_msgSend(v5, "processIdentifier");
        -[RTXPCListener machServiceName](self, "machServiceName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v23 = v19;
        *(_WORD *)&v23[4] = 2112;
        *(_QWORD *)&v23[6] = v20;
        _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "failed to create client for connection from pid, %d, for service, %@", buf, 0x12u);

      }
      v9 = 0;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v23 = v7;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "incoming xpc connection failed code-signing check, error, %@.", buf, 0xCu);
    }
    v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "incoming xpc connection is nil", buf, 2u);
  }
  v14 = 0;
LABEL_19:

  return v14;
}

- (void)handleDisconnectionForDaemonClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "client disconnected, %@", (uint8_t *)&v7, 0xCu);
  }

  -[RTXPCListener connectedClients](self, "connectedClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  objc_msgSend(v4, "shutdown");
  -[RTXPCListener logClients](self, "logClients");

}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
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

- (SMInitiatorService)initiatorService
{
  return self->_initiatorService;
}

- (void)setInitiatorService:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorService, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
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
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_frameworkInterface, 0);
}

@end
