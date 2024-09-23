@implementation RTPlaceTypeClassifierExpertContacts

- (RTPlaceTypeClassifierExpertContacts)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithContactsManager_distanceCalculator_learnedLocationStore_mapServiceManager_mapsSupportManager_placeTypeClassifierMetricsCalculator_);
}

- (RTPlaceTypeClassifierExpertContacts)initWithContactsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 mapServiceManager:(id)a6 mapsSupportManager:(id)a7 placeTypeClassifierMetricsCalculator:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  RTPlaceTypeClassifierExpertContacts *v19;
  id *p_isa;
  RTPlaceTypeClassifierExpertContacts *v21;
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
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: contactsManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_18;
  }
  if (!v16)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v29)
  {
    v22 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: mapServiceManager";
      goto LABEL_17;
    }
LABEL_18:

    v21 = 0;
    goto LABEL_19;
  }
  v27 = v18;
  if (v28)
  {
    v30.receiver = self;
    v30.super_class = (Class)RTPlaceTypeClassifierExpertContacts;
    v19 = -[RTPlaceTypeClassifierExpertContacts init](&v30, sel_init);
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_contactsManager, a3);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 2, a4);
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
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapsSupportManager", buf, 2u);
    }

    v21 = 0;
  }
  v22 = v27;
LABEL_19:

  return v21;
}

- (id)_meCardContactWithError:(id *)a3
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
  id v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint8_t buf[8];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__57;
  v45 = __Block_byref_object_dispose__57;
  v46 = 0;
  v35 = 0;
  v36 = (id *)&v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__57;
  v39 = __Block_byref_object_dispose__57;
  v40 = 0;
  v5 = dispatch_semaphore_create(0);
  -[RTPlaceTypeClassifierExpertContacts contactsManager](self, "contactsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __63__RTPlaceTypeClassifierExpertContacts__meCardContactWithError___block_invoke;
  v31 = &unk_1E929CC38;
  v33 = &v41;
  v34 = &v35;
  v7 = v5;
  v32 = v7;
  objc_msgSend(v6, "fetchMeCardWithHandler:", &v28);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v28, v29, v30, v31);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_129);
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
  v47 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v47, 1);
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
    objc_storeStrong(v36 + 5, v23);
  if (a3)
    *a3 = objc_retainAutorelease(v36[5]);
  v26 = (id)v42[5];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v26;
}

void __63__RTPlaceTypeClassifierExpertContacts__meCardContactWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_correctedMapItemsFromUserWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  id *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE buf[12];
  __int16 v58;
  id v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, &unk_1E9327F50);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, &unk_1E9327F68);

  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__57;
  v55 = __Block_byref_object_dispose__57;
  v56 = 0;
  v45 = 0;
  v46 = (id *)&v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__57;
  v49 = __Block_byref_object_dispose__57;
  v50 = 0;
  v8 = dispatch_semaphore_create(0);
  -[RTPlaceTypeClassifierExpertContacts mapsSupportManager](self, "mapsSupportManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke;
  v41[3] = &unk_1E9296EE0;
  v43 = &v45;
  v44 = &v51;
  v10 = v8;
  v42 = v10;
  objc_msgSend(v9, "fetchPinnedPlacesWithHandler:", v41);

  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_129);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v60[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v60, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

    v27 = 0;
  }
  else
  {
LABEL_6:
    v26 = 0;
    v27 = 1;
  }

  v28 = v26;
  if ((v27 & 1) == 0)
    objc_storeStrong(v46 + 5, v26);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = objc_msgSend((id)v52[5], "count");
    v31 = v46[5];
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v30;
    v58 = 2112;
    v59 = v31;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "fetched, %lu, pinnedPlaces, error, %@", buf, 0x16u);
  }

  v32 = v46[5];
  if (v32)
  {
    v33 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v32);
  }
  else
  {
    v34 = (void *)v52[5];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke_10;
    v38[3] = &unk_1E929CC60;
    v40 = &v45;
    v35 = v5;
    v39 = v35;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v38);
    v36 = v46[5];
    if (v36)
    {
      v33 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v36);
    }
    else
    {
      v33 = v35;
    }

  }
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  return v33;
}

void __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __75__RTPlaceTypeClassifierExpertContacts__correctedMapItemsFromUserWithError___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!objc_msgSend(v5, "type"))
  {
LABEL_5:
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17 = 134218242;
      v18 = (id)(a3 + 1);
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "pinnedPlace %lu, %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "type") == 1 || objc_msgSend(v5, "type") == 2)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    goto LABEL_5;
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "pinnedPlace %@, has invalid type", (uint8_t *)&v17, 0xCu);
  }

  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0D18598];
  v21 = *MEMORY[0x1E0CB2D50];
  v22[0] = CFSTR("RTPinnedPlace type is invalid.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v10);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

LABEL_10:
}

