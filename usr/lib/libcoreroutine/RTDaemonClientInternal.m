@implementation RTDaemonClientInternal

- (RTDaemonClientInternal)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_accountManager_assetManager_authorizationManager_buildingPolygonManager_deviceLocationPredictor_diagnostics_eventModelProvider_authorizedLocationManager_fingerprintManager_hintManager_intermittentGNSSManager_learnedLocationManager_learnedLocationStore_locationManager_locationStore_mapServiceManager_motionActivityManager_peopleDiscoveryProvider_persistenceManager_placeInferenceQueryStore_pointOfInterestSampler_purgeManager_safetyCacheStore_scenarioTriggerManager_vehicleLocationProvider_visitManager_workoutRouteManager_workoutScheduler_);
}

- (RTDaemonClientInternal)initWithQueue:(id)a3 accountManager:(id)a4 assetManager:(id)a5 authorizationManager:(id)a6 buildingPolygonManager:(id)a7 deviceLocationPredictor:(id)a8 diagnostics:(id)a9 eventModelProvider:(id)a10 authorizedLocationManager:(id)a11 fingerprintManager:(id)a12 hintManager:(id)a13 intermittentGNSSManager:(id)a14 learnedLocationManager:(id)a15 learnedLocationStore:(id)a16 locationManager:(id)a17 locationStore:(id)a18 mapServiceManager:(id)a19 motionActivityManager:(id)a20 peopleDiscoveryProvider:(id)a21 persistenceManager:(id)a22 placeInferenceQueryStore:(id)a23 pointOfInterestSampler:(id)a24 purgeManager:(id)a25 safetyCacheStore:(id)a26 scenarioTriggerManager:(id)a27 vehicleLocationProvider:(id)a28 visitManager:(id)a29 workoutRouteManager:(id)a30 workoutScheduler:(id)a31
{
  id v36;
  void *v37;
  RTDaemonClientInternal *v38;
  RTDaemonClientInternal *v39;
  uint64_t v40;
  RTEntitlementProvider *entitlementProvider;
  RTDaemonClientInternal *v42;
  RTDaemonClientInternal *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  const char *v52;
  id v55;
  id v56;
  id v57;
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
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  objc_super v86;
  uint8_t buf[16];

  v85 = a3;
  v55 = a4;
  v60 = a4;
  v36 = a5;
  v68 = a6;
  v84 = a7;
  v83 = a8;
  v82 = a9;
  v81 = a10;
  v80 = a11;
  v79 = a12;
  v78 = a13;
  v77 = a14;
  v76 = a15;
  v75 = a16;
  v74 = a17;
  v59 = a18;
  v73 = a19;
  v72 = a20;
  v71 = a21;
  v70 = a22;
  v69 = a23;
  v67 = a24;
  v66 = a25;
  v57 = a26;
  v65 = a27;
  v64 = a28;
  v63 = a29;
  v62 = a30;
  v61 = a31;
  if (!v85)
  {
    v47 = v36;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v43 = 0;
    v44 = 0;
    v45 = v60;
    goto LABEL_35;
  }
  v56 = v36;
  if (!v36)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

      v43 = 0;
      v44 = v85;
      v45 = v60;
      v47 = v56;
LABEL_35:
      v37 = v68;
LABEL_74:
      v42 = self;
      v46 = v59;
      goto LABEL_75;
    }
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: assetManager";
LABEL_49:
    _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, v52, buf, 2u);
    goto LABEL_34;
  }
  v37 = v68;
  if (!v68)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: authorizationManager";
LABEL_72:
    _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, v51, buf, 2u);
    goto LABEL_73;
  }
  if (!v84)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: buildingPolygonManager";
    goto LABEL_72;
  }
  if (!v83)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: deviceLocationPredictor";
    goto LABEL_72;
  }
  if (!v82)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_72;
  }
  if (!v81)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: eventModelProvider";
    goto LABEL_72;
  }
  if (!v80)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: authorizedLocationManager";
    goto LABEL_72;
  }
  if (!v79)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_72;
  }
  if (!v78)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_72;
  }
  if (!v77)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: intermittentGNSSManager";
    goto LABEL_72;
  }
  if (!v76)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_72;
  }
  if (!v75)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_72;
  }
  if (!v74)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_72;
  }
  if (!v73)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_72;
  }
  if (!v72)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_72;
  }
  if (!v71)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: peopleDiscoveryProvider";
    goto LABEL_72;
  }
  if (!v70)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v51 = "Invalid parameter not satisfying: persistenceManager";
    goto LABEL_72;
  }
  if (!v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = "Invalid parameter not satisfying: placeInferenceQueryStore";
      goto LABEL_72;
    }
LABEL_73:

    v43 = 0;
    v44 = v85;
    v45 = v60;
    v47 = v56;
    goto LABEL_74;
  }
  if (!v67)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: pointOfInterestSampler";
    goto LABEL_49;
  }
  if (!v66)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: purgeManager";
    goto LABEL_49;
  }
  if (!v65)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: scenarioTriggerManager";
    goto LABEL_49;
  }
  if (!v64)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: vehicleLocationProvider";
    goto LABEL_49;
  }
  if (!v63)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: visitManager";
    goto LABEL_49;
  }
  if (!v62)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: workoutRouteManager";
    goto LABEL_49;
  }
  if (!v61)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: workoutScheduler";
    goto LABEL_49;
  }
  v86.receiver = self;
  v86.super_class = (Class)RTDaemonClientInternal;
  v38 = -[RTDaemonClientInternal init](&v86, sel_init);
  v39 = v38;
  if (v38)
  {
    objc_storeStrong((id *)&v38->_queue, a3);
    objc_storeStrong((id *)&v39->_accountManager, v55);
    objc_storeStrong((id *)&v39->_assetManager, a5);
    objc_storeStrong((id *)&v39->_authorizationManager, a6);
    objc_storeStrong((id *)&v39->_buildingPolygonManager, a7);
    objc_storeStrong((id *)&v39->_deviceLocationPredictor, a8);
    objc_storeStrong((id *)&v39->_diagnostics, a9);
    objc_storeStrong((id *)&v39->_eventModelProvider, a10);
    objc_storeStrong((id *)&v39->_authorizedLocationManager, a11);
    objc_storeStrong((id *)&v39->_fingerprintManager, a12);
    objc_storeStrong((id *)&v39->_hintManager, a13);
    objc_storeStrong((id *)&v39->_intermittentGNSSManager, a14);
    objc_storeStrong((id *)&v39->_learnedLocationManager, a15);
    objc_storeStrong((id *)&v39->_learnedLocationStore, a16);
    objc_storeStrong((id *)&v39->_locationManager, a17);
    objc_storeStrong((id *)&v39->_locationStore, a18);
    objc_storeStrong((id *)&v39->_mapServiceManager, a19);
    objc_storeStrong((id *)&v39->_motionActivityManager, a20);
    objc_storeStrong((id *)&v39->_peopleDiscoveryProvider, a21);
    objc_storeStrong((id *)&v39->_persistenceManager, a22);
    objc_storeStrong((id *)&v39->_placeInferenceQueryStore, a23);
    objc_storeStrong((id *)&v39->_pointOfInterestSampler, a24);
    objc_storeStrong((id *)&v39->_purgeManager, a25);
    objc_storeStrong((id *)&v39->_scenarioTriggerManager, a27);
    objc_storeStrong((id *)&v39->_vehicleLocationProvider, a28);
    objc_storeStrong((id *)&v39->_visitManager, a29);
    objc_storeStrong((id *)&v39->_workoutRouteManager, a30);
    objc_storeStrong((id *)&v39->_workoutScheduler, a31);
    objc_storeStrong((id *)&v39->_safetyCacheStore, a26);
    +[RTEntitlementProvider internalDaemonProtocolEntitlementProvider](RTEntitlementProvider, "internalDaemonProtocolEntitlementProvider");
    v40 = objc_claimAutoreleasedReturnValue();
    entitlementProvider = v39->_entitlementProvider;
    v39->_entitlementProvider = (RTEntitlementProvider *)v40;

  }
  v42 = v39;
  v43 = v42;
  v44 = v85;
  v46 = v59;
  v45 = v60;
  v47 = v56;
  v37 = v68;
