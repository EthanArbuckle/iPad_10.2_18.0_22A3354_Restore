@implementation SMSuggestionsHelper

- (SMSuggestionsHelper)initWithAuthorizationManager:(id)a3 contactsManager:(id)a4 deviceLocationPredictor:(id)a5 distanceCalculator:(id)a6 healthKitManager:(id)a7 learnedLocationStore:(id)a8 learnedLocationManager:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 navigationManager:(id)a12 sessionStore:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SMSuggestionsHelper *v29;
  SMSuggestionsHelper *v30;
  RTLocation *latestLocationOfTheDevice;
  void *v32;
  void *v33;
  SMSuggestionsHelper *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v42;
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
  id v55;
  id v56;
  objc_super v57;
  uint8_t buf[16];

  v18 = a3;
  v45 = a4;
  v19 = a4;
  v46 = a5;
  v52 = a5;
  v47 = a6;
  v51 = a6;
  v48 = a7;
  v20 = a7;
  v49 = a8;
  v21 = a8;
  v22 = a9;
  v53 = a10;
  v56 = a11;
  v55 = a12;
  v23 = a13;
  v50 = v18;
  if (!v18)
  {
    v36 = v23;
    v24 = v19;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
    }

    v34 = 0;
    v35 = 0;
    v25 = v51;
    v26 = v52;
    v27 = v22;
    goto LABEL_21;
  }
  v24 = v19;
  if (!v19)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    v25 = v51;
    v26 = v52;
    v27 = v22;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactsManager", buf, 2u);
    }

    v34 = 0;
    v35 = v50;
LABEL_21:
    v28 = v53;
    goto LABEL_40;
  }
  v25 = v51;
  v26 = v52;
  v27 = v22;
  if (!v52)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    v28 = v53;
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: deviceLocationPredictor";
LABEL_38:
    _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_39;
  }
  v28 = v53;
  if (!v51)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_38;
  }
  if (!v20)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_38;
  }
  if (!v21)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_38;
  }
  if (!v27)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_38;
  }
  if (!v53)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_38;
  }
  if (!v56)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)buf = 0;
    v40 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_38;
  }
  if (!v55)
  {
    v36 = v23;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v40 = "Invalid parameter not satisfying: navigationManager";
      goto LABEL_38;
    }
LABEL_39:

    v34 = 0;
    v35 = v50;
    goto LABEL_40;
  }
  v43 = v23;
  if (v23)
  {
    v57.receiver = self;
    v57.super_class = (Class)SMSuggestionsHelper;
    v29 = -[RTNotifier init](&v57, sel_init);
    v30 = v29;
    if (v29)
    {
      objc_storeStrong((id *)&v29->_authorizationManager, a3);
      objc_storeStrong((id *)&v30->_contactsManager, v45);
      objc_storeStrong((id *)&v30->_deviceLocationPredictor, v46);
      objc_storeStrong((id *)&v30->_distanceCalculator, v47);
      objc_storeStrong((id *)&v30->_healthKitManager, v48);
      objc_storeStrong((id *)&v30->_learnedLocationStore, v49);
      objc_storeStrong((id *)&v30->_learnedLocationManager, a9);
      objc_storeStrong((id *)&v30->_locationManager, a10);
      objc_storeStrong((id *)&v30->_mapServiceManager, a11);
      objc_storeStrong((id *)&v30->_navigationManager, a12);
      objc_storeStrong((id *)&v30->_sessionStore, a13);
      latestLocationOfTheDevice = v30->_latestLocationOfTheDevice;
      v30->_latestLocationOfTheDevice = 0;

    }
    -[SMSuggestionsHelper authorizationManager](v30, "authorizationManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:", v30, sel_onAuthorizationNotification_, v33);

    v34 = v30;
    self = v34;
    v35 = v50;
    v28 = v53;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionStore", buf, 2u);
    }

    v34 = 0;
    v35 = v50;
  }
  v36 = v43;
LABEL_40:

  return v34;
}

- (void)_getFAFamilyMembersFromAAAFamilyWithHandler:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SMSuggestionsHelper__getFAFamilyMembersFromAAAFamilyWithHandler___block_invoke;
    v7[3] = &unk_1E929C260;
    v8 = v4;
    v9 = v3;
    v6 = v4;
    -[NSObject startRequestWithCompletionHandler:](v5, "startRequestWithCompletionHandler:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SMSuggestionsHelper _getFAFamilyMembersFromAAAFamilyWithHandler:]";
      v12 = 1024;
      v13 = 131;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

uint64_t __67__SMSuggestionsHelper__getFAFamilyMembersFromAAAFamilyWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (*v4)(void);
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(a2, "members");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v4();
}

- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__SMSuggestionsHelper_fetchMostLikelyReceiverHandlesWithHandler___block_invoke;
    v7[3] = &unk_1E9297650;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SMSuggestionsHelper fetchMostLikelyReceiverHandlesWithHandler:]";
      v11 = 1024;
      v12 = 152;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __65__SMSuggestionsHelper_fetchMostLikelyReceiverHandlesWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMostLikelyReceiverHandlesWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD block[4];
  NSObject *v37;
  SMSuggestionsHelper *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _BYTE *v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  SEL v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  _QWORD *v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[4];
  id v56;
  NSObject *v57;
  _QWORD *v58;
  _QWORD v59[3];
  char v60;
  _QWORD v61[4];
  id v62;
  NSObject *v63;
  _QWORD *v64;
  _QWORD v65[3];
  char v66;
  _QWORD v67[5];
  NSObject *v68;
  id v69;
  _BYTE *v70;
  SEL v71;
  _BYTE buf[24];
  char v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = dispatch_group_create();
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, starting", buf, 0x16u);

    }
    v11 = (void *)objc_opt_new();
    v12 = objc_alloc(MEMORY[0x1E0D8B9F8]);
    LOBYTE(v33) = 0;
    v35 = objc_msgSend(v12, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", *MEMORY[0x1E0D8BD30], *MEMORY[0x1E0D8BD30], 1, 0, 0, 0, v33, 0, 0, 0, 0, 0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v73 = 0;
    dispatch_group_enter(v6);
    v13 = MEMORY[0x1E0C809B0];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke;
    v67[3] = &unk_1E929BD30;
    v67[4] = self;
    v70 = buf;
    v14 = v6;
    v68 = v14;
    v71 = a2;
    v15 = v11;
    v69 = v15;
    -[SMSuggestionsHelper _getSessionConfigurationsWithOptions:handler:](self, "_getSessionConfigurationsWithOptions:handler:", v35, v67);
    v34 = v5;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x2020000000;
    v66 = 0;
    v16 = (void *)objc_opt_new();
    dispatch_group_enter(v14);
    v61[0] = v13;
    v61[1] = 3221225472;
    v61[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_45;
    v61[3] = &unk_1E929BBF8;
    v64 = v65;
    v17 = v16;
    v62 = v17;
    v18 = v14;
    v63 = v18;
    -[SMSuggestionsHelper getFavoriteHandles:](self, "getFavoriteHandles:", v61);
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v60 = 0;
    v19 = (void *)objc_opt_new();
    dispatch_group_enter(v18);
    v55[0] = v13;
    v55[1] = 3221225472;
    v55[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2_46;
    v55[3] = &unk_1E929BBF8;
    v58 = v59;
    v20 = v19;
    v56 = v20;
    v21 = v18;
    v57 = v21;
    -[SMSuggestionsHelper getEmergencyHandles:](self, "getEmergencyHandles:", v55);
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    v22 = (void *)objc_opt_new();
    dispatch_group_enter(v21);
    v49[0] = v13;
    v49[1] = 3221225472;
    v49[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_3;
    v49[3] = &unk_1E929BBF8;
    v52 = v53;
    v23 = v22;
    v50 = v23;
    v24 = v21;
    v51 = v24;
    -[SMSuggestionsHelper getiCloudFamilyHandles:](self, "getiCloudFamilyHandles:", v49);
    dispatch_get_global_queue(2, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_4;
    block[3] = &unk_1E929C2D8;
    v37 = v24;
    v38 = self;
    v44 = buf;
    v45 = v59;
    v46 = v53;
    v47 = v65;
    v48 = a2;
    v39 = v15;
    v40 = v20;
    v41 = v23;
    v42 = v17;
    v43 = v34;
    v26 = v17;
    v27 = v23;
    v28 = v20;
    v29 = v15;
    v30 = v24;
    v5 = v34;
    v31 = v30;
    dispatch_async(v25, block);

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v59, 8);

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(buf, 8);
    v32 = v35;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsHelper _fetchMostLikelyReceiverHandlesWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 166;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2;
  block[3] = &unk_1E929C288;
  v18 = *(_QWORD *)(a1 + 56);
  v13 = v6;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v14 = v8;
  v15 = v9;
  v19 = *(_QWORD *)(a1 + 64);
  v16 = v5;
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  if (*(_QWORD *)(a1 + 32))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 56), "count");
      *(_DWORD *)buf = 138412802;
      v41 = v4;
      v42 = 2112;
      v43 = v5;
      v44 = 2048;
      v45 = v6;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, fetched sessionConfigurations count, %lu", buf, 0x20u);

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = a1;
    v7 = *(id *)(a1 + 56);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      v33 = v7;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v12, "conversation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(v34 + 80));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "conversation");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "receiverHandles");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v41 = v24;
              v42 = 2112;
              v43 = v25;
              v44 = 2112;
              v45 = (uint64_t)v27;
              _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%@, %@, sessionConfig handles, %@", buf, 0x20u);

              v7 = v33;
            }

            objc_msgSend(v12, "conversation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "receiverHandles");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (v18 <= 1)
            {
              v19 = *(void **)(v34 + 64);
              objc_msgSend(v12, "conversation");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "receiverHandles");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "firstObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v22);

            }
          }
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v9);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(v34 + 80));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(*(id *)(v34 + 64), "count");
      *(_DWORD *)buf = 138412802;
      v41 = v30;
      v42 = 2112;
      v43 = v31;
      v44 = 2048;
      v45 = v32;
      _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, session configuration handles count, %lu", buf, 0x20u);

    }
    dispatch_group_leave(*(dispatch_group_t *)(v34 + 40));
  }
}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6 && objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 5000000000);
  v4 = dispatch_group_wait(v2, v3) == 0;
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_5;
  block[3] = &unk_1E929C2B0;
  v6 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v19 = v4;
  v7 = *(_OWORD *)(a1 + 104);
  v15 = *(_OWORD *)(a1 + 88);
  v16 = v7;
  v8 = *(_QWORD *)(a1 + 120);
  v17 = 0x4014000000000000;
  v18 = v8;
  v10 = v6;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  v14 = *(id *)(a1 + 80);
  dispatch_async(v5, block);

}

void __66__SMSuggestionsHelper__fetchMostLikelyReceiverHandlesWithHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_submitMetricForFetchMostLikelyReceiverHandlesDidComplete:didFetchSessionConfigurations:didFetchEmergencyContacts:didFetchICloudFamily:didFetchFavorites:timeout:", *(unsigned __int8 *)(a1 + 128), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24), *(double *)(a1 + 112));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 128))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 120));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v38 = v30;
      v39 = 2112;
      v40 = v31;
      v41 = 2112;
      v42 = (uint64_t)v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@, %@, timed out waiting for completion, metric, %@", buf, 0x20u);

    }
  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D8231EA8](v7);
        objc_msgSend(v11, "canonicalizedHandle", (_QWORD)v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v8 = v7;
    }
    while (v7);
  }

  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v16 = 0;
    do
    {
      v17 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "containsObject:", v18);

      if ((v19 & 1) == 0)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v20);

        objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

      }
      objc_autoreleasePoolPop(v17);
      ++v16;
    }
    while (v16 < objc_msgSend(v5, "count"));
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 120));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 138412802;
    v38 = v24;
    v39 = 2112;
    v40 = v25;
    v41 = 2048;
    v42 = v26;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, deduped handles count, %lu", buf, 0x20u);

  }
  v27 = *(_QWORD *)(a1 + 72);
  v28 = (void *)objc_msgSend(v14, "copy");
  (*(void (**)(uint64_t, void *, _QWORD))(v27 + 16))(v27, v28, 0);

}

