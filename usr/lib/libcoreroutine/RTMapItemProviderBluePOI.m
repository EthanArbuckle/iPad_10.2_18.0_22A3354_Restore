@implementation RTMapItemProviderBluePOI

+ (NSArray)preferredAOICategories
{
  if (qword_1ED942A78 != -1)
    dispatch_once(&qword_1ED942A78, &__block_literal_global_25);
  return (NSArray *)(id)_MergedGlobals_5;
}

void __50__RTMapItemProviderBluePOI_preferredAOICategories__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if (!_MergedGlobals_5)
  {
    v2[0] = *MEMORY[0x1E0D26798];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)_MergedGlobals_5;
    _MergedGlobals_5 = v0;

  }
}

- (RTMapItemProviderBluePOI)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_fingerprintManager_locationManager_mapServiceManager_motionActivityManager_placeInferenceQueryStore_platform_);
}

- (RTMapItemProviderBluePOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 fingerprintManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 motionActivityManager:(id)a8 placeInferenceQueryStore:(id)a9 platform:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  RTMapItemProviderBluePOIParameters *v25;
  RTMapItemProviderBluePOI *v26;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = -[RTMapItemProviderBluePOIParameters initWithDefaultsManager:]([RTMapItemProviderBluePOIParameters alloc], "initWithDefaultsManager:", v24);
  v26 = -[RTMapItemProviderBluePOI initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:parameters:placeInferenceQueryStore:platform:](self, "initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:parameters:placeInferenceQueryStore:platform:", v24, v23, v22, v21, v20, v19, v25, v18, v17);

  return v26;
}

- (RTMapItemProviderBluePOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 fingerprintManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 motionActivityManager:(id)a8 parameters:(id)a9 placeInferenceQueryStore:(id)a10 platform:(id)a11
{
  id v17;
  id v18;
  id v19;
  RTInferredMapItemDeduper *v20;
  RTInferredMapItemDeduper *inferredMapItemDeduper;
  NSObject *v22;
  RTMapItemProviderBluePOIParameters *parameters;
  RTMapItemProviderBluePOI *v24;
  NSObject *v25;
  const char *v26;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  RTMapItemProviderBluePOIParameters *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v29 = a4;
  v18 = a5;
  v34 = a6;
  v33 = a7;
  v32 = a8;
  v31 = a9;
  v30 = a10;
  v19 = a11;
  v28 = v19;
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_33:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_34;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_33;
  }
  if (!v34)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_33;
  }
  if (!v33)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_33;
  }
  if (!v32)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_33;
  }
  if (!v31)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: parameters";
    goto LABEL_33;
  }
  if (!v30)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_33;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: platform";
    goto LABEL_33;
  }
  v35.receiver = self;
  v35.super_class = (Class)RTMapItemProviderBluePOI;
  self = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v35, sel_initWithDefaultsManager_distanceCalculator_, v17, v29);
  if (self)
  {
    v20 = -[RTInferredMapItemDeduper initWithDeduperFunction:]([RTInferredMapItemDeduper alloc], "initWithDeduperFunction:", &__block_literal_global_9);
    inferredMapItemDeduper = self->_inferredMapItemDeduper;
    self->_inferredMapItemDeduper = v20;

    if (self->_inferredMapItemDeduper)
    {
      objc_storeStrong((id *)&self->_fingerprintManager, a5);
      objc_storeStrong((id *)&self->_locationManager, a6);
      objc_storeStrong((id *)&self->_mapServiceManager, a7);
      objc_storeStrong((id *)&self->_motionActivityManager, a8);
      objc_storeStrong((id *)&self->_placeInferenceQueryStore, a10);
      objc_storeStrong((id *)&self->_platform, a11);
      objc_storeStrong((id *)&self->_parameters, a9);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        parameters = self->_parameters;
        *(_DWORD *)buf = 138412290;
        v37 = parameters;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderBluePOI with parameters: %@", buf, 0xCu);
      }

      goto LABEL_14;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: _inferredMapItemDeduper";
      goto LABEL_33;
    }
LABEL_34:

    v24 = 0;
    goto LABEL_35;
  }
LABEL_14:
  self = self;
  v24 = self;
LABEL_35:

  return v24;
}

uint64_t __191__RTMapItemProviderBluePOI_initWithDefaultsManager_distanceCalculator_fingerprintManager_locationManager_mapServiceManager_motionActivityManager_parameters_placeInferenceQueryStore_platform___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToMapItem:", v7);

  objc_msgSend(v5, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "extendedAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "wifiFingerprintLabelType");
  objc_msgSend(v4, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "extendedAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "wifiFingerprintLabelType");

  if (v11 == v14)
    return v8;
  else
    return 0;
}

- (id)fingerprintsBetweenStartDate:(id)a3 endDate:(id)a4 isTimeWindowFallback:(BOOL *)a5 settledState:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  NSObject *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  dispatch_time_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  char v58;
  NSObject *v59;
  id v60;
  id v61;
  NSObject *v62;
  id v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  void *v67;
  const __CFString *v68;
  id v69;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  const char *aSelector;
  NSObject *dsema;
  _QWORD v81[4];
  NSObject *v82;
  _BYTE *v83;
  uint64_t *v84;
  _QWORD v85[4];
  NSObject *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  id *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  id *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _BYTE v101[24];
  uint64_t (*v102)(uint64_t, uint64_t);
  _BYTE v103[20];
  __int16 v104;
  const __CFString *v105;
  __int16 v106;
  id v107;
  _BYTE buf[12];
  __int16 v109;
  id v110;
  __int16 v111;
  id v112;
  __int16 v113;
  void *v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v101 = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v101, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
      v60 = 0;
      *a7 = v33;
      goto LABEL_44;
    }
LABEL_30:
    v60 = 0;
    goto LABEL_44;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v101 = 0;
      _os_log_error_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v101, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
      v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  aSelector = a2;
  v95 = 0;
  v96 = (id *)&v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__31;
  v99 = __Block_byref_object_dispose__31;
  v100 = 0;
  v89 = 0;
  v90 = (id *)&v89;
  v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__31;
  v93 = __Block_byref_object_dispose__31;
  v94 = 0;
  v13 = dispatch_semaphore_create(0);
  -[RTMapItemProviderBluePOI fingerprintManager](self, "fingerprintManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke;
  v85[3] = &unk_1E9296EE0;
  v87 = &v95;
  v88 = &v89;
  v15 = v13;
  v86 = v15;
  objc_msgSend(v14, "fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:", v10, v12, a6, v85);

  dsema = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v17))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v101 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v101, 2u);
  }

  v27 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)buf = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v101 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, buf, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_retainAutorelease(v29);

    v31 = 0;
  }
  else
  {
LABEL_12:
    v30 = 0;
    v31 = 1;
  }

  v34 = v30;
  if ((v31 & 1) == 0)
    objc_storeStrong(v90 + 5, v30);
  if (a6 == 2 && !v90[5] && !objc_msgSend(v96[5], "count"))
  {
    *a5 = 1;
    *(_QWORD *)v101 = 0;
    *(_QWORD *)&v101[8] = v101;
    *(_QWORD *)&v101[16] = 0x3032000000;
    v102 = __Block_byref_object_copy__31;
    *(_QWORD *)v103 = __Block_byref_object_dispose__31;
    *(_QWORD *)&v103[8] = 0;
    -[RTMapItemProviderBluePOI _determineFingerprintFallbackDateIntervalFromStartDate:endDate:](self, "_determineFingerprintFallbackDateIntervalFromStartDate:endDate:", v10, v12);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "stringFromDate");
      v73 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringFromDate");
      v71 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringFromDate");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "endDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringFromDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v73;
      v109 = 2112;
      v110 = v71;
      v111 = 2112;
      v112 = v37;
      v113 = 2112;
      v114 = v39;
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "Zero fingerprints found between startDate %@, endDate, %@, fallback query between fallbackStartDate %@ and fallbackEndDate %@", buf, 0x2Au);

    }
    -[RTMapItemProviderBluePOI fingerprintManager](self, "fingerprintManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "startDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "endDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke_15;
    v81[3] = &unk_1E9296EE0;
    v83 = v101;
    v84 = &v89;
    v43 = dsema;
    v82 = v43;
    objc_msgSend(v40, "fetchFingerprintsBetweenStartDate:endDate:filteredBySettledState:handler:", v41, v42, 2, v81);

    v44 = v43;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v44, v45))
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "timeIntervalSinceDate:", v74);
    v47 = v46;
    v48 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "filteredArrayUsingPredicate:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "submitToCoreAnalytics:type:duration:", v52, 1, v47);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v54 = (void *)MEMORY[0x1E0CB35C8];
    v115[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v115, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = objc_retainAutorelease(v56);

      v58 = 0;
    }
    else
    {
LABEL_31:
      v58 = 1;
      v57 = v34;
    }

    v61 = v57;
    if ((v58 & 1) == 0)
      objc_storeStrong(v90 + 5, v57);
    if (!v90[5])
      objc_storeStrong(v96 + 5, *(id *)(*(_QWORD *)&v101[8] + 40));

    _Block_object_dispose(v101, 8);
    v34 = v61;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(aSelector);
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v96[5], "count");
    objc_msgSend(v10, "stringFromDate");
    v65 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)v66;
    v68 = CFSTR("YES");
    v69 = v90[5];
    if (!*a5)
      v68 = CFSTR("NO");
    *(_DWORD *)v101 = 138413826;
    *(_QWORD *)&v101[4] = v63;
    *(_WORD *)&v101[12] = 2048;
    *(_QWORD *)&v101[14] = v64;
    *(_WORD *)&v101[22] = 2112;
    v102 = v65;
    *(_WORD *)v103 = 2112;
    *(_QWORD *)&v103[2] = v66;
    *(_WORD *)&v103[10] = 2048;
    *(_QWORD *)&v103[12] = a6;
    v104 = 2112;
    v105 = v68;
    v106 = 2112;
    v107 = v69;
    _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "%@, fingerprints count, %lu, startDate %@, endData, %@, settledState, %lu, isTimeWindowFallback, %@, error, %@", v101, 0x48u);

  }
  if (a7)
    *a7 = objc_retainAutorelease(v90[5]);
  v60 = v96[5];

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v95, 8);

LABEL_44:
  return v60;
}

void __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __105__RTMapItemProviderBluePOI_fingerprintsBetweenStartDate_endDate_isTimeWindowFallback_settledState_error___block_invoke_15(uint64_t a1, void *a2, void *a3)
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

- (id)_determineFingerprintFallbackDateIntervalFromStartDate:(id)a3 endDate:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "dateWithTimeInterval:sinceDate:", a3, -300.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v6, 300.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  return v9;
}

- (id)accessPointsForFingerprint:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  _QWORD v38[4];
  NSObject *v39;
  uint8_t *v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint8_t v55[16];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fingerprint", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("fingerprint"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v34 = 0;
      *a5 = v31;
      goto LABEL_24;
    }
LABEL_23:
    v34 = 0;
    goto LABEL_24;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  *(_QWORD *)buf = 0;
  v49 = buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__31;
  v52 = __Block_byref_object_dispose__31;
  v53 = 0;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__31;
  v46 = __Block_byref_object_dispose__31;
  v47 = 0;
  v11 = dispatch_semaphore_create(0);
  -[RTMapItemProviderBluePOI fingerprintManager](self, "fingerprintManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __69__RTMapItemProviderBluePOI_accessPointsForFingerprint_endDate_error___block_invoke;
  v38[3] = &unk_1E9296EE0;
  v40 = buf;
  v41 = &v42;
  v13 = v11;
  v39 = v13;
  objc_msgSend(v12, "fetchWifiAccessPointsForFingerprint:handler:", v8, v38);

  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timeIntervalSinceDate:", v15);
  v18 = v17;
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v55 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v55, 2u);
  }

  v25 = (void *)MEMORY[0x1E0CB35C8];
  v54 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v55 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_retainAutorelease(v27);

    v29 = 0;
  }
  else
  {
LABEL_12:
    v28 = 0;
    v29 = 1;
  }

  v32 = v28;
  if ((v29 & 1) == 0)
    objc_storeStrong(v43 + 5, v28);
  if (a5)
    *a5 = objc_retainAutorelease(v43[5]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K <= %@"), CFSTR("date"), v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v49 + 5), "filteredArrayUsingPredicate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(buf, 8);

LABEL_24:
  return v34;
}