- (id)_postalAddressMapItemsOfContact:(id)a3 error:(id *)a4
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  dispatch_semaphore_t v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  __int128 v59;
  id v60;
  void *v61;
  os_log_t log;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id obj;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  _QWORD v72[4];
  NSObject *v73;
  uint8_t *v74;
  uint64_t *v75;
  uint64_t v76;
  id *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint8_t v82[8];
  uint8_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE buf[12];
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  id v96;
  _BYTE v97[128];
  _QWORD v98[4];

  v98[1] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  if (v60)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    objc_msgSend(v60, "postalAddresses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    if (!v70)
      goto LABEL_48;
    v69 = *(_QWORD *)v89;
    v64 = *MEMORY[0x1E0D18598];
    v65 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)&v4 = 138412290;
    v59 = v4;
    while (1)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v89 != v69)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v5);
        *(_QWORD *)v82 = 0;
        v83 = v82;
        v84 = 0x3032000000;
        v85 = __Block_byref_object_copy__57;
        v86 = __Block_byref_object_dispose__57;
        v87 = 0;
        v76 = 0;
        v77 = (id *)&v76;
        v78 = 0x3032000000;
        v79 = __Block_byref_object_copy__57;
        v80 = __Block_byref_object_dispose__57;
        v81 = 0;
        objc_msgSend(v6, "mergedThoroughfare", v59);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length") == 0;

        if (v8)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            *(_QWORD *)&buf[4] = v6;
            v34 = v33;
            v35 = "skipping postalAddress due to missing street, %@";
            goto LABEL_46;
          }
LABEL_31:
          v54 = 7;
          goto LABEL_41;
        }
        if (!objc_msgSend(v6, "labelType"))
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            *(_QWORD *)&buf[4] = v6;
            v34 = v33;
            v35 = "skipping postalAddress with type other, %@";
LABEL_46:
            _os_log_debug_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_DEBUG, v35, buf, 0xCu);
          }
          goto LABEL_31;
        }
        v9 = dispatch_semaphore_create(0);
        v10 = objc_alloc(MEMORY[0x1E0D183F8]);
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (void *)objc_msgSend(v10, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v12);

        -[RTPlaceTypeClassifierExpertContacts mapServiceManager](self, "mapServiceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "geoDictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v72[0] = MEMORY[0x1E0C809B0];
        v72[1] = 3221225472;
        v72[2] = __77__RTPlaceTypeClassifierExpertContacts__postalAddressMapItemsOfContact_error___block_invoke;
        v72[3] = &unk_1E9296EE0;
        v74 = v82;
        v75 = &v76;
        v15 = v9;
        v73 = v15;
        objc_msgSend(v13, "fetchMapItemsFromAddressDictionary:options:handler:", v14, v71, v72);

        v16 = v15;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v16, v18))
          goto LABEL_16;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", v17);
        v21 = v20;
        v22 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_129);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v28 = (void *)MEMORY[0x1E0CB35C8];
        v98[0] = v65;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v98, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v64, 15, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = objc_retainAutorelease(v30);

          v32 = 0;
        }
        else
        {
LABEL_16:
          v31 = 0;
          v32 = 1;
        }

        v33 = v31;
        if ((v32 & 1) == 0)
          objc_storeStrong(v77 + 5, v31);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = objc_msgSend(*((id *)v83 + 5), "count");
          v38 = v77[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v6;
          v93 = 2048;
          v94 = v37;
          v95 = 2112;
          v96 = v38;
          _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "geocoded postalAddress, %@, mapItems, %lu, error, %@", buf, 0x20u);
        }

        objc_msgSend(*((id *)v83 + 5), "enumerateObjectsUsingBlock:", &__block_literal_global_42);
        v39 = v77[5];
        if (v39 && objc_msgSend(v39, "code") != -8)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v77[5]);
          v54 = 1;
        }
        else
        {
          if (objc_msgSend(*((id *)v83 + 5), "count"))
          {
            objc_msgSend(*((id *)v83 + 5), "firstObject");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "address");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "mergedThoroughfare");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "length") == 0;

            if (v43)
            {
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v59;
                *(_QWORD *)&buf[4] = v40;
                _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "skipping invalid mapItem, %@", buf, 0xCu);
              }

              v44 = v40;
            }
            else
            {
              objc_msgSend(v40, "appendSource:", 4);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              v45 = objc_alloc(MEMORY[0x1E0D183F0]);
              objc_msgSend(v44, "extendedAttributes");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "identifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v46;
              if (!v46)
              {
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v61;
              }
              objc_msgSend(v6, "contactsIdentifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "extendedAttributes");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "wifiConfidence");
              v51 = v50;
              objc_msgSend(v44, "extendedAttributes");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)objc_msgSend(v45, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v47, v48, 1, objc_msgSend(v52, "wifiFingerprintLabelType"), v51);
              objc_msgSend(v44, "setExtendedAttributes:", v53);

              if (!v46)
              -[NSObject addObject:](log, "addObject:", v44);
            }

          }
          v54 = 0;
        }