- (void)getFavoriteHandles:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  SEL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[SMSuggestionsHelper contactsManager](self, "contactsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke;
    v9[3] = &unk_1E9298E10;
    v9[4] = self;
    v11 = v5;
    v12 = a2;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "fetchFavoriteContactsWithHandler:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSuggestionsHelper getFavoriteHandles:]";
      v15 = 1024;
      v16 = 338;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke_2;
  v13[3] = &unk_1E9298DE8;
  v14 = v6;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v18 = v8;
  v19 = v9;
  v10 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v17 = v10;
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, v13);

}

void __42__SMSuggestionsHelper_getFavoriteHandles___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      v22 = 2048;
      v23 = v6;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, fetched favorite contacts count, %lu", buf, 0x20u);

    }
    v7 = *(_QWORD *)(a1 + 48);
    v17 = 0;
    +[SMSuggestionsHelper getSMHandlesFromRTContacts:error:](SMSuggestionsHelper, "getSMHandlesFromRTContacts:error:", v7, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, favorites contacts handles count, %lu", buf, 0x20u);

    }
    if (v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      if (v8)
      {
        if (objc_msgSend(v8, "count"))
          objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v8);
      }
      v15 = *(_QWORD *)(a1 + 64);
      v16 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

    }
  }
}

- (void)getEmergencyHandles:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  SEL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[SMSuggestionsHelper healthKitManager](self, "healthKitManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke;
    v9[3] = &unk_1E9298E10;
    v9[4] = self;
    v11 = v5;
    v12 = a2;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "fetchEmergencyContactsWithHandler:", v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSuggestionsHelper getEmergencyHandles:]";
      v15 = 1024;
      v16 = 384;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke_2;
  v13[3] = &unk_1E9298DE8;
  v14 = v6;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v18 = v8;
  v19 = v9;
  v10 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v5;
  v17 = v10;
  v11 = v5;
  v12 = v6;
  dispatch_async(v7, v13);

}

void __43__SMSuggestionsHelper_getEmergencyHandles___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138412802;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      v22 = 2048;
      v23 = v6;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, fetched emergency contacts count, %lu", buf, 0x20u);

    }
    v7 = *(_QWORD *)(a1 + 48);
    v17 = 0;
    +[SMSuggestionsHelper getSMHandlesFromRTContacts:error:](SMSuggestionsHelper, "getSMHandlesFromRTContacts:error:", v7, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, emergency contacts handles count, %lu", buf, 0x20u);

    }
    if (v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      if (v8)
      {
        if (objc_msgSend(v8, "count"))
          objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v8);
      }
      v15 = *(_QWORD *)(a1 + 64);
      v16 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v16, 0);

    }
  }
}

- (void)getiCloudFamilyHandles:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  SEL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke;
    v8[3] = &unk_1E9298E10;
    v8[4] = self;
    v11 = a2;
    v9 = v6;
    v10 = v5;
    v7 = v6;
    -[SMSuggestionsHelper _getFAFamilyMembersFromAAAFamilyWithHandler:](self, "_getFAFamilyMembersFromAAAFamilyWithHandler:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SMSuggestionsHelper getiCloudFamilyHandles:]";
      v14 = 1024;
      v15 = 431;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke_2;
  block[3] = &unk_1E92975D8;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v6;
  v15 = v8;
  v12 = *(_OWORD *)(a1 + 48);
  v9 = (id)v12;
  v18 = v12;
  v16 = v5;
  v17 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

void __46__SMSuggestionsHelper_getiCloudFamilyHandles___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v35 = v25;
      v36 = 2112;
      v37 = v26;
      v38 = 2112;
      v39 = v27;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%@, %@, iCloud family query errored, %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (!objc_msgSend(v9, "memberType") && (objc_msgSend(v9, "isMe") & 1) == 0)
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v6);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v3, "count");
      *(_DWORD *)buf = 138412802;
      v35 = v12;
      v36 = 2112;
      v37 = v13;
      v38 = 2048;
      v39 = v14;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, Adult iCloud family members count, %lu", buf, 0x20u);

    }
    v28 = 0;
    +[SMSuggestionsHelper getSMHandlesFromFAFamilyMembers:error:](SMSuggestionsHelper, "getSMHandlesFromFAFamilyMembers:error:", v3, &v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 138412802;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v38 = 2048;
      v39 = v21;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, iCloud family handles count, %lu", buf, 0x20u);

    }
    if (v16)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      if (v15 && objc_msgSend(v15, "count"))
        objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v15);
      v22 = *(_QWORD *)(a1 + 64);
      v23 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

    }
  }
}

- (id)canonicalizeHandles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "canonicalizedHandle", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__SMSuggestionsHelper_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke;
  v11[3] = &unk_1E929C300;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  -[SMSuggestionsHelper getFavoriteHandles:](self, "getFavoriteHandles:", v11);

}

void __77__SMSuggestionsHelper_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "canonicalizeHandles:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "canonicalizeHandles:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intersectSet:", v11);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    v20 = 2048;
    v21 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, Common handle count between receiverHandles & favorite handles: %lu", (uint8_t *)&v16, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v10, "count"), 0);

LABEL_10:
}

- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__SMSuggestionsHelper_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke;
  v11[3] = &unk_1E929C300;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  -[SMSuggestionsHelper getEmergencyHandles:](self, "getEmergencyHandles:", v11);

}

void __78__SMSuggestionsHelper_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "canonicalizeHandles:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "canonicalizeHandles:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intersectSet:", v11);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    v20 = 2048;
    v21 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, Common handle count between receiverHandles & emergency handles: %lu", (uint8_t *)&v16, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v10, "count"), 0);

LABEL_10:
}

- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__SMSuggestionsHelper_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke;
  v11[3] = &unk_1E929C300;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v7;
  v10 = v8;
  -[SMSuggestionsHelper getiCloudFamilyHandles:](self, "getiCloudFamilyHandles:", v11);

}

void __81__SMSuggestionsHelper_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_9:
    v7();
    goto LABEL_10;
  }
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "canonicalizeHandles:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "canonicalizeHandles:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intersectSet:", v11);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    v20 = 2048;
    v21 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, Common handle count between receiverHandles & iCloud family handles: %lu", (uint8_t *)&v16, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v10, "count"), 0);

LABEL_10:
}

- (id)_submitMetricForFetchMostLikelyReceiverHandlesDidComplete:(BOOL)a3 didFetchSessionConfigurations:(BOOL)a4 didFetchEmergencyContacts:(BOOL)a5 didFetchICloudFamily:(BOOL)a6 didFetchFavorites:(BOOL)a7 timeout:(double)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[7];

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v25[6] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("didComplete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("didFetchSessionConfigurations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  v24[2] = CFSTR("didFetchEmergencyContacts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  v24[3] = CFSTR("didFetchICloudFamily");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  v24[4] = CFSTR("didFetchFavorites");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v17;
  v24[5] = CFSTR("timeout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v21 = (void *)objc_msgSend(v20, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorFetchMostLikelyReceiverHandlesCompletion, 1);
  log_analytics_submission(v21, v19);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  return v19;
}

- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__SMSuggestionsHelper_fetchMostLikelySessionDestinationsWithHandler___block_invoke;
    v7[3] = &unk_1E9297650;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SMSuggestionsHelper fetchMostLikelySessionDestinationsWithHandler:]";
      v11 = 1024;
      v12 = 619;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __69__SMSuggestionsHelper_fetchMostLikelySessionDestinationsWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchMostLikelySessionDestinationsWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  char *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[SMSuggestionsHelper routineEnabled](self, "routineEnabled"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke;
      v15[3] = &unk_1E929C328;
      v15[4] = self;
      v17 = a2;
      v16 = v5;
      -[SMSuggestionsHelper _refreshCurrentLocationWithHandler:](self, "_refreshCurrentLocationWithHandler:", v15);

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D18598];
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = CFSTR("Significant Locations disabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = CFSTR("Significant Locations disabled");
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, authorization error, %@", buf, 0x20u);

      }
      (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, MEMORY[0x1E0C9AA60], v10);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSuggestionsHelper _fetchMostLikelySessionDestinationsWithHandler:]";
      v20 = 1024;
      LODWORD(v21) = 633;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  __int128 v13;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke_2;
  block[3] = &unk_1E9297590;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v6;
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v13 = v9;
  v8 = v4;
  dispatch_async(v5, block);

}

void __70__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@, %@, location error, %@", (uint8_t *)&v7, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:", *(_QWORD *)(a1 + 48));
  }

}