void __69__RTMapItemProviderBluePOI_accessPointsForFingerprint_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)locationsForAccessPoints:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  RTMapItemProviderBluePOIParameters *parameters;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v8 && v10)
  {
    objc_msgSend(v10, "timeIntervalSinceDate:", v8);
    v13 = v12 / 60.0;
    -[RTMapItemProviderBluePOIParameters locationLookupWindowMinMinutes](self->_parameters, "locationLookupWindowMinMinutes");
    parameters = self->_parameters;
    if (v13 >= v15)
    {
      -[RTMapItemProviderBluePOIParameters locationLookupWindowMaxMinutes](parameters, "locationLookupWindowMaxMinutes");
      if (v13 <= v17)
      {
LABEL_8:
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v10);
        -[RTMapItemProviderBluePOI locationsInDateInterval:error:](self, "locationsInDateInterval:error:", v19, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      -[RTMapItemProviderBluePOIParameters locationLookupWindowMaxMinutes](self->_parameters, "locationLookupWindowMaxMinutes");
    }
    else
    {
      -[RTMapItemProviderBluePOIParameters locationLookupWindowMinMinutes](parameters, "locationLookupWindowMinMinutes");
    }
    objc_msgSend(v8, "dateByAddingTimeInterval:", v16 * 60.0);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

- (id)locationsInDateInterval:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  double v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _RTMap *v33;
  _RTMap *v34;
  void *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint8_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint8_t v47[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint8_t buf[16];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    *(_QWORD *)v47 = 0;
    v48 = v47;
    v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__31;
    v51 = __Block_byref_object_dispose__31;
    v52 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__31;
    v45 = __Block_byref_object_dispose__31;
    v46 = 0;
    v7 = dispatch_semaphore_create(0);
    v8 = objc_alloc(MEMORY[0x1E0D184F0]);
    -[RTMapItemProviderBluePOIParameters locationUncertaintyThreshold](self->_parameters, "locationUncertaintyThreshold");
    v36 = (void *)objc_msgSend(v8, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v6, -[RTMapItemProviderBluePOIParameters maxLocationsPerFingerprint](self->_parameters, "maxLocationsPerFingerprint")- 1, 0, v9);
    -[RTMapItemProviderBluePOI locationManager](self, "locationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __58__RTMapItemProviderBluePOI_locationsInDateInterval_error___block_invoke;
    v37[3] = &unk_1E9296EE0;
    v39 = v47;
    v40 = &v41;
    v11 = v7;
    v38 = v11;
    objc_msgSend(v10, "fetchStoredLocationsWithOptions:handler:", v36, v37);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v53 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v53, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_retainAutorelease(v26);

      v28 = 0;
    }
    else
    {
LABEL_7:
      v27 = 0;
      v28 = 1;
    }

    v29 = v27;
    if ((v28 & 1) == 0)
      objc_storeStrong((id *)v48 + 5, v27);
    v30 = (void *)*((_QWORD *)v48 + 5);
    if (v30)
    {
      v31 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v30);
    }
    else
    {
      v33 = [_RTMap alloc];
      v34 = -[_RTMap initWithInput:](v33, "initWithInput:", v42[5]);
      -[_RTMap withBlock:](v34, "withBlock:", &__block_literal_global_34);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(v47, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v47 = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v47, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

void __58__RTMapItemProviderBluePOI_locationsInDateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v9 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __58__RTMapItemProviderBluePOI_locationsInDateInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D183B0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCLLocation:", v3);

  return v4;
}

- (id)motionActivitesFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  id v31;
  id v32;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint8_t buf[16];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v45 = 0;
    v46 = (id *)&v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__31;
    v49 = __Block_byref_object_dispose__31;
    v50 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__31;
    v43 = __Block_byref_object_dispose__31;
    v44 = 0;
    v11 = dispatch_semaphore_create(0);
    -[RTMapItemProviderBluePOI motionActivityManager](self, "motionActivityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __57__RTMapItemProviderBluePOI_motionActivitesFrom_to_error___block_invoke;
    v35[3] = &unk_1E9296EE0;
    v37 = &v39;
    v38 = &v45;
    v13 = v11;
    v36 = v13;
    objc_msgSend(v12, "fetchMotionActivitiesFromStartDate:endDate:handler:", v7, v9, v35);

    v14 = v13;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v14, v16))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v15);
    v19 = v18;
    v20 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v51, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

      v30 = 0;
    }
    else
    {
LABEL_8:
      v29 = 0;
      v30 = 1;
    }

    v31 = v29;
    if ((v30 & 1) == 0)
      objc_storeStrong(v46 + 5, v29);
    v32 = v46[5];
    if (v32)
    {
      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v32);
    }
    else
    {
      v10 = (id)v40[5];
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v45, 8);

  }
  return v10;
}

void __57__RTMapItemProviderBluePOI_motionActivitesFrom_to_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)dedupeQueryResults:(id)a3 error:(id *)a4
{
  id v7;
  _RTMap *v8;
  void *v9;
  RTInferredMapItemDeduperState *v10;
  RTInferredMapItemDeduper *inferredMapItemDeduper;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v7);
    -[_RTMap withBlock:](v8, "withBlock:", &__block_literal_global_39);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc_init(RTInferredMapItemDeduperState);
    inferredMapItemDeduper = self->_inferredMapItemDeduper;
    v39 = 0;
    -[RTInferredMapItemDeduper dedupeDoubleArrayOfInferredMapItems:state:error:](inferredMapItemDeduper, "dedupeDoubleArrayOfInferredMapItems:state:error:", v9, v10, &v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v39;
    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v30;
        v44 = 2112;
        v45 = v13;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      v15 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      goto LABEL_30;
    }
    v38 = 0;
    -[RTMapItemProviderBluePOI collapseDedupedInferredMapItems:inferredMapItemDeduperState:error:](self, "collapseDedupedInferredMapItems:inferredMapItemDeduperState:error:", v12, v10, &v38);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v38;
    if (v18)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v31;
        v44 = 2112;
        v45 = v18;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      if (a4)
      {
        v15 = 0;
        *a4 = objc_retainAutorelease(v18);
LABEL_29:

LABEL_30:
        goto LABEL_31;
      }
    }
    else
    {
      v20 = objc_msgSend(v17, "count");
      if (v20 == objc_msgSend(v7, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v33 = v12;
          v35 = v9;
          v21 = 0;
          do
          {
            v22 = objc_alloc(MEMORY[0x1E0D18408]);
            objc_msgSend(v17, "objectAtIndexedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "secondObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)objc_msgSend(v22, "initWithFirstObject:secondObject:", v23, v25);

            objc_msgSend(v15, "addObject:", v26);
            ++v21;
          }
          while (v21 < objc_msgSend(v17, "count"));
          v9 = v35;
          v18 = 0;
          v12 = v33;
        }
        goto LABEL_29;
      }
      v36 = (id)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0D18598];
      v40 = *MEMORY[0x1E0CB2D50];
      v41 = CFSTR("collapsedDedupedInferredMapItems.count != queryResults.count");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", v34, 0, v27);
      v37 = (id)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v32;
        v44 = 2112;
        v45 = v37;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      if (a4)
        *a4 = objc_retainAutorelease(v37);

    }
    v15 = 0;
    goto LABEL_29;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queryResults", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("queryResults"));
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_31:

  return v15;
}

uint64_t __53__RTMapItemProviderBluePOI_dedupeQueryResults_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstObject");
}

- (id)collapseDedupedInferredMapItems:(id)a3 inferredMapItemDeduperState:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  const __CFString *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  void *v60;
  void *v61;
  uint64_t v62;
  const char *aSelector;
  id *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: allDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v50 = CFSTR("allDedupedInferredMapItems");
LABEL_38:
      _RTErrorInvalidParameterCreate((uint64_t)v50);
      v48 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    }
LABEL_39:
    v48 = 0;
    goto LABEL_50;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (a5)
    {
      v50 = CFSTR("inferredMapItemDeduperState");
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  aSelector = a2;
  v11 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v13 = v8;
  v65 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
  if (v65)
  {
    v14 = *(_QWORD *)v81;
    v15 = 0x1E0C99000uLL;
    v69 = v10;
    v64 = a5;
    v67 = v13;
    v68 = v12;
    v62 = *(_QWORD *)v81;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v81 != v14)
          objc_enumerationMutation(v13);
        v66 = v16;
        v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v16);
        objc_msgSend(*(id *)(v11 + 3560), "arrayWithCapacity:", objc_msgSend(v17, "count"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v15 + 3592), "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v19 = v17;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v77 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              objc_msgSend(v24, "mapItem");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "objectForKeyedSubscript:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = (void *)MEMORY[0x1E0CB37E8];
              if (v27)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "doubleValue");
                v31 = v30;
                objc_msgSend(v24, "confidence");
                objc_msgSend(v28, "numberWithDouble:", v31 + v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v33, v26);

              }
              else
              {
                objc_msgSend(v24, "confidence");
                objc_msgSend(v28, "numberWithDouble:");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v29, v26);
              }

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
          }
          while (v21);
        }

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v34 = v18;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
        v10 = v69;
        if (!v35)
          goto LABEL_27;
        v36 = v35;
        v37 = *(_QWORD *)v73;
        while (2)
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v73 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * j);
            objc_msgSend(v34, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            v42 = v41;

            if (v42 > 1.0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("confidence for uuid %@ was greater than 1"), v39);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)MEMORY[0x1E0CB35C8];
              v54 = *MEMORY[0x1E0D18598];
              v88 = *MEMORY[0x1E0CB2D50];
              v89 = v52;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "errorWithDomain:code:userInfo:", v54, 0, v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(aSelector);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v85 = v60;
                v86 = 2112;
                v87 = v56;
                _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

              }
              v43 = v56;
              goto LABEL_46;
            }
            v71 = 0;
            objc_msgSend(v69, "mapItemForDedupedUUID:error:", v39, &v71);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v71;
            if (v44)
            {
              v56 = v44;
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(aSelector);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v85 = v61;
                v86 = 2112;
                v87 = v56;
                _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

              }
              v52 = v56;
LABEL_46:
              v12 = v68;
              if (v64)
                *v64 = objc_retainAutorelease(v56);

              v48 = 0;
              v10 = v69;
              goto LABEL_49;
            }
            v45 = objc_alloc(MEMORY[0x1E0D183A8]);
            objc_msgSend(v34, "objectForKeyedSubscript:", v39);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "doubleValue");
            v47 = (void *)objc_msgSend(v45, "initWithMapItem:confidence:source:", v43, 0x4000);

            objc_msgSend(v70, "addObject:", v47);
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
          if (v36)
            continue;
          break;
        }
LABEL_27:

        v12 = v68;
        objc_msgSend(v68, "addObject:", v70);

        v16 = v66 + 1;
        v13 = v67;
        v11 = 0x1E0C99000;
        v14 = v62;
        v15 = 0x1E0C99000;
      }
      while (v66 + 1 != v65);
      v65 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
    }
    while (v65);
  }

  v48 = v12;
LABEL_49:

LABEL_50:
  return v48;
}

- (id)sortedAveragedQueryResults:(id)a3 baseDuration:(double)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  void *v65;
  const char *aSelector;
  id *v67;
  id v68;
  id obj;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  void *v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  id v91;
  uint64_t v92;
  const __CFString *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!objc_msgSend(v8, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: correctedQueryResults.count != 0", buf, 2u);
    }

    if (a5)
    {
      v10 = CFSTR("correctedQueryResults.count != 0");
      goto LABEL_11;
    }
LABEL_30:
    v12 = 0;
    goto LABEL_48;
  }
  if (a4 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: baseDuration >= 0", buf, 2u);
    }

    if (a5)
    {
      v10 = CFSTR("baseDuration >= 0");
LABEL_11:
      _RTErrorInvalidParameterCreate((uint64_t)v10);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
    goto LABEL_30;
  }
  aSelector = a2;
  v67 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v68 = v8;
  obj = v8;
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
  if (v71)
  {
    v70 = *(_QWORD *)v84;
    v14 = 0.0;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v84 != v70)
          objc_enumerationMutation(obj);
        v72 = v15;
        v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v15);
        objc_msgSend(v16, "secondObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "duration");
        v19 = v18;

        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        objc_msgSend(v16, "firstObject");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v80 != v22)
                objc_enumerationMutation(v74);
              v24 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              v25 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v24, "mapItem");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "muid"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", v27);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_alloc(MEMORY[0x1E0CB3598]);
                objc_msgSend(v24, "confidence");
                v32 = v31;
                objc_msgSend(v16, "secondObject");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "duration");
                v35 = (void *)objc_msgSend(v30, "initWithDouble:", v32 * (v34 + a4));
                objc_msgSend(v29, "decimalNumberByAdding:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, v27);

              }
              else
              {
                v37 = objc_alloc(MEMORY[0x1E0CB3598]);
                objc_msgSend(v24, "confidence");
                v39 = v38;
                objc_msgSend(v16, "secondObject");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "duration");
                v42 = (void *)objc_msgSend(v37, "initWithDouble:", v39 * (v41 + a4));
                objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, v27);

                objc_msgSend(v24, "mapItem");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v29, v27);
              }

            }
            v21 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
          }
          while (v21);
        }
        v14 = v14 + v19;

        v15 = v72 + 1;
      }
      while (v72 + 1 != v71);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    }
    while (v71);
  }
  else
  {
    v14 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v44 = v13;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v76;
    while (2)
    {
      for (j = 0; j != v46; ++j)
      {
        if (*(_QWORD *)v76 != v47)
          objc_enumerationMutation(v44);
        v49 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j);
        objc_msgSend(v44, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithDouble:", v14 + a4 * (double)(unint64_t)objc_msgSend(obj, "count"));
        objc_msgSend(v50, "decimalNumberByDividingBy:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "doubleValue");
        v54 = v53;

        v55 = objc_alloc(MEMORY[0x1E0D183A8]);
        objc_msgSend(v73, "objectForKeyedSubscript:", v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v55, "initWithMapItem:confidence:source:", v56, 0x4000, v54);

        if (!v57)
        {
          v60 = (void *)MEMORY[0x1E0CB35C8];
          v61 = *MEMORY[0x1E0D18598];
          v92 = *MEMORY[0x1E0CB2D50];
          v93 = CFSTR("inferredMapItem was nil");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "errorWithDomain:code:userInfo:", v61, 0, v62);
          v59 = (id)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v89 = v65;
            v90 = 2112;
            v91 = v59;
            _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v8 = v68;
          if (v67)
          {
            v59 = objc_retainAutorelease(v59);
            v12 = 0;
            *v67 = v59;
          }
          else
          {
            v12 = 0;
          }
          v58 = v44;
          goto LABEL_47;
        }
        objc_msgSend(v43, "addObject:", v57);

      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
      if (v46)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sortedArrayUsingDescriptors:", v59);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v68;
LABEL_47:

LABEL_48:
  return v12;
}

- (BOOL)chooseBestAoiInferredMapItem:(id *)a3 PoiInferredMapItem:(id *)a4 fromSortedAveragedResults:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[16];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = v9;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAoiInferredMapItem", buf, 2u);
    }

    if (!a6)
      goto LABEL_30;
    v21 = CFSTR("outAoiInferredMapItem");
    goto LABEL_29;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outPoiInferredMapItem", buf, 2u);
    }

    if (!a6)
      goto LABEL_30;
    v21 = CFSTR("outPoiInferredMapItem");
LABEL_29:
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedAveragedResults", buf, 2u);
    }

    if (a6)
    {
      v21 = CFSTR("sortedAveragedResults");
      goto LABEL_29;
    }
