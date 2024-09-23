@implementation RTClientListener

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
      -[RTClientListener handleClientConnection:](self, "handleClientConnection:", v5);
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

- (id)handleClientConnection:(id)a3
{
  void *v4;
  RTDaemonClient *v5;
  RTDaemonClient *v7;
  id v8;

  v8 = a3;
  v7 = [RTDaemonClient alloc];
  -[RTXPCListener queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTDaemonClient initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:](v7, "initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:", v4, 0, self->_accountManager, self->_assetManager, self->_authorizationManager, self->_backgroundInertialOdometryManager, self->_contactsManager, self->_defaultsManager, self->_deviceLocationPredictor, self->_diagnostics, self->_elevationManager, self->_eventAgentManager,
         self->_eventModelProvider,
         self->_authorizedLocationManager,
         self->_fingerprintManager,
         self->_healthKitManager,
         self->_hintManager,
         self->_intermittentGNSSManager,
         self->_learnedLocationManager,
         self->_learnedLocationStore,
         self->_locationManager,
         self->_locationContextManager,
         self->_locationStore,
         self->_mapServiceManager,
         self->_metricManager,
         self->_motionActivityManager,
         self->_peopleDiscoveryProvider,
         self->_placeInferenceManager,
         self->_purgeManager,
         self->_scenarioTriggerManager,
         self->_timerManager,
         self->_tripSegmentManager,
         self->_vehicleLocationProvider,
         self->_vehicleStore,
         self->_visitManager,
         self->_wifiManager);

  -[RTDaemonClient setClientManagerDelegate:](v5, "setClientManagerDelegate:", self);
  -[RTClientListener _setupConnection:forClient:](self, "_setupConnection:forClient:", v8, v5);

  return v5;
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
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
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
  v18[2] = __47__RTClientListener__setupConnection_forClient___block_invoke;
  v18[3] = &unk_1E92983E8;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v6, "setInterruptionHandler:", v18);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __47__RTClientListener__setupConnection_forClient___block_invoke_272;
  v16[3] = &unk_1E92983E8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "setInvalidationHandler:", v16);
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
  +[RTXPC signingIdentifierOfConnection:](RTXPC, "signingIdentifierOfConnection:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSigningIdentifier:", v13);

  objc_msgSend(v7, "signingIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBundleIdentifier:", v14);

  objc_msgSend(v7, "setXpcConnection:", v6);
  objc_msgSend(v7, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v7);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (RTClientListener)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_assetManager_authorizationManager_backgroundInertialOdometryManager_contactsManager_defaultsManager_deviceLocationPredictor_diagnostics_elevationManager_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_healthKitManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationContextManager_locationStore_mapServiceManager_metricManager_motionActivityManager_peopleDiscoveryProvider_placeInferenceManager_purgeManager_scenarioTriggerManager_timerManager_tripSegmentManager_vehicleLocationProvider_vehicleStore_visitManager_wifiManager_);
}