LABEL_41:
        _Block_object_dispose(&v76, 8);

        _Block_object_dispose(v82, 8);
        if (v54 != 7 && v54)
        {

          goto LABEL_52;
        }
        ++v5;
      }
      while (v70 != v5);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
      v70 = v56;
      if (!v56)
      {
LABEL_48:

        v57 = log;
        goto LABEL_53;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v82 = 0;
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contact", v82, 2u);
  }
LABEL_52:
  v57 = 0;

LABEL_53:
  return v57;
}

void __77__RTPlaceTypeClassifierExpertContacts__postalAddressMapItemsOfContact_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __77__RTPlaceTypeClassifierExpertContacts__postalAddressMapItemsOfContact_error___block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
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
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "postalAddress mapItem %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)classifyWithError:(id *)a3
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  dispatch_semaphore_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  dispatch_time_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  char v48;
  id v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  id v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  void *v61;
  _BOOL4 v62;
  double v63;
  dispatch_semaphore_t v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  dispatch_time_t v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  char v83;
  id v84;
  _BOOL4 v85;
  id v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t (**v110)(_QWORD, _QWORD);
  void *v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  RTLearnedPlace *v113;
  int v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i;
  void *v119;
  void *v120;
  int v121;
  id v122;
  uint64_t v123;
  NSObject *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  int v129;
  char v130;
  NSObject *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  RTLearnedPlace *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  NSObject *v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  void *v152;
  void *v153;
  id v154;
  id v156;
  uint64_t v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  void *v172;
  SEL aSelectora;
  id v175;
  id v176;
  id v177;
  id v178;
  void *v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  id obj;
  void *v196;
  void *v197;
  int v198;
  id v199;
  uint64_t (*v200)(uint64_t, uint64_t);
  void *v201;
  void *v202;
  void *v203;
  id v204;
  uint64_t (**v205)(_QWORD, _QWORD);
  void *context;
  void *contexta;
  uint64_t v208;
  id v209;
  uint64_t (*v211)(uint64_t, uint64_t);
  id v212;
  _QWORD v213[4];
  id v214;
  id v215;
  id v216;
  id v217;
  uint64_t (**v218)(_QWORD, _QWORD);
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _QWORD v223[4];
  id v224;
  id v225;
  id v226;
  uint64_t *v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[5];
  id v233;
  _BYTE *v234;
  uint64_t *v235;
  _QWORD *v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _QWORD v241[4];
  NSObject *v242;
  _BYTE *v243;
  uint64_t *v244;
  id v245;
  _QWORD v246[4];
  NSObject *v247;
  uint64_t *v248;
  uint64_t *v249;
  uint64_t v250;
  uint64_t *v251;
  uint64_t v252;
  uint64_t (*v253)(uint64_t, uint64_t);
  void (*v254)(uint64_t);
  id v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  uint64_t v264;
  id *v265;
  uint64_t v266;
  uint64_t (*v267)(uint64_t, uint64_t);
  void (*v268)(uint64_t);
  id v269;
  _QWORD v270[4];
  id v271;
  id v272;
  id v273;
  id v274;
  _BYTE v275[128];
  uint8_t v276[128];
  _BYTE v277[24];
  uint64_t (*v278)(uint64_t, uint64_t);
  __int128 v279;
  _QWORD v280[4];
  _BYTE v281[128];
  _BYTE v282[128];
  uint8_t v283[128];
  _BYTE buf[24];
  uint64_t (*v285)(uint64_t, uint64_t);
  void (*v286)(uint64_t);
  id v287;
  uint64_t v288;

  v288 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = (void *)MEMORY[0x1D8231EA8]();
  v274 = 0;
  -[RTPlaceTypeClassifierExpertContacts _meCardContactWithError:](self, "_meCardContactWithError:", &v274);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = (uint64_t (*)(uint64_t, uint64_t))v274;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v196;
    *(_WORD *)&buf[22] = 2112;
    v285 = v200;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, meCard, %@, error, %@", buf, 0x20u);

  }
  if (v200 || !v196)
  {
    v211 = v200;
    goto LABEL_160;
  }
  v273 = 0;
  -[RTPlaceTypeClassifierExpertContacts _postalAddressMapItemsOfContact:error:](self, "_postalAddressMapItemsOfContact:error:", v196, &v273);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v171 = v273;
  if (v171 || !objc_msgSend(obj, "count"))
  {
    v211 = (uint64_t (*)(uint64_t, uint64_t))v171;
    goto LABEL_159;
  }
  v272 = 0;
  -[RTPlaceTypeClassifierExpertContacts _correctedMapItemsFromUserWithError:](self, "_correctedMapItemsFromUserWithError:", &v272);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = v272;
  if (v158)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v156 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v156;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v158;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, failed to fetch  correctedMapItemsFromUser due to error, %@", buf, 0x16u);

    }
  }
  v270[0] = MEMORY[0x1E0C809B0];
  v270[1] = 3221225472;
  v270[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke;
  v270[3] = &unk_1E929CCD0;
  v271 = v196;
  v205 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D8232094](v270);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v285 = __Block_byref_object_copy__57;
  v286 = __Block_byref_object_dispose__57;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v287 = (id)objc_claimAutoreleasedReturnValue();
  v264 = 0;
  v265 = (id *)&v264;
  v266 = 0x3032000000;
  v267 = __Block_byref_object_copy__57;
  v268 = __Block_byref_object_dispose__57;
  v269 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v262 = 0u;
  v263 = 0u;
  v260 = 0u;
  v261 = 0u;
  obj = obj;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v283, 16);
  if (v6)
  {
    v180 = *MEMORY[0x1E0D18598];
    v182 = *MEMORY[0x1E0CB2D50];
    v184 = *(_QWORD *)v261;
LABEL_15:
    v7 = 0;
    v186 = v6;
    while (1)
    {
      if (*(_QWORD *)v261 != v184)
        objc_enumerationMutation(obj);
      v208 = v7;
      v8 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * v7);
      context = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ((uint64_t (**)(_QWORD, void *))v205)[2](v205, v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v258 = 0u;
      v259 = 0u;
      v256 = 0u;
      v257 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v256, v282, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v257;
LABEL_20:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v257 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * v14);
          if (objc_msgSend(v8, "isEqualToMapItem:", v15))
          {
            objc_msgSend(v8, "location");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "location");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToLocation:", v17);

            if ((v18 & 1) == 0)
              break;
          }
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v256, v282, 16);
            if (v12)
              goto LABEL_20;
            goto LABEL_27;
          }
        }
        objc_msgSend(v15, "location");
        v212 = (id)objc_claimAutoreleasedReturnValue();

        if (!v212)
          goto LABEL_30;
        v177 = objc_alloc(MEMORY[0x1E0D183E8]);
        objc_msgSend(v8, "identifier");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "category");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "address");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = (id)objc_msgSend(v8, "source");
        v19 = objc_msgSend(v8, "mapItemPlaceType");
        v20 = objc_msgSend(v8, "muid");
        v21 = objc_msgSend(v8, "resultProviderID");
        objc_msgSend(v8, "geoMapItemHandle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "creationDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "expirationDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "extendedAttributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "displayLanguage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v157) = objc_msgSend(v8, "disputed");
        v27 = objc_msgSend(v177, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v202, v197, v192, v189, v212, v175, v19, v20, v21, v22, v23, v24, v25, v26, v157);

        objc_msgSend(v172, "setObject:forKeyedSubscript:", &unk_1E9327F80, v27);
        v198 = 0;
      }
      else
      {
LABEL_27:

LABEL_30:
        v212 = 0;
        v27 = 0;
        v198 = 1;
      }
      v203 = (void *)v27;
      v28 = v27 ? (void *)v27 : v8;
      objc_msgSend(v191, "addObject:", v28);
      v250 = 0;
      v251 = &v250;
      v252 = 0x3032000000;
      v253 = __Block_byref_object_copy__57;
      v254 = __Block_byref_object_dispose__57;
      v255 = 0;
      v29 = dispatch_semaphore_create(0);
      -[RTPlaceTypeClassifierExpertContacts learnedLocationStore](self, "learnedLocationStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v246[0] = MEMORY[0x1E0C809B0];
      v246[1] = 3221225472;
      v246[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_27;
      v246[3] = &unk_1E9297478;
      v248 = &v250;
      v249 = &v264;
      v31 = v29;
      v247 = v31;
      objc_msgSend(v30, "fetchLocationOfInterestWithMapItem:handler:", v8, v246);

      v32 = v31;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v32, v34))
        goto LABEL_39;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", v33);
      v37 = v36;
      v38 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_129);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "filteredArrayUsingPredicate:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "submitToCoreAnalytics:type:duration:", v42, 1, v37);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v277 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v277, 2u);
      }

      v44 = (void *)MEMORY[0x1E0CB35C8];
      v280[0] = v182;
      *(_QWORD *)v277 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v277, v280, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", v180, 15, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v47 = objc_retainAutorelease(v46);

        v48 = 0;
      }
      else
      {
LABEL_39:
        v47 = 0;
        v48 = 1;
      }

      v49 = v47;
      if ((v48 & 1) == 0)
        objc_storeStrong(v265 + 5, v47);
      if (v265[5])
      {
        v50 = 4;
      }
      else
      {
        if (v251[5])
        {
          -[RTPlaceTypeClassifierExpertContacts distanceCalculator](self, "distanceCalculator");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v251[5], "location");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "location");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "location");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v245 = 0;
          objc_msgSend(v51, "distanceFromLocation:toLocation:error:", v53, v54, &v245);
          v56 = v55;
          v57 = v245;

          if (!v57 && v56 > 250.0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "addObject:", v251[5]);
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v59 = (id)objc_claimAutoreleasedReturnValue();
              v60 = v251[5];
              *(_DWORD *)v277 = 138413058;
              *(_QWORD *)&v277[4] = v59;
              *(_WORD *)&v277[12] = 2112;
              *(_QWORD *)&v277[14] = v60;
              *(_WORD *)&v277[22] = 2112;
              v278 = (uint64_t (*)(uint64_t, uint64_t))v8;
              LOWORD(v279) = 2048;
              *(double *)((char *)&v279 + 2) = v56;
              _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, picked locationOfInterest, %@, with same mapItem as postalAddressMapItem, %@, with distance, %lf", v277, 0x2Au);

            }
          }

        }
        objc_msgSend(v8, "location");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "referenceFrame") == 2;

        if (v62)
          v63 = 1400.0;
        else
          v63 = 400.0;
        v64 = dispatch_semaphore_create(0);

        -[RTPlaceTypeClassifierExpertContacts learnedLocationStore](self, "learnedLocationStore");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v212;
        if (v198)
        {
          objc_msgSend(v8, "location");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v169;
        }
        v241[0] = MEMORY[0x1E0C809B0];
        v241[1] = 3221225472;
        v241[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_29;
        v241[3] = &unk_1E9296EE0;
        v243 = buf;
        v244 = &v264;
        v67 = v64;
        v242 = v67;
        objc_msgSend(v65, "fetchLocationsOfInterestWithinDistance:location:handler:", v66, v241, v63);
        if (v198)

        v32 = v67;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v32, v69))
          goto LABEL_63;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "timeIntervalSinceDate:", v68);
        v72 = v71;
        v73 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_129);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "filteredArrayUsingPredicate:", v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "firstObject");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v73, "submitToCoreAnalytics:type:duration:", v77, 1, v72);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v277 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v277, 2u);
        }

        v79 = (void *)MEMORY[0x1E0CB35C8];
        v280[0] = v182;
        *(_QWORD *)v277 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v277, v280, 1);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "errorWithDomain:code:userInfo:", v180, 15, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {
          v82 = objc_retainAutorelease(v81);

          v83 = 0;
        }
        else
        {
LABEL_63:
          v83 = 1;
          v82 = v49;
        }

        v84 = v82;
        if ((v83 & 1) == 0)
          objc_storeStrong(v265 + 5, v82);
        v85 = v265[5] != 0;

        v50 = 4 * v85;
        v49 = v84;
      }

      _Block_object_dispose(&v250, 8);
      objc_autoreleasePoolPop(context);
      if (v50)
        break;
      v7 = v208 + 1;
      if (v208 + 1 == v186)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v283, 16);
        if (v6)
          goto LABEL_15;
        break;
      }
    }
  }

  v86 = v265[5];
  if (v86)
  {
    v211 = (uint64_t (*)(uint64_t, uint64_t))v86;
    goto LABEL_158;
  }
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "allObjects");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v191;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifierExpertContacts distanceCalculator](self, "distanceCalculator");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v250 = 0;
  v251 = &v250;
  v252 = 0x3032000000;
  v253 = __Block_byref_object_copy__57;
  v254 = __Block_byref_object_dispose__57;
  v255 = 0;
  v237 = 0u;
  v238 = 0u;
  v239 = 0u;
  v240 = 0u;
  obj = v88;
  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v237, v281, 16);
  if (!v89)
  {
    v211 = 0;
    goto LABEL_91;
  }
  v211 = 0;
  v90 = *(_QWORD *)v238;
  do
  {
    v91 = 0;
    do
    {
      if (*(_QWORD *)v238 != v90)
        objc_enumerationMutation(obj);
      v92 = *(_QWORD *)(*((_QWORD *)&v237 + 1) + 8 * v91);
      v280[0] = 0;
      v280[1] = v280;
      v280[2] = 0x2020000000;
      v280[3] = 0x7FF0000000000000;
      *(_QWORD *)v277 = 0;
      *(_QWORD *)&v277[8] = v277;
      *(_QWORD *)&v277[16] = 0x3032000000;
      v278 = __Block_byref_object_copy__57;
      *(_QWORD *)&v279 = __Block_byref_object_dispose__57;
      *((_QWORD *)&v279 + 1) = 0;
      v232[0] = MEMORY[0x1E0C809B0];
      v232[1] = 3221225472;
      v232[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2_30;
      v232[3] = &unk_1E929CCF8;
      v232[4] = v92;
      v234 = v277;
      v233 = v193;
      v235 = &v250;
      v236 = v280;
      objc_msgSend(v87, "enumerateObjectsUsingBlock:", v232);
      v93 = (void *)v251[5];
      if (v93)
      {
        v94 = v211;
        v211 = v93;
LABEL_83:

        goto LABEL_84;
      }
      v95 = *(void **)(*(_QWORD *)&v277[8] + 40);
      if (v95)
      {
        objc_msgSend(v95, "identifier");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "objectForKey:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v97 == 0;

        if (v98)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&v277[8] + 40), "identifier");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "setObject:forKey:", v99, v100);

        }
        objc_msgSend(*(id *)(*(_QWORD *)&v277[8] + 40), "identifier");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v190, "objectForKey:", v94);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "addObject:", v92);

        goto LABEL_83;
      }
      objc_msgSend(v159, "addObject:", v92);