LABEL_75:

  return v43;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTDaemonClientInternal executablePath](self, "executablePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTDaemonClientInternal processIdentifier](self, "processIdentifier");
  -[RTDaemonClientInternal signingIdentifier](self, "signingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%d), %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
  RTDaemonClientInternal *v25;
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
  v29[3] = __Block_byref_object_copy__71;
  v29[4] = __Block_byref_object_dispose__71;
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
  block[2] = __62__RTDaemonClientInternal_connection_handleInvocation_isReply___block_invoke;
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

void __62__RTDaemonClientInternal_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  _BYTE buf[12];
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "invoke");
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      v38 = 2112;
      v39 = v12;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "client, %@, called, %@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "protocol");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "conformsToProtocol:", v7);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "exportedInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replyBlockSignatureForSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    +[RTXPC executablePathOfConnection:](RTXPC, "executablePathOfConnection:", *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "clientConnection:satisfiesEntitlementRequirementsForInvocation:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    if (v10)
    {
      if ((v15 & 1) != 0)
      {
        v16 = objc_msgSend(*(id *)(a1 + 32), "blockArgumentIndex");
        *(_QWORD *)buf = 0;
        objc_msgSend(*(id *)(a1 + 32), "getArgument:atIndex:", buf, v16);
        NSStringFromSelector((SEL)objc_msgSend(*(id *)(a1 + 32), "selector"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(*(id *)buf, "copy");
        objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
        v31 = v17;
        v32 = v4;
        v33 = v18;
        v19 = v18;
        v20 = v17;
        v34 = (id)__NSMakeSpecialForwardingCaptureBlock();
        objc_msgSend(*(id *)(a1 + 32), "setArgument:atIndex:", &v34, v16);
        objc_msgSend(*(id *)(a1 + 32), "invoke");
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = 0;

      }
      else
      {
        v35 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not entitled for this operation."), v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v28 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 3, v26);
        objc_msgSend(*(id *)(a1 + 48), "rejectInvocation:withError:replyTypes:", *(_QWORD *)(a1 + 32), v28, v10);
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v30 = *(void **)(v29 + 40);
        *(_QWORD *)(v29 + 40) = 0;

      }
    }
    else
    {
      if (v15)
        objc_msgSend(*(id *)(a1 + 32), "invoke");
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = 0;

    }
  }
}

void __62__RTDaemonClientInternal_connection_handleInvocation_isReply___block_invoke_320(_QWORD *a1, void *a2)
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
  _rt_log_facility_get_os_log(RTLogFacilityClient);
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

- (void)setXpcConnection:(id)a3
{
  id v5;
  id *p_xpcConnection;
  NSXPCConnection *xpcConnection;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSXPCConnection *v68;
  uint64_t v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  id location;

  v5 = a3;
  p_xpcConnection = (id *)&self->_xpcConnection;
  objc_storeStrong((id *)&self->_xpcConnection, a3);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[RTDaemonClientInternal queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](xpcConnection, "_setQueue:", v8);

    v9 = self->_xpcConnection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC9E7B8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v9, "setExportedInterface:", v10);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exportedInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_injectLocations_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exportedInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_extendLifetimeOfVisitsWithIdentifiers_toExpireOn_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "exportedInterface");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_expireLifetimeOfVisitsWithIdentifiers_expirationDate_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "exportedInterface");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_storeHints_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "exportedInterface");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_fetchBuildingPolygonsFromLocations_radius_limit_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "exportedInterface");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_fetchBuildingPolygonsFromLocations_radius_limit_reply_, 0, 1);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "exportedInterface");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_injectPeopleDensityStats_duration_date_advertisements_handler_, 3, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "exportedInterface");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "exportedInterface");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1E0C99E60];
    v52 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply_, 0, 1);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "exportedInterface");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_fetchPointOfInterestsAroundCoordinate_radius_reply_, 0, 0);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "exportedInterface");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)MEMORY[0x1E0C99E60];
    v60 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_fetchPointOfInterestsAroundCoordinate_radius_reply_, 0, 1);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "exportedInterface");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_fetchPointOfInterestAttributesWithIdentifier_reply_, 0, 1);

    -[RTDaemonClientInternal xpcConnection](self, "xpcConnection");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "exportedInterface");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setClasses:forSelector:argumentIndex:ofReply:", v67, sel_fetchCurrentLocationWithReply_, 0, 1);

    objc_initWeak(&location, self);
    v68 = self->_xpcConnection;
    v69 = MEMORY[0x1E0C809B0];
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __43__RTDaemonClientInternal_setXpcConnection___block_invoke;
    v73[3] = &unk_1E92983E8;
    objc_copyWeak(&v74, &location);
    -[NSXPCConnection setInterruptionHandler:](v68, "setInterruptionHandler:", v73);
    v70 = *p_xpcConnection;
    v71[0] = v69;
    v71[1] = 3221225472;
    v71[2] = __43__RTDaemonClientInternal_setXpcConnection___block_invoke_518;
    v71[3] = &unk_1E92983E8;
    objc_copyWeak(&v72, &location);
    objc_msgSend(v70, "setInvalidationHandler:", v71);
    objc_msgSend(*p_xpcConnection, "resume");
    objc_destroyWeak(&v72);
    objc_destroyWeak(&v74);
    objc_destroyWeak(&location);
  }

}

void __43__RTDaemonClientInternal_setXpcConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = WeakRetained;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc interruption", (uint8_t *)&v3, 0xCu);
  }

}

void __43__RTDaemonClientInternal_setXpcConnection___block_invoke_518(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _rt_log_facility_get_os_log(RTLogFacilityConnection);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = WeakRetained;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc invalidation", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "setXpcConnection:", 0);
}

- (void)fetchDataVaultPath:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  NSObject *v4;
  void *v5;
  uint8_t v6[8];
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, void *))a3;
  if (v3)
  {
    v7 = *MEMORY[0x1E0CB2D50];
    v8[0] = CFSTR("This operation is unsupported on this platform.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }

}

- (void)fetchPathToBackupWithReply:(id)a3
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
    -[RTDaemonClientInternal diagnostics](self, "diagnostics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__RTDaemonClientInternal_fetchPathToBackupWithReply___block_invoke;
    v8[3] = &unk_1E929DF48;
    v10 = a2;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v6, "fetchPathToBackupWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __53__RTDaemonClientInternal_fetchPathToBackupWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138413058;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, reply to client, %@, pathToBackup, %@, error, %@", (uint8_t *)&v10, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchAllLocationsOfInterestWithReply:(id)a3
{
  id v5;
  void *v6;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke;
    v9[3] = &unk_1E9297E70;
    v9[4] = self;
    v11 = a2;
    v10 = v5;
    -[RTLearnedLocationManager fetchAllLocationsOfInterestWithHandler:](learnedLocationManager, "fetchAllLocationsOfInterestWithHandler:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke_2;
  block[3] = &unk_1E9297910;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v15 = v8;
  v16 = v6;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v5;
  dispatch_async(v7, block);

}

void __63__RTDaemonClientInternal_fetchAllLocationsOfInterestWithReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v9 = 138413058;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest to client, %@, error, %@", (uint8_t *)&v9, 0x2Au);

  }
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, *(_QWORD *)(a1 + 48));

}