- (RTClientListener)initWithAccountManager:(id)a3 assetManager:(id)a4 authorizationManager:(id)a5 backgroundInertialOdometryManager:(id)a6 contactsManager:(id)a7 defaultsManager:(id)a8 deviceLocationPredictor:(id)a9 diagnostics:(id)a10 elevationManager:(id)a11 eventAgentManager:(id)a12 eventModelProvider:(id)a13 authorizedLocationManager:(id)a14 fingerprintManager:(id)a15 healthKitManager:(id)a16 hintManager:(id)a17 intermittentGNSSManager:(id)a18 learnedLocationManager:(id)a19 learnedLocationStore:(id)a20 locationManager:(id)a21 locationContextManager:(id)a22 locationStore:(id)a23 mapServiceManager:(id)a24 metricManager:(id)a25 motionActivityManager:(id)a26 peopleDiscoveryProvider:(id)a27 placeInferenceManager:(id)a28 purgeManager:(id)a29 scenarioTriggerManager:(id)a30 timerManager:(id)a31 tripSegmentManager:(id)a32 vehicleLocationProvider:(id)a33 vehicleStore:(id)a34 visitManager:(id)a35 wifiManager:(id)a36
{
  RTClientListener *v41;
  RTClientListener *v42;
  uint64_t v43;
  NSXPCInterface *frameworkInterface;
  uint64_t v45;
  NSXPCInterface *daemonInterface;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSXPCInterface *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSXPCInterface *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSXPCInterface *v65;
  void *v66;
  NSXPCInterface *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  NSXPCInterface *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  NSXPCInterface *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  NSXPCInterface *v79;
  void *v80;
  NSXPCInterface *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  NSXPCInterface *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  NSXPCInterface *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  NSXPCInterface *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  NSXPCInterface *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  NSXPCInterface *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  NSXPCInterface *v105;
  void *v106;
  NSXPCInterface *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  NSXPCInterface *v111;
  void *v112;
  id v115;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  uint64_t v151;
  objc_super v152;

  v150 = a3;
  v149 = a4;
  v148 = a5;
  v147 = a6;
  v146 = a7;
  v115 = a8;
  v145 = a8;
  v144 = a9;
  v143 = a10;
  v142 = a11;
  v141 = a12;
  v140 = a13;
  v139 = a14;
  v138 = a15;
  v137 = a16;
  v136 = a17;
  v135 = a18;
  v134 = a19;
  v133 = a20;
  v132 = a21;
  v131 = a22;
  v130 = a23;
  v129 = a24;
  v128 = a25;
  v127 = a26;
  v126 = a27;
  v125 = a28;
  v124 = a29;
  v123 = a30;
  v122 = a31;
  v121 = a32;
  v120 = a33;
  v119 = a34;
  v118 = a35;
  v117 = a36;
  v152.receiver = self;
  v152.super_class = (Class)RTClientListener;
  v41 = -[RTXPCListener initWithMachServiceName:](&v152, sel_initWithMachServiceName_, CFSTR("com.apple.routined.registration"));
  v42 = v41;
  if (v41)
  {
    objc_storeStrong((id *)&v41->_accountManager, a3);
    objc_storeStrong((id *)&v42->_assetManager, a4);
    objc_storeStrong((id *)&v42->_authorizationManager, a5);
    objc_storeStrong((id *)&v42->_backgroundInertialOdometryManager, a6);
    objc_storeStrong((id *)&v42->_contactsManager, a7);
    objc_storeStrong((id *)&v42->_defaultsManager, v115);
    objc_storeStrong((id *)&v42->_deviceLocationPredictor, a9);
    objc_storeStrong((id *)&v42->_diagnostics, a10);
    objc_storeStrong((id *)&v42->_elevationManager, a11);
    objc_storeStrong((id *)&v42->_eventAgentManager, a12);
    objc_storeStrong((id *)&v42->_eventModelProvider, a13);
    objc_storeStrong((id *)&v42->_fingerprintManager, a15);
    objc_storeStrong((id *)&v42->_authorizedLocationManager, a14);
    objc_storeStrong((id *)&v42->_healthKitManager, a16);
    objc_storeStrong((id *)&v42->_hintManager, a17);
    objc_storeStrong((id *)&v42->_intermittentGNSSManager, a18);
    objc_storeStrong((id *)&v42->_learnedLocationManager, a19);
    objc_storeStrong((id *)&v42->_learnedLocationStore, a20);
    objc_storeStrong((id *)&v42->_locationManager, a21);
    objc_storeStrong((id *)&v42->_locationContextManager, a22);
    objc_storeStrong((id *)&v42->_locationStore, a23);
    objc_storeStrong((id *)&v42->_mapServiceManager, a24);
    objc_storeStrong((id *)&v42->_metricManager, a25);
    objc_storeStrong((id *)&v42->_motionActivityManager, a26);
    objc_storeStrong((id *)&v42->_peopleDiscoveryProvider, a27);
    objc_storeStrong((id *)&v42->_placeInferenceManager, a28);
    objc_storeStrong((id *)&v42->_purgeManager, a29);
    objc_storeStrong((id *)&v42->_scenarioTriggerManager, a30);
    objc_storeStrong((id *)&v42->_timerManager, a31);
    objc_storeStrong((id *)&v42->_vehicleLocationProvider, a33);
    objc_storeStrong((id *)&v42->_vehicleStore, a34);
    objc_storeStrong((id *)&v42->_visitManager, a35);
    objc_storeStrong((id *)&v42->_tripSegmentManager, a32);
    objc_storeStrong((id *)&v42->_wifiManager, a36);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFD0C890);
    v43 = objc_claimAutoreleasedReturnValue();
    frameworkInterface = v42->_frameworkInterface;
    v42->_frameworkInterface = (NSXPCInterface *)v43;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC794E0);
    v45 = objc_claimAutoreleasedReturnValue();
    daemonInterface = v42->_daemonInterface;
    v42->_daemonInterface = (NSXPCInterface *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v151 = objc_opt_class();
    v48 = objc_opt_class();
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    objc_msgSend(v47, "setWithObjects:", v151, v48, v49, v50, v51, v52, v53, v54, objc_opt_class(), 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v42->_daemonInterface, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_extendLifetimeOfVisitsWithIdentifiers_reply_, 0, 0);
    v56 = v42->_daemonInterface;
    v57 = (void *)MEMORY[0x1E0C99E60];
    v58 = objc_opt_class();
    objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v56, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_fetchStoredVisitsWithOptions_reply_, 0, 0);

    v60 = v42->_daemonInterface;
    v61 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    objc_msgSend(v61, "setWithObjects:", v62, v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v60, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_fetchFamiliarityIndexResultsWithOptions_reply_, 0, 0);

    v65 = v42->_daemonInterface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v65, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_fetchAuthorizedLocationStatus_, 0, 0);

    v67 = v42->_daemonInterface;
    v68 = (void *)MEMORY[0x1E0C99E60];
    v69 = objc_opt_class();
    objc_msgSend(v68, "setWithObjects:", v69, objc_opt_class(), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v67, "setClasses:forSelector:argumentIndex:ofReply:", v70, sel_fetchTripSegmentsWithOptions_reply_, 0, 0);

    v71 = v42->_daemonInterface;
    v72 = (void *)MEMORY[0x1E0C99E60];
    v73 = objc_opt_class();
    objc_msgSend(v72, "setWithObjects:", v73, objc_opt_class(), 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v71, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_fetchLocationsCountForTripSegmentWithOptions_reply_, 0, 0);

    v75 = v42->_daemonInterface;
    v76 = (void *)MEMORY[0x1E0C99E60];
    v77 = objc_opt_class();
    objc_msgSend(v76, "setWithObjects:", v77, objc_opt_class(), 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v75, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_fetchLocationsForTripSegmentWithOptions_reply_, 0, 0);

    v79 = v42->_daemonInterface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v79, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_deleteTripSegmentWithUUID_reply_, 0, 0);

    v81 = v42->_daemonInterface;
    v82 = (void *)MEMORY[0x1E0C99E60];
    v83 = objc_opt_class();
    objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v81, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_fetchTripSegmentMetadataWithOptions_reply_, 0, 0);

    v85 = v42->_daemonInterface;
    v86 = (void *)MEMORY[0x1E0C99E60];
    v87 = objc_opt_class();
    objc_msgSend(v86, "setWithObjects:", v87, objc_opt_class(), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v85, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_fetchVehiclesWithOptions_reply_, 0, 0);

    v89 = v42->_daemonInterface;
    v90 = (void *)MEMORY[0x1E0C99E60];
    v91 = objc_opt_class();
    objc_msgSend(v90, "setWithObjects:", v91, objc_opt_class(), 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v89, "setClasses:forSelector:argumentIndex:ofReply:", v92, sel_fetchProximityHistoryFromEventIDs_completionHandler_, 0, 0);

    v93 = v42->_daemonInterface;
    v94 = (void *)MEMORY[0x1E0C99E60];
    v95 = objc_opt_class();
    objc_msgSend(v94, "setWithObjects:", v95, objc_opt_class(), 0);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v93, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_fetchPeopleCountEventsHistory_completionHandler_, 0, 0);

    v97 = v42->_daemonInterface;
    v98 = (void *)MEMORY[0x1E0C99E60];
    v99 = objc_opt_class();
    objc_msgSend(v98, "setWithObjects:", v99, objc_opt_class(), 0);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v97, "setClasses:forSelector:argumentIndex:ofReply:", v100, sel_fetchContactScoresFromContactIDs_completionHandler_, 0, 0);

    v101 = v42->_daemonInterface;
    v102 = (void *)MEMORY[0x1E0C99E60];
    v103 = objc_opt_class();
    objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v101, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_addElevations_handler_, 0, 0);

    v105 = v42->_daemonInterface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v105, "setClasses:forSelector:argumentIndex:ofReply:", v106, sel_fetchElevationsWithOptions_reply_, 0, 0);

    v107 = v42->_daemonInterface;
    v108 = (void *)MEMORY[0x1E0C99E60];
    v109 = objc_opt_class();
    objc_msgSend(v108, "setWithObjects:", v109, objc_opt_class(), 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v107, "setClasses:forSelector:argumentIndex:ofReply:", v110, sel_addBackgroundInertialOdometrySamples_reply_, 0, 0);

    v111 = v42->_daemonInterface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v111, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_fetchBackgroundInertialOdometrySamplesWithOptions_reply_, 0, 0);

    -[RTXPCListener setup](v42, "setup");
  }

  return v42;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  v3 = (void *)MEMORY[0x1E0C99E08];
  +[RTClientListener persistedClientsPath](RTClientListener, "persistedClientsPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTClientListener setPersistedClients:](self, "setPersistedClients:", v5);

  -[RTClientListener persistedClients](self, "persistedClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (-[RTClientListener persistedClients](self, "persistedClients"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("$archiver")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = (void *)objc_opt_new();
    -[RTClientListener setPersistedClients:](self, "setPersistedClients:", v9);

  }
  -[RTClientListener persistedClients](self, "persistedClients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __26__RTClientListener__setup__block_invoke;
  v12[3] = &unk_1E92A4B50;
  v12[4] = self;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

  v11.receiver = self;
  v11.super_class = (Class)RTClientListener;
  -[RTXPCListener _setup](&v11, sel__setup);
}

void __26__RTClientListener__setup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  RTDaemonClient *v8;
  RTDaemonClient *v9;

  v4 = a3;
  v8 = [RTDaemonClient alloc];
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD **)(a1 + 32);
  v9 = -[RTDaemonClient initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:](v8, "initWithQueue:restorationData:accountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:", v5, v4, v6[37], v6[26], v6[17], v6[46], v6[43], v6[18], v6[19], v6[32], v6[45], v6[31],
         v6[22],
         v6[23],
         v6[40],
         v6[20],
         v6[27],
         v6[47],
         v6[33],
         v6[34],
         v6[29],
         v6[30],
         v6[28],
         v6[42],
         v6[38],
         v6[39],
         v6[36],
         v6[35],
         v6[21],
         v6[14],
         v6[44],
         v6[25],
         v6[15],
         v6[16],
         v6[24],
         v6[41]);

  -[RTDaemonClient setClientManagerDelegate:](v9, "setClientManagerDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "disconnectedClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v9);

}