LABEL_84:

      _Block_object_dispose(v277, 8);
      _Block_object_dispose(v280, 8);
      if (v93)
        goto LABEL_91;
      ++v91;
    }
    while (v89 != v91);
    v102 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v237, v281, 16);
    v89 = v102;
  }
  while (v102);
LABEL_91:

  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v176 = v87;
  v103 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v228, v276, 16);
  if (!v103)
    goto LABEL_155;
  v185 = *(_QWORD *)v229;
  while (2)
  {
    v104 = 0;
    v187 = v103;
    while (2)
    {
      if (*(_QWORD *)v229 != v185)
        objc_enumerationMutation(v176);
      objc_msgSend(*(id *)(*((_QWORD *)&v228 + 1) + 8 * v104), "place");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "mapItem");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "location");
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v105, "identifier");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "objectForKey:", v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v223[0] = MEMORY[0x1E0C809B0];
      v223[1] = 3221225472;
      v223[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_3;
      v223[3] = &unk_1E929CD20;
      v110 = v205;
      v226 = v110;
      v224 = v193;
      v204 = v107;
      v225 = v204;
      v227 = &v250;
      objc_msgSend(v109, "sortedArrayUsingComparator:", v223);
      contexta = (void *)objc_claimAutoreleasedReturnValue();

      v111 = (void *)v251[5];
      if (v111)
      {
        v112 = v111;

        v113 = 0;
        v114 = 10;
        v211 = v112;
        goto LABEL_151;
      }
      if (!objc_msgSend(contexta, "count"))
      {
        v113 = 0;
        goto LABEL_150;
      }
      objc_msgSend(contexta, "firstObject");
      v199 = (id)objc_claimAutoreleasedReturnValue();
      v221 = 0u;
      v222 = 0u;
      v219 = 0u;
      v220 = 0u;
      v115 = contexta;
      v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v219, v275, 16);
      if (v116)
      {
        v117 = *(_QWORD *)v220;
        while (2)
        {
          for (i = 0; i != v116; ++i)
          {
            if (*(_QWORD *)v220 != v117)
              objc_enumerationMutation(v115);
            v119 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * i);
            objc_msgSend(v105, "mapItem");
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = RTMapItemsAddressIdentifiersSame(v120, v119);

            if (v121)
            {
              v122 = v119;

              v199 = v122;
              goto LABEL_109;
            }
          }
          v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v219, v275, 16);
          if (v116)
            continue;
          break;
        }
      }