- (void)_fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  SEL v41;
  _QWORD block[4];
  NSObject *v43;
  SMSuggestionsHelper *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD *v49;
  uint64_t *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t *v56;
  SEL v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  NSObject *v62;
  _QWORD *v63;
  _QWORD *v64;
  SEL v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[3];
  char v69;
  _QWORD v70[5];
  id v71;
  id v72;
  NSObject *v73;
  _QWORD *v74;
  uint64_t *v75;
  SEL v76;
  _QWORD v77[3];
  char v78;
  _QWORD v79[5];
  id v80;
  NSObject *v81;
  void *v82;
  id v83;
  uint64_t *v84;
  _BYTE *v85;
  uint64_t *v86;
  _QWORD *v87;
  _QWORD *v88;
  SEL v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  int v103;
  _QWORD v104[5];
  id v105;
  _QWORD v106[4];
  _QWORD v107[5];
  id v108;
  id v109;
  NSObject *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  SEL v115;
  _QWORD v116[3];
  char v117;
  _QWORD v118[5];
  id v119;
  _QWORD v120[5];
  id v121;
  _QWORD v122[5];
  id v123;
  uint8_t v124[128];
  _BYTE buf[24];
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  if (v37)
  {
    v5 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v126 = __Block_byref_object_copy__53;
    v127 = __Block_byref_object_dispose__53;
    v128 = 0;
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v122[0] = 0;
    v122[1] = v122;
    v122[2] = 0x3032000000;
    v122[3] = __Block_byref_object_copy__53;
    v122[4] = __Block_byref_object_dispose__53;
    v123 = 0;
    v120[0] = 0;
    v120[1] = v120;
    v120[2] = 0x3032000000;
    v120[3] = __Block_byref_object_copy__53;
    v120[4] = __Block_byref_object_dispose__53;
    v121 = 0;
    v118[0] = 0;
    v118[1] = v118;
    v118[2] = 0x3032000000;
    v118[3] = __Block_byref_object_copy__53;
    v118[4] = __Block_byref_object_dispose__53;
    v119 = 0;
    v116[0] = 0;
    v116[1] = v116;
    v116[2] = 0x2020000000;
    v117 = 0;
    dispatch_group_enter(v5);
    -[SMSuggestionsHelper navigationManager](self, "navigationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke;
    v107[3] = &unk_1E929C378;
    v107[4] = self;
    v111 = v116;
    v112 = v122;
    v113 = v120;
    v115 = a2;
    v39 = v7;
    v108 = v39;
    v38 = v6;
    v109 = v38;
    v114 = v118;
    v9 = v5;
    v110 = v9;
    objc_msgSend(v8, "fetchNavigationRouteSummaryWithHandler:", v107);
    v41 = a2;

    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x2020000000;
    v106[3] = 0x7FEFFFFFFFFFFFFFLL;
    v104[0] = 0;
    v104[1] = v104;
    v104[2] = 0x3032000000;
    v104[3] = __Block_byref_object_copy__53;
    v104[4] = __Block_byref_object_dispose__53;
    v105 = 0;
    v100 = 0;
    v101 = &v100;
    v102 = 0x2020000000;
    v103 = 0;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v10 = objc_msgSend(&unk_1E932C400, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v97;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v97 != v11)
            objc_enumerationMutation(&unk_1E932C400);
          v13 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1D8231EA8]();
          v90 = 0;
          v91 = &v90;
          v92 = 0x3032000000;
          v93 = __Block_byref_object_copy__53;
          v94 = __Block_byref_object_dispose__53;
          v95 = 0;
          ++*((_DWORD *)v101 + 6);
          dispatch_group_enter(v9);
          -[SMSuggestionsHelper learnedLocationManager](self, "learnedLocationManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "unsignedIntegerValue");
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_82;
          v79[3] = &unk_1E929C3C8;
          v79[4] = self;
          v84 = &v100;
          v85 = buf;
          v86 = &v90;
          v89 = v41;
          v80 = v39;
          v81 = v9;
          v82 = v13;
          v87 = v106;
          v88 = v104;
          v83 = v38;
          objc_msgSend(v15, "fetchLocationsOfInterestWithPlaceType:handler:", v16, v79);

          _Block_object_dispose(&v90, 8);
          objc_autoreleasePoolPop(v14);
        }
        v10 = objc_msgSend(&unk_1E932C400, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
      }
      while (v10);
    }
    v90 = 0;
    v91 = &v90;
    v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__53;
    v94 = __Block_byref_object_dispose__53;
    v95 = (id)objc_opt_new();
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x2020000000;
    v78 = 0;
    dispatch_group_enter(v9);
    -[SMSuggestionsHelper latestLocationOfTheDevice](self, "latestLocationOfTheDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_86;
    v70[3] = &unk_1E929C418;
    v70[4] = self;
    v74 = v77;
    v76 = v41;
    v19 = v39;
    v71 = v19;
    v20 = v38;
    v72 = v20;
    v75 = &v90;
    v21 = v9;
    v73 = v21;
    -[SMSuggestionsHelper _getNPLOIsWithOnlyHighConfidence:location:date:handler:](self, "_getNPLOIsWithOnlyHighConfidence:location:date:handler:", 0, v17, v18, v70);

    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v69 = 0;
    dispatch_group_enter(v21);
    v22 = objc_alloc(MEMORY[0x1E0D8B9F8]);
    LOBYTE(v36) = 0;
    v40 = (void *)objc_msgSend(v22, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", *MEMORY[0x1E0D8BD30], *MEMORY[0x1E0D8BD30], 1, 0, &unk_1E932C418, 0, v36, 0, 0, 0, 0, 0);
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__53;
    v66[4] = __Block_byref_object_dispose__53;
    v67 = 0;
    v23 = objc_opt_new();
    v24 = MEMORY[0x1E0C809B0];
    v25 = (void *)v23;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_92;
    v58[3] = &unk_1E929C4E0;
    v58[4] = self;
    v63 = v66;
    v65 = v41;
    v26 = v19;
    v59 = v26;
    v27 = v20;
    v60 = v27;
    v28 = v25;
    v61 = v28;
    v29 = v21;
    v62 = v29;
    v64 = v68;
    -[SMSuggestionsHelper _getSessionConfigurationsWithOptions:handler:](self, "_getSessionConfigurationsWithOptions:handler:", v40, v58);
    dispatch_get_global_queue(2, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_102;
    block[3] = &unk_1E929C530;
    v43 = v29;
    v44 = self;
    v50 = &v100;
    v51 = v77;
    v52 = v68;
    v53 = v118;
    v54 = v104;
    v55 = v106;
    v56 = &v90;
    v57 = v41;
    v45 = v28;
    v46 = v27;
    v49 = v116;
    v47 = v26;
    v48 = v37;
    v31 = v26;
    v32 = v27;
    v33 = v28;
    v34 = v29;
    dispatch_async(v30, block);

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(v68, 8);

    _Block_object_dispose(v77, 8);
    _Block_object_dispose(&v90, 8);

    _Block_object_dispose(&v100, 8);
    _Block_object_dispose(v104, 8);

    _Block_object_dispose(v106, 8);
    _Block_object_dispose(v116, 8);
    _Block_object_dispose(v118, 8);

    _Block_object_dispose(v120, 8);
    _Block_object_dispose(v122, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSuggestionsHelper _fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 674;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2;
  block[3] = &unk_1E929C350;
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v18 = v6;
  v19 = v9;
  v11 = *(_QWORD *)(a1 + 96);
  v24 = v8;
  v26 = v11;
  block[1] = 3221225472;
  v23 = *(_OWORD *)(a1 + 64);
  v17 = v5;
  v20 = v10;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 88);
  v21 = v12;
  v25 = v13;
  v22 = *(id *)(a1 + 56);
  v14 = v6;
  v15 = v5;
  dispatch_async(v7, block);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  dispatch_semaphore_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  dispatch_time_t v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_class *v46;
  id v47;
  id v48;
  const __CFString *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  objc_class *v68;
  id v69;
  id v70;
  const __CFString *v71;
  objc_class *v72;
  id v73;
  void *v74;
  void *v75;
  objc_class *v76;
  id v77;
  void *v78;
  uint64_t v79;
  objc_class *v80;
  void *v81;
  void *v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  __CFString *v88;
  id obj;
  uint64_t v90;
  uint64_t v91;
  void *context;
  _QWORD v94[4];
  NSObject *v95;
  _BYTE *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[12];
  __int16 v110;
  void *v111;
  __int16 v112;
  id v113;
  _BYTE buf[24];
  uint64_t (*v115)(uint64_t, uint64_t);
  _BYTE v116[20];
  _BYTE v117[128];
  _QWORD v118[4];

  v118[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v80 = (objc_class *)objc_opt_class();
      NSStringFromClass(v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 112));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v81;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v82;
      *(_WORD *)&buf[22] = 2112;
      v115 = v83;
      _os_log_error_impl(&dword_1D1A22000, v1, OS_LOG_TYPE_ERROR, "%@, %@, navigation error, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 112));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2048;
    v115 = (uint64_t (*)(uint64_t, uint64_t))v6;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, %@, route summaries count, %lu", buf, 0x20u);

  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
  if (v91)
  {
    v90 = *(_QWORD *)v106;
    v85 = *MEMORY[0x1E0D18598];
    v86 = *MEMORY[0x1E0CB2D50];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v106 != v90)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v7);
        context = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(*(id *)(a1 + 48), "distanceCalculator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "latestLocationOfTheDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "destinationMapItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0;
        objc_msgSend(v9, "distanceFromLocation:toLocation:error:", v10, v12, &v104);
        v14 = v13;
        v15 = (uint64_t (*)(uint64_t, uint64_t))v104;

        if (v15)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v65 = (objc_class *)objc_opt_class();
            NSStringFromClass(v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 112));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v66;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v67;
            *(_WORD *)&buf[22] = 2112;
            v115 = v15;
            _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, distanceToRouteSummaryDestinationError, %@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v15);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "latestLocationOfTheDevice");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_27;
          objc_msgSend(v8, "destinationMapItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
LABEL_27:
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v46 = (objc_class *)objc_opt_class();
              NSStringFromClass(v46);
              v47 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 112));
              v48 = (id)objc_claimAutoreleasedReturnValue();
              if (v14 == 1.79769313e308)
              {
                v49 = CFSTR("DBL_MAX");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v14);
                v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v49 = v88;
              }
              objc_msgSend(*(id *)(a1 + 48), "latestLocationOfTheDevice");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "destinationMapItem");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "location");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v48;
              *(_WORD *)&buf[22] = 2112;
              v115 = (uint64_t (*)(uint64_t, uint64_t))v49;
              *(_WORD *)v116 = 2112;
              *(_QWORD *)&v116[2] = v62;
              *(_WORD *)&v116[10] = 2112;
              *(_QWORD *)&v116[12] = v64;
              _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, routeSummary.destinationMapItem.location, %@", buf, 0x34u);

              if (v14 != 1.79769313e308)
            }
            goto LABEL_51;
          }
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v14 < 0.0 || v14 == 1.79769313e308)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v68 = (objc_class *)objc_opt_class();
              NSStringFromClass(v68);
              v69 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 112));
              v70 = (id)objc_claimAutoreleasedReturnValue();
              v71 = CFSTR("DBL_MAX");
              if (v14 != 1.79769313e308)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v14);
                v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v71 = v84;
              }
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v69;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v70;
              *(_WORD *)&buf[22] = 2112;
              v115 = (uint64_t (*)(uint64_t, uint64_t))v71;
              _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, %@, invalid distance value, %@", buf, 0x20u);
              if (v14 != 1.79769313e308)

            }
LABEL_51:

            goto LABEL_52;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 112));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v14);
            v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v115 = v26;
            *(_WORD *)v116 = 2048;
            *(_QWORD *)&v116[2] = 0x407F400000000000;
            *(_WORD *)&v116[10] = 2048;
            *(_QWORD *)&v116[12] = 0x41124F8000000000;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, navigation route, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x34u);

          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v115 = __Block_byref_object_copy__53;
          *(_QWORD *)v116 = __Block_byref_object_dispose__53;
          *(_QWORD *)&v116[8] = 0;
          v98 = 0;
          v99 = &v98;
          v100 = 0x3032000000;
          v101 = __Block_byref_object_copy__53;
          v102 = __Block_byref_object_dispose__53;
          v103 = 0;
          v27 = dispatch_semaphore_create(0);
          objc_msgSend(*(id *)(a1 + 48), "learnedLocationStore");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "destinationMapItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_75;
          v94[3] = &unk_1E9297478;
          v96 = buf;
          v97 = &v98;
          v30 = v27;
          v95 = v30;
          objc_msgSend(v28, "fetchLocationOfInterestWithMapItem:handler:", v29, v94);

          v31 = v30;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v31, v33))
            goto LABEL_32;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "timeIntervalSinceDate:", v32);
          v35 = v34;
          v36 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_299);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "filteredArrayUsingPredicate:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v36, "submitToCoreAnalytics:type:duration:", v40, 1, v35);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v109 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v109, 2u);
          }

          v42 = (void *)MEMORY[0x1E0CB35C8];
          v118[0] = v86;
          *(_QWORD *)v109 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v118, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "errorWithDomain:code:userInfo:", v85, 15, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            v45 = objc_retainAutorelease(v44);

          }
          else
          {
LABEL_32:
            v45 = 0;
          }

          v50 = v45;
          if (v99[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v72 = (objc_class *)objc_opt_class();
              NSStringFromClass(v72);
              v73 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 112));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = (void *)v99[5];
              *(_DWORD *)v109 = 138412802;
              *(_QWORD *)&v109[4] = v73;
              v110 = 2112;
              v111 = v74;
              v112 = 2112;
              v113 = v75;
              _os_log_error_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_ERROR, "%@, %@, navigationLOIError, %@", v109, 0x20u);

            }
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v99[5]);
          }
          if (v50)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v76 = (objc_class *)objc_opt_class();
              NSStringFromClass(v76);
              v77 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 112));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v109 = 138412802;
              *(_QWORD *)&v109[4] = v77;
              v110 = 2112;
              v111 = v78;
              v112 = 2112;
              v113 = v50;
              _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "%@, %@, navigationLOISemaError, %@", v109, 0x20u);

            }
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v50);
          }
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            objc_msgSend(*(id *)(a1 + 48), "_placeInferenceFromLOI:");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
              goto LABEL_63;
          }
          v54 = objc_alloc(MEMORY[0x1E0D18420]);
          objc_msgSend(v8, "destinationMapItem");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "destinationMapItem");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "location");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (void *)objc_msgSend(v54, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v55, 0, 0, 0, v57, v58, 0.0);

          if (v53)
          {
LABEL_63:
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v53);
            v59 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
            v61 = *(_QWORD *)(v59 + 40);
            v60 = (id *)(v59 + 40);
            if (!v61)
              objc_storeStrong(v60, v53);
          }

          _Block_object_dispose(&v98, 8);
          _Block_object_dispose(buf, 8);

        }