LABEL_30:
    v23 = 0;
    goto LABEL_31;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = v9;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v16, "mapItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "extendedAttributes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "wifiFingerprintLabelType");

        if (v19 != 2)
        {
          *a4 = objc_retainAutorelease(v16);
          goto LABEL_24;
        }
        if (!*a3)
          *a3 = objc_retainAutorelease(v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_24:

  v23 = 1;
  v10 = v26;
LABEL_31:

  return v23;
}

- (id)sortQueryResults:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v29;
  const char *aSelector;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    aSelector = a2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = *MEMORY[0x1E0D18598];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("mapItem"), 0, &__block_literal_global_76);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = v13;
          v46[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sortedArrayUsingDescriptors:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_alloc(MEMORY[0x1E0D18408]);
          objc_msgSend(v12, "secondObject");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v18, "initWithFirstObject:secondObject:", v17, v19);

          if (v20)
          {
            objc_msgSend(v35, "addObject:", v20);
          }
          else
          {
            v21 = (void *)MEMORY[0x1E0CB35C8];
            v44 = v32;
            v45 = CFSTR("sortedQueryResult was nil");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", v33, 0, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v41 = v29;
              v42 = 2112;
              v43 = v23;
              _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

            }
            if (a4)
              *a4 = objc_retainAutorelease(v23);

          }
          if (!v20)
          {

            v26 = 0;
            v25 = v35;
            goto LABEL_19;
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        if (v9)
          continue;
        break;
      }
    }

    v25 = v35;
    v26 = v35;
LABEL_19:

    v7 = v31;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queryResults", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("queryResults"));
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

uint64_t __51__RTMapItemProviderBluePOI_sortQueryResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "extendedAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wifiFingerprintLabelType");

  objc_msgSend(v4, "extendedAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "wifiFingerprintLabelType");
  v9 = 1;
  v10 = -1;
  if (v6 == 1)
    v11 = 1;
  else
    v11 = -1;
  if (v8 != 2)
    v10 = v11;
  if (v6 != 2)
    v9 = v10;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

- (id)bestQueryFromSortedQueryResults:(id)a3 bestInferredMapItem:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v37;
  SEL aSelector;
  const char *aSelectora;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;
  const __CFString *v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
    {
      if (v10)
      {
        aSelector = a2;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v11 = v9;
        v43 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
        if (v43)
        {
          v40 = v9;
          v12 = 0;
          obj = v11;
          v42 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v49 != v42)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              objc_msgSend(v14, "firstObject", aSelector);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v45;
                while (2)
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v45 != v18)
                      objc_enumerationMutation(v15);
                    if (-[RTInferredMapItemDeduper inferredMapItem:dedupesToInferredMapItem:error:](self->_inferredMapItemDeduper, "inferredMapItem:dedupesToInferredMapItem:error:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v10, 0))
                    {
                      if (v12)
                      {
                        objc_msgSend(v14, "secondObject");
                        v20 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v20, "duration");
                        v22 = v21;
                        objc_msgSend(v12, "secondObject");
                        v23 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "duration");
                        v25 = v24;

                        if (v22 > v25)
                        {
                          v26 = v14;

                          v12 = v26;
                        }
                      }
                      else
                      {
                        v12 = v14;
                      }
                      goto LABEL_22;
                    }
                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
                  if (v17)
                    continue;
                  break;
                }
              }
LABEL_22:

            }
            v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
          }
          while (v43);

          v9 = v40;
          if (v12)
          {
            objc_msgSend(v12, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

            goto LABEL_47;
          }
        }
        else
        {

        }
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0D18598];
        v56 = *MEMORY[0x1E0CB2D50];
        v57 = CFSTR("bestQuery is nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1, aSelector);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 0, v34);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(aSelectora);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v53 = v37;
          v54 = 2112;
          v55 = v12;
          _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        if (a5)
        {
          v12 = objc_retainAutorelease(v12);
          v27 = 0;
          *a5 = v12;
        }
        else
        {
          v27 = 0;
        }
        goto LABEL_46;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bestInferredMapItem", buf, 2u);
      }

      if (a5)
      {
        v29 = CFSTR("bestInferredMapItem");
        goto LABEL_38;
      }
LABEL_39:
      v27 = 0;
      goto LABEL_47;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults.count > 0", buf, 2u);
    }

    if (!a5)
      goto LABEL_39;
    v29 = CFSTR("sortedQueryResults.count > 0");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults", buf, 2u);
    }

    if (!a5)
      goto LABEL_39;
    v29 = CFSTR("sortedQueryResults");
  }
LABEL_38:
  _RTErrorInvalidParameterCreate((uint64_t)v29);
  v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

  return v27;
}

- (BOOL)sortedQueryResult:(id)a3 correspondsToAoi:(id)a4 poi:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  RTInferredMapItemDeduper *inferredMapItemDeduper;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  const char *v26;
  RTMapItemProviderBluePOI *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[16];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: sortedQueryResult";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_22;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: bestAoiInferredMapItem";
    goto LABEL_21;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: bestPoiInferredMapItem";
      goto LABEL_21;
    }
LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v8, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();
  -[NSObject firstObject](v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_22;
  inferredMapItemDeduper = self->_inferredMapItemDeduper;
  -[NSObject firstObject](v12, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(inferredMapItemDeduper) = -[RTInferredMapItemDeduper inferredMapItem:dedupesToInferredMapItem:error:](inferredMapItemDeduper, "inferredMapItem:dedupesToInferredMapItem:error:", v9, v15, 0);

  if (!(_DWORD)inferredMapItemDeduper)
    goto LABEL_22;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v12;
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v16)
  {
    v17 = v16;
    v28 = self;
    v29 = v11;
    v18 = *(_QWORD *)v31;
LABEL_8:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v18)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
      objc_msgSend(v20, "mapItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "extendedAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "wifiFingerprintLabelType");

      if (v23 != 2)
        break;
      if (v17 == ++v19)
      {
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v17)
          goto LABEL_8;
        v24 = 0;
        v25 = v12;
        v11 = v29;
        goto LABEL_27;
      }
    }
    v25 = v20;

    if (v25)
    {
      v11 = v29;
      v24 = -[RTInferredMapItemDeduper inferredMapItem:dedupesToInferredMapItem:error:](v28->_inferredMapItemDeduper, "inferredMapItem:dedupesToInferredMapItem:error:", v29, v25, 0);
      goto LABEL_27;
    }
    v24 = 0;
    v11 = v29;
  }
  else
  {
    v24 = 0;
    v25 = v12;
LABEL_27:

  }
LABEL_23:

  return v24;
}

- (id)bestQueryFromSortedQueryResults:(id)a3 bestAoiInferredMapItem:(id)a4 bestPoiInferredMapItem:(id)a5 error:(id *)a6
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  id v28;
  NSObject *v29;
  const __CFString *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  unint64_t v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  SEL aSelector;
  const char *aSelectora;
  id v49;
  id *v50;
  unint64_t v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults", buf, 2u);
    }

    if (!a6)
      goto LABEL_35;
    v30 = CFSTR("sortedQueryResults");
    goto LABEL_29;
  }
  if (!objc_msgSend(v11, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sortedQueryResults.count > 0", buf, 2u);
    }

    if (!a6)
      goto LABEL_35;
    v30 = CFSTR("sortedQueryResults.count > 0");
LABEL_29:
    _RTErrorInvalidParameterCreate((uint64_t)v30);
    v28 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (!(v12 | v13))
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0D18598];
    v63 = *MEMORY[0x1E0CB2D50];
    v64[0] = CFSTR("both bestAoiInferredMapItem and bestPoiInferredMapItem are nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 0, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = v44;
      v61 = 2112;
      v62 = v35;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a6)
      *a6 = objc_retainAutorelease(v35);

LABEL_35:
    v28 = 0;
    goto LABEL_36;
  }
  v51 = v12;
  if (v12 && v13)
  {
    aSelector = a2;
    v50 = a6;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v15)
    {
      v16 = v15;
      v49 = v11;
      v17 = 0;
      v18 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v55 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          if (-[RTMapItemProviderBluePOI sortedQueryResult:correspondsToAoi:poi:](self, "sortedQueryResult:correspondsToAoi:poi:", v20, v12, v13, aSelector))
          {
            if (v17)
            {
              objc_msgSend(v20, "secondObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "duration");
              v23 = v22;
              objc_msgSend(v17, "secondObject");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "duration");
              v26 = v25;

              if (v23 > v26)
              {
                v27 = v20;

                v17 = v27;
              }
              v12 = v51;
            }
            else
            {
              v17 = v20;
            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v16);

      v11 = v49;
      if (v17)
      {
        objc_msgSend(v17, "firstObject");
        v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

        goto LABEL_36;
      }
    }
    else
    {

    }
    v53 = 0;
    -[RTMapItemProviderBluePOI bestQueryFromSortedQueryResults:bestInferredMapItem:error:](self, "bestQueryFromSortedQueryResults:bestInferredMapItem:error:", v14, v12, &v53, aSelector);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v53;
    if (v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelectora);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v60 = v46;
        v61 = 2112;
        v62 = v17;
        _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        v12 = v51;
      }

      v28 = 0;
      if (v50)
        *v50 = objc_retainAutorelease(v17);
    }
    else
    {
      v28 = v42;
    }

    goto LABEL_55;
  }
  if (v12)
    v38 = v12;
  else
    v38 = v13;
  v52 = 0;
  -[RTMapItemProviderBluePOI bestQueryFromSortedQueryResults:bestInferredMapItem:error:](self, "bestQueryFromSortedQueryResults:bestInferredMapItem:error:", v11, v38, &v52);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v52;
  if (v40)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = v45;
      v61 = 2112;
      v62 = v40;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      v12 = v51;
    }

    v28 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v40);
  }
  else
  {
    v28 = v39;
  }

LABEL_36:
  return v28;
}

- (id)bestQueryFromAggregatedQueries:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  unint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  id v46;
  void *v47;
  unint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  unint64_t v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  unint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  id v77;
  void *v78;
  unint64_t v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  id *v92;
  RTMapItemProviderBluePOI *v93;
  void *v94;
  void *v95;
  void *v96;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  unint64_t v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aggregatedQueries", buf, 2u);
    }

    if (a4)
    {
      v28 = CFSTR("aggregatedQueries");
LABEL_25:
      _RTErrorInvalidParameterCreate((uint64_t)v28);
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_86;
    }
LABEL_26:
    v26 = 0;
    goto LABEL_86;
  }
  if (!objc_msgSend(v6, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aggregatedQueries.count > 0", buf, 2u);
    }

    if (a4)
    {
      v28 = CFSTR("aggregatedQueries.count > 0");
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v92 = a4;
  v93 = self;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v96 = v7;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "secondObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "duration");
        *(_DWORD *)buf = 138412802;
        v106 = v11;
        v107 = 2048;
        v108 = v8;
        v109 = 2048;
        v110 = v13;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, query, %lu, duration %.3f", buf, 0x20u);

      }
      objc_msgSend(v9, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = 0;
        do
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndexedSubscript:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v106 = v18;
            v107 = 2048;
            v108 = v16;
            v109 = 2112;
            v110 = v20;
            _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, inferredMapItem %lu, inferredMapItem %@", buf, 0x20u);

          }
          ++v16;
          objc_msgSend(v9, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

        }
        while (v16 < v22);
      }

      ++v8;
      v7 = v96;
    }
    while (v8 < objc_msgSend(v96, "count"));
  }
  v104 = 0;
  -[RTMapItemProviderBluePOI dedupeQueryResults:error:](v93, "dedupeQueryResults:error:", v7, &v104);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v104;
  v25 = v24;
  if (v24)
  {
    v26 = 0;
    if (v92)
      *v92 = objc_retainAutorelease(v24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v23, "count"))
    {
      v30 = 0;
      v94 = v23;
      do
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "secondObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "duration");
          *(_DWORD *)buf = 138412802;
          v106 = v33;
          v107 = 2048;
          v108 = v30;
          v109 = 2048;
          v110 = v35;
          _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, corrected query, %lu, duration %.3f", buf, 0x20u);

        }
        objc_msgSend(v31, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");

        if (v37)
        {
          v38 = 0;
          do
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "firstObject");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectAtIndexedSubscript:", v38);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v106 = v40;
              v107 = 2048;
              v108 = v38;
              v109 = 2112;
              v110 = v42;
              _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, inferredMapItem %lu, inferredMapItem %@", buf, 0x20u);

            }
            ++v38;
            objc_msgSend(v31, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "count");

          }
          while (v38 < v44);
        }

        ++v30;
        v23 = v94;
      }
      while (v30 < objc_msgSend(v94, "count"));
    }
    -[RTMapItemProviderBluePOIParameters baseDuration](v93->_parameters, "baseDuration");
    v103 = 0;
    -[RTMapItemProviderBluePOI sortedAveragedQueryResults:baseDuration:error:](v93, "sortedAveragedQueryResults:baseDuration:error:", v23, &v103);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v103;
    v47 = v46;
    v91 = v45;
    if (v46)
    {
      v25 = 0;
      v26 = 0;
      if (v92)
        *v92 = objc_retainAutorelease(v46);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v45, "count"))
      {
        v48 = 0;
        do
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "objectAtIndexedSubscript:", v48);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v106 = v50;
            v107 = 2048;
            v108 = v48;
            v109 = 2112;
            v110 = v51;
            _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "%@, averaged inferredMapItem, %lu, %@", buf, 0x20u);

            v45 = v91;
          }

          ++v48;
        }
        while (v48 < objc_msgSend(v45, "count"));
      }
      v101 = 0;
      v102 = 0;
      v100 = 0;
      -[RTMapItemProviderBluePOI chooseBestAoiInferredMapItem:PoiInferredMapItem:fromSortedAveragedResults:error:](v93, "chooseBestAoiInferredMapItem:PoiInferredMapItem:fromSortedAveragedResults:error:", &v102, &v101, v45, &v100);
      v52 = v102;
      v53 = v101;
      v54 = v100;
      v55 = v54;
      if (v54)
      {
        v26 = 0;
        if (v92)
          *v92 = objc_retainAutorelease(v54);
        v47 = 0;
        v25 = 0;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v106 = v57;
          v107 = 2112;
          v108 = (unint64_t)v52;
          v109 = 2112;
          v110 = v53;
          _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, bestAoiInferredMapItem, %@, bestPoiInferredMapItem, %@", buf, 0x20u);

        }
        v99 = 0;
        -[RTMapItemProviderBluePOI sortQueryResults:error:](v93, "sortQueryResults:error:", v23, &v99);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v99;
        if (v59)
        {
          v47 = 0;
          v25 = 0;
          if (v92)
          {
            v60 = v59;
            v26 = 0;
            *v92 = objc_retainAutorelease(v59);
          }
          else
          {
            v26 = 0;
            v60 = v59;
          }
        }
        else
        {
          v84 = 0;
          v86 = 0;
          v88 = v53;
          v89 = v52;
          v95 = v23;
          v90 = v58;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v58, "count"))
          {
            v61 = 0;
            do
            {
              objc_msgSend(v58, "objectAtIndexedSubscript:", v61, v84, v86);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v63 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(a2);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "secondObject");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "duration");
                *(_DWORD *)buf = 138412802;
                v106 = v64;
                v107 = 2048;
                v108 = v61;
                v109 = 2048;
                v110 = v66;
                _os_log_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_INFO, "%@, sorted query, %lu, duration %.3f", buf, 0x20u);

              }
              objc_msgSend(v62, "firstObject");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = objc_msgSend(v67, "count");

              if (v68)
              {
                v69 = 0;
                do
                {
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                  {
                    NSStringFromSelector(a2);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "firstObject");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v72, "objectAtIndexedSubscript:", v69);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v106 = v71;
                    v107 = 2048;
                    v108 = v69;
                    v109 = 2112;
                    v110 = v73;
                    _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "%@, inferredMapItem %lu, inferredMapItem %@", buf, 0x20u);

                  }
                  ++v69;
                  objc_msgSend(v62, "firstObject");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = objc_msgSend(v74, "count");

                }
                while (v69 < v75);
              }

              ++v61;
              v58 = v90;
            }
            while (v61 < objc_msgSend(v90, "count"));
          }
          v98 = 0;
          v53 = v88;
          v52 = v89;
          -[RTMapItemProviderBluePOI bestQueryFromSortedQueryResults:bestAoiInferredMapItem:bestPoiInferredMapItem:error:](v93, "bestQueryFromSortedQueryResults:bestAoiInferredMapItem:bestPoiInferredMapItem:error:", v58, v89, v88, &v98, v84, v86);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = v98;
          v78 = v77;
          v25 = 0;
          if (v77)
          {
            v26 = 0;
            if (v92)
              *v92 = objc_retainAutorelease(v77);
            v58 = v90;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO) && objc_msgSend(v76, "count"))
            {
              v79 = 0;
              do
              {
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v80 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                {
                  NSStringFromSelector(a2);
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "objectAtIndexedSubscript:", v79);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v106 = v81;
                  v107 = 2048;
                  v108 = v79;
                  v109 = 2112;
                  v110 = v82;
                  _os_log_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_INFO, "%@, best inferredMapItems, %lu, %@", buf, 0x20u);

                  v58 = v90;
                }

                ++v79;
              }
              while (v79 < objc_msgSend(v76, "count"));
            }
            v26 = v76;
            v23 = v95;
            v25 = 0;
            v53 = v88;
            v52 = v89;
          }

          v47 = 0;
          v60 = v85;
          v55 = v87;
        }

      }
    }

  }