LABEL_109:

      aSelectora = (SEL)((uint64_t (**)(_QWORD, id))v205)[2](v110, v199);
      if (aSelectora)
      {
        v123 = 2;
        goto LABEL_117;
      }
      if ((objc_msgSend(v105, "typeSource") & 2) != 0)
      {
        v123 = 0;
LABEL_117:
        objc_msgSend(v172, "objectForKeyedSubscript:", v199);
        v125 = (void *)objc_claimAutoreleasedReturnValue();

        v126 = v123 | 4;
        if (!v125)
          v126 = v123;
        v162 = v126;
        objc_msgSend(v105, "mapItem");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v127, "validMUID") & 1) != 0)
        {
          objc_msgSend(v105, "mapItem");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v128, "isEqualToMapItem:", v199);

          if (v129)
          {
            objc_msgSend(v105, "mapItem");
            v209 = (id)objc_claimAutoreleasedReturnValue();
            v178 = v199;
            v130 = objc_msgSend(v178, "source");
LABEL_124:
            if ((v130 & 8) != 0
              || (objc_msgSend(v178, "source") & 4) != 0 && RTMapItemsAddressIdentifiersSame(v178, v209))
            {
              objc_msgSend(v199, "location");
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v131 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v277 = 138412546;
                *(_QWORD *)&v277[4] = v209;
                *(_WORD *)&v277[12] = 2112;
                *(_QWORD *)&v277[14] = v183;
                _os_log_impl(&dword_1D1A22000, v131, OS_LOG_TYPE_INFO, "applying corrected coordinate to mapItem, original mapItem, %@, corrected coordinates, %@", v277, 0x16u);
              }

            }
            else
            {
              v183 = 0;
            }
            if (v209 == v199)
            {
              v181 = 0;
            }
            else
            {
              objc_msgSend(v199, "extendedAttributes");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v165 = objc_alloc(MEMORY[0x1E0D183E8]);
            objc_msgSend(v209, "identifier");
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "name");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "category");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "address");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = v183;
            if (!v183)
            {
              objc_msgSend(v209, "location");
              v161 = (void *)objc_claimAutoreleasedReturnValue();
              v132 = v161;
            }
            v164 = v132;
            v163 = objc_msgSend(v209, "source");
            v133 = objc_msgSend(v209, "mapItemPlaceType");
            v134 = objc_msgSend(v209, "muid");
            v135 = objc_msgSend(v209, "resultProviderID");
            objc_msgSend(v209, "geoMapItemHandle");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "creationDate");
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "expirationDate");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = v181;
            if (!v181)
            {
              objc_msgSend(v209, "extendedAttributes");
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              v139 = v160;
            }
            objc_msgSend(v209, "displayLanguage");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v157) = objc_msgSend(v209, "disputed");
            v141 = (void *)objc_msgSend(v165, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v170, v168, v167, v166, v164, v163, v133, v134, v135, v136, v137, v138, v139, v140, v157);

            if (!v181)
            if (!v183)

            if (v141)
            {
              v142 = [RTLearnedPlace alloc];
              objc_msgSend(v105, "identifier");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "customLabel");
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "creationDate");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "expirationDate");
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v142, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v143, aSelectora, v162, v141, v144, v145, v146);

              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v147 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v277 = 138412546;
                *(_QWORD *)&v277[4] = v105;
                *(_WORD *)&v277[12] = 2112;
                *(_QWORD *)&v277[14] = v113;
                _os_log_impl(&dword_1D1A22000, v147, OS_LOG_TYPE_INFO, "disambiguated place using meCard, previous place, %@, updated place, %@", v277, 0x16u);
              }

              if (v113)
                objc_msgSend(v201, "addObject:", v113);
              v114 = 0;
            }
            else
            {
              v113 = 0;
              v114 = 11;
            }

            if (!v141)
              goto LABEL_151;
