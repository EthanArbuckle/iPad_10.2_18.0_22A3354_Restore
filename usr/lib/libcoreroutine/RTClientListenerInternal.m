@implementation RTClientListenerInternal

- (RTClientListenerInternal)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountManager_assetManager_authorizationManager_buildingPolygonManager_deviceLocationPredictor_diagnostics_eventAgentManager_eventModelProvider_authorizedLocationManager_fingerprintManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationStore_mapServiceManager_motionActivityManager_peopleDiscoveryProvider_persistenceManager_placeInferenceQueryStore_platform_pointOfInterestSampler_purgeManager_safetyCacheStore_scenarioTriggerManager_vehicleLocationProvider_visitManager_workoutRouteManager_workoutScheduler_);
}

- (RTClientListenerInternal)initWithAccountManager:(id)a3 assetManager:(id)a4 authorizationManager:(id)a5 buildingPolygonManager:(id)a6 deviceLocationPredictor:(id)a7 diagnostics:(id)a8 eventAgentManager:(id)a9 eventModelProvider:(id)a10 authorizedLocationManager:(id)a11 fingerprintManager:(id)a12 hintManager:(id)a13 intermittentGNSSManager:(id)a14 learnedLocationManager:(id)a15 learnedLocationStore:(id)a16 locationManager:(id)a17 locationStore:(id)a18 mapServiceManager:(id)a19 motionActivityManager:(id)a20 peopleDiscoveryProvider:(id)a21 persistenceManager:(id)a22 placeInferenceQueryStore:(id)a23 platform:(id)a24 pointOfInterestSampler:(id)a25 purgeManager:(id)a26 safetyCacheStore:(id)a27 scenarioTriggerManager:(id)a28 vehicleLocationProvider:(id)a29 visitManager:(id)a30 workoutRouteManager:(id)a31 workoutScheduler:(id)a32
{
  id v37;
  RTClientListenerInternal *v38;
  id *p_isa;
  RTClientListenerInternal *v40;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
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
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  objc_super v75;

  v73 = a3;
  v54 = a4;
  v53 = a5;
  v52 = a6;
  v42 = a7;
  v51 = a7;
  v43 = a8;
  v50 = a8;
  v49 = a9;
  v72 = a10;
  v71 = a11;
  v70 = a12;
  v69 = a13;
  v68 = a14;
  v48 = a15;
  v67 = a16;
  v66 = a17;
  v65 = a18;
  v47 = a19;
  v64 = a20;
  v63 = a21;
  v46 = a22;
  v62 = a23;
  v37 = a24;
  v61 = a25;
  v60 = a26;
  v59 = a27;
  v58 = a28;
  v57 = a29;
  v56 = a30;
  v55 = a31;
  v45 = a32;
  if (objc_msgSend(v37, "internalInstall"))
  {
    v75.receiver = self;
    v75.super_class = (Class)RTClientListenerInternal;
    v38 = -[RTXPCListener initWithMachServiceName:](&v75, sel_initWithMachServiceName_, CFSTR("com.apple.routined.internal"));
    p_isa = (id *)&v38->super.super.super.isa;
    if (v38)
    {
      objc_storeStrong((id *)&v38->_accountManager, a3);
      objc_storeStrong(p_isa + 12, a4);
      objc_storeStrong(p_isa + 13, a5);
      objc_storeStrong(p_isa + 14, a6);
      objc_storeStrong(p_isa + 15, v42);
      objc_storeStrong(p_isa + 16, v43);
      objc_storeStrong(p_isa + 17, a9);
      objc_storeStrong(p_isa + 18, a10);
      objc_storeStrong(p_isa + 19, a11);
      objc_storeStrong(p_isa + 20, a12);
      objc_storeStrong(p_isa + 21, a13);
      objc_storeStrong(p_isa + 22, a14);
      objc_storeStrong(p_isa + 23, a15);
      objc_storeStrong(p_isa + 24, a16);
      objc_storeStrong(p_isa + 25, a17);
      objc_storeStrong(p_isa + 26, a18);
      objc_storeStrong(p_isa + 27, a19);
      objc_storeStrong(p_isa + 28, a20);
      objc_storeStrong(p_isa + 30, a21);
      objc_storeStrong(p_isa + 29, a22);
      objc_storeStrong(p_isa + 31, a23);
      objc_storeStrong(p_isa + 33, a24);
      objc_storeStrong(p_isa + 32, a25);
      objc_storeStrong(p_isa + 34, a26);
      objc_storeStrong(p_isa + 35, a28);
      objc_storeStrong(p_isa + 36, a29);
      objc_storeStrong(p_isa + 37, a30);
      objc_storeStrong(p_isa + 39, a31);
      objc_storeStrong(p_isa + 40, a32);
      objc_storeStrong(p_isa + 41, a27);
      objc_msgSend(p_isa, "setup");
    }
    v40 = p_isa;
    self = v40;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)handleClientConnection:(id)a3
{
  id v4;
  void *v5;
  RTDaemonClientInternal *v6;
  void *v7;
  void *v8;
  void *v9;
  RTDaemonClientInternal *v11;

  v4 = a3;
  v11 = [RTDaemonClientInternal alloc];
  -[RTXPCListener queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RTDaemonClientInternal initWithQueue:accountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:](v11, "initWithQueue:accountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:", v5, self->_accountManager, self->_assetManager, self->_authorizationManager, self->_buildingPolygonManager, self->_deviceLocationPredictor, self->_diagnostics, self->_eventModelProvider, self->_authorizedLocationManager, self->_fingerprintManager, self->_hintManager, self->_intermittentGNSSManager, self->_learnedLocationManager,
         self->_learnedLocationStore,
         self->_locationManager,
         self->_locationStore,
         self->_mapServiceManager,
         self->_motionActivityManager,
         self->_peopleDiscoveryProvider,
         self->_persistenceManager,
         self->_placeInferenceQueryStore,
         self->_pointOfInterestSampler,
         self->_purgeManager,
         self->_safetyCacheStore,
         self->_scenarioTriggerManager,
         self->_vehicleLocationProvider,
         self->_visitManager,
         self->_workoutRouteManager,
         self->_workoutScheduler);

  +[RTXPC executablePathOfConnection:](RTXPC, "executablePathOfConnection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDaemonClientInternal setExecutablePath:](v6, "setExecutablePath:", v7);

  -[RTDaemonClientInternal setProcessIdentifier:](v6, "setProcessIdentifier:", objc_msgSend(v4, "processIdentifier"));
  +[RTXPC signingIdentifierOfConnection:](RTXPC, "signingIdentifierOfConnection:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTDaemonClientInternal setSigningIdentifier:](v6, "setSigningIdentifier:", v8);

  -[RTDaemonClientInternal setXpcConnection:](v6, "setXpcConnection:", v4);
  -[RTDaemonClientInternal xpcConnection](v6, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v6);

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  int v16;
  void *v17;
  int v19;
  void *v20;
  int v21;
  _BYTE v22[18];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "incoming xpc connection is nil", (uint8_t *)&v21, 2u);
    }
    goto LABEL_15;
  }
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v19 = objc_msgSend(v7, "processIdentifier");
      -[RTXPCListener machServiceName](self, "machServiceName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 67109378;
      *(_DWORD *)v22 = v19;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v20;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "listener received incoming connection from pid %d, for service, %@", (uint8_t *)&v21, 0x12u);

    }
    -[RTClientListenerInternal handleClientConnection:](self, "handleClientConnection:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      -[RTXPCListener connectedClients](self, "connectedClients");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

      _rt_log_facility_get_os_log(RTLogFacilityConnection);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[RTXPCListener machServiceName](self, "machServiceName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        *(_QWORD *)v22 = v10;
        *(_WORD *)&v22[8] = 2112;
        *(_QWORD *)&v22[10] = v13;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "client connected, %@, to service, %@", (uint8_t *)&v21, 0x16u);

      }
      -[RTXPCListener logClients](self, "logClients");
      v14 = 1;
      goto LABEL_16;
    }
    _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v7, "processIdentifier");
      -[RTXPCListener machServiceName](self, "machServiceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 67109378;
      *(_DWORD *)v22 = v16;
      *(_WORD *)&v22[4] = 2112;
      *(_QWORD *)&v22[6] = v17;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "failed to create client for connection from pid, %d, for service, %@", (uint8_t *)&v21, 0x12u);

    }
    v10 = 0;