LABEL_86:

  return v26;
}

- (id)mapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
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
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _RTMap *v41;
  _RTMap *v42;
  void *v43;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  id *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE buf[12];
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  id v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v46 = a5;
  v47 = a6;
  v48 = a7;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_94);
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &__block_literal_global_97);
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__31;
  v63 = __Block_byref_object_dispose__31;
  v64 = 0;
  v53 = 0;
  v54 = (id *)&v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__31;
  v57 = __Block_byref_object_dispose__31;
  v58 = 0;
  v15 = dispatch_semaphore_create(0);
  -[RTMapItemProviderBluePOI mapServiceManager](self, "mapServiceManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_98;
  v49[3] = &unk_1E9296EE0;
  v51 = &v59;
  v52 = &v53;
  v17 = v15;
  v50 = v17;
  objc_msgSend(v16, "fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:", v13, v14, v46, v47, v48, v49);

  v18 = v17;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v18, v20))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSinceDate:", v19);
  v23 = v22;
  v24 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
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
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v30 = (void *)MEMORY[0x1E0CB35C8];
  v72[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v72, 1);
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
LABEL_6:
    v33 = 0;
    v34 = 1;
  }

  v35 = v33;
  if ((v34 & 1) == 0)
    objc_storeStrong(v54 + 5, v33);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v14, "count");
    v39 = objc_msgSend((id)v60[5], "count");
    v40 = v54[5];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v37;
    v66 = 2048;
    v67 = v38;
    v68 = 2048;
    v69 = v39;
    v70 = 2112;
    v71 = v40;
    _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "blue poi request at location, %@, access points, %lu, mapItems, %lu, error, %@", buf, 0x2Au);

  }
  objc_msgSend((id)v60[5], "enumerateObjectsUsingBlock:", &__block_literal_global_101);
  if (a8)
    *a8 = objc_retainAutorelease(v54[5]);
  v41 = [_RTMap alloc];
  v42 = -[_RTMap initWithInput:](v41, "initWithInput:", v60[5]);
  -[_RTMap withBlock:](v42, "withBlock:", &__block_literal_global_104);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  return v43;
}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "accessPoint %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_95(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "location %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_98(uint64_t a1, void *a2, void *a3)
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

void __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_99(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = a3 + 1;
    objc_msgSend(v4, "extendedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wifiConfidence");
    v9 = v8;
    objc_msgSend(v4, "extendedAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218754;
    v12 = v6;
    v13 = 2112;
    v14 = v4;
    v15 = 2048;
    v16 = v9;
    v17 = 2048;
    v18 = objc_msgSend(v10, "wifiFingerprintLabelType");
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "mapItem, %lu, %@, confidence, %lf, type, %ld", (uint8_t *)&v11, 0x2Au);

  }
}

id __95__RTMapItemProviderBluePOI_mapItemsFromLocations_accessPoints_startDate_endDate_options_error___block_invoke_102(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D183A8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "extendedAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wifiConfidence");
  v6 = (void *)objc_msgSend(v4, "initWithMapItem:confidence:source:", v3, 0x4000);

  return v6;
}

- (id)mapItemFromPlistDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("category"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("mapItemPlaceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("mapItemPlaceType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (int)objc_msgSend(v7, "intValue");

  }
  else
  {
    v34 = 1000;
  }

  objc_msgSend(v3, "objectForKey:", CFSTR("muid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("resultProviderID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v3, "objectForKey:", CFSTR("latitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v3, "objectForKey:", CFSTR("longitude"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v3, "objectForKey:", CFSTR("labelType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v9;
  v39 = (void *)v5;
  v37 = v18;
  v35 = v3;
  v36 = v11;
  if (objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("unknown")))
  {
    if (objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("poi")))
      v19 = 2 * (objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("aoi")) == 0);
    else
      v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dateByAddingTimeInterval:", 4838400.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0D18330]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = 0;
  v24 = (void *)objc_msgSend(v22, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v23, 0, 0, 0, v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  0,
                  v33,
                  v20,
                  v21,
                  0,
                  0);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", v20, v14, v17, 1.0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183F0]), "initWithAddressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", 0, 0, v19, 1.0);
  v27 = objc_alloc(MEMORY[0x1E0D183E8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = 0;
  v30 = (void *)objc_msgSend(v27, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v28, v4, v39, v24, v25, 0x4000, v34, v38, v36, v29, v20, v21, v26, 0, v32);

  return v30;
}

- (id)inferredMapItemsFromPlist:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v27);

  if (v9)
    v10 = v27 == 0;
  else
    v10 = 0;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("Inferred Map Items"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __60__RTMapItemProviderBluePOI_inferredMapItemsFromPlist_error___block_invoke;
      v25[3] = &unk_1E92973B8;
      v25[4] = self;
      v16 = v15;
      v26 = v16;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v25);
      v17 = v26;
      v18 = v16;

      v11 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to create dictionary from plist file, %@"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v24;
        v30 = 2112;
        v31 = v18;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      if (a4)
      {
        v18 = objc_retainAutorelease(v18);
        v11 = 0;
        *a4 = v18;
      }
      else
      {
        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __60__RTMapItemProviderBluePOI_inferredMapItemsFromPlist_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mapItem"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mapItemFromPlistDictionary:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("confidence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183A8]), "initWithMapItem:confidence:source:", v4, 0x4000, v7);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  void *v46;
  unint64_t v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  uint64_t v62;
  double v63;
  void *v64;
  void *v65;
  uint64_t v66;
  objc_class *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  unint64_t v81;
  uint64_t v82;
  _QWORD v83[2];

  v83[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    -[RTMapItemProviderBluePOIParameters injectedPlistPath](self->_parameters, "injectedPlistPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v75 = v10;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "~~~ %@, EVAL MODE ~~~", buf, 0xCu);

      }
      -[RTMapItemProviderBluePOIParameters injectedPlistPath](self->_parameters, "injectedPlistPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0;
      -[RTMapItemProviderBluePOI inferredMapItemsFromPlist:error:](self, "inferredMapItemsFromPlist:error:", v11, &v73);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v73;

      if (v13)
      {
        v14 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v13);
      }
      else
      {
        v14 = v12;
      }

      goto LABEL_35;
    }
  }
  objc_msgSend(v7, "locations");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v7, "accessPoints");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0D183F8]);
      v19 = objc_msgSend(v7, "useBackground");
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v18, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", v19, v21, v22);

      v24 = objc_msgSend(v7, "fidelityPolicy");
      objc_msgSend(v7, "locations");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessPoints");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "location");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMapItemProviderBluePOI _mapItemsWithFidelityPolicy:locations:accessPoints:referenceLocation:options:error:](self, "_mapItemsWithFidelityPolicy:locations:accessPoints:referenceLocation:options:error:", v24, v25, v26, v27, v23, a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[RTMapItemProviderBluePOIParameters aoiConfidencePassThroughThreshold](self->_parameters, "aoiConfidencePassThroughThreshold");
        v30 = v29;
        -[RTMapItemProviderBluePOIParameters poiConfidencePassThroughThreshold](self->_parameters, "poiConfidencePassThroughThreshold");
        -[RTMapItemProviderBluePOI _filterByConfidence:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:error:](self, "_filterByConfidence:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:error:", v28, a4, v30, 0.0, v31, 0.0);
        v14 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }

      if (!v14)
        goto LABEL_36;
LABEL_30:
      objc_msgSend(v7, "distance");
      if (v63 > 0.0)
      {
        objc_msgSend(v7, "location");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          objc_msgSend(v7, "location");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "distance");
          -[RTMapItemProviderBluePOI filterByDistance:location:thresholdForUnknownLabel:error:](self, "filterByDistance:location:thresholdForUnknownLabel:error:", v14, v65, a4);
          v66 = objc_claimAutoreleasedReturnValue();

          v14 = v66;
        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = -[NSObject count](v14, "count");
        *(_DWORD *)buf = 138412802;
        v75 = v68;
        v76 = 2112;
        v77 = (unint64_t)v69;
        v78 = 2048;
        v79 = v70;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, inferredMapItems.count, %lu", buf, 0x20u);

      }
      goto LABEL_35;
    }
  }
  objc_msgSend(v7, "startDate");
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
    goto LABEL_24;
  v33 = (void *)v32;
  objc_msgSend(v7, "endDate");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {

    goto LABEL_24;
  }
  v35 = (void *)v34;
  objc_msgSend(v7, "startDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v36, "isAfterDate:", v37);

  if (v38)
  {
LABEL_24:
    if (a4)
    {
      v61 = (void *)MEMORY[0x1E0CB35C8];
      v62 = *MEMORY[0x1E0D18598];
      v82 = *MEMORY[0x1E0CB2D50];
      v83[0] = CFSTR("requires a valid date range.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, &v82, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "errorWithDomain:code:userInfo:", v62, 7, v12);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

      goto LABEL_36;
    }
    v14 = 0;
    goto LABEL_36;
  }
  v39 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v7, "startDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v39, "initWithStartDate:endDate:", v40, v41);

  v72 = (void *)v42;
  v43 = -[RTMapItemProviderBluePOI numberOfRealtimeQueriesForInterval:](self, "numberOfRealtimeQueriesForInterval:", v42);
  v44 = -[RTMapItemProviderBluePOIParameters maxNumberOfQueries](self->_parameters, "maxNumberOfQueries") - v43;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[RTMapItemProviderBluePOIParameters maxNumberOfQueries](self->_parameters, "maxNumberOfQueries");
    *(_DWORD *)buf = 138413058;
    v75 = v46;
    v76 = 2048;
    v77 = v47;
    v78 = 2048;
    v79 = v43;
    v80 = 2048;
    v81 = v44;
    _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%@, maxNumberOfQueries, %lu, realtime usage, %lu, hindsight usage, %lu", buf, 0x2Au);

  }
  objc_msgSend(v7, "distance");
  v49 = v48;
  objc_msgSend(v7, "location");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemProviderBluePOI _mapItemsWithinDistance:location:startDate:endDate:maxQueryAttemps:error:](self, "_mapItemsWithinDistance:location:startDate:endDate:maxQueryAttemps:error:", v50, v51, v52, v44, a4, v49);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[RTMapItemProviderBluePOIParameters aoiConfidencePassThroughThreshold](self->_parameters, "aoiConfidencePassThroughThreshold");
    v55 = v54;
    -[RTMapItemProviderBluePOIParameters aoiConfidenceConsiderThreshold](self->_parameters, "aoiConfidenceConsiderThreshold");
    v57 = v56;
    -[RTMapItemProviderBluePOIParameters poiConfidencePassThroughThreshold](self->_parameters, "poiConfidencePassThroughThreshold");
    v59 = v58;
    -[RTMapItemProviderBluePOIParameters poiConfidenceConsiderThreshold](self->_parameters, "poiConfidenceConsiderThreshold");
    -[RTMapItemProviderBluePOI _filterByConfidence:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:error:](self, "_filterByConfidence:aoiConfidencePassThroughThreshold:aoiConfidenceConsiderThreshold:poiConfidencePassThroughThreshold:poiConfidenceConsiderThreshold:error:", v53, a4, v55, v57, v59, v60);
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  if (v14)
    goto LABEL_30;