LABEL_52:

        objc_autoreleasePoolPop(context);
        ++v7;
      }
      while (v91 != v7);
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
      v91 = v79;
    }
    while (v79);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_75(uint64_t a1, void *a2, void *a3)
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

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_83;
  block[3] = &unk_1E929C3A0;
  v8 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v19 = v6;
  v20 = v9;
  v11 = *(_QWORD *)(a1 + 112);
  v26 = v8;
  v28 = v11;
  block[1] = 3221225472;
  v25 = *(_OWORD *)(a1 + 72);
  v18 = v5;
  v21 = v10;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(void **)(a1 + 64);
  v22 = v12;
  v23 = v13;
  v27 = *(_OWORD *)(a1 + 96);
  v24 = v14;
  v15 = v6;
  v16 = v5;
  dispatch_async(v7, block);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_83(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  __CFString *v21;
  NSObject *v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  id v26;
  __CFString *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  _BOOL4 v43;
  objc_class *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  objc_class *v49;
  uint64_t v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  uint64_t v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  objc_class *v63;
  id v64;
  id v65;
  const __CFString *v66;
  objc_class *v67;
  void *v68;
  void *v69;
  __CFString *v70;
  uint64_t v71;
  objc_class *v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  id obj;
  uint64_t v80;
  __CFString *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  id v93;
  __int16 v94;
  id v95;
  __int16 v96;
  const __CFString *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  _BYTE v106[128];
  uint64_t v107;

  v1 = a1;
  v107 = *MEMORY[0x1E0C80C00];
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40), *(id *)(v1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v80 = v1;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v72 = (objc_class *)objc_opt_class();
      NSStringFromClass(v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(v1 + 128));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(v80 + 104) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v93 = v73;
      v94 = 2112;
      v95 = v74;
      v96 = 2112;
      v97 = v75;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, %@, placeTypeError, %@", buf, 0x20u);

      v1 = v80;
    }

    objc_msgSend(*(id *)(v1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 104) + 8) + 40));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(v1 + 128));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(*(id *)(v80 + 72), "unsignedIntegerValue"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v80 + 96) + 8) + 40), "count");
      *(_DWORD *)buf = 138413058;
      v93 = v6;
      v94 = 2112;
      v95 = v7;
      v96 = 2112;
      v97 = v8;
      v98 = 2048;
      v99 = v9;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, fetched learned LOIs of type, %@, count, %lu,", buf, 0x2Au);

      v1 = v80;
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = *(id *)(*(_QWORD *)(*(_QWORD *)(v1 + 96) + 8) + 40);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
    if (v10)
    {
      v11 = v10;
      v82 = *(_QWORD *)v89;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v89 != v82)
            objc_enumerationMutation(obj);
          v13 = *(__CFString **)(*((_QWORD *)&v88 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(*(id *)(v1 + 48), "distanceCalculator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 48), "latestLocationOfTheDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v13;
          -[__CFString location](v13, "location");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 0;
          objc_msgSend(v15, "distanceFromLocation:toLocation:error:", v16, v18, &v87);
          v20 = v19;
          v21 = (__CFString *)v87;

          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v83 = v14;
            v23 = v11;
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(v1 + 128));
            v26 = (id)objc_claimAutoreleasedReturnValue();
            v27 = v21;
            if (v20 == 1.79769313e308)
            {
              v28 = CFSTR("DBL_MAX");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v20);
              v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
              v81 = (__CFString *)v28;
            }
            objc_msgSend(*(id *)(v1 + 48), "latestLocationOfTheDevice");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString location](v86, "location");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "location");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v93 = v25;
            v94 = 2112;
            v95 = v26;
            v96 = 2112;
            v97 = v28;
            v98 = 2112;
            v99 = (uint64_t)v29;
            v100 = 2112;
            v101 = (uint64_t)v31;
            v102 = 2112;
            v103 = (uint64_t)v27;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, learnedLOI.location.location, %@, error, %@", buf, 0x3Eu);

            if (v20 != 1.79769313e308)
            v1 = v80;
            v14 = v83;
            v21 = v27;
            v11 = v23;
          }

          if (v21)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v49 = (objc_class *)objc_opt_class();
              NSStringFromClass(v49);
              v50 = v11;
              v51 = v21;
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(v1 + 128));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v93 = v52;
              v94 = 2112;
              v95 = v53;
              v96 = 2112;
              v97 = v51;
              _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, distanceError, %@", buf, 0x20u);

              v1 = v80;
              v21 = (__CFString *)v51;
              v11 = v50;
            }

            objc_msgSend(*(id *)(v1 + 56), "addObject:", v21);
          }
          else
          {
            -[__CFString location](v86, "location");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "location");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              if (v20 < 0.0 || v20 == 1.79769313e308)
              {
                v36 = v11;
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  v63 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v63);
                  v64 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(*(SEL *)(v1 + 128));
                  v65 = (id)objc_claimAutoreleasedReturnValue();
                  v66 = CFSTR("DBL_MAX");
                  if (v20 != 1.79769313e308)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v20);
                    v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v66 = v76;
                  }
                  *(_DWORD *)buf = 138412802;
                  v93 = v64;
                  v94 = 2112;
                  v95 = v65;
                  v96 = 2112;
                  v97 = v66;
                  _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, invalid distance value, %@", buf, 0x20u);
                  if (v20 != 1.79769313e308)

                }
                v21 = 0;
                v11 = v36;
              }
              else
              {
                objc_msgSend(*(id *)(v1 + 48), "_placeInferenceFromLOI:", v86);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v39;
                if (v39)
                {
                  v21 = 0;
                  if (objc_msgSend(v39, "userType") == 1
                    && v20 < *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24))
                  {
                    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v1 + 120) + 8) + 40), v40);
                    *(double *)(*(_QWORD *)(*(_QWORD *)(v1 + 112) + 8) + 24) = v20;
                  }
                  v41 = +[SMSuggestionsHelper isValidDistance:](SMSuggestionsHelper, "isValidDistance:", v20);
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v42 = objc_claimAutoreleasedReturnValue();
                  v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
                  if (v41)
                  {
                    if (v43)
                    {
                      v44 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v44);
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(*(SEL *)(v1 + 128));
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString place](v86, "place");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v77, "type"));
                      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      -[__CFString identifier](v86, "identifier");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v20);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413826;
                      v93 = v84;
                      v94 = 2112;
                      v95 = v78;
                      v96 = 2112;
                      v97 = v45;
                      v98 = 2112;
                      v99 = (uint64_t)v46;
                      v100 = 2112;
                      v101 = (uint64_t)v47;
                      v102 = 2048;
                      v103 = 0x407F400000000000;
                      v104 = 2048;
                      v105 = 0x41124F8000000000;
                      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, learned placeType, %@, LOI with identifier, %@, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x48u);

                      v1 = v80;
                      v21 = 0;

                    }
                    objc_msgSend(*(id *)(v1 + 80), "addObject:", v40);
                  }
                  else
                  {
                    if (v43)
                    {
                      v54 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v54);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(*(SEL *)(v1 + 128));
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      -[__CFString identifier](v86, "identifier");
                      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v20);
                      v85 = v14;
                      v58 = v11;
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138413570;
                      v93 = v55;
                      v94 = 2112;
                      v95 = v56;
                      v96 = 2112;
                      v97 = v57;
                      v98 = 2112;
                      v99 = (uint64_t)v59;
                      v100 = 2048;
                      v101 = 0x407F400000000000;
                      v102 = 2048;
                      v103 = 0x41124F8000000000;
                      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, LOI with identifier, %@, skipped, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);

                      v11 = v58;
                      v14 = v85;

                      v1 = v80;
                      v21 = 0;

                    }
                  }
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v48 = objc_claimAutoreleasedReturnValue();
                  v21 = 0;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    v67 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v67);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(*(SEL *)(v1 + 128));
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(*(id *)(v80 + 72), "unsignedIntegerValue"));
                    v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413058;
                    v93 = v68;
                    v94 = 2112;
                    v95 = v69;
                    v96 = 2112;
                    v97 = v70;
                    v98 = 2112;
                    v99 = (uint64_t)v86;
                    _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "%@, %@, learned place type, %@, placeInference is null, learned LOI, %@", buf, 0x2Au);

                    v1 = v80;
                    v21 = 0;
                  }

                }
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                v60 = (objc_class *)objc_opt_class();
                NSStringFromClass(v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(*(SEL *)(v1 + 128));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v93 = v61;
                v94 = 2112;
                v95 = v62;
                v96 = 2112;
                v97 = v86;
                _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, location not found in learned LOI, %@", buf, 0x20u);

                v1 = v80;
              }

              v21 = 0;
            }
          }

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v11 != v12);
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v106, 16);
        v11 = v71;
      }
      while (v71);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 64));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_87;
  block[3] = &unk_1E929C3F0;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v17 = v6;
  v18 = v9;
  v11 = *(_QWORD *)(a1 + 80);
  v23 = v8;
  v25 = v11;
  block[1] = 3221225472;
  v19 = v10;
  v20 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 72);
  v21 = v12;
  v24 = v13;
  v22 = *(id *)(a1 + 56);
  v14 = v5;
  v15 = v6;
  dispatch_async(v7, block);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_87(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  _BOOL4 v23;
  objc_class *v24;
  id v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  const __CFString *v29;
  NSObject *v30;
  objc_class *v31;
  id v32;
  id v33;
  const __CFString *v34;
  objc_class *v35;
  id v36;
  id v37;
  void *v38;
  __CFString *v39;
  const __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  NSObject *v49;
  objc_class *v50;
  void *v51;
  void *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  id v60;
  id v61;
  __CFString *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 96));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *(const __CFString **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v72 = v54;
      v73 = 2112;
      v74 = v55;
      v75 = 2112;
      v76 = v56;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%@, %@, nploiError, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
  }
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v3 = *(id *)(a1 + 56);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
  if (v4)
  {
    v5 = v4;
    v64 = *(_QWORD *)v68;
    v61 = v3;
    do
    {
      v6 = 0;
      v63 = v5;
      do
      {
        if (*(_QWORD *)v68 != v64)
          objc_enumerationMutation(v3);
        v7 = *(__CFString **)(*((_QWORD *)&v67 + 1) + 8 * v6);
        v65 = MEMORY[0x1D8231EA8]();
        objc_msgSend(*(id *)(a1 + 40), "distanceCalculator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "latestLocationOfTheDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString locationOfInterest](v7, "locationOfInterest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        objc_msgSend(v8, "distanceFromLocation:toLocation:error:", v9, v11, &v66);
        v13 = v12;
        v14 = (__CFString *)v66;

        if (v14)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 96));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v72 = v45;
            v73 = 2112;
            v74 = v46;
            v75 = 2112;
            v76 = v14;
            _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, distanceToNPLOIError, %@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
LABEL_14:
          v16 = (void *)v65;
          goto LABEL_49;
        }
        objc_msgSend(*(id *)(a1 + 40), "latestLocationOfTheDevice");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_21;
        v18 = (void *)v17;
        -[__CFString locationOfInterest](v7, "locationOfInterest");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          v21 = +[SMSuggestionsHelper isValidDistance:](SMSuggestionsHelper, "isValidDistance:", v13);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
          if (v21)
          {
            if (v23)
            {
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v60 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 96));
              v25 = (id)objc_claimAutoreleasedReturnValue();
              -[__CFString locationOfInterest](v7, "locationOfInterest");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", +[RTPlaceInferenceManager learnedPlaceTypeFromLocationOfInterestType:](RTPlaceInferenceManager, "learnedPlaceTypeFromLocationOfInterestType:", objc_msgSend(v59, "type")));
              v26 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              -[__CFString locationOfInterest](v7, "locationOfInterest");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "identifier");
              v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v13 == 1.79769313e308)
              {
                v29 = CFSTR("DBL_MAX");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v13);
                v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v29 = v57;
              }
              *(_DWORD *)buf = 138413826;
              v72 = v60;
              v73 = 2112;
              v74 = v25;
              v75 = 2112;
              v76 = v26;
              v77 = 2112;
              v78 = v28;
              v79 = 2112;
              v80 = (uint64_t)v29;
              v81 = 2048;
              v82 = 0x407F400000000000;
              v83 = 2048;
              v84 = 0x41124F8000000000;
              _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, nploi placeType, %@, LOI with identifier, %@, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x48u);
              if (v13 != 1.79769313e308)

            }
            +[SMSuggestionsHelper placeInferenceFromNPLOI:](SMSuggestionsHelper, "placeInferenceFromNPLOI:", v7);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              objc_msgSend(*(id *)(a1 + 64), "addObject:", v47);
              -[__CFString confidence](v7, "confidence");
              v5 = v63;
              if (v48 == 1.0)
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObject:", v7);
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v49 = objc_claimAutoreleasedReturnValue();
              v5 = v63;
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v50 = (objc_class *)objc_opt_class();
                NSStringFromClass(v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(*(SEL *)(a1 + 96));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v72 = v51;
                v73 = 2112;
                v74 = v52;
                v75 = 2112;
                v76 = v7;
                _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "%@, %@, placeInference is nil, nploi, %@", buf, 0x20u);

              }
            }

            goto LABEL_14;
          }
          if (v23)
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 96));
            v37 = (id)objc_claimAutoreleasedReturnValue();
            -[__CFString locationOfInterest](v7, "locationOfInterest");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "identifier");
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v13 == 1.79769313e308)
            {
              v40 = CFSTR("DBL_MAX");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v13);
              v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v40 = v58;
            }
            *(_DWORD *)buf = 138413570;
            v72 = v36;
            v73 = 2112;
            v74 = v37;
            v75 = 2112;
            v76 = v39;
            v77 = 2112;
            v78 = v40;
            v79 = 2048;
            v80 = 0x407F400000000000;
            v81 = 2048;
            v82 = 0x41124F8000000000;
            _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, LOI with identifier, %@, skipped, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);
            v16 = (void *)v65;
            if (v13 != 1.79769313e308)

          }
          else
          {
            v16 = (void *)v65;
          }

          v5 = v63;
        }
        else
        {
LABEL_21:
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 96));
            v33 = (id)objc_claimAutoreleasedReturnValue();
            if (v13 == 1.79769313e308)
            {
              v34 = CFSTR("DBL_MAX");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v13);
              v34 = (const __CFString *)objc_claimAutoreleasedReturnValue();
              v62 = (__CFString *)v34;
            }
            objc_msgSend(*(id *)(a1 + 40), "latestLocationOfTheDevice");
            v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[__CFString locationOfInterest](v7, "locationOfInterest");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "location");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v72 = v32;
            v73 = 2112;
            v74 = v33;
            v75 = 2112;
            v76 = v34;
            v77 = 2112;
            v78 = v41;
            v79 = 2112;
            v80 = (uint64_t)v43;
            _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, nploi.locationOfInterest.location, %@", buf, 0x34u);

            if (v13 != 1.79769313e308)
            v3 = v61;
            v5 = v63;
          }
          v16 = (void *)v65;

        }