LABEL_150:
            v114 = 0;
            goto LABEL_151;
          }
        }
        else
        {

        }
        v209 = v199;
        objc_msgSend(v105, "mapItem");
        v178 = (id)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend(v178, "source");
        goto LABEL_124;
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v124 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v277 = 138412546;
        *(_QWORD *)&v277[4] = v199;
        *(_WORD *)&v277[12] = 2112;
        *(_QWORD *)&v277[14] = v105;
        _os_log_error_impl(&dword_1D1A22000, v124, OS_LOG_TYPE_ERROR, "unable to find the type for postalAddress mapItem, %@, associated to place, %@", v277, 0x16u);
      }

      v113 = 0;
      v114 = 11;
LABEL_151:

      if (v114 != 11 && v114)
        goto LABEL_155;
      if (++v104 != v187)
        continue;
      break;
    }
    v103 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v228, v276, 16);
    if (v103)
      continue;
    break;
  }
LABEL_155:

  if (objc_msgSend(v159, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "dateByAddingTimeInterval:", 4838400.0);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v213[0] = MEMORY[0x1E0C809B0];
    v213[1] = 3221225472;
    v213[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_35;
    v213[3] = &unk_1E929CD48;
    v214 = v172;
    v218 = v205;
    v150 = v148;
    v215 = v150;
    v151 = v149;
    v216 = v151;
    v217 = v201;
    objc_msgSend(v159, "enumerateObjectsUsingBlock:", v213);

  }
  _Block_object_dispose(&v250, 8);

LABEL_158:
  _Block_object_dispose(&v264, 8);

  _Block_object_dispose(buf, 8);
LABEL_159:

LABEL_160:
  objc_autoreleasePoolPop(v179);
  if (a3)
    *a3 = objc_retainAutorelease(v211);
  -[RTPlaceTypeClassifierExpertContacts placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "storeMetricsData:source:", v201, 2);

  if (objc_msgSend(v201, "count"))
    v153 = v201;
  else
    v153 = 0;
  v154 = v153;

  return v154;
}