- (void)forceSequentialClusterIdentification:(id)a3
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
    -[RTDaemonClientInternal learnedLocationManager](self, "learnedLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "trainForReason:mode:handler:", 2, 1, v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __63__RTDaemonClientInternal_forceSequentialClusterIdentification___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)injectLocationOfInterest:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  RTLearnedLocationOfInterest *v10;
  RTLearnedLocationManager *learnedLocationManager;
  RTDaemonClientInternal *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[RTLearnedLocationOfInterest initWithLocationOfInterest:creationDate:]([RTLearnedLocationOfInterest alloc], "initWithLocationOfInterest:creationDate:", v7, v9);
    learnedLocationManager = self->_learnedLocationManager;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke;
    v13[3] = &unk_1E9298100;
    v13[4] = self;
    v15 = a2;
    v14 = v8;
    v12 = self;
    -[RTLearnedLocationManager addLocationOfInterest:handler:](learnedLocationManager, "addLocationOfInterest:handler:", v10, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __57__RTDaemonClientInternal_injectLocationOfInterest_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)injectVisit:(id)a3 locationOfInterest:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  RTLearnedVisit *v14;
  RTLearnedLocationOfInterest *v15;
  RTLearnedLocationManager *learnedLocationManager;
  RTDaemonClientInternal *v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateByAddingTimeInterval:](v12, "dateByAddingTimeInterval:", 2419200.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[RTLearnedVisit initWithVisit:locationOfInterest:creationDate:expirationDate:]([RTLearnedVisit alloc], "initWithVisit:locationOfInterest:creationDate:expirationDate:", v9, v10, v12, v13);
    v15 = -[RTLearnedLocationOfInterest initWithLocationOfInterest:creationDate:]([RTLearnedLocationOfInterest alloc], "initWithLocationOfInterest:creationDate:", v10, v12);
    learnedLocationManager = self->_learnedLocationManager;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke;
    v18[3] = &unk_1E9298100;
    v18[4] = self;
    v20 = a2;
    v19 = v11;
    v17 = self;
    -[RTLearnedLocationManager addVisit:locationOfInterest:handler:](learnedLocationManager, "addVisit:locationOfInterest:handler:", v14, v15, v18);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __63__RTDaemonClientInternal_injectVisit_locationOfInterest_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchStoredLocationsCountFromDate:(id)a3 toDate:(id)a4 uncertainty:(double)a5 limit:(unint64_t)a6 reply:(id)a7
{
  id v13;
  id v14;
  id v15;
  RTLocationManager *locationManager;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  double v23;
  unint64_t v24;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a7;
  if (v15)
  {
    locationManager = self->_locationManager;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke;
    v18[3] = &unk_1E929DF98;
    v18[4] = self;
    v22 = a2;
    v19 = v13;
    v20 = v14;
    v23 = a5;
    v24 = a6;
    v21 = v15;
    -[RTLocationManager fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:](locationManager, "fetchStoredLocationsCountFromDate:toDate:uncertainty:limit:handler:", v19, v20, a6, v18, a5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke_2;
  block[3] = &unk_1E929DF70;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 64);
  v17 = a2;
  block[4] = v7;
  block[1] = 3221225472;
  v12 = v8;
  v9 = *(id *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 80);
  v13 = v9;
  v14 = v5;
  v15 = *(id *)(a1 + 56);
  v10 = v5;
  dispatch_async(v6, block);

}

uint64_t __91__RTDaemonClientInternal_fetchStoredLocationsCountFromDate_toDate_uncertainty_limit_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 80);
    v7 = *(_QWORD *)(a1 + 88);
    v8 = *(_QWORD *)(a1 + 96);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v12 = 138414082;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    v16 = 2048;
    v17 = v6;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v9;
    v22 = 2048;
    v23 = v7;
    v24 = 2048;
    v25 = v8;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, %lu location fromDate, %@, toDate, %@, uncertainty, %.2f, limit, %lu, error, %@", (uint8_t *)&v12, 0x52u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)fetchLocationsOfInterestWithVisitsWithinDistance:(id)a3 location:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  RTLearnedLocationStore *learnedLocationStore;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint8_t *v32;
  SEL v33;
  uint8_t v34[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
    {
      *(_QWORD *)v34 = 0;
      v35 = v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__71;
      v38 = __Block_byref_object_dispose__71;
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v14, v15);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v16, "UTF8String");
      v39 = (id)os_transaction_create();

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v41 = v26;
        v42 = 2112;
        v43 = v27;
        _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);

      }
      learnedLocationStore = self->_learnedLocationStore;
      objc_msgSend(v9, "doubleValue");
      v20 = v19;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke;
      v28[3] = &unk_1E929DFE8;
      v28[4] = self;
      v33 = a2;
      v29 = v9;
      v30 = v10;
      v31 = v11;
      v32 = v34;
      -[RTLearnedLocationStore fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:](learnedLocationStore, "fetchLocationsOfInterestWithVisitsWithinDistance:location:handler:", v30, v28, v20);

      _Block_object_dispose(v34, 8);
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = CFSTR("distance cannot be nil");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v34, 2u);
    }

  }
}

void __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke_2;
  v13[3] = &unk_1E929DFC0;
  v21 = *(_QWORD *)(a1 + 72);
  v14 = v5;
  v15 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v9;
  v10 = *(id *)(a1 + 56);
  v18 = v6;
  v19 = v10;
  v20 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, v13);

}

void __90__RTDaemonClientInternal_fetchLocationsOfInterestWithVisitsWithinDistance_location_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    objc_msgSend(*(id *)(a1 + 40), "doubleValue");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 48), "coordinateToString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v13 = 138413314;
    v14 = v3;
    v15 = 2048;
    v16 = v4;
    v17 = 2048;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, sending %lu locations of interest within %.2fm of %@ to client, %@", (uint8_t *)&v13, 0x34u);

  }
  v9 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0D183C0], "locationsOfInterestFromLearnedLocationsOfInterest:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, *(_QWORD *)(a1 + 64));

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