LABEL_49:

        objc_autoreleasePoolPop(v16);
        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v67, v85, 16);
    }
    while (v5);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_93;
  v16[3] = &unk_1E929C4B8;
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v17 = v6;
  v18 = v9;
  v11 = *(_QWORD *)(a1 + 88);
  v24 = v8;
  v26 = v11;
  v16[1] = 3221225472;
  v19 = v10;
  v20 = v5;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v23 = v12;
  v25 = v13;
  v14 = v5;
  v15 = v6;
  dispatch_async(v7, v16);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_93(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  BOOL v20;
  NSObject *v21;
  _BOOL4 v22;
  objc_class *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  const __CFString *v28;
  objc_class *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  const __CFString *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  id v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  objc_class *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  objc_class *v56;
  void *v57;
  void *v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  __CFString *v60;
  id v61;
  id v62;
  __CFString *v63;
  __CFString *v64;
  NSObject *group;
  id obj;
  uint64_t v67;
  uint64_t v68;
  _QWORD block[4];
  id v70;
  uint64_t v71;
  _QWORD v72[5];
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  id v77;
  _BYTE *v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD v81[5];
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE buf[24];
  uint64_t (*v89)(uint64_t, uint64_t);
  _BYTE v90[20];
  __int16 v91;
  uint64_t v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 88;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(id *)(a1 + 32));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 104));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      v89 = v59;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@, %@, sessionConfigError, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  }
  +[SMSuggestionsHelper dedupeSessionConfigurations:](SMSuggestionsHelper, "dedupeSessionConfigurations:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v4;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v85;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v85 != v67)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(*(id *)(a1 + 40), "distanceCalculator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "latestLocationOfTheDevice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "destination");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0;
        objc_msgSend(v8, "distanceFromLocation:toLocation:error:", v9, v11, &v83);
        v13 = v12;
        v14 = (uint64_t (*)(uint64_t, uint64_t))v83;

        if (v14)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 104));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v37;
            *(_WORD *)&buf[22] = 2112;
            v89 = v14;
            _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, distanceError, %@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "latestLocationOfTheDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_20;
          objc_msgSend(v6, "destination");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (v19)
          {
LABEL_20:
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v47 = (objc_class *)objc_opt_class();
              NSStringFromClass(v47);
              v62 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 104));
              v61 = (id)objc_claimAutoreleasedReturnValue();
              v48 = CFSTR("DBL_MAX");
              if (v13 != 1.79769313e308)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v13);
                v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v48 = v60;
              }
              objc_msgSend(*(id *)(a1 + 40), "latestLocationOfTheDevice");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "destination");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "location");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v62;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v61;
              *(_WORD *)&buf[22] = 2112;
              v89 = (uint64_t (*)(uint64_t, uint64_t))v48;
              *(_WORD *)v90 = 2112;
              *(_QWORD *)&v90[2] = v49;
              *(_WORD *)&v90[10] = 2112;
              *(_QWORD *)&v90[12] = v51;
              _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, %@, distance, %@, latestLocationOfTheDevice, %@, sessionConfiguration.destination.location, %@", buf, 0x34u);

              if (v13 != 1.79769313e308)
            }
            goto LABEL_34;
          }
          v20 = +[SMSuggestionsHelper isValidDistance:](SMSuggestionsHelper, "isValidDistance:", v13);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (!v20)
          {
            if (v22)
            {
              v29 = (objc_class *)objc_opt_class();
              NSStringFromClass(v29);
              v30 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 104));
              v31 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "destination");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "location");
              v33 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              if (v13 == 1.79769313e308)
              {
                v34 = CFSTR("DBL_MAX");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v13);
                v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v34 = v64;
              }
              *(_DWORD *)buf = 138413570;
              *(_QWORD *)&buf[4] = v30;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v31;
              *(_WORD *)&buf[22] = 2112;
              v89 = v33;
              *(_WORD *)v90 = 2112;
              *(_QWORD *)&v90[2] = v34;
              *(_WORD *)&v90[10] = 2048;
              *(_QWORD *)&v90[12] = 0x407F400000000000;
              v91 = 2048;
              v92 = 0x41124F8000000000;
              _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, location, %@, skipped, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);
              if (v13 != 1.79769313e308)

            }
LABEL_34:

            goto LABEL_35;
          }
          if (v22)
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 104));
            v25 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "destination");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "location");
            v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            if (v13 == 1.79769313e308)
            {
              v28 = CFSTR("DBL_MAX");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v13);
              v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v28 = v63;
            }
            *(_DWORD *)buf = 138413570;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v89 = v27;
            *(_WORD *)v90 = 2112;
            *(_QWORD *)&v90[2] = v28;
            *(_WORD *)&v90[10] = 2048;
            *(_QWORD *)&v90[12] = 0x407F400000000000;
            v91 = 2048;
            v92 = 0x41124F8000000000;
            _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, session location, %@, added, distance, %@, min threshold, %.3f, max threshold, %.3f", buf, 0x3Eu);
            if (v13 != 1.79769313e308)

          }
          dispatch_group_enter(group);
          v38 = objc_alloc(MEMORY[0x1E0D183F8]);
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v38, "initWithUseBackgroundTraits:analyticsIdentifier:", 0, v40);

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v89 = __Block_byref_object_copy__53;
          *(_QWORD *)v90 = __Block_byref_object_dispose__53;
          *(_QWORD *)&v90[8] = 0;
          v81[0] = 0;
          v81[1] = v81;
          v81[2] = 0x3032000000;
          v81[3] = __Block_byref_object_copy__53;
          v81[4] = __Block_byref_object_dispose__53;
          v82 = 0;
          objc_msgSend(*(id *)(a1 + 40), "mapServiceManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "destination");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "destinationMapItem");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_95;
          v72[3] = &unk_1E929C490;
          v45 = *(void **)(a1 + 48);
          v72[4] = *(_QWORD *)(a1 + 40);
          v78 = buf;
          v46 = *(_QWORD *)(a1 + 104);
          v79 = v81;
          v80 = v46;
          v73 = v45;
          v74 = group;
          v75 = v6;
          v76 = *(id *)(a1 + 64);
          v77 = *(id *)(a1 + 72);
          objc_msgSend(v42, "fetchMapItemFromHandle:options:handler:", v44, v41, v72);

          _Block_object_dispose(v81, 8);
          _Block_object_dispose(buf, 8);

        }