LABEL_36:

  return v14;
}

- (id)_mapItemsWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 referenceLocation:(id)a6 options:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  objc_class *v46;
  uint64_t v47;
  void *v48;
  const char *aSelector;
  id v50;
  void *v51;
  void *v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;
  const __CFString *v63;
  void *v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v13, "count"))
  {
    aSelector = a2;
    v54 = v16;
    objc_msgSend(v13, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timestamp");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "timeIntervalSinceDate:", v18);
    v22 = v21;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingDescriptors:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v26);
    v28 = v27;

    objc_msgSend(v24, "lastObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v30);
    v32 = v31;

    +[RTMapItemProviderBluePOIWiFiScanMetrics submitBluePOIWiFiScanMetricsWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:](RTMapItemProviderBluePOIWiFiScanMetrics, "submitBluePOIWiFiScanMetricsWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:", objc_msgSend(v14, "count"), 0, objc_msgSend(v14, "count"), 0, objc_msgSend(v14, "count"), 1, v28, v32, v22);
    if (objc_msgSend(v14, "count"))
    {
      v33 = (void *)objc_opt_new();
      v34 = v33;
      if (v15)
        objc_msgSend(v33, "addObject:", v15);
      v50 = v15;
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __111__RTMapItemProviderBluePOI__mapItemsWithFidelityPolicy_locations_accessPoints_referenceLocation_options_error___block_invoke;
      v56[3] = &unk_1E929A988;
      v35 = v34;
      v57 = v35;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v56);
      v55 = 0;
      -[RTMapItemProviderBluePOI mapItemsFromLocations:accessPoints:startDate:endDate:options:error:](self, "mapItemsFromLocations:accessPoints:startDate:endDate:options:error:", v35, v14, v18, v20, v54, &v55);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v55;
      v38 = v37;
      if (v37)
      {
        if (a8)
          *a8 = objc_retainAutorelease(v37);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v47 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v59 = v53;
          v60 = 2112;
          v61 = v47;
          v48 = (void *)v47;
          _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "%@, %@, mapItemsFromLocationsAccessPointsErrors", buf, 0x16u);

        }
        v40 = 0;
      }
      else
      {
        v40 = v36;
      }

    }
    else
    {
      if (!a8)
      {
        v40 = 0;
        goto LABEL_18;
      }
      v50 = v15;
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0D18598];
      v62 = *MEMORY[0x1E0CB2D50];
      v63 = CFSTR("requires accessPoints.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, 7, v35);
      v40 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    v15 = v50;
LABEL_18:

    v16 = v54;
    goto LABEL_19;
  }
  if (!a8)
  {
    v40 = 0;
    goto LABEL_20;
  }
  v41 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0D18598];
  v65 = *MEMORY[0x1E0CB2D50];
  v66[0] = CFSTR("requires locations.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 7, v18);
  v40 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
  return v40;
}

void __111__RTMapItemProviderBluePOI__mapItemsWithFidelityPolicy_locations_accessPoints_referenceLocation_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D183B0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithCLLocation:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

- (id)_filterOutEmptyFingerprintsFromFingerprints:(id)a3 endDate:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, uint64_t);
  void *v16;
  RTMapItemProviderBluePOI *v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3880];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __80__RTMapItemProviderBluePOI__filterOutEmptyFingerprintsFromFingerprints_endDate___block_invoke;
  v16 = &unk_1E929A9B0;
  v17 = self;
  v18 = v6;
  v8 = v6;
  v9 = a3;
  objc_msgSend(v7, "predicateWithBlock:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filteredArrayUsingPredicate:", v10, v13, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

BOOL __80__RTMapItemProviderBluePOI__filterOutEmptyFingerprintsFromFingerprints_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "accessPointsForFingerprint:endDate:error:", a2, *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_fallbackToLocationBasedLookupForVisitDuration:(double)a3
{
  double v4;

  -[RTMapItemProviderBluePOIParameters noFingerprintMinVisitDuration](self->_parameters, "noFingerprintMinVisitDuration");
  return v4 <= a3;
}

- (unint64_t)numberOfRealtimeQueriesForInterval:(id)a3
{
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
  id v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  void *v32;
  __CFString *v33;
  unint64_t i;
  void *v35;
  __CFString *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  _BOOL4 v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, void *, void *);
  void *v48;
  NSObject *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _BYTE buf[12];
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  id v68;
  _QWORD v69[4];

  v69[1] = *MEMORY[0x1E0C80C00];
  v44 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__31;
  v62 = __Block_byref_object_dispose__31;
  v63 = 0;
  v52 = 0;
  v53 = (id *)&v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__31;
  v56 = __Block_byref_object_dispose__31;
  v57 = 0;
  v5 = dispatch_semaphore_create(0);
  -[RTMapItemProviderBluePOI placeInferenceQueryStore](self, "placeInferenceQueryStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = MEMORY[0x1E0C809B0];
  v46 = 3221225472;
  v47 = __63__RTMapItemProviderBluePOI_numberOfRealtimeQueriesForInterval___block_invoke;
  v48 = &unk_1E9296EE0;
  v50 = &v58;
  v51 = &v52;
  v7 = v5;
  v49 = v7;
  objc_msgSend(v6, "fetchPlaceInferenceQueriesWithDateInterval:ascending:handler:", v44, 1, &v45);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
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
  v69[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v69, 1);
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
    objc_storeStrong(v53 + 5, v23);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend((id)v59[5], "count");
    v29 = v53[5];
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v27;
    v65 = 2048;
    v66 = v28;
    v67 = 2112;
    v68 = v29;
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, fetched place inference queries, %lu, error, %@", buf, 0x20u);

  }
  if (v53[5] || !objc_msgSend((id)v59[5], "count"))
  {
    v30 = 0;
  }
  else
  {
    objc_msgSend((id)v59[5], "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sourceIdentifier");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = v33 == CFSTR("com.apple.CoreRoutine.visitManager");

    for (i = 1; i < objc_msgSend((id)v59[5], "count", v44, v45, v46, v47, v48); ++i)
    {
      objc_msgSend((id)v59[5], "objectAtIndexedSubscript:", i);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sourceIdentifier");
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v37 = v36 == CFSTR("com.apple.CoreRoutine.visitManager");

      if (v37)
      {
        objc_msgSend((id)v59[5], "objectAtIndexedSubscript:", i);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "date");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v59[5], "objectAtIndexedSubscript:", i - 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "date");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "timeIntervalSinceDate:", v41);
        v43 = v42 > 1.0;

        if (v43)
          ++v30;
      }
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v30;
}

void __63__RTMapItemProviderBluePOI_numberOfRealtimeQueriesForInterval___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_bestAOIFromAOIs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  void *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSObject *v32;
  objc_class *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  const char *aSelector;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v5)
  {
    v6 = v5;
    aSelector = a2;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v46;
    v10 = 0.0;
    v11 = 0.0;
    obj = v4;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "preferredAOICategories");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "category");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "containsObject:", v16);

        if (v17)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v29 = objc_claimAutoreleasedReturnValue();
          v4 = obj;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v50 = v35;
            v51 = 2112;
            v52 = v36;
            v53 = 2112;
            v54 = v13;
            v55 = 2112;
            v56 = obj;
            _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "%@, %@, selecting preferred AOI, %@, from AOIs, %@.", buf, 0x2Au);

          }
          v30 = v13;

          goto LABEL_29;
        }
        objc_msgSend(v13, "confidence");
        if (v18 >= 0.9)
        {
          if (!v8 || (objc_msgSend(v13, "confidence"), v11 > v19))
          {
            v20 = v13;

            objc_msgSend(v20, "confidence");
            v11 = v21;
            v8 = v20;
          }
        }
        objc_msgSend(v13, "confidence");
        if (v22 < 0.9)
        {
          if (!v7 || (objc_msgSend(v13, "confidence"), v10 < v23))
          {
            v24 = v13;

            objc_msgSend(v24, "confidence");
            v10 = v25;
            v7 = v24;
          }
        }
      }
      v4 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
      if (v6)
        continue;
      break;
    }

    if (!v8)
    {
      v31 = v7;
      a2 = aSelector;
      goto LABEL_25;
    }
    v26 = v8;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v50 = v41;
      v51 = 2112;
      v52 = v42;
      v53 = 2112;
      v54 = v26;
      v55 = 2112;
      v56 = v7;
      v57 = 2048;
      v58 = 0x3FECCCCCCCCCCCCDLL;
      v59 = 2112;
      v60 = obj;
      _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "%@, %@, selecting innerNestedAOI, %@, higherOverlapConflictedAOI, %@, threshold, %f, AOIs, %@.", buf, 0x3Eu);

    }
    v28 = v26;
    v8 = v28;
  }
  else
  {

    v31 = 0;
LABEL_25:
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v50 = v38;
      v51 = 2112;
      v52 = v39;
      v53 = 2112;
      v54 = v31;
      v55 = 2112;
      v56 = 0;
      v57 = 2048;
      v58 = 0x3FECCCCCCCCCCCCDLL;
      v59 = 2112;
      v60 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEBUG, "%@, %@, selecting higherOverlapConflictedAOI, %@, innerNestedAOI, %@, threshold, %f, AOIs, %@.", buf, 0x3Eu);

    }
    v28 = v31;
    v7 = v28;
    v8 = 0;
  }
  v30 = v28;
LABEL_29:

  return v30;
}

- (id)_filterLessRelevantAOIsFromQueryResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v33;
    *(_QWORD *)&v8 = 138412802;
    v29 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "mapItem", v29);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "mapItemPlaceType");

        v15 = v4;
        if (v14 != 1)
        {
          objc_msgSend(v12, "mapItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "mapItemPlaceType");

          v15 = v5;
          if (v17 != 2)
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = (objc_class *)objc_opt_class();
              NSStringFromClass(v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v29;
              v37 = v20;
              v38 = 2112;
              v39 = v21;
              v40 = 2112;
              v41 = v12;
              _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, %@, the inferred map item, %@, is neither an AOI or a POI.", buf, 0x20u);

            }
            v15 = v5;
          }
        }
        objc_msgSend(v15, "addObject:", v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v22, "addObjectsFromArray:", v6);
  }
  else
  {
    -[RTMapItemProviderBluePOI _bestAOIFromAOIs:](self, "_bestAOIFromAOIs:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v23);
    objc_msgSend(v22, "addObjectsFromArray:", v5);

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v37 = v26;
    v38 = 2112;
    v39 = v27;
    v40 = 2112;
    v41 = v6;
    v42 = 2112;
    v43 = v4;
    v44 = 2112;
    v45 = v5;
    v46 = 2112;
    v47 = v22;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, queryResult, %@, aois, %@, pois, %@, selectedResults, %@.", buf, 0x3Eu);

  }
  return v22;
}