- (void)fetchVisitsWithReply:(id)a3
{
  id v4;
  void *v5;
  RTLearnedLocationStore *learnedLocationStore;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    learnedLocationStore = self->_learnedLocationStore;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__RTDaemonClientInternal_fetchVisitsWithReply___block_invoke;
    v8[3] = &unk_1E9299760;
    v9 = v4;
    -[RTLearnedLocationStore fetchVisitsWithHandler:](learnedLocationStore, "fetchVisitsWithHandler:", v8);
    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __47__RTDaemonClientInternal_fetchVisitsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
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
        v14 = objc_alloc(MEMORY[0x1E0D183D8]);
        v15 = (void *)objc_msgSend(v14, "initWithRTLearnedVisit:", v13, (_QWORD)v16);
        if (v15)
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

- (void)forceRelabeling:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTLearnedLocationManager forceRelabeling:](self->_learnedLocationManager, "forceRelabeling:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)forcePlaceTypeClassificationWithReply:(id)a3
{
  id v4;
  void *v5;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__RTDaemonClientInternal_forcePlaceTypeClassificationWithReply___block_invoke;
    v8[3] = &unk_1E9297568;
    v9 = v4;
    -[RTLearnedLocationManager classifyPlaceTypesWithHandler:](learnedLocationManager, "classifyPlaceTypesWithHandler:", v8);
    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

uint64_t __64__RTDaemonClientInternal_forcePlaceTypeClassificationWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)simulateScenarioTrigger:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  RTScenarioTriggerManager *scenarioTriggerManager;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    scenarioTriggerManager = self->_scenarioTriggerManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke;
    v10[3] = &unk_1E929E010;
    v10[4] = self;
    v11 = v6;
    -[RTScenarioTriggerManager simulateScenarioTrigger:handler:](scenarioTriggerManager, "simulateScenarioTrigger:handler:", a3, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke_2;
  block[3] = &unk_1E9298DC0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __56__RTDaemonClientInternal_simulateScenarioTrigger_reply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)forceUpdateAssetMetadataWithReply:(id)a3
{
  id v4;
  void *v5;
  RTAssetManager *assetManager;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    assetManager = self->_assetManager;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__RTDaemonClientInternal_forceUpdateAssetMetadataWithReply___block_invoke;
    v8[3] = &unk_1E9297568;
    v9 = v4;
    -[RTAssetManager forceUpdateAssetMetadataWithHandler:](assetManager, "forceUpdateAssetMetadataWithHandler:", v8);
    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

uint64_t __60__RTDaemonClientInternal_forceUpdateAssetMetadataWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateAssetServerURL:(id)a3 assetType:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  RTAssetManager *assetManager;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    assetManager = self->_assetManager;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke;
    v12[3] = &unk_1E9299358;
    v12[4] = self;
    v13 = v8;
    -[RTAssetManager updateAssetServerURL:assetType:handler:](assetManager, "updateAssetServerURL:assetType:handler:", a3, a4, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke_2;
  v7[3] = &unk_1E9297678;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __63__RTDaemonClientInternal_updateAssetServerURL_assetType_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)forceEventModelRefreshWithReply:(id)a3
{
  id v4;
  void *v5;
  RTEventModelProvider *eventModelProvider;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    eventModelProvider = self->_eventModelProvider;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke;
    v8[3] = &unk_1E9299358;
    v8[4] = self;
    v9 = v4;
    -[RTEventModelProvider refreshAllLOIHistogramsWithHandler:](eventModelProvider, "refreshAllLOIHistogramsWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke_2;
  v7[3] = &unk_1E9297678;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __58__RTDaemonClientInternal_forceEventModelRefreshWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)injectLocations:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  RTLocationManager *locationManager;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    locationManager = self->_locationManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__RTDaemonClientInternal_injectLocations_reply___block_invoke;
    v10[3] = &unk_1E9299358;
    v10[4] = self;
    v11 = v6;
    -[RTLocationManager injectLocations:handler:](locationManager, "injectLocations:handler:", a3, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __48__RTDaemonClientInternal_injectLocations_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__RTDaemonClientInternal_injectLocations_reply___block_invoke_2;
  v7[3] = &unk_1E9297678;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __48__RTDaemonClientInternal_injectLocations_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)storeHints:(id)a3 reply:(id)a4
{
  id v6;
  RTHintManager *hintManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  hintManager = self->_hintManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__RTDaemonClientInternal_storeHints_reply___block_invoke;
  v9[3] = &unk_1E9297568;
  v10 = v6;
  v8 = v6;
  -[RTHintManager storeHints:handler:](hintManager, "storeHints:handler:", a3, v9);

}

uint64_t __43__RTDaemonClientInternal_storeHints_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)injectSignalForSignalGeneratorOptions:(id)a3 reply:(id)a4
{
  id v6;
  void *v7;
  RTLocationManager *locationManager;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint8_t buf[16];

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    locationManager = self->_locationManager;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__RTDaemonClientInternal_injectSignalForSignalGeneratorOptions_reply___block_invoke;
    v10[3] = &unk_1E9297568;
    v11 = v6;
    +[RTSignalGenerator injectSignalForSignalGeneratorOptions:locationManager:handler:](RTSignalGenerator, "injectSignalForSignalGeneratorOptions:locationManager:handler:", a3, locationManager, v10);
    v9 = v11;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

uint64_t __70__RTDaemonClientInternal_injectSignalForSignalGeneratorOptions_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearAllLocationsOfInterestWithReply:(id)a3
{
  id v4;
  void *v5;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke;
    v8[3] = &unk_1E9299358;
    v8[4] = self;
    v9 = v4;
    -[RTLearnedLocationManager removeAllLocationsOfInterestWithHandler:](learnedLocationManager, "removeAllLocationsOfInterestWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke_2;
  v7[3] = &unk_1E9297678;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __63__RTDaemonClientInternal_clearAllLocationsOfInterestWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateTransitionWithIdentifier:(id)a3 modeOfTransportation:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTLearnedLocationManager updateTransitionWithIdentifier:motionActivityType:handler:](self->_learnedLocationManager, "updateTransitionWithIdentifier:motionActivityType:handler:", v8, objc_msgSend(MEMORY[0x1E0D183D0], "motionActivityTypeFromModeOfTransportation:", a4), v9);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v11, 2u);
    }

  }
}

- (void)reconstructTransitionsWithReply:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTLearnedLocationManager reconstructTransitionsWithHandler:](self->_learnedLocationManager, "reconstructTransitionsWithHandler:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)simulateVisit:(id)a3 reply:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (a4)
  {
    -[RTVisitManager simulateVisit:handler:](self->_visitManager, "simulateVisit:handler:", a3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }

  }
}

- (void)fetchVisitsBetweenStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  RTVisitManager *visitManager;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    visitManager = self->_visitManager;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__RTDaemonClientInternal_fetchVisitsBetweenStartDate_endDate_reply___block_invoke;
    v12[3] = &unk_1E9297EE0;
    v12[4] = self;
    v13 = v8;
    -[RTVisitManager fetchVisitsFromDate:toDate:handler:](visitManager, "fetchVisitsFromDate:toDate:handler:", a3, a4, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __68__RTDaemonClientInternal_fetchVisitsBetweenStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v5, "count");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 134218242;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "sending %lu visits to client, %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)injectRealtimeVisit:(id)a3 reply:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (a4)
  {
    -[RTVisitManager injectRealtimeVisit:handler:](self->_visitManager, "injectRealtimeVisit:handler:", a3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v5, 2u);
    }

  }
}

- (void)submitHintAtLocation:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t v13[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (v7)
  {
    if (v6)
    {
      -[RTHintManager submitHintFromSource:location:](self->_hintManager, "submitHintFromSource:location:", -1, v6);
      v7[2](v7, 0);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D18598];
      v14 = *MEMORY[0x1E0CB2D50];
      v15[0] = CFSTR("Valid location required.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v12);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v13, 2u);
    }

  }
}

