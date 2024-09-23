@implementation RTMapItemProviderReverseGeocode

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
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
  id v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  NSObject *v41;
  _RTMap *v42;
  _RTMap *v43;
  objc_class *v45;
  id v46;
  void *v47;
  objc_class *v48;
  id v49;
  void *v50;
  void *v51;
  objc_class *v52;
  id v53;
  void *v54;
  const char *aSelector;
  const char *aSelectora;
  void *v57;
  void *v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _BYTE buf[12];
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  _QWORD v90[4];

  aSelector = a2;
  v90[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__19;
  v83 = __Block_byref_object_dispose__19;
  v84 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__19;
  v77 = __Block_byref_object_dispose__19;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__19;
  v71 = __Block_byref_object_dispose__19;
  v72 = 0;
  objc_msgSend(v5, "location");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D183F8]);
  v7 = objc_msgSend(v5, "useBackground");
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v6, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", v7, v9, v10);

  v11 = dispatch_semaphore_create(0);
  -[RTMapItemProviderReverseGeocode mapServiceManager](self, "mapServiceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke;
  v62[3] = &unk_1E9299588;
  v64 = &v79;
  v65 = &v73;
  v66 = &v67;
  v13 = v11;
  v63 = v13;
  objc_msgSend(v12, "fetchMapItemsRelatedPlacesFromLocation:options:handler:", v57, v59, v62);

  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v15);
  v19 = v18;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_15);
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
  v90[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v90, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);

  }
  else
  {
LABEL_6:
    v29 = 0;
  }

  v30 = v29;
  v31 = v30;
  if (a4 && v30)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v46;
      v86 = 2112;
      v87 = v47;
      v88 = 2112;
      v89 = v31;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorLogAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v33 = objc_retainAutorelease(v31);
LABEL_17:
    v35 = 0;
    *a4 = v33;
    goto LABEL_23;
  }
  if (a4 && v68[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)v68[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v49;
      v86 = 2112;
      v87 = v50;
      v88 = 2112;
      v89 = v51;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorLogAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v33 = objc_retainAutorelease((id)v68[5]);
    goto LABEL_17;
  }
  v36 = v80[5];
  v37 = v74[5];
  v61 = 0;
  -[RTMapItemProviderReverseGeocode _selectMapItemsFromFetchedMapItems:relatedPlacesMapItems:options:error:](self, "_selectMapItemsFromFetchedMapItems:relatedPlacesMapItems:options:error:", v36, v37, v59, &v61, aSelector);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v61;
  v40 = (void *)v80[5];
  v80[5] = v38;

  if (v39)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelectora);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v53;
      v86 = 2112;
      v87 = v54;
      v88 = 2112;
      v89 = v39;
      _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, %@, an error occurred when retrieving related places, %@.", buf, 0x20u);

    }
  }
  v42 = [_RTMap alloc];
  v43 = -[_RTMap initWithInput:](v42, "initWithInput:", v80[5]);
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke_8;
  v60[3] = &unk_1E9298788;
  v60[4] = self;
  -[_RTMap withBlock:](v43, "withBlock:", v60);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  return v35;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