- (id)_mapItemsWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6 maxQueryAttemps:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  unint64_t v41;
  unint64_t v42;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  id v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  objc_class *v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  objc_class *v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  int v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  const char *aSelector;
  char *aSelectora;
  void *v131;
  void *v132;
  void *v133;
  RTMapItemProviderBluePOI *v134;
  id v135;
  id v136;
  id v137;
  _QWORD v138[5];
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  _QWORD *v144;
  uint64_t *v145;
  uint64_t *v146;
  uint64_t *v147;
  uint64_t *v148;
  _BYTE *v149;
  uint64_t *v150;
  const char *v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t (*v163)(uint64_t, uint64_t);
  void (*v164)(uint64_t);
  id v165;
  uint64_t v166;
  uint64_t *v167;
  uint64_t v168;
  uint64_t (*v169)(uint64_t, uint64_t);
  void (*v170)(uint64_t);
  id v171;
  _QWORD v172[4];
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  char v176;
  id v177;
  id v178;
  char v179;
  uint8_t v180[4];
  double v181;
  __int16 v182;
  double v183;
  __int16 v184;
  uint64_t v185;
  __int16 v186;
  uint64_t v187;
  _BYTE buf[24];
  uint64_t (*v189)(uint64_t, uint64_t);
  __int128 v190;
  void *v191;
  void *v192;
  uint64_t v193;
  const __CFString *v194;
  uint64_t v195;
  _QWORD v196[4];

  v196[1] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (v14)
  {
    if (!v15 || !v16 || objc_msgSend(v15, "isAfterDate:", v16))
    {
      if (a8)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v193 = *MEMORY[0x1E0CB2D50];
        v194 = CFSTR("requires a valid date range.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v19);
        v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v22 = 0;
        *a8 = v20;
LABEL_68:

        goto LABEL_69;
      }
      goto LABEL_10;
    }
    aSelector = a2;
    v134 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v14, "latitude");
    v25 = v24;
    objc_msgSend(v14, "longitude");
    v27 = v26;
    objc_msgSend(v14, "horizontalUncertainty");
    v29 = objc_msgSend(v23, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v15, objc_msgSend(v14, "referenceFrame"), v25, v27, v28);
    if (v29)
      objc_msgSend(v19, "addObject:", v29);
    v131 = (void *)v29;
    v179 = 0;
    v178 = 0;
    -[RTMapItemProviderBluePOI fingerprintsBetweenStartDate:endDate:isTimeWindowFallback:settledState:error:](v134, "fingerprintsBetweenStartDate:endDate:isTimeWindowFallback:settledState:error:", v15, v17, &v179, 2, &v178);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v178;
    objc_msgSend(v17, "timeIntervalSinceDate:", v15);
    v32 = v31;
    if (v30)
    {
      if (a8)
        *a8 = objc_retainAutorelease(v30);
      -[RTMapItemProviderBluePOIParameters aoiConfidencePassThroughThreshold](v134->_parameters, "aoiConfidencePassThroughThreshold");
      v34 = v33;
      -[RTMapItemProviderBluePOIParameters poiConfidencePassThroughThreshold](v134->_parameters, "poiConfidencePassThroughThreshold");
      -[RTMapItemProviderBluePOI _submitPerformanceMetricsForResults:noFingerprints:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:fingerprintsCount:zeroAccessPointsFingerprintsCount:nonZeroAccessPointsFingerprintsCount:queryCount:firstResultQueryCount:error:visitInterval:visitSource:](v134, "_submitPerformanceMetricsForResults:noFingerprints:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:fingerprintsCount:zeroAccessPointsFingerprintsCount:nonZeroAccessPointsFingerprintsCount:queryCount:firstResultQueryCount:error:visitInterval:visitSource:", MEMORY[0x1E0C9AA60], 0, 3, 0, 0, 0, v34, v35, v32, 0, 0, v30, 3);
      v22 = 0;
      goto LABEL_67;
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("start"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "sortedArrayUsingDescriptors:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v123 = objc_msgSend(v38, "count");
    -[RTMapItemProviderBluePOI _filterOutEmptyFingerprintsFromFingerprints:endDate:](v134, "_filterOutEmptyFingerprintsFromFingerprints:endDate:", v38, v17);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v121 = objc_msgSend(v39, "count");
    v40 = objc_msgSend(v39, "count") > a7;
    v41 = objc_msgSend(v39, "count");
    if (v41 >= a7)
      v42 = a7;
    else
      v42 = v41;
    objc_msgSend(v39, "subarrayWithRange:", v40, v42);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v133, "count");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v84;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v123;
      *(_WORD *)&buf[22] = 2048;
      v189 = (uint64_t (*)(uint64_t, uint64_t))v121;
      LOWORD(v190) = 2048;
      *(_QWORD *)((char *)&v190 + 2) = v85;
      _os_log_debug_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_DEBUG, "%@, fingerprints from settled points, total count, %lu, non zero AP count, %lu, filtered count, %lu", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v133);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v133, "count") >= a7)
    {
      v116 = 0;
      v119 = 0;
    }
    else
    {
      v179 = 0;
      v177 = 0;
      -[RTMapItemProviderBluePOI fingerprintsBetweenStartDate:endDate:isTimeWindowFallback:settledState:error:](v134, "fingerprintsBetweenStartDate:endDate:isTimeWindowFallback:settledState:error:", v15, v17, &v179, 1, &v177);
      v127 = (id)objc_claimAutoreleasedReturnValue();
      v44 = v177;
      if (v44)
      {
        v30 = v44;
        if (a8)
        {
          v30 = objc_retainAutorelease(v44);
          v22 = 0;
          *a8 = v30;
        }
        else
        {
          v22 = 0;
        }
        goto LABEL_66;
      }
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("start"), 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "sortedArrayUsingDescriptors:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = objc_msgSend(v47, "count");
      -[RTMapItemProviderBluePOI _filterOutEmptyFingerprintsFromFingerprints:endDate:](v134, "_filterOutEmptyFingerprintsFromFingerprints:endDate:", v47, v17);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v116 = objc_msgSend(v48, "count");
      v49 = objc_msgSend(v48, "count");
      v50 = objc_msgSend(v133, "count");
      if (a7 - v50 > v49)
        v51 = 1;
      else
        v51 = v49 / (a7 - v50);
      if (objc_msgSend(v48, "count"))
      {
        v52 = 0;
        do
        {
          if (objc_msgSend(v132, "count") >= a7)
            break;
          objc_msgSend(v48, "objectAtIndex:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "addObject:", v53);

          v52 += v51;
        }
        while (v52 < objc_msgSend(v48, "count"));
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(aSelector);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v132, "count");
        v88 = objc_msgSend(v133, "count");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v86;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v119;
        *(_WORD *)&buf[22] = 2048;
        v189 = (uint64_t (*)(uint64_t, uint64_t))v116;
        LOWORD(v190) = 2048;
        *(_QWORD *)((char *)&v190 + 2) = v87 - v88;
        _os_log_debug_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_DEBUG, "%@, fingerprints from unsettled points, total count, %lu, non zero AP count, %lu, filtered count, %lu", buf, 0x2Au);

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v133, "count");
      v58 = objc_msgSend(v132, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v56;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2048;
      v189 = (uint64_t (*)(uint64_t, uint64_t))v58;
      _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%@, fingerprints from settled points count, %lu, total fingerprints count, %lu", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v173 = 0;
    v174 = &v173;
    v175 = 0x2020000000;
    v176 = 0;
    v172[0] = 0;
    v172[1] = v172;
    v172[2] = 0x2020000000;
    v172[3] = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v189 = __Block_byref_object_copy__31;
    *(_QWORD *)&v190 = __Block_byref_object_dispose__31;
    *((_QWORD *)&v190 + 1) = 0;
    v166 = 0;
    v167 = &v166;
    v168 = 0x3032000000;
    v169 = __Block_byref_object_copy__31;
    v170 = __Block_byref_object_dispose__31;
    v171 = (id)objc_opt_new();
    v160 = 0;
    v161 = &v160;
    v162 = 0x3032000000;
    v163 = __Block_byref_object_copy__31;
    v164 = __Block_byref_object_dispose__31;
    v165 = (id)objc_opt_new();
    v156 = 0;
    v157 = &v156;
    v158 = 0x2020000000;
    v159 = 0;
    v152 = 0;
    v153 = &v152;
    v154 = 0x2020000000;
    v155 = 0;
    v138[0] = MEMORY[0x1E0C809B0];
    v138[1] = 3221225472;
    v138[2] = __101__RTMapItemProviderBluePOI__mapItemsWithinDistance_location_startDate_endDate_maxQueryAttemps_error___block_invoke;
    v138[3] = &unk_1E929A9D8;
    v138[4] = v134;
    v114 = v17;
    v139 = v114;
    v126 = v59;
    v140 = v126;
    v144 = v172;
    v60 = v19;
    v141 = v60;
    v151 = aSelector;
    v61 = v15;
    v142 = v61;
    v145 = &v156;
    v127 = v128;
    v143 = v127;
    v146 = &v152;
    v147 = &v166;
    v148 = &v160;
    v149 = buf;
    v150 = &v173;
    objc_msgSend(v132, "enumerateObjectsUsingBlock:", v138);
    objc_msgSend((id)v167[5], "valueForKeyPath:", CFSTR("@min.self"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v161[5], "valueForKeyPath:", CFSTR("@max.self"));
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "timeIntervalSinceDate:");
    objc_msgSend(v61, "timeIntervalSinceDate:", v125);
    v62 = v116 + v121;
    v122 = v119 + v123 - (v116 + v121);
    v124 = v119 + v123;
    +[RTMapItemProviderBluePOIWiFiScanMetrics submitBluePOIWiFiScanMetricsWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:](RTMapItemProviderBluePOIWiFiScanMetrics, "submitBluePOIWiFiScanMetricsWithFingerprintsCount:fingerprintsZeroAccessPointsCount:fingerprintsNonZeroAccessPointsCount:isFingerprintWindowFallback:timeIntervalSinceEarliestFingerprint:timeIntervalSinceLatestFingerprint:totalAccessPointsCount:visitInterval:visitSource:");
    v63 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v63)
    {
      if (a8)
      {
        v22 = 0;
        *a8 = objc_retainAutorelease(v63);
LABEL_65:

        _Block_object_dispose(&v152, 8);
        _Block_object_dispose(&v156, 8);
        _Block_object_dispose(&v160, 8);

        _Block_object_dispose(&v166, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(v172, 8);
        _Block_object_dispose(&v173, 8);

        v30 = 0;
LABEL_66:

LABEL_67:
        goto LABEL_68;
      }
    }
    else
    {
      if (!*((_BYTE *)v174 + 24) && !objc_msgSend(v126, "count"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          v108 = *((unsigned __int8 *)v174 + 24);
          v109 = objc_msgSend(v126, "count");
          v110 = CFSTR("YES");
          *(_DWORD *)v180 = 138412802;
          if (!v108)
            v110 = CFSTR("NO");
          v181 = *(double *)&v110;
          v182 = 2048;
          v183 = v32;
          v184 = 2048;
          v185 = v109;
          _os_log_debug_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_DEBUG, "fingerprintFound, %@, visit duration, %f, error count, %lu", v180, 0x20u);
        }
        v65 = v62;

        if (-[RTMapItemProviderBluePOI _fallbackToLocationBasedLookupForVisitDuration:](v134, "_fallbackToLocationBasedLookupForVisitDuration:", v32))
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v180 = 134217984;
            v181 = v32;
            _os_log_debug_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_DEBUG, "no fingerprints with access points - falling back to location based lookup, visit duration, %f", v180, 0xCu);
          }

          v137 = 0;
          v120 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v61, v114);
          -[RTMapItemProviderBluePOI locationsInDateInterval:error:](v134, "locationsInDateInterval:error:", v120, &v137);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v137;
          v117 = v68;
          if (v68)
          {
            objc_msgSend(v126, "addObject:", v68);
          }
          else
          {
            if (objc_msgSend(v67, "count"))
              objc_msgSend(v60, "addObjectsFromArray:", v67);
            v112 = v67;
            v94 = objc_alloc(MEMORY[0x1E0D183F8]);
            v95 = (objc_class *)objc_opt_class();
            NSStringFromClass(v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = (void *)objc_msgSend(v94, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v96);

            v136 = 0;
            -[RTMapItemProviderBluePOI mapItemsFromLocations:accessPoints:startDate:endDate:options:error:](v134, "mapItemsFromLocations:accessPoints:startDate:endDate:options:error:", v60, 0, v61, v114, v113, &v136);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v136;
            ++v157[3];
            if (!objc_msgSend(v127, "count") && !objc_msgSend(v22, "count"))
              ++v153[3];
            if (objc_msgSend(v22, "count"))
            {
              v118 = v97;
              v98 = objc_alloc(MEMORY[0x1E0D18408]);
              v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v61, v114);
              aSelectora = (char *)objc_msgSend(v98, "initWithFirstObject:secondObject:", v22, v99);

              objc_msgSend(v127, "addObject:", aSelectora);
              -[RTMapItemProviderBluePOIParameters aoiConfidencePassThroughThreshold](v134->_parameters, "aoiConfidencePassThroughThreshold");
              v101 = v100;
              -[RTMapItemProviderBluePOIParameters poiConfidencePassThroughThreshold](v134->_parameters, "poiConfidencePassThroughThreshold");
              v103 = v102;
              v104 = v157[3];
              v105 = v153[3];
              _RTSafeArray();
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              _RTMultiErrorCreate();
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTMapItemProviderBluePOI _submitPerformanceMetricsForResults:noFingerprints:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:fingerprintsCount:zeroAccessPointsFingerprintsCount:nonZeroAccessPointsFingerprintsCount:queryCount:firstResultQueryCount:error:visitInterval:visitSource:](v134, "_submitPerformanceMetricsForResults:noFingerprints:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:fingerprintsCount:zeroAccessPointsFingerprintsCount:nonZeroAccessPointsFingerprintsCount:queryCount:firstResultQueryCount:error:visitInterval:visitSource:", v127, 1, 3, v124, v122, v65, v101, v103, v32, v104, v105, v107, 3);

              goto LABEL_65;
            }
            if (v126 && v97)
              objc_msgSend(v126, "addObject:", v97);

            v67 = v112;
          }

          v62 = v65;
        }
      }
      -[RTMapItemProviderBluePOIParameters aoiConfidencePassThroughThreshold](v134->_parameters, "aoiConfidencePassThroughThreshold");
      v70 = v69;
      -[RTMapItemProviderBluePOIParameters poiConfidencePassThroughThreshold](v134->_parameters, "poiConfidencePassThroughThreshold");
      v72 = v71;
      v73 = v157[3];
      v74 = v153[3];
      _RTSafeArray();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTMapItemProviderBluePOI _submitPerformanceMetricsForResults:noFingerprints:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:fingerprintsCount:zeroAccessPointsFingerprintsCount:nonZeroAccessPointsFingerprintsCount:queryCount:firstResultQueryCount:error:visitInterval:visitSource:](v134, "_submitPerformanceMetricsForResults:noFingerprints:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:fingerprintsCount:zeroAccessPointsFingerprintsCount:nonZeroAccessPointsFingerprintsCount:queryCount:firstResultQueryCount:error:visitInterval:visitSource:", v127, 0, 3, v124, v122, v62, v70, v72, v32, v73, v74, v76, 3);

      if (objc_msgSend(v127, "count"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          v89 = (objc_class *)objc_opt_class();
          NSStringFromClass(v89);
          v90 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v91 = (id)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v132, "count");
          v93 = v157[3];
          *(_DWORD *)v180 = 138413058;
          v181 = *(double *)&v90;
          v182 = 2112;
          v183 = *(double *)&v91;
          v184 = 2048;
          v185 = v92;
          v186 = 2048;
          v187 = v93;
          _os_log_debug_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_DEBUG, "%@, %@, fingerprintsCount, %lu, numberOfBPQueries, %lu", v180, 0x2Au);

        }
        v135 = 0;
        -[RTMapItemProviderBluePOI bestQueryFromAggregatedQueries:error:](v134, "bestQueryFromAggregatedQueries:error:", v127, &v135);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v135;
        if (v79)
          objc_msgSend(v126, "addObject:", v79);
        if (a8 && objc_msgSend(v126, "count"))
        {
          v111 = 1;
          _RTSafeArray();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          _RTMultiErrorCreate();
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        -[RTMapItemProviderBluePOI _filterLessRelevantAOIsFromQueryResult:](v134, "_filterLessRelevantAOIsFromQueryResult:", v78, v111);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTMapItemProviderBluePOI _adjustConfidencesOfTheSelectedResult:allQueryResults:](v134, "_adjustConfidencesOfTheSelectedResult:allQueryResults:", v81, v127);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_65;
      }
      if (a8 && objc_msgSend(v126, "count"))
      {
        _RTSafeArray();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        _RTMultiErrorCreate();
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v22 = 0;
    goto LABEL_65;
  }
  if (a8)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v195 = *MEMORY[0x1E0CB2D50];
    v196[0] = CFSTR("requires a valid location.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v196, &v195, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  v22 = 0;
LABEL_69:

  return v22;
}