- (void)fetchFusionCandidatesForVisitIdentifier:(id)a3 reply:(id)a4
{
  id v7;
  void *v8;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__RTDaemonClientInternal_fetchFusionCandidatesForVisitIdentifier_reply___block_invoke;
    v11[3] = &unk_1E929E078;
    v13 = a2;
    v12 = v7;
    -[RTLearnedLocationManager fetchFusionCandidatesForVisitIdentifier:handler:](learnedLocationManager, "fetchFusionCandidatesForVisitIdentifier:handler:", a3, v11);
    v10 = v12;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __72__RTDaemonClientInternal_fetchFusionCandidatesForVisitIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _RTMap *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v11, 0xCu);

  }
  if (v6)
  {
    v9 = 0;
  }
  else
  {
    v10 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v5);
    -[_RTMap withBlock:](v10, "withBlock:", &__block_literal_global_57);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __72__RTDaemonClientInternal_fetchFusionCandidatesForVisitIdentifier_reply___block_invoke_538(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0D183C0];
  v3 = a2;
  objc_msgSend(v3, "secondObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "typeFromPlaceType:", objc_msgSend(v4, "unsignedIntegerValue"));

  v6 = objc_alloc(MEMORY[0x1E0D18408]);
  objc_msgSend(v3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFirstObject:secondObject:", v7, v8);

  return v9;
}

- (void)fetchInferredMapItemForVisitIdentifier:(id)a3 reply:(id)a4
{
  id v7;
  void *v8;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke;
    v11[3] = &unk_1E929E0C8;
    v11[4] = self;
    v13 = a2;
    v12 = v7;
    -[RTLearnedLocationManager fetchInferredMapItemForVisitIdentifier:handler:](learnedLocationManager, "fetchInferredMapItemForVisitIdentifier:handler:", a3, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E929E0A0;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __71__RTDaemonClientInternal_fetchInferredMapItemForVisitIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)queryProvider:(id)a3 options:(id)a4 reply:(id)a5
{
  id v9;
  void *v10;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    learnedLocationManager = self->_learnedLocationManager;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke;
    v13[3] = &unk_1E9297E70;
    v13[4] = self;
    v15 = a2;
    v14 = v9;
    -[RTLearnedLocationManager queryProvider:options:handler:](learnedLocationManager, "queryProvider:options:handler:", a3, a4, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke_2;
  block[3] = &unk_1E929E0A0;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __54__RTDaemonClientInternal_queryProvider_options_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchFingerprintsWithOptions:(id)a3 reply:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, NSObject *);
  RTFingerprintManager *fingerprintManager;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(id, _QWORD, NSObject *);
  SEL v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, NSObject *))a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[RTDaemonClientInternal fetchFingerprintsWithOptions:reply:]";
      v24 = 1024;
      v25 = 873;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("requires valid options.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
    v12 = objc_claimAutoreleasedReturnValue();

    v8[2](v8, 0, v12);
LABEL_9:

    goto LABEL_10;
  }
  fingerprintManager = self->_fingerprintManager;
  objc_msgSend(v7, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "settledState");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke;
  v17[3] = &unk_1E9297E70;
  v17[4] = self;
  v19 = a2;
  v18 = v8;
  -[RTFingerprintManager fetchFingerprintsInDateInterval:filteredBySettledState:handler:](fingerprintManager, "fetchFingerprintsInDateInterval:filteredBySettledState:handler:", v10, v11, v17);

LABEL_10:
}

void __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke_2;
  block[3] = &unk_1E929E0A0;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__RTDaemonClientInternal_fetchFingerprintsWithOptions_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchWiFiAccessPointsForFingerprint:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  RTFingerprintManager *fingerprintManager;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTDaemonClientInternal fetchWiFiAccessPointsForFingerprint:reply:]";
      v23 = 1024;
      v24 = 899;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint (in %s:%d)", buf, 0x12u);
    }

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("requires a valid fingerprint.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 7, v15);
    v11 = objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, NSObject *))v9)[2](v9, 0, v11);
LABEL_9:

    goto LABEL_10;
  }
  fingerprintManager = self->_fingerprintManager;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke;
  v16[3] = &unk_1E9297E70;
  v16[4] = self;
  v18 = a2;
  v17 = v8;
  -[RTFingerprintManager fetchWifiAccessPointsForFingerprint:handler:](fingerprintManager, "fetchWifiAccessPointsForFingerprint:handler:", v7, v16);

LABEL_10:
}

void __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke_2;
  block[3] = &unk_1E929E0A0;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __68__RTDaemonClientInternal_fetchWiFiAccessPointsForFingerprint_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)injectFingerprintWithIdentifier:(id)a3 settledState:(unint64_t)a4 start:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  RTFingerprintManager *fingerprintManager;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  NSObject *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (!v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[RTDaemonClientInternal injectFingerprintWithIdentifier:settledState:start:reply:]";
        v38 = 1024;
        v39 = 926;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
      }

    }
    if (a4 >= 3)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[RTDaemonClientInternal injectFingerprintWithIdentifier:settledState:start:reply:]";
        v38 = 1024;
        v39 = 927;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTScenarioTriggerSettledStateIsValid(settledState) (in %s:%d)", buf, 0x12u);
      }

      if (v12)
      {
LABEL_8:
        if (v11)
          goto LABEL_9;
        goto LABEL_20;
      }
    }
    else if (v12)
    {
      goto LABEL_8;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTDaemonClientInternal injectFingerprintWithIdentifier:settledState:start:reply:]";
      v38 = 1024;
      v39 = 928;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: start (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_9:
      if (a4 >= 3)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0D18598];
        v32 = *MEMORY[0x1E0CB2D50];
        v33 = CFSTR("requires a valid settledState.");
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v33;
        v24 = &v32;
      }
      else
      {
        if (v12)
        {
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18398]), "initWithIdentifier:settledState:start:accessPoints:", v11, a4, v12, 0);
          fingerprintManager = self->_fingerprintManager;
          v29 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke;
          v26[3] = &unk_1E9298100;
          v26[4] = self;
          v28 = a2;
          v27 = v13;
          -[RTFingerprintManager injectFingerprints:handler:](fingerprintManager, "injectFingerprints:handler:", v17, v26);

          goto LABEL_24;
        }
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0D18598];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = CFSTR("requires a valid start.");
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v31;
        v24 = &v30;
      }
LABEL_23:
      objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v25);
      v15 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, NSObject *))v13 + 2))(v13, v15);
      goto LABEL_24;
    }
LABEL_20:
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("requires a valid identifier.");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v35;
    v24 = &v34;
    goto LABEL_23;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
  }
LABEL_24:

}

void __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke_2;
  block[3] = &unk_1E929E0F0;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __83__RTDaemonClientInternal_injectFingerprintWithIdentifier_settledState_start_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)injectFingerprintWithSettledState:(BOOL)a3 start:(id)a4 reply:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  RTFingerprintManager *fingerprintManager;
  void *v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  uint8_t buf[16];
  _QWORD v21[2];

  v6 = a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (v6)
      v11 = 2;
    else
      v11 = 1;
    v12 = objc_alloc(MEMORY[0x1E0D18398]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithIdentifier:settledState:start:accessPoints:", v13, v11, v9, 0);

    fingerprintManager = self->_fingerprintManager;
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke;
    v17[3] = &unk_1E9298100;
    v17[4] = self;
    v19 = a2;
    v18 = v10;
    -[RTFingerprintManager injectFingerprints:handler:](fingerprintManager, "injectFingerprints:handler:", v16, v17);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke_2;
  block[3] = &unk_1E929E0F0;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __72__RTDaemonClientInternal_injectFingerprintWithSettledState_start_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)injectWiFiAccessPointWithMac:(id)a3 rssi:(int64_t)a4 channel:(int64_t)a5 age:(double)a6 date:(id)a7 reply:(id)a8
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  RTFingerprintManager *fingerprintManager;
  void *v20;
  _QWORD v21[5];
  id v22;
  SEL v23;
  uint8_t buf[16];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v17 = a8;
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18580]), "initWithMac:rssi:channel:age:date:", v15, a4, a5, v16, a6);
    fingerprintManager = self->_fingerprintManager;
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke;
    v21[3] = &unk_1E9298100;
    v21[4] = self;
    v23 = a2;
    v22 = v17;
    -[RTFingerprintManager injectWifiAccessPointsToLastFingerprint:handler:](fingerprintManager, "injectWifiAccessPointsToLastFingerprint:handler:", v20, v21);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke_2;
  block[3] = &unk_1E929E0F0;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __83__RTDaemonClientInternal_injectWiFiAccessPointWithMac_rssi_channel_age_date_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, done", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)logDatabasesWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTDaemonClientInternal learnedLocationManager](self, "learnedLocationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke;
    v7[3] = &unk_1E9299358;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "logDatabasesWithHandler:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke_2;
  v7[3] = &unk_1E9297678;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __48__RTDaemonClientInternal_logDatabasesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)logSafetyCacheWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTDaemonClientInternal safetyCacheStore](self, "safetyCacheStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke;
    v7[3] = &unk_1E9299358;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "logStoreWithHandler:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke_2;
  v9[3] = &unk_1E9297678;
  v5 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  dispatch_async(v4, v9);

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, v7, v8);
}