void __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v18 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __106__RTMapItemProviderReverseGeocode__selectMapItemsFromFetchedMapItems_relatedPlacesMapItems_options_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id obj;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_filterRelatedPlacesMapItems:", a2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!v5 && objc_msgSend(obj, "count"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_selectMapItemsFromFetchedMapItems:(id)a3 relatedPlacesMapItems:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
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
  id v29;
  char v30;
  id v31;
  id v32;
  void *v34;
  void *v35;
  _QWORD v36[5];
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint8_t buf[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__19;
  v50 = __Block_byref_object_dispose__19;
  v13 = v10;
  v51 = v13;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__19;
  v44 = __Block_byref_object_dispose__19;
  v45 = 0;
  if (objc_msgSend(v13, "count") != 1 || objc_msgSend(v11, "count") != 1)
    goto LABEL_13;
  v14 = dispatch_semaphore_create(0);
  -[RTMapItemProviderReverseGeocode mapServiceManager](self, "mapServiceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __106__RTMapItemProviderReverseGeocode__selectMapItemsFromFetchedMapItems_relatedPlacesMapItems_options_error___block_invoke;
  v36[3] = &unk_1E92995B0;
  v36[4] = self;
  v38 = &v46;
  v39 = &v40;
  v16 = v14;
  v37 = v16;
  objc_msgSend(v15, "fetchMapItemsFromIdentifiers:options:source:handler:", v11, v12, 0x40000, v36);

  v17 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v17, v18))
  {
    v29 = 0;
LABEL_9:
    v30 = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "timeIntervalSinceDate:", v35);
  v20 = v19;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_15);
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
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v27 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v52, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29)
    goto LABEL_9;
  v29 = objc_retainAutorelease(v29);

  v30 = 0;
LABEL_10:

  v31 = v29;
  if ((v30 & 1) == 0)
    objc_storeStrong(v41 + 5, v29);

LABEL_13:
  if (a6)
    *a6 = objc_retainAutorelease(v41[5]);
  v32 = (id)v47[5];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v32;
}

- (RTMapItemProviderReverseGeocode)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_mapServiceManager_);
}

- (RTMapItemProviderReverseGeocode)initWithDefaultsManager:(id)a3 mapServiceManager:(id)a4
{
  id v6;
  id v7;
  RTMapItemProviderReverseGeocodeParameters *v8;
  RTMapItemProviderReverseGeocode *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[RTMapItemProviderReverseGeocodeParameters initWithDefaultsManager:]([RTMapItemProviderReverseGeocodeParameters alloc], "initWithDefaultsManager:", v6);
    self = -[RTMapItemProviderReverseGeocode initWithMapServiceManager:parameters:](self, "initWithMapServiceManager:parameters:", v7, v8);

    v9 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (RTMapItemProviderReverseGeocode)initWithMapServiceManager:(id)a3 parameters:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTMapItemProviderReverseGeocode *v10;
  id *p_isa;
  NSObject *v12;
  id v13;
  RTMapItemProviderReverseGeocode *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v14 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: mapServiceManager";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_11;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTMapItemProviderReverseGeocode;
  v10 = -[RTMapItemProviderReverseGeocode init](&v18, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mapServiceManager, a3);
    objc_storeStrong(p_isa + 2, a4);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = p_isa[2];
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderReverseGeocode with parameters: %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v14 = self;
LABEL_12:

  return v14;
}

id __61__RTMapItemProviderReverseGeocode_mapItemsWithOptions_error___block_invoke_8(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D183A8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "_confidenceForSource:", objc_msgSend(v4, "source"));
  v7 = (void *)objc_msgSend(v5, "initWithMapItem:confidence:source:", v4, objc_msgSend(v4, "source"), v6);

  return v7;
}

- (id)_filterRelatedPlacesMapItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "address");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "geoAddressObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "address");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "structuredAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "subPremisesCount");

        if (!v14)
          objc_msgSend(v16, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v16;
}

- (double)_confidenceForSource:(unint64_t)a3
{
  NSObject *v5;
  double result;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0)
  {
    -[RTMapItemProviderReverseGeocodeParameters confidence](self->_parameters, "confidence");
  }
  else if ((a3 & 0x40000) != 0)
  {
    -[RTMapItemProviderReverseGeocodeParameters relatedPlacesConfidence](self->_parameters, "relatedPlacesConfidence");
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D183E8], "sourceToString:", a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid source %@, falling back to revgeo confidence.", (uint8_t *)&v8, 0xCu);

    }
    -[RTMapItemProviderReverseGeocodeParameters confidence](self->_parameters, "confidence");
  }
  return result;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMapItemProviderReverseGeocodeParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
}

@end