uint64_t __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "postalAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2;
  v8[3] = &unk_1E929CCA8;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "extendedAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contactsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = v13;
  if (v9)
  {
    if (objc_msgSend(v13, "labelType") == 1)
    {
      v11 = 1;
    }
    else
    {
      if (objc_msgSend(v13, "labelType") != 2)
      {
        v12 = objc_msgSend(v13, "labelType") == 3;
        v10 = v13;
        if (!v12)
          goto LABEL_8;
        v11 = 3;
LABEL_7:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
LABEL_8:
        *a4 = 1;
        goto LABEL_9;
      }
      v11 = 2;
    }
    v10 = v13;
    goto LABEL_7;
  }
LABEL_9:

}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_27(uint64_t a1, void *a2, void *a3)
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

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObjectsFromArray:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_2_30(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  uint64_t v18;
  id obj;

  objc_msgSend(a2, "place");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToMapItem:", *(_QWORD *)(a1 + 32));

    if (v10)
      goto LABEL_3;
    v11 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    objc_msgSend(v11, "distanceFromLocation:toLocation:error:", v8, v12, &obj);
    v15 = v14;
    objc_storeStrong((id *)(v13 + 40), obj);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      goto LABEL_5;
    if (v15 > 250.0)
      goto LABEL_6;
    objc_msgSend(v6, "mapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = RTMapItemsAddressIdentifiersSame(v16, *(void **)(a1 + 32));

    if (v17)
    {
LABEL_3:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
LABEL_5:
      *a4 = 1;
      goto LABEL_6;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (v15 < *(double *)(v18 + 24))
    {
      *(double *)(v18 + 24) = v15;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v6);
    }
  }
LABEL_6:

}