uint64_t __50__RTDaemonClientInternal_logSafetyCacheWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)performExportMirroringRequest:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTPersistenceManager performExportMirroringRequest:](self->_persistenceManager, "performExportMirroringRequest:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)performImportMirroringRequest:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTPersistenceManager performImportMirroringRequest:](self->_persistenceManager, "performImportMirroringRequest:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)performZoneResetMirroringRequest:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTPersistenceManager performZoneResetMirroringRequest:](self->_persistenceManager, "performZoneResetMirroringRequest:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)mirroringDelegateSetupState:(id)a3
{
  id v4;
  void *v5;
  RTPersistenceManager *persistenceManager;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    persistenceManager = self->_persistenceManager;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__RTDaemonClientInternal_mirroringDelegateSetupState___block_invoke;
    v8[3] = &unk_1E929E118;
    v9 = v4;
    -[RTPersistenceManager mirroringDelegateSetupState:](persistenceManager, "mirroringDelegateSetupState:", v8);
    v7 = v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

uint64_t __54__RTDaemonClientInternal_mirroringDelegateSetupState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tearDownPersistenceStack:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (a3)
  {
    -[RTPersistenceManager tearDownPersistenceStack:](self->_persistenceManager, "tearDownPersistenceStack:");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v4, 2u);
    }

  }
}

- (void)fetchFMCEnabledWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[RTDaemonClientInternal vehicleLocationProvider](self, "vehicleLocationProvider");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchFMCEnabledWithHandler:](v5, "fetchFMCEnabledWithHandler:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }

}

- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 reply:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTMotionActivityManager *motionActivityManager;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  SEL v18;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    motionActivityManager = self->_motionActivityManager;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__RTDaemonClientInternal_fetchMotionActivitiesFromStartDate_endDate_reply___block_invoke;
    v14[3] = &unk_1E92980D8;
    v18 = a2;
    v14[4] = self;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionActivityManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v15, v16, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __75__RTDaemonClientInternal_fetchMotionActivitiesFromStartDate_endDate_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(v5, "count");
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = 138413570;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, reply to client, %@, %lu activites from startDate, %@, to endDate, %@, error, %@", (uint8_t *)&v13, 0x3Eu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)submitMetrics:(id)a3 metricName:(id)a4 reply:(id)a5
{
  id v7;
  NSString *v8;
  _QWORD *v9;
  Class v10;
  objc_class *v11;
  NSObject *v12;
  id v13;
  id v14;
  void (*v15)(_QWORD *, id);
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  void *v21;
  char v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[8];
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (NSString *)a4;
  v9 = a5;
  if (v9)
  {
    v10 = NSClassFromString(v8);
    if (v10)
    {
      v11 = v10;
      if ((-[objc_class conformsToProtocol:](v10, "conformsToProtocol:", &unk_1EFC71BB0) & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_alloc_init(v11);
          v26 = 0;
          -[NSObject setAllMetrics:error:](v12, "setAllMetrics:error:", v7, &v26);
          v13 = v26;
          if (v13)
          {
            v14 = v13;
            v15 = (void (*)(_QWORD *, id))v9[2];
          }
          else
          {
            v25 = 0;
            v22 = -[NSObject submitMetricsWithError:](v12, "submitMetricsWithError:", &v25);
            v14 = v25;
            v15 = (void (*)(_QWORD *, id))v9[2];
            if ((v22 & 1) != 0)
            {
              v23 = v9;
              v24 = 0;
LABEL_17:
              v15(v23, v24);

              goto LABEL_13;
            }
          }
          v23 = v9;
          v24 = v14;
          goto LABEL_17;
        }
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0D18598];
        v28 = *MEMORY[0x1E0CB2D50];
        v29 = CFSTR("metric provided is not a subclass of RTMetric");
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = &v29;
        v20 = &v28;
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v17 = *MEMORY[0x1E0D18598];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = CFSTR("metric provided does not conform to RTMetricProtocol");
        v18 = (void *)MEMORY[0x1E0C99D80];
        v19 = &v31;
        v20 = &v30;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR("metric class cannot be nil");
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = (const __CFString **)v33;
      v20 = &v32;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v21);
    v12 = objc_claimAutoreleasedReturnValue();

    ((void (*)(_QWORD *, NSObject *))v9[2])(v9, v12);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }
LABEL_13:

}

- (void)submitTransitMetricsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[RTLearnedLocationManager learnedLocationEngine](self->_learnedLocationManager, "learnedLocationEngine");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject performTransitAnalyticsWithHandler:](v5, "performTransitAnalyticsWithHandler:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }

}

- (void)expireLifetimeOfVisitsWithIdentifiers:(id)a3 expirationDate:(id)a4 reply:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  if (a5)
  {
    -[RTLearnedLocationStore expireLifetimeOfVisitsWithIdentifiers:expirationDate:handler:](self->_learnedLocationStore, "expireLifetimeOfVisitsWithIdentifiers:expirationDate:handler:", a3, a4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)extendLifetimeOfVisitsWithIdentifiers:(id)a3 toExpireOn:(id)a4 reply:(id)a5
{
  NSObject *v5;
  uint8_t v6[16];

  if (a5)
  {
    -[RTLearnedLocationStore updateExpirationDateOfVisitsWithIdentifiers:expirationDate:allowThresholdBypass:handler:](self->_learnedLocationStore, "updateExpirationDateOfVisitsWithIdentifiers:expirationDate:allowThresholdBypass:handler:", a3, a4, 1, a5);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }

  }
}