LABEL_35:

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v68 != v5);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      v68 = v52;
    }
    while (v52);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v53 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_101;
  block[3] = &unk_1E92977E0;
  v54 = *(id *)(a1 + 80);
  v55 = *(_QWORD *)(a1 + 96);
  v70 = v54;
  v71 = v55;
  dispatch_group_notify(group, v53, block);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_95(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_96;
  block[3] = &unk_1E929C440;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v17 = v6;
  v18 = v8;
  v25 = *(_QWORD *)(a1 + 96);
  block[1] = 3221225472;
  v24 = *(_OWORD *)(a1 + 80);
  v16 = v5;
  v19 = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(void **)(a1 + 64);
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = *(id *)(a1 + 72);
  v13 = v6;
  v14 = v5;
  dispatch_async(v7, block);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_96(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD *v29;
  _BYTE *v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(id *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 112));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v35 = v17;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%@, %@, mapItemError, %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
LABEL_5:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    return;
  }
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 112));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v35 = v21;
      LOWORD(v36) = 2112;
      *(_QWORD *)((char *)&v36 + 2) = v22;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@, %@, error creating mapItem, %@, error, %@", buf, 0x2Au);

    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v7 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Hydrated mapItem, %@ session configuration, %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__53;
  *(_QWORD *)&v36 = __Block_byref_object_dispose__53;
  *((_QWORD *)&v36 + 1) = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__53;
  v32[4] = __Block_byref_object_dispose__53;
  v33 = 0;
  objc_msgSend(*(id *)(a1 + 48), "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_97;
  v23[3] = &unk_1E929C468;
  v10 = *(void **)(a1 + 56);
  v23[4] = *(_QWORD *)(a1 + 48);
  v29 = v32;
  v30 = buf;
  v31 = *(_QWORD *)(a1 + 112);
  v24 = v10;
  v11 = *(id *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(void **)(a1 + 80);
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = *(id *)(a1 + 88);
  objc_msgSend(v8, "fetchLocationOfInterestWithMapItem:handler:", v9, v23);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(buf, 8);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_98;
  block[3] = &unk_1E929C440;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v17 = v6;
  v18 = v8;
  v25 = *(_QWORD *)(a1 + 96);
  block[1] = 3221225472;
  v24 = *(_OWORD *)(a1 + 80);
  v16 = v5;
  v19 = v9;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(void **)(a1 + 64);
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = *(id *)(a1 + 72);
  v13 = v6;
  v14 = v5;
  dispatch_async(v7, block);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_98(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  SMFenceInfo *v41;
  void *v42;
  SMFenceInfo *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 112));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
      v46 = 138412802;
      v47 = v38;
      v48 = 2112;
      v49 = v39;
      v50 = 2112;
      v51 = v40;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, %@, sessionConfigLOIError, %@", (uint8_t *)&v46, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
LABEL_5:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    return;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 112));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    v9 = *(void **)(a1 + 72);
    v46 = 138413058;
    v47 = v6;
    v48 = 2112;
    v49 = v7;
    v50 = 2112;
    v51 = v8;
    v52 = 2112;
    v53 = v9;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, fetched learned LOI, %@, configuration, %@", (uint8_t *)&v46, 0x2Au);

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40))
    goto LABEL_5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 112));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "place");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v14, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "destination");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138413058;
    v47 = v12;
    v48 = 2112;
    v49 = v13;
    v50 = 2112;
    v51 = v15;
    v52 = 2112;
    v53 = v17;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, place type, %@, location, %@", (uint8_t *)&v46, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "_placeInferenceFromLOI:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18
    || (objc_msgSend(v18, "mapItem"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, !v20))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 112));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      v46 = 138413058;
      v47 = v34;
      v48 = 2112;
      v49 = v35;
      v50 = 2112;
      v51 = v19;
      v52 = 2112;
      v53 = v36;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, place inference is nill or it doens't have map item, %@, destinationLearnedLOI, %@", (uint8_t *)&v46, 0x2Au);

    }
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 80), "addObject:", v19);
  v21 = *(void **)(a1 + 88);
  objc_msgSend(v19, "mapItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", v22);
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {

LABEL_19:
    v41 = [SMFenceInfo alloc];
    objc_msgSend(*(id *)(a1 + 72), "sessionStartDate");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "destination");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "radius");
    v43 = -[SMFenceInfo initWithDate:fenceRadius:](v41, "initWithDate:fenceRadius:", v32);
    v44 = *(void **)(a1 + 88);
    objc_msgSend(v19, "mapItem");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v45);

LABEL_20:
    goto LABEL_21;
  }
  v24 = (void *)v23;
  v25 = *(void **)(a1 + 88);
  objc_msgSend(v19, "mapItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "sessionStartDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "laterDate:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "sessionStartDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30 == v31)
    goto LABEL_19;
LABEL_21:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_101(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_2_102(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  BOOL v4;
  NSObject *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 5000000000);
  v4 = dispatch_group_wait(v2, v3) == 0;
  objc_msgSend(*(id *)(a1 + 40), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 96);
  v15 = *(_OWORD *)(a1 + 80);
  v16 = v6;
  v7 = *(_OWORD *)(a1 + 128);
  v17 = *(_OWORD *)(a1 + 112);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_3;
  v10[3] = &unk_1E929C508;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v21 = v4;
  v9 = *(_QWORD *)(a1 + 144);
  v19 = 0x4014000000000000;
  v20 = v9;
  v18 = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 72);
  dispatch_async(v5, v10);

}

void __91__SMSuggestionsHelper__fetchMostLikelySessionDestinationsWithRefreshedLocationWithHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_submitMetricForFetchMostLikelySessionDestinationsWithRefreshedLocationDidComplete:didFetchNavigationRouteSummary:didFetchLOIs:didFetchNPLOIs:didFetchSessionConfigurations:timeout:", *(unsigned __int8 *)(a1 + 152), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 0, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(double *)(a1 + 136));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 152))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 144));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v2;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@, %@, timed out waiting for completion, metric, %@", buf, 0x20u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_computeMostlikelySessionDestinations:closestHome:distanceToClosestHome:nploisWithValidDistanceAndHighConfidence:fenceSizeForMapItem:placeInferences:errors:handler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24), *(_QWORD *)(a1 + 64));

}

- (id)_submitMetricForFetchMostLikelySessionDestinationsWithRefreshedLocationDidComplete:(BOOL)a3 didFetchNavigationRouteSummary:(BOOL)a4 didFetchLOIs:(BOOL)a5 didFetchNPLOIs:(BOOL)a6 didFetchSessionConfigurations:(BOOL)a7 timeout:(double)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[6];
  _QWORD v25[7];

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v25[6] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("didComplete");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("didFetchNavigationRouteSummary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  v24[2] = CFSTR("didFetchLOIs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  v24[3] = CFSTR("didFetchNPLOIs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  v24[4] = CFSTR("didFetchSessionConfigurations");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v17;
  v24[5] = CFSTR("timeout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v21 = (void *)objc_msgSend(v20, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorFetchMostLikelySessionDestinationsWithRefreshedLocationCompletion, 1);
  log_analytics_submission(v21, v19);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  return v19;
}

- (void)_computeMostlikelySessionDestinations:(id)a3 closestHome:(id)a4 distanceToClosestHome:(double)a5 nploisWithValidDistanceAndHighConfidence:(id)a6 fenceSizeForMapItem:(id)a7 placeInferences:(id)a8 errors:(id)a9 handler:(id)a10
{
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
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  objc_class *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  objc_class *v72;
  void *v73;
  void *v74;
  objc_class *v75;
  void *v76;
  void *v77;
  objc_class *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  NSObject *v90;
  objc_class *v91;
  void *v92;
  void *v93;
  objc_class *v94;
  uint64_t v95;
  void *v96;
  objc_class *v97;
  void *v98;
  void *v99;
  void *v100;
  void (**v101)(id, void *, void *, void *);
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id obj;
  void *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  void *v113;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  uint8_t v122[128];
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  double v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v111 = a7;
  v19 = a8;
  v20 = a9;
  v101 = (void (**)(id, void *, void *, void *))a10;
  if (v16)
  {
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
      v124 = v23;
      v125 = 2112;
      v126 = (uint64_t)v24;
      v127 = 2112;
      v128 = (uint64_t)v16;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, setting navigation session destination as mostLikelySessionDestination, %@", buf, 0x20u);

    }
    v25 = v16;
LABEL_5:
    v26 = v25;
    goto LABEL_6;
  }
  if (!v17)
    goto LABEL_60;
  if (+[SMSuggestionsHelper isValidDistance:](SMSuggestionsHelper, "isValidDistance:", a5))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      v84 = (objc_class *)objc_opt_class();
      NSStringFromClass(v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v124 = v85;
      v125 = 2112;
      v126 = (uint64_t)v86;
      v127 = 2112;
      v128 = (uint64_t)v17;
      v129 = 2048;
      v130 = a5;
      _os_log_impl(&dword_1D1A22000, v83, OS_LOG_TYPE_INFO, "%@, %@, setting closest home as mostLikelySessionDestination, %@, distance to home, %.3f", buf, 0x2Au);

    }
    v25 = v17;
    goto LABEL_5;
  }
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "firstObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    +[SMSuggestionsHelper placeInferenceFromNPLOI:](SMSuggestionsHelper, "placeInferenceFromNPLOI:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v88;
    if (!v26)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        v97 = (objc_class *)objc_opt_class();
        NSStringFromClass(v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v124 = v98;
        v125 = 2112;
        v126 = (uint64_t)v99;
        v127 = 2112;
        v128 = (uint64_t)v100;
        _os_log_error_impl(&dword_1D1A22000, v89, OS_LOG_TYPE_ERROR, "%@, %@, placeInference is nil, nploi, %@", buf, 0x20u);

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v91 = (objc_class *)objc_opt_class();
      NSStringFromClass(v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v124 = v92;
      v125 = 2112;
      v126 = (uint64_t)v93;
      v127 = 2112;
      v128 = (uint64_t)v26;
      _os_log_impl(&dword_1D1A22000, v90, OS_LOG_TYPE_INFO, "%@, %@, setting first nploi with high confidence as mostLikelySessionDestination, %@", buf, 0x20u);

    }
  }
  else
  {
LABEL_60:
    v26 = 0;
  }
LABEL_6:
  objc_msgSend(v26, "mapItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "objectForKey:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = v20;
  if (v28)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v124 = v31;
      v125 = 2112;
      v126 = (uint64_t)v32;
      v127 = 2112;
      v128 = (uint64_t)v26;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, %@, session configuration for mostLikelySessionDestination exists, %@", buf, 0x20u);

    }
    v121 = 0;
    +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceInfo:placeInference:error:](SMSuggestionsHelper, "createMasqueradingReferenceLocationFromFenceInfo:placeInference:error:", v28, v26, &v121);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v121;
    if (v34 || !v33)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v94 = (objc_class *)objc_opt_class();
        NSStringFromClass(v94);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v95 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v124 = v113;
        v125 = 2112;
        v126 = v95;
        v96 = (void *)v95;
        v127 = 2112;
        v128 = (uint64_t)v26;
        _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%@, %@, error creating masquerading place inference, defaulting to original, %@", buf, 0x20u);

        v20 = v105;
      }

      v36 = v26;
      objc_msgSend(v20, "addObject:", v34);
      v33 = v36;
    }

    v26 = v33;
  }
  v106 = v26;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v124 = v39;
    v125 = 2112;
    v126 = (uint64_t)v40;
    v127 = 2112;
    v128 = (uint64_t)v26;
    _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, %@, final mostLikelySessionDestination, %@", buf, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 138412802;
    v124 = v43;
    v125 = 2112;
    v126 = (uint64_t)v44;
    v127 = 2048;
    v128 = v45;
    _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, %@, final place inferences count, %lu", buf, 0x20u);

  }
  -[SMSuggestionsHelper _dedupePlaceInferencesWithOrder:](self, "_dedupePlaceInferencesWithOrder:", v19);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v46, "count");
    *(_DWORD *)buf = 138412802;
    v124 = v49;
    v125 = 2112;
    v126 = (uint64_t)v50;
    v127 = 2048;
    v128 = v51;
    _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, final deduped place inferences count, %lu", buf, 0x20u);

  }
  v102 = v19;
  v103 = v18;
  v104 = v17;

  v109 = (void *)objc_opt_new();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v46;
  v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
  if (v112)
  {
    v110 = *(_QWORD *)v118;
    do
    {
      v52 = 0;
      v53 = v28;
      do
      {
        if (*(_QWORD *)v118 != v110)
          objc_enumerationMutation(obj);
        v54 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v52);
        v55 = (void *)MEMORY[0x1D8231EA8]();
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v124 = v58;
          v125 = 2112;
          v126 = (uint64_t)v59;
          v127 = 2112;
          v128 = (uint64_t)v54;
          _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, %@, deduped place inference, %@", buf, 0x20u);

        }
        objc_msgSend(v54, "mapItem");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectForKey:", v60);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = v54;
        v62 = v61;
        if (v28)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            v64 = (objc_class *)objc_opt_class();
            NSStringFromClass(v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v124 = v65;
            v125 = 2112;
            v126 = (uint64_t)v66;
            v127 = 2112;
            v128 = (uint64_t)v62;
            _os_log_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_INFO, "%@, %@, session configuration for place inference exists, %@", buf, 0x20u);

          }
          v116 = 0;
          +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceInfo:placeInference:error:](SMSuggestionsHelper, "createMasqueradingReferenceLocationFromFenceInfo:placeInference:error:", v28, v62, &v116);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v116;
          if (v68 || !v67)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v78 = (objc_class *)objc_opt_class();
              NSStringFromClass(v78);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v79 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v124 = v107;
              v125 = 2112;
              v126 = v79;
              v80 = (void *)v79;
              v127 = 2112;
              v128 = (uint64_t)v106;
              _os_log_error_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_ERROR, "%@, %@, error creating masquerading place inference, defaulting to original, %@", buf, 0x20u);

            }
          }

          if (v67)
          {
LABEL_37:
            objc_msgSend(v109, "addObject:", v67);
            goto LABEL_42;
          }
        }
        else
        {
          v67 = v61;
          if (v61)
            goto LABEL_37;
        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v75 = (objc_class *)objc_opt_class();
          NSStringFromClass(v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v124 = v76;
          v125 = 2112;
          v126 = (uint64_t)v77;
          _os_log_error_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_ERROR, "%@, %@, finalCandidateSessionDestination is nil", buf, 0x16u);

        }
