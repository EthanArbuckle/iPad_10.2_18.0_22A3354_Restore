@implementation RTMapItemProviderCurrentPOI

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  double v29;
  double v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  RTMapItemProviderCurrentPOI *v36;
  id v37;
  uint64_t *v38;
  SEL v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  id v47;
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  SEL v51;
  uint64_t v52;
  uint64_t *v53;
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

  v6 = a3;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__47;
  v62 = __Block_byref_object_dispose__47;
  v63 = 0;
  v31 = (void *)objc_opt_new();
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__47;
  v56 = __Block_byref_object_dispose__47;
  v57 = 0;
  -[RTMapItemProviderCurrentPOI visitStore](self, "visitStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D18508]);
  v10 = *MEMORY[0x1E0D185C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E9327CF8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, v11, 0, 1, &unk_1E9327CE0, v12);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke;
  v46[3] = &unk_1E929BCE0;
  v51 = a2;
  v14 = v6;
  v47 = v14;
  v49 = &v52;
  v15 = v7;
  v48 = v15;
  v50 = &v58;
  objc_msgSend(v8, "fetchVisitsWithOptions:handler:", v13, v46);

  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__47;
  v44 = __Block_byref_object_dispose__47;
  v45 = 0;
  dispatch_group_enter(v15);
  -[RTMapItemProviderCurrentPOI visitStore](self, "visitStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D18508]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E9327D10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, v18, 0, 0, &unk_1E9327CE0, v19);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_16;
  v33[3] = &unk_1E929BD58;
  v39 = a2;
  v21 = v14;
  v34 = v21;
  v38 = &v40;
  v22 = v15;
  v35 = v22;
  v36 = self;
  v23 = v31;
  v37 = v23;
  objc_msgSend(v16, "fetchVisitsWithOptions:handler:", v20, v33);

  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  if (v53[5] || v41[5])
  {
    if (!a4)
    {
      v26 = 0;
      goto LABEL_8;
    }
    _RTSafeArray();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
  }
  else
  {
    if (v59[5])
      objc_msgSend(v23, "addObject:");
    objc_msgSend(v21, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMapItemProviderCurrentPOI parameters](self, "parameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "distanceThreshold");
    v30 = v29;

    -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:error:](self, "filterInferredMapItems:byDistance:fromLocation:error:", v23, v24, a4, v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_6;
    v25 = 0;
  }
  *a4 = v25;
LABEL_6:

LABEL_8:
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v26;
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (RTMapItemProviderCurrentPOIParameters)parameters
{
  return self->_parameters;
}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
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
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v35 = v8;
    v36 = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v10;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, fetched last instant POI visit, %@, options, %@, error, %@", buf, 0x2Au);

  }
  if (!v6)
  {
    objc_msgSend(v5, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "placeInference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (objc_msgSend(v12, "mapItem"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        NSStringFromSelector(*(SEL *)(a1 + 64));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v35 = v30;
        v36 = 2112;
        v37 = v31;
        v38 = 2112;
        v39 = v12;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "%@, fetched visit, %@, has a placeInference, %@ but not a map item this should not happen", buf, 0x20u);

      }
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = *MEMORY[0x1E0D18598];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("placeInference has a nil mapItem"), *MEMORY[0x1E0CB2D50]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 0, v26);
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v29 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v27;

    }
    else
    {
      objc_msgSend(v12, "mapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "validMUID"))
      {
        objc_msgSend(v12, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "address");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mergedThoroughfare");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "length");

        if (!v18)
        {
LABEL_14:
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

          goto LABEL_15;
        }
        v19 = objc_alloc(MEMORY[0x1E0D183A8]);
        objc_msgSend(v12, "mapItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "confidence");
        v21 = objc_msgSend(v19, "initWithMapItem:confidence:source:", v20, 0x10000);

        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v14 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;
      }
    }

    goto LABEL_14;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_15:

}

- (RTMapItemProviderCurrentPOI)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_placeInferenceQueryStore_visitStore_parameters_);
}

- (RTMapItemProviderCurrentPOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 visitStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RTMapItemProviderCurrentPOIParameters *v14;
  RTMapItemProviderCurrentPOI *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[RTMapItemProviderCurrentPOIParameters initWithDefaultsManager:]([RTMapItemProviderCurrentPOIParameters alloc], "initWithDefaultsManager:", v13);
  v15 = -[RTMapItemProviderCurrentPOI initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:visitStore:parameters:](self, "initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:visitStore:parameters:", v13, v12, v11, v10, v14);

  return v15;
}

- (RTMapItemProviderCurrentPOI)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 visitStore:(id)a6 parameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  RTMapItemProviderCurrentPOI *v18;
  id *p_isa;
  NSObject *v20;
  id v21;
  RTMapItemProviderCurrentPOI *v22;
  NSObject *v23;
  const char *v24;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: defaultsManager";
LABEL_21:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_22;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_21;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_21;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: visitStore";
    goto LABEL_21;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: parameters";
      goto LABEL_21;
    }
LABEL_22:

    v22 = 0;
    goto LABEL_23;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTMapItemProviderCurrentPOI;
  v18 = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v26, sel_initWithDefaultsManager_distanceCalculator_, v12, v13);
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_placeInferenceQueryStore, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = p_isa[5];
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderCurrentPOI with parameters, %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v22 = self;
LABEL_23:

  return v22;
}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a2, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v28 = v9;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v10;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, fetched last visit, %@, options, %@, error, %@", buf, 0x2Au);

  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entry");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v7, "exit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else
      {
        objc_msgSend(v7, "entry");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isBeforeDate:", v11);

        if (v16)
        {
          v17 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v7, "entry");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v11);

          objc_msgSend(*(id *)(a1 + 48), "placeInferenceQueryStore");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_19;
          v22[3] = &unk_1E929BD30;
          v23 = v19;
          v26 = *(_OWORD *)(a1 + 64);
          v24 = *(id *)(a1 + 40);
          v25 = *(id *)(a1 + 56);
          v21 = v19;
          objc_msgSend(v20, "fetchPlaceInferenceQueriesWithDateInterval:ascending:handler:", v21, 0, v22);

LABEL_11:
          goto LABEL_12;
        }
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_11;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
LABEL_12:

}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "count");
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, fetched place inference query count, %lu, interval, %@, error, %@", buf, 0x2Au);

  }
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_20;
    v11[3] = &unk_1E929BD08;
    v13 = *(_QWORD *)(a1 + 64);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

  }
}

void __57__RTMapItemProviderCurrentPOI_mapItemsWithOptions_error___block_invoke_20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "placeInference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  objc_msgSend(v5, "placeInference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "validMUID"))
  {

LABEL_10:
    goto LABEL_11;
  }
  v23 = a3;
  v24 = a1;
  objc_msgSend(v5, "placeInference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "address");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mergedThoroughfare");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(v24 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v22;
      v27 = 2048;
      v28 = v23;
      v29 = 2112;
      v30 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, place inference query, %@", buf, 0x20u);

    }
    v17 = objc_alloc(MEMORY[0x1E0D183A8]);
    objc_msgSend(v5, "placeInference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeInference");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "confidence");
    v21 = (void *)objc_msgSend(v17, "initWithMapItem:confidence:source:", v19, 0x10000);

    if (v21)
      objc_msgSend(*(id *)(v24 + 32), "addObject:", v21);

  }
LABEL_11:

}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
}

@end
