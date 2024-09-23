@implementation RTMapItemProviderPOIHistory

- (RTMapItemProviderPOIHistory)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_placeInferenceQueryStore_);
}

- (RTMapItemProviderPOIHistory)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTMapItemProviderPOIHistoryParameters *v11;
  RTMapItemProviderPOIHistory *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[RTMapItemProviderPOIHistoryParameters initWithDefaultsManager:]([RTMapItemProviderPOIHistoryParameters alloc], "initWithDefaultsManager:", v10);
  v12 = -[RTMapItemProviderPOIHistory initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:parameters:](self, "initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:parameters:", v10, v9, v8, v11);

  return v12;
}

- (RTMapItemProviderPOIHistory)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 placeInferenceQueryStore:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RTMapItemProviderPOIHistory *v15;
  id *p_isa;
  NSObject *v17;
  id v18;
  RTMapItemProviderPOIHistory *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: defaultsManager";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_19;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_18;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: placeInferenceQueryStore";
    goto LABEL_18;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = "Invalid parameter not satisfying: parameters";
      goto LABEL_18;
    }
LABEL_19:

    v19 = 0;
    goto LABEL_20;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTMapItemProviderPOIHistory;
  v15 = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v23, sel_initWithDefaultsManager_distanceCalculator_, v10, v11);
  p_isa = (id *)&v15->super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_placeInferenceQueryStore, a5);
    objc_storeStrong(p_isa + 4, a6);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = p_isa[4];
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderPOIHistory with parameters, %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v19 = self;
LABEL_20:

  return v19;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
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
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  _QWORD v44[4];
  id v45;
  SEL v46;
  _QWORD v47[4];
  id v48;
  NSObject *v49;
  uint64_t *v50;
  uint64_t *v51;
  SEL v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint8_t buf[16];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  v59 = 0;
  v60 = (id *)&v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__116;
  v63 = __Block_byref_object_dispose__116;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__116;
  v57 = __Block_byref_object_dispose__116;
  v58 = 0;
  v9 = dispatch_semaphore_create(0);
  -[RTMapItemProviderPOIHistory placeInferenceQueryStore](self, "placeInferenceQueryStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke;
  v47[3] = &unk_1E9299490;
  v52 = a2;
  v11 = v8;
  v48 = v11;
  v50 = &v53;
  v51 = &v59;
  v12 = v9;
  v49 = v12;
  objc_msgSend(v10, "fetchPlaceInferenceQueriesWithDateInterval:ascending:handler:", v11, 0, v47);

  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v15))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v14);
  v18 = v17;
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_89);
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
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v25 = (void *)MEMORY[0x1E0CB35C8];
  v65 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v65, 1);
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
LABEL_6:
    v28 = 0;
    v29 = 1;
  }

  v30 = v28;
  if ((v29 & 1) == 0)
    objc_storeStrong(v60 + 5, v28);
  v31 = v60[5];
  if (v31)
  {
    v32 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v31);
  }
  else
  {
    v33 = (void *)objc_opt_new();
    v34 = (void *)v54[5];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke_5;
    v44[3] = &unk_1E929BD08;
    v46 = a2;
    v35 = v33;
    v45 = v35;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v44);
    -[RTMapItemProviderPOIHistory parameters](self, "parameters");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "distanceThreshold");
    v38 = v37;
    objc_msgSend(v4, "location");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:error:](self, "filterInferredMapItems:byDistance:fromLocation:error:", v35, v39, a4, v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = 0;

  }
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v32;
}

void __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
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
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "count");
    v10 = *(_QWORD *)(a1 + 32);
    v17 = 138413058;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, fetched place inference query count, %lu, interval, %@, error, %@", (uint8_t *)&v17, 0x2Au);

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;
  v13 = v5;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v6;
  v16 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57__RTMapItemProviderPOIHistory_mapItemsWithOptions_error___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
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
    v21 = (void *)objc_msgSend(v17, "initWithMapItem:confidence:source:", v19, 0x80000);

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

- (void)setPlaceInferenceQueryStore:(id)a3
{
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, a3);
}

- (RTMapItemProviderPOIHistoryParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
}

@end