void __101__RTMapItemProviderBluePOI__mapItemsWithinDistance_location_startDate_endDate_maxQueryAttemps_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  _BYTE *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  const __CFString *v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  _QWORD v98[3];

  v98[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v81 = 0;
  objc_msgSend(v8, "accessPointsForFingerprint:endDate:error:", v7, v9, &v81);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v81;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingDescriptors:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v12, "count") + v15;
    v16 = *(void **)(a1 + 32);
    v80 = 0;
    objc_msgSend(v16, "locationsForAccessPoints:error:", v12, &v80);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v80;
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);
      *a4 = 1;
LABEL_32:

      goto LABEL_33;
    }
    v19 = objc_msgSend(v17, "count");
    v20 = *(void **)(a1 + 56);
    v77 = v13;
    if (v19)
    {
      objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v17);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = v20;
    }
    v78 = v21;
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v22 = objc_claimAutoreleasedReturnValue();
    v76 = v17;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 136));
      v74 = a4;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = a3 + 1;
      objc_msgSend(v7, "identifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringFromDate");
      v23 = objc_claimAutoreleasedReturnValue();
      +[RTScenarioTriggerManager settledStateName:](RTScenarioTriggerManager, "settledStateName:", objc_msgSend(v7, "settledState"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v12, "count");
      v26 = objc_msgSend(v78, "count");
      *(_DWORD *)buf = 138413826;
      v85 = v68;
      v86 = 2048;
      v87 = v70;
      v88 = 2112;
      v89 = v66;
      v90 = 2112;
      v91 = v23;
      v27 = (void *)v23;
      v92 = 2112;
      v93 = v24;
      v94 = 2048;
      v95 = v25;
      v96 = 2048;
      v97 = v26;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, fingerprint, %lu, identifier, %@, start, %@, settled state, %@, number of accessPoints, %lu, number of locations, %lu", buf, 0x48u);

      v18 = 0;
      a4 = v74;
    }

    v13 = v77;
    if (!objc_msgSend(v12, "count"))
    {
LABEL_31:

      goto LABEL_32;
    }
    v28 = objc_alloc(MEMORY[0x1E0D183F8]);
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v28, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v30);

    v32 = *(_QWORD *)(a1 + 64);
    v33 = *(void **)(a1 + 32);
    v34 = *(_QWORD *)(a1 + 40);
    v79 = 0;
    v71 = (void *)v31;
    objc_msgSend(v33, "mapItemsFromLocations:accessPoints:startDate:endDate:options:error:", v78, v12, v32, v34, v31, &v79);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v79;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (!objc_msgSend(*(id *)(a1 + 72), "count") && !objc_msgSend(v35, "count"))
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    v36 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v12, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "date");
    v73 = v35;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)objc_msgSend(v36, "initWithStartDate:endDate:", v38, v40);

    v41 = v73;
    v42 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    objc_msgSend(v12, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "date");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v44);

    v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    objc_msgSend(v12, "lastObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "date");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v47);

    v18 = 0;
    if (objc_msgSend(v73, "count"))
    {
      v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18408]), "initWithFirstObject:secondObject:", v73, v75);
      if (!v48)
      {
        v57 = (void *)MEMORY[0x1E0CB35C8];
        v58 = *MEMORY[0x1E0D18598];
        v82 = *MEMORY[0x1E0CB2D50];
        v83 = CFSTR("queryResult was nil");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "errorWithDomain:code:userInfo:", v58, 0, v59);
        v60 = objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(*(SEL *)(a1 + 136));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v85 = v65;
          v86 = 2112;
          v87 = v60;
          _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v62 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
        v63 = *(void **)(v62 + 40);
        *(_QWORD *)(v62 + 40) = v60;

        *a4 = 1;
        v18 = 0;
        v13 = v77;
        v17 = v76;
        v64 = v69;
        goto LABEL_30;
      }
      v49 = (void *)v48;
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v48);
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "earlyStop"))
      {
        objc_msgSend(v73, "objectAtIndex:", 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "mapItem");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "extendedAttributes");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v52, "wifiFingerprintLabelType");

        objc_msgSend(v50, "confidence");
        v54 = v53;
        v55 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        if (v67 == 2)
          objc_msgSend(v55, "aoiConfidencePassThroughThreshold");
        else
          objc_msgSend(v55, "poiConfidencePassThroughThreshold");
        if (v54 >= v56)
          *a4 = 1;

        v18 = 0;
        v41 = v73;
      }

    }
    v17 = v76;
    v64 = v69;
    if (v69)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v69);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = 1;
    v13 = v77;
LABEL_30:

    goto LABEL_31;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
  *a4 = 1;
  v12 = v10;
LABEL_33:

}

- (id)_computeEarlyStopQueryResultFromResults:(id)a3 originalMaxNumberOfQueries:(unint64_t)a4 aoiConfidencePassThroughThreshold:(double)a5 poiConfidencePassThroughThreshold:(double)a6
{
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  RTMapItemProviderBluePOIParameters *parameters;
  double v23;
  unint64_t v24;
  unint64_t v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  unint64_t v32;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "count");
  if (v10 >= a4)
    v11 = a4;
  else
    v11 = v10;
  v12 = objc_msgSend(v8, "count");
  if (v12 >= a4)
    v13 = a4;
  else
    v13 = v12;
  if (v13)
  {
    v32 = v11;
    v11 = 1;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v11 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v14);
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "mapItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "extendedAttributes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "wifiFingerprintLabelType");

      objc_msgSend(v16, "confidence");
      v21 = v20;
      parameters = self->_parameters;
      if (v19 == 2)
        -[RTMapItemProviderBluePOIParameters aoiConfidencePassThroughThreshold](parameters, "aoiConfidencePassThroughThreshold");
      else
        -[RTMapItemProviderBluePOIParameters poiConfidencePassThroughThreshold](parameters, "poiConfidencePassThroughThreshold");
      if (v21 >= v23)
        break;

      v24 = objc_msgSend(v8, "count");
      if (v24 >= a4)
        v25 = a4;
      else
        v25 = v24;
      if (v25 <= v11++)
      {
        v11 = v32;
        goto LABEL_19;
      }
    }
    v11 = v11;

  }
LABEL_19:
  if (objc_msgSend(v9, "count"))
  {
    -[RTMapItemProviderBluePOI bestQueryFromAggregatedQueries:error:](self, "bestQueryFromAggregatedQueries:error:", v9, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x1E0D18408]);
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x1E0D18408]);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithFirstObject:secondObject:", v27, v29);

  return v30;
}

- (void)_submitPerformanceMetricsForResults:(id)a3 noFingerprints:(BOOL)a4 originalMaxNumberOfQueries:(unint64_t)a5 aoiConfidencePassThroughThreshold:(double)a6 poiConfidencePassThroughThreshold:(double)a7 fingerprintsCount:(unint64_t)a8 zeroAccessPointsFingerprintsCount:(unint64_t)a9 nonZeroAccessPointsFingerprintsCount:(unint64_t)a10 queryCount:(unint64_t)a11 firstResultQueryCount:(unint64_t)a12 error:(id)a13 visitInterval:(double)a14 visitSource:(int64_t)a15
{
  _BOOL4 v20;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v41;
  id v42;

  v20 = a4;
  v22 = a3;
  v23 = a13;
  if (v20)
  {
    v24 = 0;
    v25 = 1;
  }
  else
  {
    v41 = (id)a8;
    -[RTMapItemProviderBluePOI _computeEarlyStopQueryResultFromResults:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:](self, "_computeEarlyStopQueryResultFromResults:originalMaxNumberOfQueries:aoiConfidencePassThroughThreshold:poiConfidencePassThroughThreshold:", v22, a5, a6, a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 == v28)
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(v26, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v26, "secondObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v29, "unsignedIntegerValue");

    a8 = (unint64_t)v41;
  }
  v42 = v22;
  if (objc_msgSend(v42, "count"))
  {
    if (v20)
    {
      objc_msgSend(v42, "firstObject");
      v30 = a8;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v42;
      a8 = v30;
    }
    else
    {
      -[RTMapItemProviderBluePOI bestQueryFromAggregatedQueries:error:](self, "bestQueryFromAggregatedQueries:error:", v42, 0);
      v38 = objc_claimAutoreleasedReturnValue();
      v33 = v42;
      v32 = (void *)v38;
    }
    v35 = a9;
    v34 = a10;
    v36 = a12;
    v37 = a11;
  }
  else
  {
    v32 = 0;
    v35 = a9;
    v34 = a10;
    v36 = a12;
    v37 = a11;
    v33 = v42;
  }
  +[RTMapItemProviderBluePOIPerformanceMetrics submitMetricsWithNonZeroAccessPointsFingerprintsCount:zeroAccessPointsFingerprintsCount:fingerprintsCount:queryCount:firstResultQueryCount:results:earlyStopQueryCount:earlyStopQueryResult:bestQueryResult:error:visitInterval:visitSource:](RTMapItemProviderBluePOIPerformanceMetrics, "submitMetricsWithNonZeroAccessPointsFingerprintsCount:zeroAccessPointsFingerprintsCount:fingerprintsCount:queryCount:firstResultQueryCount:results:earlyStopQueryCount:earlyStopQueryResult:bestQueryResult:error:visitInterval:visitSource:", v34, v35, a8, v37, v36, v33, a14, v25, v24, v32, v23, a15);

}

- (BOOL)_hasMapItemInQueryResult:(id)a3 wifiFingerprintLabelType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "mapItem", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "extendedAttributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "wifiFingerprintLabelType");

        if (v12 == a4)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_adjustConfidencesOfTheSelectedResult:(id)a3 allQueryResults:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  RTMapItemProviderBluePOI *v46;
  const char *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  double v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[RTMapItemProviderBluePOI _hasMapItemInQueryResult:wifiFingerprintLabelType:](self, "_hasMapItemInQueryResult:wifiFingerprintLabelType:", v7, 2))
  {
    v59 = v7;
    +[RTMapItemProviderBluePOIPerformanceMetrics _mapItemDictionaryforResults:wifiFingerprintLabelType:](RTMapItemProviderBluePOIPerformanceMetrics, "_mapItemDictionaryforResults:wifiFingerprintLabelType:", v8, 1);
    v57 = v8;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTMapItemProviderBluePOIPerformanceMetrics _mapItemDictionaryforResults:wifiFingerprintLabelType:](RTMapItemProviderBluePOIPerformanceMetrics, "_mapItemDictionaryforResults:wifiFingerprintLabelType:", v8, 2);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v63 = 0;
      v13 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v70 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          objc_msgSend(v62, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v12 < v17)
          {
            v18 = v15;

            v12 = v17;
            v63 = v18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v63 = 0;
    }

    -[RTMapItemProviderBluePOI _confidenceCoefficientsForAOI:AOIOccurenceCount:POIResults:](self, "_confidenceCoefficientsForAOI:AOIOccurenceCount:POIResults:", v63, v12, v58);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v63, "unsignedIntegerValue");
      *(_DWORD *)buf = 138413058;
      v75 = v23;
      v76 = 2112;
      v77 = v24;
      v78 = 2048;
      v79 = v25;
      v80 = 2048;
      v81 = *(double *)&v12;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, AOI MUID with the largest number of occuraces, %lu, largest number of occurances, %lu.", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v59, "count"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v26 = v59;
    v64 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v64)
    {
      v61 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v66 != v61)
            objc_enumerationMutation(v26);
          v28 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
          objc_msgSend(v28, "mapItem");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "extendedAttributes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "wifiFingerprintLabelType");

          if (v31 == 1)
          {
            v32 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v28, "mapItem");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "muid"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "confidence");
            v36 = v35;
            objc_msgSend(v20, "objectForKeyedSubscript:", v34);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "doubleValue");
            v39 = v36 * v38;

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v41 = (objc_class *)objc_opt_class();
              NSStringFromClass(v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v60 = v34;
              v43 = v26;
              v44 = v19;
              v45 = v20;
              v46 = self;
              v47 = a2;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v75 = v42;
              v76 = 2112;
              v77 = v48;
              v78 = 2112;
              v79 = (uint64_t)v28;
              v80 = 2048;
              v81 = v39;
              _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, %@, confidence for map item, %@, was changed to, %f.", buf, 0x2Au);

              a2 = v47;
              self = v46;
              v20 = v45;
              v19 = v44;
              v26 = v43;
              v34 = v60;

            }
            v49 = objc_alloc(MEMORY[0x1E0D183A8]);
            objc_msgSend(v28, "mapItem");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = (void *)objc_msgSend(v49, "initWithMapItem:confidence:source:", v50, objc_msgSend(v28, "source"), v39);

            objc_msgSend(v19, "addObject:", v51);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v75 = v54;
              v76 = 2112;
              v77 = v55;
              v78 = 2112;
              v79 = (uint64_t)v28;
              _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, confidence for map item, %@, remains unchanged.", buf, 0x20u);

            }
            objc_msgSend(v19, "addObject:", v28);
          }
        }
        v64 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v64);
    }

    v7 = v59;
    v8 = v57;
  }
  else
  {
    v19 = v7;
  }

  return v19;
}