LABEL_42:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          v72 = (objc_class *)objc_opt_class();
          NSStringFromClass(v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v124 = v73;
          v125 = 2112;
          v126 = (uint64_t)v74;
          v127 = 2112;
          v128 = (uint64_t)v67;
          _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_INFO, "%@, %@, final candidate session destination, %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v55);
        ++v52;
        v53 = v28;
      }
      while (v112 != v52);
      v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v122, 16);
    }
    while (v112);
  }

  _RTSafeArray();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2](v101, v106, v109, v82);

}

- (void)onAuthorizationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SMSuggestionsHelper_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__SMSuggestionsHelper_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAuthorizationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onAuthorizationNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[SMSuggestionsHelper setRoutineEnabled:](self, "setRoutineEnabled:", objc_msgSend(v5, "enabled"));
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[SMSuggestionsHelper routineEnabled](self, "routineEnabled");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v14 = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (void)refreshCurrentLocationWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SMSuggestionsHelper_refreshCurrentLocationWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__SMSuggestionsHelper_refreshCurrentLocationWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshCurrentLocationWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_refreshCurrentLocationWithHandler:(id)a3
{
  id v5;
  void *v6;
  RTLocationRequestOptions *v7;
  RTLocationRequestOptions *v8;
  void *v9;
  RTLocationRequestOptions *v10;
  id v11;
  _QWORD v12[5];
  RTLocationRequestOptions *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  SEL v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v5 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__53;
  v20[4] = __Block_byref_object_dispose__53;
  v21 = 0;
  v6 = (void *)MEMORY[0x1D8231EA8]();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__53;
  v18[4] = __Block_byref_object_dispose__53;
  v19 = 0;
  v7 = [RTLocationRequestOptions alloc];
  v8 = -[RTLocationRequestOptions initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:](v7, "initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:", 1, 1, *MEMORY[0x1E0C9E490], 100.0, 60.0, 4.0, 100.0, 3600.0);
  -[SMSuggestionsHelper locationManager](self, "locationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke;
  v12[3] = &unk_1E929C580;
  v12[4] = self;
  v15 = v20;
  v16 = v18;
  v17 = a2;
  v10 = v8;
  v13 = v10;
  v11 = v5;
  v14 = v11;
  objc_msgSend(v9, "fetchCurrentLocationWithOptions:handler:", v10, v12);

  _Block_object_dispose(v18, 8);
  objc_autoreleasePoolPop(v6);
  _Block_object_dispose(v20, 8);

}

void __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke_2;
  v12[3] = &unk_1E929C558;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v14 = v5;
  v15 = v8;
  v19 = *(_QWORD *)(a1 + 72);
  v12[1] = 3221225472;
  v18 = *(_OWORD *)(a1 + 56);
  v13 = v6;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __58__SMSuggestionsHelper__refreshCurrentLocationWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(v12, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      v28 = 138413314;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 2048;
      v37 = -v14;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, Success, YES, options, %@, location, %@, age, %.3f", (uint8_t *)&v28, 0x34u);

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v28 = 138412802;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, setting latestLocationOfTheDevice as fetchedLastLocation, %@", (uint8_t *)&v28, 0x20u);

    }
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  }
  else
  {
    if (v7)
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 56);
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v28 = 138413058;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, Success, NO, options, %@, error, %@", (uint8_t *)&v28, 0x2Au);

    }
    v20 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "setLatestLocationOfTheDevice:", v20);
  v26 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "latestLocationOfTheDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v26 + 16))(v26, v27, *(_QWORD *)(a1 + 32));

}

- (void)getSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SMSuggestionsHelper_getSessionConfigurationsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __67__SMSuggestionsHelper_getSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getSessionConfigurationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_getSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *, _QWORD);
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSuggestionsHelper _getSessionConfigurationsWithOptions:handler:]";
      v20 = 1024;
      v21 = 1548;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10, 0);

  }
  -[SMSuggestionsHelper sessionStore](self, "sessionStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__SMSuggestionsHelper__getSessionConfigurationsWithOptions_handler___block_invoke;
  v14[3] = &unk_1E9298550;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = a2;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "fetchSessionConfigurationsWithOptions:handler:", v13, v14);

}

void __68__SMSuggestionsHelper__getSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138413570;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2048;
    v19 = objc_msgSend(v5, "count");
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, options, %@, session configurations count, %lu, fetched session configurations, %@, fetch error, %@", (uint8_t *)&v12, 0x3Eu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SMSuggestionsHelper_getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke;
  block[3] = &unk_1E9298FA0;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __77__SMSuggestionsHelper_getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getNPLOIsWithOnlyHighConfidence:location:date:handler:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  SEL v22;
  BOOL v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__53;
  v26[4] = __Block_byref_object_dispose__53;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__53;
  v24[4] = __Block_byref_object_dispose__53;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsHelper deviceLocationPredictor](self, "deviceLocationPredictor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke;
  v17[3] = &unk_1E929C608;
  v20 = v24;
  v21 = v26;
  v15 = v13;
  v19 = v15;
  v17[4] = self;
  v22 = a2;
  v23 = a3;
  v16 = v11;
  v18 = v16;
  objc_msgSend(v14, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:handler:", v16, v12, v17, 3600.0);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

}

void __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  }
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_120);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filteredArrayUsingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    v19 = objc_msgSend(v12, "count");
    v20 = v6;
    if (*(_BYTE *)(a1 + 80))
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v22 = objc_msgSend(v14, "count");
    v23 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413826;
    v27 = v17;
    v28 = 2112;
    v29 = v18;
    v30 = 2048;
    v31 = v25;
    v32 = 2048;
    v33 = v19;
    v34 = 2112;
    v35 = v21;
    v6 = v20;
    v36 = 2048;
    v37 = v22;
    v38 = 2112;
    v39 = v23;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, nplois fetched count, %lu, nploisWithoutOnlyVehicleSource count, %lu, only high confidence, %@, nploisWithOnlyHighConfidenceAndWithoutOnlyVehicleSource, %lu, w.r.t the location, %@", buf, 0x48u);

  }
  if (*(_BYTE *)(a1 + 80))
    v24 = v14;
  else
    v24 = v12;
  (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v24, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

}

uint64_t __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = a2;
  objc_msgSend(v2, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v2, "sources");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v6 = 1;
  }

  return v6 & 1;
}

BOOL __78__SMSuggestionsHelper__getNPLOIsWithOnlyHighConfidence_location_date_handler___block_invoke_3(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "confidence");
  return v2 == 1.0;
}

+ (id)getSMHandlesFromRTContacts:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  objc_class *v24;
  char *v25;
  void *v26;
  const char *aSelector;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[SMSuggestionsHelper getSMHandlesFromRTContacts:error:]";
      v36 = 1024;
      LODWORD(v37) = 1634;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contacts (in %s:%d)", buf, 0x12u);
    }

  }
  v9 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v11)
  {
    v12 = v11;
    aSelector = a2;
    obj = v10;
    v13 = 0;
    v14 = *(_QWORD *)v31;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15);
        v18 = (void *)MEMORY[0x1D8231EA8]();
        v29 = v16;
        objc_msgSend(a1, "getSMHandlesFromRTContact:error:", v17, &v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v29;

        if (a4 && v13)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v35 = v25;
            v36 = 2112;
            v37 = v26;
            v38 = 2112;
            v39 = v13;
            _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

          }
          v13 = objc_retainAutorelease(v13);
          *a4 = v13;
          v21 = v9;

          objc_autoreleasePoolPop(v18);
          v10 = obj;

          goto LABEL_22;
        }
        objc_msgSend(v9, "addObjectsFromArray:", v19);

        objc_autoreleasePoolPop(v18);
        ++v15;
        v16 = v13;
      }
      while (v12 != v15);
      v10 = obj;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v12)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v13);
  v22 = v9;
LABEL_22:

  return v9;
}

+ (id)getSMHandlesFromRTContact:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  objc_class *v32;
  uint64_t v33;
  void *v34;
  void *v37;
  char *v38;
  char *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v51 = "+[SMSuggestionsHelper getSMHandlesFromRTContact:error:]";
      v52 = 1024;
      LODWORD(v53) = 1653;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contact (in %s:%d)", buf, 0x12u);
    }

  }
  v6 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v37 = v4;
  objc_msgSend(v4, "phoneNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0D397A8], "validateAndCleanupID:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = objc_alloc(MEMORY[0x1E0D8B960]);
          objc_msgSend(MEMORY[0x1E0C99D20], "array");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithPrimaryHandle:secondaryHandles:", v14, v16);
          objc_msgSend(v6, "addObject:", v17);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v38 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v19 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v51 = v38;
            v52 = 2112;
            v53 = v19;
            v20 = (void *)v19;
            v54 = 2112;
            v55 = v12;
            _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);

          }
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    }
    while (v9);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v37, "emailAddresses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v42;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v42 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v25);
        v27 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0D397A8], "validateAndCleanupID:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = objc_alloc(MEMORY[0x1E0D8B960]);
          objc_msgSend(MEMORY[0x1E0C99D20], "array");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v29, "initWithPrimaryHandle:secondaryHandles:", v28, v30);
          objc_msgSend(v6, "addObject:", v31);

        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v39 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v33 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v51 = v39;
            v52 = 2112;
            v53 = v33;
            v34 = (void *)v33;
            v54 = 2112;
            v55 = v26;
            _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);

          }
        }

        objc_autoreleasePoolPop(v27);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v23);
  }

  if (a4)
    *a4 = 0;

  return v6;
}