void __47__RTClientListener__setupConnection_forClient___block_invoke(uint64_t a1)
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

void __47__RTClientListener__setupConnection_forClient___block_invoke_272(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "executableName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc invalidation", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);
  objc_msgSend(WeakRetained, "setProcessIdentifier:", 0);
  objc_msgSend(WeakRetained, "setExecutablePath:", 0);
  objc_msgSend(WeakRetained, "clientManagerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleDisconnectionForDaemonClient:", WeakRetained);

}

- (id)handleRestorationForDaemonClient:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[4];
  id v39;
  _BYTE *v40;
  uint8_t v41[4];
  id v42;
  __int16 v43;
  void *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "restorationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "restorationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "rehydrate any existing session for client, %@, restoration identifier, %@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v46 = __Block_byref_object_copy__149;
    v47 = __Block_byref_object_dispose__149;
    v48 = 0;
    -[RTXPCListener disconnectedClients](self, "disconnectedClients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __53__RTClientListener_handleRestorationForDaemonClient___block_invoke;
    v38[3] = &unk_1E92A4B78;
    v10 = v4;
    v39 = v10;
    v40 = buf;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v38);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      objc_msgSend(v10, "xpcConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTClientListener _setupConnection:forClient:](self, "_setupConnection:forClient:", v11, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      -[RTXPCListener disconnectedClients](self, "disconnectedClients");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      -[RTXPCListener connectedClients](self, "connectedClients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

      -[RTXPCListener connectedClients](self, "connectedClients");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObject:", v10);

      objc_msgSend(v10, "setXpcConnection:", 0);
      objc_msgSend(v10, "shutdown");
      -[RTXPCListener logClients](self, "logClients");
      v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
    }
    else
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__149;
      v36 = __Block_byref_object_dispose__149;
      v37 = 0;
      -[RTXPCListener connectedClients](self, "connectedClients");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      v27 = 3221225472;
      v28 = __53__RTClientListener_handleRestorationForDaemonClient___block_invoke_2;
      v29 = &unk_1E92A4B78;
      v17 = v10;
      v30 = v17;
      v31 = &v32;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v26);

      v18 = v33[5];
      _rt_log_facility_get_os_log(RTLogFacilityConnection);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "restorationIdentifier", v26, v27, v28, v29);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v41 = 138412546;
          v42 = v17;
          v43 = 2112;
          v44 = v25;
          _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "client, %@, already rehydrated session for restoration identifier, %@, terminating connection, this is likely a programming error that multiple instances of RTRoutineManager from the same process are using the same restoration identifier", v41, 0x16u);

        }
        objc_msgSend(v17, "xpcConnection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "invalidate");

        objc_msgSend(v17, "shutdown");
        -[RTXPCListener connectedClients](self, "connectedClients");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObject:", v17);

        -[RTXPCListener logClients](self, "logClients");
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v17, "restorationIdentifier", v26, v27, v28, v29);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v41 = 138412290;
          v42 = v23;
          _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "client, %@, does not have any existing sessions", v41, 0xCu);

        }
      }

      _Block_object_dispose(&v32, 8);
      v15 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __53__RTClientListener_handleRestorationForDaemonClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "restorationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "restorationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __53__RTClientListener_handleRestorationForDaemonClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a2;
  if (*(id *)(a1 + 32) != v4)
  {
    v8 = v4;
    objc_msgSend(v4, "restorationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "restorationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    v4 = v8;
    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v4 = v8;
    }
  }

}