uint64_t __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  id v23;
  id obj;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(a1[6] + 16))();
  v8 = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (v7 == v8)
    goto LABEL_2;
  if (v7 == 1)
    goto LABEL_12;
  if (v8 == 1)
    goto LABEL_14;
  if (v7 == 2)
    goto LABEL_12;
  if (v8 == 2)
    goto LABEL_14;
  if (v7 == 3)
  {
LABEL_12:
    v21 = -1;
    goto LABEL_15;
  }
  if (v8 == 3)
    goto LABEL_14;
  if (v7 == 4)
    goto LABEL_12;
  if (v8 == 4)
  {
LABEL_14:
    v21 = 1;
    goto LABEL_15;
  }
LABEL_2:
  v9 = (void *)a1[4];
  v10 = a1[5];
  objc_msgSend(v5, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v12 + 40);
  objc_msgSend(v9, "distanceFromLocation:toLocation:error:", v10, v11, &obj);
  v14 = v13;
  objc_storeStrong((id *)(v12 + 40), obj);

  v15 = (void *)a1[4];
  v16 = a1[5];
  objc_msgSend(v6, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1[7] + 8);
  v23 = *(id *)(v18 + 40);
  objc_msgSend(v15, "distanceFromLocation:toLocation:error:", v16, v17, &v23);
  v20 = v19;
  objc_storeStrong((id *)(v18 + 40), v23);

  if (v14 < v20)
    v21 = -1;
  else
    v21 = v14 > v20;
LABEL_15:

  return v21;
}

void __57__RTPlaceTypeClassifierExpertContacts_classifyWithError___block_invoke_35(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  RTLearnedPlace *v7;
  void *v8;
  RTLearnedPlace *v9;
  NSObject *v10;
  uint8_t buf[4];
  RTLearnedPlace *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = 6;
  else
    v6 = 2;
  v7 = [RTLearnedPlace alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v7, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v8, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))(), v6, v4, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "created a placeholder place for meCard postalAdress mapItem that was not associated to any existing place, %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  }

}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
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

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (void)setMapsSupportManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSupportManager, a3);
}

- (RTPlaceTypeClassifierMetricsCalculator)placeTypeClassifierMetricsCalculator
{
  return self->_placeTypeClassifierMetricsCalculator;
}

- (void)setPlaceTypeClassifierMetricsCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
}

@end