+ (id)getSMHandlesFromFAFamilyMembers:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  objc_class *v29;
  char *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  objc_class *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  objc_class *v53;
  char *v54;
  void *v55;
  void *v56;
  id *v58;
  uint64_t v59;
  uint64_t v60;
  id obj;
  uint64_t v62;
  void *v63;
  void *v64;
  char *v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  uint64_t v88;

  v58 = a4;
  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v82 = "+[SMSuggestionsHelper getSMHandlesFromFAFamilyMembers:error:]";
      v83 = 1024;
      LODWORD(v84) = 1694;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: familyMembers (in %s:%d)", buf, 0x12u);
    }

  }
  v6 = (void *)objc_opt_new();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v76;
    v59 = *(_QWORD *)v76;
    do
    {
      v10 = 0;
      v60 = v8;
      do
      {
        if (*(_QWORD *)v76 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D8231EA8]();
        if ((objc_msgSend(v11, "isMe") & 1) == 0)
        {
          v64 = v12;
          objc_msgSend(v11, "contact");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v62 = v10;
            objc_msgSend(v11, "contact");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "phoneNumbers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "valueForKey:", CFSTR("value"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v16 = v15;
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v72;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v72 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                  objc_msgSend(v21, "stringValue", v58);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v22)
                  {
                    v23 = (void *)MEMORY[0x1E0D397A8];
                    objc_msgSend(v21, "stringValue");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "validateAndCleanupID:", v24);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v25)
                    {
                      v26 = objc_alloc(MEMORY[0x1E0D8B960]);
                      objc_msgSend(MEMORY[0x1E0C99D20], "array");
                      v27 = objc_claimAutoreleasedReturnValue();
                      v28 = (void *)objc_msgSend(v26, "initWithPrimaryHandle:secondaryHandles:", v25, v27);
                      objc_msgSend(v6, "addObject:", v28);

                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v27 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        v29 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v29);
                        v30 = (char *)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "stringValue");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v82 = v30;
                        v83 = 2112;
                        v84 = (uint64_t)v31;
                        v85 = 2112;
                        v86 = v32;
                        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);

                      }
                    }

                  }
                }
                v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
              }
              while (v18);
            }

            objc_msgSend(v63, "emailAddresses");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "valueForKey:", CFSTR("value"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v35 = v34;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v68;
              do
              {
                for (j = 0; j != v37; ++j)
                {
                  if (*(_QWORD *)v68 != v38)
                    objc_enumerationMutation(v35);
                  v40 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
                  if (v40)
                  {
                    objc_msgSend(MEMORY[0x1E0D397A8], "validateAndCleanupID:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v41)
                    {
                      v42 = objc_alloc(MEMORY[0x1E0D8B960]);
                      objc_msgSend(MEMORY[0x1E0C99D20], "array");
                      v43 = objc_claimAutoreleasedReturnValue();
                      v44 = (void *)objc_msgSend(v42, "initWithPrimaryHandle:secondaryHandles:", v41, v43);
                      objc_msgSend(v6, "addObject:", v44);

                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v43 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        v45 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v45);
                        v65 = (char *)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(a2);
                        v46 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v82 = v65;
                        v83 = 2112;
                        v84 = v46;
                        v47 = (void *)v46;
                        v85 = 2112;
                        v86 = v40;
                        _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);

                      }
                    }

                  }
                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
              }
              while (v37);
            }

            v9 = v59;
            v8 = v60;
            v10 = v62;
            v48 = v63;
          }
          else
          {
            v49 = (void *)MEMORY[0x1E0D397A8];
            objc_msgSend(v11, "appleID");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "validateAndCleanupID:", v50);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48)
            {
              v51 = objc_alloc(MEMORY[0x1E0D8B960]);
              objc_msgSend(MEMORY[0x1E0C99D20], "array");
              v16 = objc_claimAutoreleasedReturnValue();
              v52 = (void *)objc_msgSend(v51, "initWithPrimaryHandle:secondaryHandles:", v48, v16);
              objc_msgSend(v6, "addObject:", v52);

            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v53 = (objc_class *)objc_opt_class();
                NSStringFromClass(v53);
                v54 = (char *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "appleID");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v82 = v54;
                v83 = 2112;
                v84 = (uint64_t)v55;
                v85 = 2112;
                v86 = v56;
                _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, failed to sanitize handle, %@", buf, 0x20u);

              }
              v48 = 0;
            }
          }

          v12 = v64;
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
    }
    while (v8);
  }

  if (v58)
    *v58 = 0;

  return v6;
}

+ (BOOL)isValidDistance:(double)a3
{
  return a3 <= 300000.0 && a3 >= 500.0;
}

+ (id)placeInferenceFromNPLOI:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;

  v3 = (objc_class *)MEMORY[0x1E0D18420];
  v4 = a3;
  v19 = [v3 alloc];
  objc_msgSend(v4, "locationOfInterest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfInterest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLocationOfInterestType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLocationOfInterestType:", objc_msgSend(v6, "type"));
  objc_msgSend(v4, "locationOfInterest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:", objc_msgSend(v8, "typeSource"));
  objc_msgSend(v4, "locationOfInterest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationOfInterest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "confidence");
  v14 = v13;
  objc_msgSend(v4, "locationOfInterest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v19, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v5, v7, v9, 0, v11, v16, v14);

  return v17;
}

+ (id)createMasqueradingReferenceLocationFromFenceInfo:(id)a3 placeInference:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fenceInfo", buf, 2u);
    }

    if (a5)
    {
      v13 = CFSTR("fenceInfo");
      goto LABEL_16;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_25;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeInference", buf, 2u);
    }

    if (a5)
    {
      v13 = CFSTR("placeInference");
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  objc_msgSend(v8, "fenceRadius");
  if (v11 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fenceInfo.fenceRadius >= 0", buf, 2u);
    }

    if (a5)
    {
      v13 = CFSTR("fenceInfo.fenceRadius >= 0");
LABEL_16:
      _RTErrorInvalidParameterCreate((uint64_t)v13);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fenceRadius");
    v22 = v21;
    objc_msgSend(v8, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v45 = v19;
    v46 = 2112;
    v47 = v20;
    v48 = 2112;
    v49 = v10;
    v50 = 2048;
    v51 = v22;
    v52 = 2112;
    v53 = v23;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, %@, adjusting place inference, %@, with fence radius, %f, from session configuration date, %@", buf, 0x34u);

  }
  objc_msgSend(v8, "fenceRadius");
  v25 = v24;
  objc_msgSend(v10, "referenceLocation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  +[SMSuggestionsHelper createMasqueradingReferenceLocationFromFenceRadius:location:error:](SMSuggestionsHelper, "createMasqueradingReferenceLocationFromFenceRadius:location:error:", v26, &v43, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v43;

  if (v28)
  {
    v16 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v28);
  }
  else
  {
    v29 = objc_alloc(MEMORY[0x1E0D18420]);
    objc_msgSend(v10, "mapItem");
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finerGranularityMapItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v10, "userType");
    v32 = objc_msgSend(v10, "userTypeSource");
    v33 = objc_msgSend(v10, "placeType");
    objc_msgSend(v10, "confidence");
    v35 = v34;
    objc_msgSend(v10, "finerGranularityMapItemConfidence");
    v37 = v36;
    objc_msgSend(v10, "loiIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v29;
    v40 = (void *)v30;
    v16 = (void *)objc_msgSend(v39, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:", v30, v31, v42, v32, v33, v27, v35, v37, v38);

  }
LABEL_25:

  return v16;
}

+ (id)createMasqueradingReferenceLocationFromFenceRadius:(double)a3 location:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)&v24, 2u);
    }

    if (a5)
    {
      v10 = CFSTR("location");
      goto LABEL_11;
    }
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  if (a3 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fenceRadius >= 0", (uint8_t *)&v24, 2u);
    }

    if (a5)
    {
      v10 = CFSTR("fenceRadius >= 0");
LABEL_11:
      _RTErrorInvalidParameterCreate((uint64_t)v10);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v13 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v8, "latitude");
  v15 = v14;
  objc_msgSend(v8, "longitude");
  v17 = v16;
  objc_msgSend(v8, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v18, objc_msgSend(v8, "referenceFrame"), v15, v17, a3);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, %@, masquerading location, %@", (uint8_t *)&v24, 0x20u);

  }
LABEL_16:

  return v12;
}

+ (id)dedupeSessionConfigurations:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id obj;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v41;
    *(_QWORD *)&v6 = 138412802;
    v30 = v6;
    v32 = *(_QWORD *)v41;
    v33 = v4;
    do
    {
      v9 = 0;
      v34 = v7;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v10, "destination");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "destinationMapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            v45 = v26;
            v46 = 2112;
            v47 = v27;
            v48 = 2112;
            v49 = v10;
            _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, %@, session configuration doesn't have destination map item, %@", buf, 0x20u);

            goto LABEL_14;
          }
LABEL_15:

          goto LABEL_16;
        }
        objc_msgSend(v10, "destination");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "destinationMapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {

LABEL_13:
          objc_msgSend(v10, "destination", v30);
          v24 = objc_claimAutoreleasedReturnValue();
          -[NSObject destinationMapItem](v24, "destinationMapItem");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v26);
LABEL_14:

          goto LABEL_15;
        }
        v17 = (void *)v16;
        objc_msgSend(v10, "destination");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "destinationMapItem");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v38);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sessionStartDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sessionStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "laterDate:", v20);
        v21 = v11;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sessionStartDate");
        v37 = v14;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v22, "isEqualToDate:", v23);

        v11 = v21;
        v4 = v33;

        v7 = v34;
        v8 = v32;

        if (v36)
          goto LABEL_13;
LABEL_16:
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_placeInferenceFromLOI:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;

  v3 = (objc_class *)MEMORY[0x1E0D18420];
  v4 = a3;
  v18 = [v3 alloc];
  objc_msgSend(v4, "place");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "place");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", objc_msgSend(v6, "type"));
  objc_msgSend(v4, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", objc_msgSend(v8, "typeSource"));
  objc_msgSend(v4, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "confidence");
  v14 = v13;
  objc_msgSend(v4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v18, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v5, v7, v9, 0, v11, v15, v14);
  return v16;
}

- (id)_dedupePlaceInferencesWithOrder:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v10, "loiIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "loiIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            goto LABEL_12;
          objc_msgSend(v10, "loiIdentifier");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v15);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v27 = v17;
            v28 = 2112;
            v29 = v18;
            v30 = 2112;
            v31 = v10;
            _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, place inference doesn't have LOI identifier, %@", buf, 0x20u);

          }
        }

LABEL_12:
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTNavigationManager)navigationManager
{
  return self->_navigationManager;
}

- (RTLocation)latestLocationOfTheDevice
{
  return self->_latestLocationOfTheDevice;
}

- (void)setLatestLocationOfTheDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_latestLocationOfTheDevice, 0);
  objc_storeStrong((id *)&self->_navigationManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
}

@end