- (void)saveDaemonClient:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "restorationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "restorationIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "restorationData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138413058;
      v21 = v16;
      v22 = 2112;
      v23 = v5;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@%@, restorationIdentifier, %@, restorationData, %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_msgSend(v5, "restorationData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTClientListener persistedClients](self, "persistedClients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "restorationData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "restorationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v11);

    }
    else
    {
      objc_msgSend(v5, "restorationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v10);
    }

    -[RTClientListener persistedClients](self, "persistedClients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTClientListener persistedClientsPath](RTClientListener, "persistedClientsPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "writeToFile:atomically:", v13, 0);

    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v19 = CFSTR("NO");
      if (v14)
        v19 = CFSTR("YES");
      v20 = 138412290;
      v21 = v19;
      _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "success writing persisted clients, %@", (uint8_t *)&v20, 0xCu);
    }

  }
}

- (void)handleDisconnectionForDaemonClient:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "client disconnected, %@", (uint8_t *)&v9, 0xCu);
  }

  -[RTXPCListener connectedClients](self, "connectedClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  if (objc_msgSend(v4, "hasReasonToOutliveClientConnection"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "client, %@, has a reason outlive client connection", (uint8_t *)&v9, 0xCu);
    }

    -[RTXPCListener disconnectedClients](self, "disconnectedClients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  else
  {
    objc_msgSend(v4, "shutdown");
  }
  -[RTXPCListener logClients](self, "logClients");

}