- (void)forceProcessWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 reply:(id)a11
{
  _BOOL4 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  _BOOL4 v31;
  unint64_t v32;
  SEL v33;
  _QWORD block[5];
  id v35;
  id v36;
  SEL v37;
  _QWORD v38[5];
  id v39;
  NSObject *v40;
  _QWORD v41[5];
  id v42;
  NSObject *v43;
  uint8_t buf[16];

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v20 = a11;
  if (v20)
  {
    v31 = v13;
    v32 = a9;
    v33 = a2;
    v21 = dispatch_group_create();
    v22 = (void *)objc_opt_new();
    if (v16)
    {
      dispatch_group_enter(v21);
      -[RTDaemonClientInternal workoutScheduler](self, "workoutScheduler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke;
      v41[3] = &unk_1E929DDD0;
      v41[4] = self;
      v42 = v22;
      v43 = v21;
      objc_msgSend(v23, "clearTaskStatesWithHandler:", v41);

    }
    dispatch_group_enter(v21);
    -[RTDaemonClientInternal workoutRouteManager](self, "workoutRouteManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_3;
    v38[3] = &unk_1E929DDD0;
    v38[4] = self;
    v26 = v22;
    v39 = v26;
    v40 = v21;
    v27 = v21;
    LOBYTE(v30) = a10;
    objc_msgSend(v24, "processWorkoutsClearClusters:clearExistingDistanceMatrix:buildDistanceMatrix:syncClustersToHealhtKit:syncClustersToWatch:filteringDistanceThreshold:topNWorkouts:isSchedulerTriggered:handler:", v17, v16, v15, v14, v31, v32, a8, v30, v38);

    -[RTDaemonClientInternal queue](self, "queue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = v25;
    block[1] = 3221225472;
    block[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_5;
    block[3] = &unk_1E9297590;
    v37 = v33;
    block[4] = self;
    v35 = v26;
    v36 = v20;
    v29 = v26;
    dispatch_group_notify(v27, v28, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_2;
  block[3] = &unk_1E9299D78;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, block);

}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_3(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_4;
  block[3] = &unk_1E9299D78;
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v5 = v3;
  dispatch_async(v4, block);

}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_4(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __219__RTDaemonClientInternal_forceProcessWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_reply___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, errors, %@", (uint8_t *)&v8, 0x20u);

  }
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

- (void)displayWorkoutDistanceRecordsWithHandler:(id)a3
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
    -[RTDaemonClientInternal workoutRouteManager](self, "workoutRouteManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "displayWorkoutDistanceRecordsWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __67__RTDaemonClientInternal_displayWorkoutDistanceRecordsWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)updateRelevanceScoresWithReply:(id)a3
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
    -[RTDaemonClientInternal workoutRouteManager](self, "workoutRouteManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "updateRelevanceScoresWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __57__RTDaemonClientInternal_updateRelevanceScoresWithReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)processNewlyAddedWorkout:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
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
    v12 = "Invalid parameter not satisfying: newlyAddedWorkoutUUID";
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
    v12 = "Invalid parameter not satisfying: reply";
    goto LABEL_10;
  }
  -[RTDaemonClientInternal workoutRouteManager](self, "workoutRouteManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke;
  v13[3] = &unk_1E9298100;
  v13[4] = self;
  v15 = a2;
  v14 = v9;
  objc_msgSend(v10, "processNewlyAddedWorkout:handler:", v7, v13);

LABEL_8:
}

void __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __57__RTDaemonClientInternal_processNewlyAddedWorkout_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)deleteWorkout:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
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
    v12 = "Invalid parameter not satisfying: workoutUUID";
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
    v12 = "Invalid parameter not satisfying: reply";
    goto LABEL_10;
  }
  -[RTDaemonClientInternal workoutRouteManager](self, "workoutRouteManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke;
  v13[3] = &unk_1E9298100;
  v13[4] = self;
  v15 = a2;
  v14 = v9;
  objc_msgSend(v10, "deleteWorkout:handler:", v7, v13);

LABEL_8:
}

void __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __46__RTDaemonClientInternal_deleteWorkout_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchBuildingPolygonsFromLocations:(id)a3 radius:(double)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  uint8_t buf[16];

  v11 = a3;
  v12 = a6;
  if (v12)
  {
    -[RTDaemonClientInternal buildingPolygonManager](self, "buildingPolygonManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke;
    v15[3] = &unk_1E9297E70;
    v15[4] = self;
    v17 = a2;
    v16 = v12;
    objc_msgSend(v13, "fetchClosestBuildingPolygonsFromLocations:radius:limit:handler:", v11, a5, v15, a4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke_2;
  block[3] = &unk_1E9298750;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __80__RTDaemonClientInternal_fetchBuildingPolygonsFromLocations_radius_limit_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchIntermittentGNSSRegistrationStateWithReply:(id)a3
{
  id v5;
  void *v6;
  RTIntermittentGNSSManager *intermittentGNSSManager;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    intermittentGNSSManager = self->_intermittentGNSSManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__RTDaemonClientInternal_fetchIntermittentGNSSRegistrationStateWithReply___block_invoke;
    v9[3] = &unk_1E9297740;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    -[RTIntermittentGNSSManager fetchIntermittentGNSSRegistrationStateWithHandler:](intermittentGNSSManager, "fetchIntermittentGNSSRegistrationStateWithHandler:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __74__RTDaemonClientInternal_fetchIntermittentGNSSRegistrationStateWithReply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v10 = 138412802;
    v11 = v7;
    if ((_DWORD)a2)
      v9 = CFSTR("YES");
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, reply to client, %@, RTIntermittentGNSSRegistered, %@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);

}

- (void)updateIntermittentGNSSRegistrationOverrideState:(unint64_t)a3 reply:(id)a4
{
  id v7;
  void *v8;
  RTIntermittentGNSSManager *intermittentGNSSManager;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  unint64_t v14;
  uint8_t buf[16];

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    intermittentGNSSManager = self->_intermittentGNSSManager;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__RTDaemonClientInternal_updateIntermittentGNSSRegistrationOverrideState_reply___block_invoke;
    v11[3] = &unk_1E929E140;
    v13 = a2;
    v14 = a3;
    v11[4] = self;
    v12 = v7;
    -[RTIntermittentGNSSManager updateIntermittentGNSSRegistrationOverrideState:handler:](intermittentGNSSManager, "updateIntermittentGNSSRegistrationOverrideState:handler:", a3, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __80__RTDaemonClientInternal_updateIntermittentGNSSRegistrationOverrideState_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    +[RTIntermittentGNSSManager overrideStateToString:](RTIntermittentGNSSManager, "overrideStateToString:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, reply to client, %@, client set intermittent gnss overrideState, %@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)injectProximityEvent:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  RTDaemonClientInternal *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v9, "peopleDiscoveryProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke;
    v11[3] = &unk_1E9298100;
    v11[4] = v9;
    v13 = a2;
    v12 = v8;
    objc_msgSend(v10, "addProximityEvent:handler:", v7, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __55__RTDaemonClientInternal_injectProximityEvent_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)injectPeopleDiscoveryAdv:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  RTDaemonClientInternal *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v9, "peopleDiscoveryProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke;
    v11[3] = &unk_1E9298100;
    v11[4] = v9;
    v13 = a2;
    v12 = v8;
    objc_msgSend(v10, "injectAdv:handler:", v7, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __59__RTDaemonClientInternal_injectPeopleDiscoveryAdv_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeAllProximityEvent:(id)a3
{
  id v5;
  RTDaemonClientInternal *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v6 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v6, "peopleDiscoveryProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = v6;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v7, "clearProximityEvents:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __50__RTDaemonClientInternal_removeAllProximityEvent___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)injectPeopleDensityBundle:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  RTDaemonClientInternal *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v9, "peopleDiscoveryProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke;
    v11[3] = &unk_1E9298100;
    v11[4] = v9;
    v13 = a2;
    v12 = v8;
    objc_msgSend(v10, "addPeopleDensityBundle:handler:", v7, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __60__RTDaemonClientInternal_injectPeopleDensityBundle_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)injectPeopleDensityStats:(unint64_t)a3 duration:(double)a4 date:(id)a5 advertisements:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  RTDaemonClientInternal *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  uint8_t buf[16];

  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    v16 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v16, "peopleDiscoveryProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke;
    v18[3] = &unk_1E9298100;
    v18[4] = v16;
    v20 = a2;
    v19 = v15;
    objc_msgSend(v17, "injectPeopleDensityStats:duration:date:advertisements:handler:", a3, v13, v14, v18, a4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v16->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __88__RTDaemonClientInternal_injectPeopleDensityStats_duration_date_advertisements_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeAllPeopleDensityBundles:(id)a3
{
  id v5;
  RTDaemonClientInternal *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v6 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v6, "peopleDiscoveryProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = v6;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v7, "clearPeopleDensityBundles:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __56__RTDaemonClientInternal_removeAllPeopleDensityBundles___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)computeContactScores:(id)a3
{
  id v5;
  RTDaemonClientInternal *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v6 = self;
    -[RTDaemonClientInternal peopleDiscoveryProvider](v6, "peopleDiscoveryProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__RTDaemonClientInternal_computeContactScores___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = v6;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v7, "computeContactScores:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = (RTDaemonClientInternal *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v6->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __47__RTDaemonClientInternal_computeContactScores___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTDaemonClientInternal_computeContactScores___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __47__RTDaemonClientInternal_computeContactScores___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchAuthorizedLocations:(id)a3
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
    -[RTDaemonClientInternal authorizedLocationManager](self, "authorizedLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke;
    v8[3] = &unk_1E9297E70;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "fetchAuthorizedLocations:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke_2;
  block[3] = &unk_1E9298750;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

uint64_t __51__RTDaemonClientInternal_fetchAuthorizedLocations___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchAuthorizedLocationExtendedStatus:(id)a3
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
    -[RTDaemonClientInternal authorizedLocationManager](self, "authorizedLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke;
    v8[3] = &unk_1E929E190;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "fetchAuthorizedLocationExtendedStatus:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  uint64_t v18;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke_2;
  block[3] = &unk_1E929E168;
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v17 = v13;
  v16 = v7;
  v18 = a3;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, block);

}

uint64_t __64__RTDaemonClientInternal_fetchAuthorizedLocationExtendedStatus___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)forceAuthorizedLocationEraseInstallInitialization:(id)a3
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
    -[RTDaemonClientInternal authorizedLocationManager](self, "authorizedLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke;
    v8[3] = &unk_1E9297740;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "runEraseInstallDatabaseInitialization:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[5];
  id v11;
  __int128 v12;
  char v13;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke_2;
  block[3] = &unk_1E929E1B8;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v12 = v9;
  v13 = a2;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __76__RTDaemonClientInternal_forceAuthorizedLocationEraseInstallInitialization___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)eraseVisitLogDatabase:(id)a3
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
    -[RTDaemonClientInternal authorizedLocationManager](self, "authorizedLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke;
    v8[3] = &unk_1E9298100;
    v8[4] = self;
    v10 = a2;
    v9 = v5;
    objc_msgSend(v6, "eraseVisitLogDatabase:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke_2;
  block[3] = &unk_1E9297590;
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v5 = (id)v7;
  v10 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __48__RTDaemonClientInternal_eraseVisitLogDatabase___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)fetchVisitLogsWithDateInterval:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  RTAuthorizedLocationVisitLogFetchOptions *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = -[RTAuthorizedLocationVisitLogFetchOptions initWithAscending:dateInterval:limit:]([RTAuthorizedLocationVisitLogFetchOptions alloc], "initWithAscending:dateInterval:limit:", 0, v7, 0);
    -[RTDaemonClientInternal authorizedLocationManager](self, "authorizedLocationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke;
    v11[3] = &unk_1E9297E70;
    v11[4] = self;
    v13 = a2;
    v12 = v8;
    objc_msgSend(v10, "fetchVisitLogsWithOptions:handler:", v9, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = (RTAuthorizedLocationVisitLogFetchOptions *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, &v9->super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

void __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  _QWORD block[5];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke_2;
  block[3] = &unk_1E9298750;
  block[4] = *(_QWORD *)(a1 + 32);
  v20 = v6;
  v18 = *(_OWORD *)(a1 + 40);
  v15 = (id)v18;
  v22 = v18;
  v21 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(v14, block);

}

uint64_t __63__RTDaemonClientInternal_fetchVisitLogsWithDateInterval_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchPlaceInferenceQueriesWithDateInterval:(id)a3 ascending:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (v10)
  {
    -[RTDaemonClientInternal placeInferenceQueryStore](self, "placeInferenceQueryStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke;
    v13[3] = &unk_1E9297E70;
    v13[4] = self;
    v15 = a2;
    v14 = v10;
    objc_msgSend(v11, "fetchPlaceInferenceQueriesWithDateInterval:ascending:handler:", v9, v6, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke_2;
  block[3] = &unk_1E9299090;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __85__RTDaemonClientInternal_fetchPlaceInferenceQueriesWithDateInterval_ascending_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)startSamplingPointOfInterestWithInterval:(double)a3 handler:(id)a4
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  RTDaemonClientInternal *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  if (v7)
  {
    -[RTDaemonClientInternal pointOfInterestSampler](self, "pointOfInterestSampler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClientInternal executablePath](self, "executablePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startSamplingPointOfInterestFromRequester:samplingInterval:", v10, a3);

    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = self;
      v18 = 2112;
      v19 = 0;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v14, 0x20u);

    }
    v7[2](v7, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v14, 2u);
    }

  }
}

- (void)stopSamplingPointOfInterest:(id)a3
{
  void (**v5)(id, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  RTDaemonClientInternal *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  if (v5)
  {
    -[RTDaemonClientInternal pointOfInterestSampler](self, "pointOfInterestSampler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTDaemonClientInternal executablePath](self, "executablePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopSamplingPointOfInterestFromRequester:", v8);

    _rt_log_facility_get_os_log(RTLogFacilityClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = self;
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v12, 0x20u);

    }
    v5[2](v5, 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 reply:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    -[RTDaemonClientInternal mapServiceManager](self, "mapServiceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke;
    v13[3] = &unk_1E9297E70;
    v13[4] = self;
    v15 = a2;
    v14 = v10;
    objc_msgSend(v11, "fetchPointOfInterestsAroundCoordinate:radius:options:handler:", v9, 0, v13, a4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke_2;
  block[3] = &unk_1E9299090;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__RTDaemonClientInternal_fetchPointOfInterestsAroundCoordinate_radius_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 reply:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    -[RTDaemonClientInternal mapServiceManager](self, "mapServiceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke;
    v10[3] = &unk_1E929E1E0;
    v10[4] = self;
    v12 = a2;
    v11 = v7;
    objc_msgSend(v8, "fetchPointOfInterestAttributesWithIdentifier:options:handler:", a3, 0, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }

  }
}

void __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke_2;
  block[3] = &unk_1E9299090;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__RTDaemonClientInternal_fetchPointOfInterestAttributesWithIdentifier_reply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityClient);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, reply to client, %@, error, %@", (uint8_t *)&v6, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)fetchCurrentLocationWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[RTDaemonClientInternal locationManager](self, "locationManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject fetchCurrentLocationWithHandler:](v5, "fetchCurrentLocationWithHandler:", v4);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", v6, 2u);
    }
  }

}

- (void)periodicPurgeWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTDaemonClientInternal purgeManager](self, "purgeManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__RTDaemonClientInternal_periodicPurgeWithReply___block_invoke;
    v7[3] = &unk_1E9297568;
    v8 = v4;
    objc_msgSend(v5, "purge:", v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: reply", buf, 2u);
    }
  }

}

uint64_t __49__RTDaemonClientInternal_periodicPurgeWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void)setExecutablePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (void)setSigningIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTEntitlementProvider)entitlementProvider
{
  return self->_entitlementProvider;
}

- (void)setEntitlementProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementProvider, a3);
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

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, a3);
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
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
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_scenarioTriggerManager, 0);
  objc_storeStrong((id *)&self->_purgeManager, 0);
  objc_storeStrong((id *)&self->_pointOfInterestSampler, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
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
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_buildingPolygonManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_entitlementProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
