@implementation RTPlaceTypeClassifierExpertInferred

- (RTPlaceTypeClassifierExpertInferred)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBiomeManager_defaultsManager_distanceCalculator_learnedLocationStore_placeTypeClassifierMetricsCalculator_platform_);
}

- (RTPlaceTypeClassifierExpertInferred)initWithBiomeManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationStore:(id)a6 placeTypeClassifierMetricsCalculator:(id)a7 platform:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTPlaceTypeClassifierExpertInferred *v19;
  id *p_isa;
  RTPlaceTypeClassifierExpertInferred *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v29 = a6;
  v28 = a7;
  v18 = a8;
  if (!v15)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: biomeManager";
LABEL_20:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_21;
  }
  if (!v16)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_20;
  }
  if (!v17)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_20;
  }
  if (!v29)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_20;
  }
  if (!v28)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: placeTypeClassifierMetricsCalculator";
      goto LABEL_20;
    }
LABEL_21:

    v21 = 0;
    goto LABEL_22;
  }
  v27 = v18;
  if (v18)
  {
    v30.receiver = self;
    v30.super_class = (Class)RTPlaceTypeClassifierExpertInferred;
    v19 = -[RTPlaceTypeClassifierExpertInferred init](&v30, sel_init);
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_biomeManager, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 6, a8);
    }
    self = p_isa;
    v21 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_22:

  return v21;
}

- (id)classifyWithError:(id *)a3
{
  RTLearnedPlaceTypeInferenceGenerator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  RTStoredLocationOfInterestEnumerationOptions *v15;
  dispatch_semaphore_t v16;
  RTLearnedLocationStore *learnedLocationStore;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  dispatch_time_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  char v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *context;
  _QWORD v43[4];
  NSObject *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  RTLearnedPlaceTypeInferenceGenerator *v58;
  uint64_t v59;
  uint8_t buf[16];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8231EA8](self, a2);
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__70;
  v57 = __Block_byref_object_dispose__70;
  v4 = [RTLearnedPlaceTypeInferenceGenerator alloc];
  -[RTPlaceTypeClassifierExpertInferred biomeManager](self, "biomeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierExpertInferred defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierExpertInferred distanceCalculator](self, "distanceCalculator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierExpertInferred learnedLocationStore](self, "learnedLocationStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierExpertInferred placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierExpertInferred platform](self, "platform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[RTLearnedPlaceTypeInferenceGenerator initWithBiomeManager:defaultsManager:distanceCalculator:learnedLocationStore:placeTypeClassifierMetricsCalculator:platform:](v4, "initWithBiomeManager:defaultsManager:distanceCalculator:learnedLocationStore:placeTypeClassifierMetricsCalculator:platform:", v5, v6, v7, v8, v9, v10);

  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3628800.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v13);

  v15 = -[RTStoredLocationOfInterestEnumerationOptions initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:]([RTStoredLocationOfInterestEnumerationOptions alloc], "initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:", 1, 5, v14, 0);
  v16 = dispatch_semaphore_create(0);
  v47 = 0;
  v48 = (id *)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__70;
  v51 = __Block_byref_object_dispose__70;
  v52 = 0;
  learnedLocationStore = self->_learnedLocationStore;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __57__RTPlaceTypeClassifierExpertInferred_classifyWithError___block_invoke;
  v43[3] = &unk_1E929DF00;
  v45 = &v47;
  v46 = &v53;
  v18 = v16;
  v44 = v18;
  -[RTLearnedLocationStore enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:](learnedLocationStore, "enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:", v15, v43);
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v19, v21))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", context);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSinceDate:", v20);
  v24 = v23;
  v25 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_56);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "filteredArrayUsingPredicate:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "submitToCoreAnalytics:type:duration:", v29, 1, v24);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v31 = (void *)MEMORY[0x1E0CB35C8];
  v59 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v59, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = objc_retainAutorelease(v33);

    v35 = 0;
  }
  else
  {
LABEL_6:
    v34 = 0;
    v35 = 1;
  }

  v36 = v34;
  if ((v35 & 1) == 0)
    objc_storeStrong(v48 + 5, v34);
  v37 = v48[5];
  if (v37)
  {
    v38 = v37;
    v39 = 0;
  }
  else
  {
    objc_msgSend((id)v54[5], "inferPlaceTypes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  objc_autoreleasePoolPop(context);
  if (a3)
    *a3 = objc_retainAutorelease(v37);

  return v39;
}

void __57__RTPlaceTypeClassifierExpertInferred_classifyWithError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
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
          v15 = (void *)MEMORY[0x1D8231EA8](v10);
          objc_msgSend(v14, "place", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "visits");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "submitVisits:place:", v17, v16);

          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v11 = v10;
      }
      while (v10);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManager, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
}

@end