- (NSMutableDictionary)persistedClients
{
  return self->_persistedClients;
}

- (void)setPersistedClients:(id)a3
{
  objc_storeStrong((id *)&self->_persistedClients, a3);
}

- (RTScenarioTriggerManager)scenarioTriggerManager
{
  return self->_scenarioTriggerManager;
}

- (void)setScenarioTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_scenarioTriggerManager, a3);
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLocationProvider, a3);
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setVehicleStore:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleStore, a3);
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

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocationPredictor, a3);
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (RTPurgeManager)purgeManager
{
  return self->_purgeManager;
}

- (void)setPurgeManager:(id)a3
{
  objc_storeStrong((id *)&self->_purgeManager, a3);
}

- (RTEventModelProvider)eventModelProvider
{
  return self->_eventModelProvider;
}

- (void)setEventModelProvider:(id)a3
{
  objc_storeStrong((id *)&self->_eventModelProvider, a3);
}

- (RTAuthorizedLocationManager)authorizedLocationManager
{
  return self->_authorizedLocationManager;
}

- (void)setAuthorizedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizedLocationManager, a3);
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitManager, a3);
}

- (RTTripSegmentManager)tripSegmentManager
{
  return self->_tripSegmentManager;
}

- (void)setTripSegmentManager:(id)a3
{
  objc_storeStrong((id *)&self->_tripSegmentManager, a3);
}