LABEL_15:
    v14 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (RTAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (RTAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTBuildingPolygonManager)buildingPolygonManager
{
  return self->_buildingPolygonManager;
}

- (void)setBuildingPolygonManager:(id)a3
{
  objc_storeStrong((id *)&self->_buildingPolygonManager, a3);
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocationPredictor, a3);
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (RTEventAgentManager)eventAgentManager
{
  return self->_eventAgentManager;
}

- (void)setEventAgentManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventAgentManager, a3);
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

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprintManager, a3);
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
  objc_storeStrong((id *)&self->_hintManager, a3);
}

- (RTIntermittentGNSSManager)intermittentGNSSManager
{
  return self->_intermittentGNSSManager;
}

- (void)setIntermittentGNSSManager:(id)a3
{
  objc_storeStrong((id *)&self->_intermittentGNSSManager, a3);
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

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTLocationStore)locationStore
{
  return self->_locationStore;
}

- (void)setLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_locationStore, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, a3);
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void)setPlaceInferenceQueryStore:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, a3);
}

- (RTPointOfInterestSampler)pointOfInterestSampler
{
  return self->_pointOfInterestSampler;
}

- (void)setPointOfInterestSampler:(id)a3
{
  objc_storeStrong((id *)&self->_pointOfInterestSampler, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTPurgeManager)purgeManager
{
  return self->_purgeManager;
}

- (void)setPurgeManager:(id)a3
{
  objc_storeStrong((id *)&self->_purgeManager, a3);
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

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitManager, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (RTWorkoutRouteManager)workoutRouteManager
{
  return self->_workoutRouteManager;
}

- (void)setWorkoutRouteManager:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRouteManager, a3);
}

- (RTWorkoutScheduler)workoutScheduler
{
  return self->_workoutScheduler;
}

- (void)setWorkoutScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_workoutScheduler, a3);
}

- (SMSafetyCacheStore)safetyCacheStore
{
  return self->_safetyCacheStore;
}

- (void)setSafetyCacheStore:(id)a3
{
  objc_storeStrong((id *)&self->_safetyCacheStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyCacheStore, 0);
  objc_storeStrong((id *)&self->_workoutScheduler, 0);
  objc_storeStrong((id *)&self->_workoutRouteManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_pointOfInterestSampler, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_intermittentGNSSManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_authorizedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_eventAgentManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_buildingPolygonManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
