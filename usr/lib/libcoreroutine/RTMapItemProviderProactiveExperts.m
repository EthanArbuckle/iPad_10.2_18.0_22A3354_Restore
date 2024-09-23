@implementation RTMapItemProviderProactiveExperts

- (RTMapItemProviderProactiveExperts)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_mapServiceManager_personalizationPortraitManager_);
}

- (RTMapItemProviderProactiveExperts)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapServiceManager:(id)a5 personalizationPortraitManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RTMapItemProviderProactiveExpertsParameters *v14;
  RTMapItemProviderProactiveExperts *v15;
  NSObject *v16;
  uint8_t v18[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = -[RTMapItemProviderProactiveExpertsParameters initWithDefaultsManager:]([RTMapItemProviderProactiveExpertsParameters alloc], "initWithDefaultsManager:", v10);
    self = -[RTMapItemProviderProactiveExperts initWithDefaultsManager:distanceCalculator:mapServiceManager:parameters:personalizationPortraitManager:](self, "initWithDefaultsManager:distanceCalculator:mapServiceManager:parameters:personalizationPortraitManager:", v10, v11, v12, v14, v13);

    v15 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v18, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (RTMapItemProviderProactiveExperts)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapServiceManager:(id)a5 parameters:(id)a6 personalizationPortraitManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RTMapItemProviderProactiveExperts *v17;
  id *p_isa;
  NSObject *v19;
  id v20;
  RTMapItemProviderProactiveExperts *v21;
  NSObject *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: personalizationPortraitManager";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_15;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: parameters";
      goto LABEL_15;
    }
LABEL_16:

    v21 = 0;
    goto LABEL_17;
  }
  v25.receiver = self;
  v25.super_class = (Class)RTMapItemProviderProactiveExperts;
  v17 = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v25, sel_initWithDefaultsManager_distanceCalculator_, v12, v13);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_personalizationPortraitManager, a7);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = p_isa[5];
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderProactiveExperts with parameters: %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v21 = self;
LABEL_17:

  return v21;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  _RTMap *v23;
  void *v24;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;

  v6 = a3;
  objc_msgSend(v6, "distance");
  v8 = v7;
  objc_msgSend(v6, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v10, -16200.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  -[RTMapItemProviderProactiveExperts _recentLocationsFrom:error:](self, "_recentLocationsFrom:error:", v11, &v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v31;
  if (v13)
  {
    v14 = v13;
    if (a4)
    {
      v14 = objc_retainAutorelease(v13);
      v15 = 0;
      *a4 = v14;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v30 = 0;
    -[RTMapItemProviderProactiveExperts _filterConnectionLocations:location:distance:error:](self, "_filterConnectionLocations:location:distance:error:", v12, v9, &v30, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v30;
    v14 = v17;
    if (v17)
    {
      v15 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v17);
    }
    else
    {
      v26 = objc_alloc(MEMORY[0x1E0D183F8]);
      v18 = objc_msgSend(v6, "useBackground");
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v28 = v16;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", v18, v20, v21);

      -[RTMapItemProviderProactiveExperts _mapItemsWithConnectionsLocations:options:](self, "_mapItemsWithConnectionsLocations:options:", v28, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v22);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __63__RTMapItemProviderProactiveExperts_mapItemsWithOptions_error___block_invoke;
      v29[3] = &unk_1E9298788;
      v29[4] = self;
      -[_RTMap withBlock:](v23, "withBlock:", v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v28;
      -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v24, v9, 2048, a4, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v15;
}

id __63__RTMapItemProviderProactiveExperts_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D183A8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "confidence");
  v6 = (void *)objc_msgSend(v5, "initWithMapItem:confidence:source:", v4, 2048);

  return v6;
}

- (id)_recentLocationsFrom:(id)a3 error:(id *)a4
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
  id v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, void *);
  void *v34;
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint8_t buf[16];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__11;
  v48 = __Block_byref_object_dispose__11;
  v49 = 0;
  v7 = dispatch_semaphore_create(0);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__11;
  v42 = __Block_byref_object_dispose__11;
  v43 = 0;
  -[RTMapItemProviderProactiveExperts personalizationPortraitManager](self, "personalizationPortraitManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __64__RTMapItemProviderProactiveExperts__recentLocationsFrom_error___block_invoke;
  v34 = &unk_1E9296EE0;
  v36 = &v44;
  v37 = &v38;
  v9 = v7;
  v35 = v9;
  objc_msgSend(v8, "fetchRecentLocationDonationsSince:handler:", v6, &v31);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v31, v32, v33, v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_9);
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
  v50 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v50, 1);
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
LABEL_6:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v45 + 5, v25);
  if (a4)
  {
    v28 = v45[5];
    if (v28)
      *a4 = objc_retainAutorelease(v28);
  }
  v29 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v29;
}

void __64__RTMapItemProviderProactiveExperts__recentLocationsFrom_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_filterConnectionLocations:(id)a3 location:(id)a4 distance:(double)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  id v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v31;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v33 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (!v11)
    {
      v13 = 0;
      goto LABEL_26;
    }
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v37;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(v16, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v9, "containsObject:", v18);

          if ((v19 & 1) != 0)
            continue;
        }
        else
        {

        }
        objc_msgSend(v16, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_19;
        -[RTMapItemProviderBase distanceCalculator](self, "distanceCalculator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v13;
        objc_msgSend(v21, "distanceFromLocation:toLocation:error:", v33, v22, &v35);
        v24 = v23;
        v25 = v35;

        if (v24 <= a5)
          v26 = 0;
        else
          v26 = 3;
        if (v25)
          v26 = 2;
        v13 = v25;
        if (v26 != 3)
        {
          if (v26)
            goto LABEL_26;
LABEL_19:
          objc_msgSend(v34, "addObject:", v16);
          objc_msgSend(v16, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length");

          if (v28)
          {
            objc_msgSend(v16, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v29);

          }
          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v12)
      {
LABEL_26:

        v8 = v31;
        goto LABEL_27;
      }
    }
  }
  v34 = 0;
LABEL_27:

  return v34;
}

- (id)_mapItemsWithConnectionsLocations:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
          -[RTMapItemProviderProactiveExperts mapServiceManager](self, "mapServiceManager", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mapItemUsingMapServiceManager:options:", v15, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v8, "addObjectsFromArray:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = v7;

  return v8 <= 900.0;
}

- (RTPersonalizationPortraitManager)personalizationPortraitManager
{
  return self->_personalizationPortraitManager;
}

- (void)setPersonalizationPortraitManager:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationPortraitManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMapItemProviderProactiveExpertsParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_personalizationPortraitManager, 0);
}

@end