- (RTAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
  objc_storeStrong((id *)&self->_hintManager, a3);
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_locationStore, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTLocationContextManager)locationContextManager
{
  return self->_locationContextManager;
}

- (void)setLocationContextManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationContextManager, a3);
}

- (RTEventAgentManager)eventAgentManager
{
  return self->_eventAgentManager;
}

- (void)setEventAgentManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventAgentManager, a3);
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (void)setPlaceInferenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceManager, a3);
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, a3);
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprintManager, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTElevationManager)elevationManager
{
  return self->_elevationManager;
}

- (void)setElevationManager:(id)a3
{
  objc_storeStrong((id *)&self->_elevationManager, a3);
}

- (RTBackgroundInertialOdometryManager)backgroundInertialOdometryManager
{
  return self->_backgroundInertialOdometryManager;
}

- (void)setBackgroundInertialOdometryManager:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundInertialOdometryManager, a3);
}

- (RTIntermittentGNSSManager)intermittentGNSSManager
{
  return self->_intermittentGNSSManager;
}

- (void)setIntermittentGNSSManager:(id)a3
{
  objc_storeStrong((id *)&self->_intermittentGNSSManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intermittentGNSSManager, 0);
  objc_storeStrong((id *)&self->_backgroundInertialOdometryManager, 0);
  objc_storeStrong((id *)&self->_elevationManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_eventAgentManager, 0);
  objc_storeStrong((id *)&self->_locationContextManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_tripSegmentManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_persistedClients, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_frameworkInterface, 0);
}

+ (id)persistedClientsPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3620], "pathInCacheDirectory:", CFSTR("Clients.plist"));
}

@end