- (id)_confidenceCoefficientsForAOI:(id)a3 AOIOccurenceCount:(unint64_t)a4 POIResults:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = (double)a4;
    v12 = *(_QWORD *)v21;
    v13 = (double)a4 * 0.5;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v13 >= (double)v17)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v17 / v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v15);

        }
        else
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E932CD80, v15);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)filterByDistance:(id)a3 location:(id)a4 thresholdForUnknownLabel:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_163);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTMapItemProviderBluePOIParameters aoiDistanceThreshold](self->_parameters, "aoiDistanceThreshold");
    v35 = 0;
    -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v14, v11, 0x4000, &v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v35;

    if (v16)
    {
      if (a6)
      {
        v16 = objc_retainAutorelease(v16);
        v17 = 0;
        *a6 = v16;
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      if (objc_msgSend(v15, "count"))
        objc_msgSend(v12, "addObjectsFromArray:", v15);
      v32 = v12;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_164_0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filteredArrayUsingPredicate:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[RTMapItemProviderBluePOIParameters poiDistanceThreshold](self->_parameters, "poiDistanceThreshold");
      v34 = 0;
      -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v19, v11, 0x4000, &v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v34;

      if (v16)
      {
        if (a6)
        {
          v16 = objc_retainAutorelease(v16);
          v17 = 0;
          *a6 = v16;
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        if (objc_msgSend(v20, "count"))
          objc_msgSend(v32, "addObjectsFromArray:", v20);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_165);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "filteredArrayUsingPredicate:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = 0;
        -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v22, v11, 0x4000, &v33, a5);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v33;

        if (v16)
        {
          v17 = 0;
          if (a6)
            *a6 = objc_retainAutorelease(v16);
        }
        else
        {
          if (objc_msgSend(v23, "count"))
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "firstObject");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "mapItem");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "extendedAttributes");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "wifiFingerprintLabelType");
              *(_DWORD *)buf = 138412546;
              v37 = v27;
              v38 = 2048;
              v39 = v30;
              _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, unknown label type, %ld", buf, 0x16u);

            }
            objc_msgSend(v32, "addObjectsFromArray:", v23);
          }
          v17 = v32;
        }

      }
      v12 = v32;

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

BOOL __85__RTMapItemProviderBluePOI_filterByDistance_location_thresholdForUnknownLabel_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wifiFingerprintLabelType") == 2;

  return v4;
}

BOOL __85__RTMapItemProviderBluePOI_filterByDistance_location_thresholdForUnknownLabel_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extendedAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wifiFingerprintLabelType") == 1;

  return v4;
}

BOOL __85__RTMapItemProviderBluePOI_filterByDistance_location_thresholdForUnknownLabel_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wifiFingerprintLabelType") == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extendedAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "wifiFingerprintLabelType") != 2;

  }
  return v5;
}

- (id)_filterByConfidence:(id)a3 aoiConfidencePassThroughThreshold:(double)a4 aoiConfidenceConsiderThreshold:(double)a5 poiConfidencePassThroughThreshold:(double)a6 poiConfidenceConsiderThreshold:(double)a7 error:(id *)a8
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  id v39;
  id v40;
  uint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  double v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (!objc_msgSend(v12, "count"))
  {
    v40 = 0;
    goto LABEL_29;
  }
  v39 = v12;
  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (!v14)
    goto LABEL_27;
  v15 = v14;
  v41 = 0;
  v16 = *(_QWORD *)v44;
  v17 = 1;
  v18 = 1;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v44 != v16)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(v20, "mapItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "extendedAttributes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "wifiFingerprintLabelType");

      if (v23 == 2)
      {
        if ((v18 & 1) != 0)
        {
          objc_msgSend(v20, "confidence");
          if (v24 < a4)
            goto LABEL_19;
          LOBYTE(v41) = 1;
          v25 = a4;
        }
        else
        {
          if ((v41 & 1) == 0)
            goto LABEL_19;
          objc_msgSend(v20, "confidence");
          if (v27 < a5)
            goto LABEL_19;
          LOBYTE(v41) = 1;
          v25 = a5;
        }
      }
      else if ((v17 & 1) != 0)
      {
        objc_msgSend(v20, "confidence");
        if (v26 < a6)
          goto LABEL_19;
        BYTE4(v41) = 1;
        v25 = a6;
      }
      else
      {
        if ((v41 & 0x100000000) == 0 || (objc_msgSend(v20, "confidence"), v28 < a7))
        {
LABEL_19:
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            goto LABEL_25;
          NSStringFromSelector(a2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v48 = v30;
          v49 = 2048;
          v50 = a4;
          v51 = 2112;
          v52 = v20;
          v31 = v29;
          v32 = "%@, filtered mapItem by confidence %0.2f, %@";
          goto LABEL_24;
        }
        BYTE4(v41) = 1;
        v25 = a7;
      }
      objc_msgSend(v40, "addObject:", v20);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      NSStringFromSelector(a2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v30;
      v49 = 2048;
      v50 = v25;
      v51 = 2112;
      v52 = v20;
      v31 = v29;
      v32 = "%@, passed mapItem by confidence %0.2f, %@";
LABEL_24:
      _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, v32, buf, 0x20u);

LABEL_25:
      objc_msgSend(v20, "mapItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "extendedAttributes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "wifiFingerprintLabelType");
      v36 = v35 != 2;
      v37 = v35 == 2;

      v17 &= v37;
      v18 &= v36;
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  }
  while (v15);
LABEL_27:

  v12 = v39;
LABEL_29:

  return v40;
}

- (id)poiHarvestForFingerprint:(id)a3 mapItem:(id)a4 referenceLocation:(id)a5 endDate:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;

  v12 = a4;
  v13 = a5;
  v36 = 0;
  -[RTMapItemProviderBluePOI accessPointsForFingerprint:endDate:error:](self, "accessPointsForFingerprint:endDate:error:", a3, a6, &v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v36;
  v16 = v15;
  if (v15)
  {
    if (a7)
    {
      v17 = 0;
      *a7 = objc_retainAutorelease(v15);
      goto LABEL_21;
    }
LABEL_8:
    v17 = 0;
    goto LABEL_21;
  }
  if (!objc_msgSend(v14, "count"))
    goto LABEL_8;
  v35 = 0;
  -[RTMapItemProviderBluePOI locationsForAccessPoints:error:](self, "locationsForAccessPoints:error:", v14, &v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v35;
  v20 = v19;
  if (v19)
  {
    v17 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v19);
  }
  else
  {
    objc_msgSend(v18, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    objc_msgSend(v18, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    -[RTMapItemProviderBluePOI motionActivitesFrom:to:error:](self, "motionActivitesFrom:to:error:", v21, v23, &v34);
    v30 = objc_claimAutoreleasedReturnValue();
    v24 = v34;

    if (v24)
    {
      v17 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v24);
      v28 = (void *)v30;
      v18 = v32;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v13)
        objc_msgSend(v25, "addObject:", v13);
      v18 = v32;
      v27 = objc_msgSend(v32, "count", v30);
      v28 = v31;
      if (v27)
        objc_msgSend(v26, "addObjectsFromArray:", v32);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16B38]), "initWithMapItem:accessPoints:locations:motionActivities:", v12, v14, v26, v31);

    }
  }

LABEL_21:
  return v17;
}

- (BOOL)submitHarvest:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  uint8_t buf[16];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v34 = 0;
    v35 = (id *)&v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__31;
    v38 = __Block_byref_object_dispose__31;
    v39 = 0;
    v7 = dispatch_semaphore_create(0);
    -[RTMapItemProviderBluePOI locationManager](self, "locationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __48__RTMapItemProviderBluePOI_submitHarvest_error___block_invoke;
    v31[3] = &unk_1E9297038;
    v33 = &v34;
    v9 = v7;
    v32 = v9;
    objc_msgSend(v8, "submitHarvestSample:handler:", v6, v31);

    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v10, v12))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v11);
    v15 = v14;
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_345);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v22 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v42, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_retainAutorelease(v24);

      v26 = 0;
    }
    else
    {
LABEL_7:
      v25 = 0;
      v26 = 1;
    }

    v27 = v25;
    if ((v26 & 1) == 0)
      objc_storeStrong(v35 + 5, v25);
    if (a4)
      *a4 = objc_retainAutorelease(v35[5]);
    LOBYTE(a4) = v35[5] == 0;

    _Block_object_dispose(&v34, 8);
  }
  else if (a4)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v40 = *MEMORY[0x1E0CB2D50];
    v41 = CFSTR("requires a valid poiHarvest.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v29);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

void __48__RTMapItemProviderBluePOI_submitHarvest_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (int)harvestTypeToPoiTriggerType:(unint64_t)a3
{
  int v3;

  if (a3 == 2)
    v3 = 4;
  else
    v3 = 3;
  if (a3)
    return v3;
  else
    return 0;
}

+ (id)harvestTypeToString:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return off_1E929AA98[a3];
}

- (BOOL)harvestVisits:(id)a3 mapItem:(id)a4 harvestType:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id *v57;
  id v58;
  id v59;
  NSObject *v60;
  uint64_t v61;
  id obj;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v68;
  void *v69;
  void *v70;
  void *context;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  id v87;
  __int16 v88;
  int v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;
  _QWORD v97[4];

  v97[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "count") && objc_msgSend(v10, "validMUID"))
  {
    v66 = (void *)objc_msgSend(v10, "copy");
    if (v66)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v11 = v9;
      v56 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      if (v56)
      {
        v12 = *(_QWORD *)v81;
        v58 = v10;
        v59 = v9;
        v57 = a6;
        v60 = v11;
        v55 = *(_QWORD *)v81;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v81 != v12)
              objc_enumerationMutation(v11);
            v61 = v13;
            v14 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v13);
            if (a5 != 1
              || !objc_msgSend(v14, "placeSource")
              || (v15 = objc_msgSend(v14, "placeSource"),
                  (-[RTMapItemProviderBluePOIParameters harvestMask](self->_parameters, "harvestMask") & v15) != 0))
            {
              v79 = 0;
              objc_msgSend(v14, "entryDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "exitDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = 0;
              -[RTMapItemProviderBluePOI fingerprintsBetweenStartDate:endDate:isTimeWindowFallback:settledState:error:](self, "fingerprintsBetweenStartDate:endDate:isTimeWindowFallback:settledState:error:", v16, v17, &v79, 2, &v78);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v78;

              if (v19)
              {
                if (a6)
                  *a6 = objc_retainAutorelease(v19);

                v48 = 0;
LABEL_41:
                v11 = v60;
                goto LABEL_43;
              }
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              obj = v18;
              v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
              if (v65)
              {
                v64 = *(_QWORD *)v75;
                while (2)
                {
                  v20 = 0;
                  do
                  {
                    if (*(_QWORD *)v75 != v64)
                      objc_enumerationMutation(obj);
                    v68 = v20;
                    v69 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v20);
                    context = (void *)MEMORY[0x1D8231EA8]();
                    v21 = objc_alloc(MEMORY[0x1E0D183B0]);
                    objc_msgSend(v14, "location");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "location");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "latitude");
                    v24 = v23;
                    objc_msgSend(v14, "location");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "location");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "longitude");
                    v28 = v27;
                    objc_msgSend(v14, "location");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "location");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "horizontalUncertainty");
                    v32 = v31;
                    objc_msgSend(v14, "entryDate");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "location");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "location");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v36 = (void *)objc_msgSend(v21, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", v33, objc_msgSend(v35, "referenceFrame"), v24, v28, v32);

                    objc_msgSend(v66, "setSource:", objc_msgSend(v14, "placeSource"));
                    objc_msgSend(v14, "exitDate");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v73 = 0;
                    -[RTMapItemProviderBluePOI poiHarvestForFingerprint:mapItem:referenceLocation:endDate:error:](self, "poiHarvestForFingerprint:mapItem:referenceLocation:endDate:error:", v69, v66, v36, v37, &v73);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = v73;

                    if (v39)
                    {
                      v40 = v39;
                    }
                    else if (v38)
                    {
                      v41 = +[RTMapItemProviderBluePOI harvestTypeToPoiTriggerType:](RTMapItemProviderBluePOI, "harvestTypeToPoiTriggerType:", a5);
                      objc_msgSend(v38, "triggerEvent");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "setTriggerType:", v41);

                      v72 = 0;
                      -[RTMapItemProviderBluePOI submitHarvest:error:](self, "submitHarvest:error:", v38, &v72);
                      v40 = v72;
                      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                      v43 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                      {
                        objc_msgSend(v38, "triggerEvent");
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        v45 = objc_msgSend(v44, "triggerType");
                        +[RTMapItemProviderBluePOI harvestTypeToString:](RTMapItemProviderBluePOI, "harvestTypeToString:", a5);
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138413314;
                        v85 = v69;
                        v86 = 2112;
                        v87 = v38;
                        v88 = 1024;
                        v89 = v45;
                        v90 = 2112;
                        v91 = v46;
                        v92 = 2112;
                        v93 = v40;
                        _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "harvested fingerprint, %@, poiHarvest, %@, triggerType, %d, harvestType, %@, error, %@", buf, 0x30u);

                      }
                    }
                    else
                    {
                      v40 = 0;
                    }

                    objc_autoreleasePoolPop(context);
                    if (v40)
                    {
                      if (v57)
                        *v57 = objc_retainAutorelease(v40);

                      v48 = 0;
                      v10 = v58;
                      v9 = v59;
                      goto LABEL_41;
                    }
                    v20 = v68 + 1;
                  }
                  while (v65 != v68 + 1);
                  v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v94, 16);
                  if (v65)
                    continue;
                  break;
                }
              }

              v10 = v58;
              v9 = v59;
              a6 = v57;
              v11 = v60;
            }
            v13 = v61 + 1;
            v12 = v55;
          }
          while (v61 + 1 != v56);
          v47 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
          v12 = v55;
          v48 = 1;
          v56 = v47;
          if (v47)
            continue;
          break;
        }
      }
      else
      {
        v48 = 1;
      }
    }
    else
    {
      if (a6)
      {
        v49 = (void *)MEMORY[0x1E0CB35C8];
        v50 = *MEMORY[0x1E0D18598];
        v96 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to copy %@"), v10);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v97[0] = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, &v96, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, 0, v52);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v85 = v54;
        v86 = 2112;
        v87 = v10;
        _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, Failed to copy %@", buf, 0x16u);

      }
      v48 = 0;
    }
LABEL_43:

  }
  else
  {
    v48 = 1;
  }

  return v48;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  -[RTMapItemProviderBluePOIParameters minVisitLength](self->_parameters, "minVisitLength");
  return v9 <= v10;
}

- (RTInferredMapItemDeduper)inferredMapItemDeduper
{
  return self->_inferredMapItemDeduper;
}

- (RTFingerprintManager)fingerprintManager
{
  return self->_fingerprintManager;
}

- (void)setFingerprintManager:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprintManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void)setPlaceInferenceQueryStore:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTMapItemProviderBluePOIParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_fingerprintManager, 0);
  objc_storeStrong((id *)&self->_inferredMapItemDeduper, 0);
}

@end
