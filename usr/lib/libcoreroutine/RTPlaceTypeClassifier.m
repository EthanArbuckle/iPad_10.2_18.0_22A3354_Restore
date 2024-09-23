@implementation RTPlaceTypeClassifier

- (RTPlaceTypeClassifier)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBiomeManager_contactsManager_defaultsManager_distanceCalculator_learnedLocationStore_locationManager_mapServiceManager_mapsSupportManager_placeTypeClassifierMetricsCalculator_platform_queue_visitManager_);
}

- (RTPlaceTypeClassifier)initWithBiomeManager:(id)a3 contactsManager:(id)a4 defaultsManager:(id)a5 distanceCalculator:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 mapsSupportManager:(id)a10 placeTypeClassifierMetricsCalculator:(id)a11 platform:(id)a12 queue:(id)a13 visitManager:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  RTPlaceTypeClassifier *v29;
  id *p_isa;
  RTPlaceTypeClassifier *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  objc_super v51;
  uint8_t buf[16];

  v50 = a3;
  v39 = a4;
  v19 = a4;
  v41 = a5;
  v49 = a5;
  v42 = a6;
  v45 = a6;
  v44 = a7;
  v40 = a8;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v46 = a12;
  v48 = a13;
  v24 = a14;
  if (!v50)
  {
    v43 = v24;
    v25 = v19;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: biomeManager", buf, 2u);
    }

    v31 = 0;
    v26 = v49;
    v28 = v44;
    v27 = v45;
    goto LABEL_42;
  }
  v25 = v19;
  if (v19)
  {
    v26 = v49;
    v28 = v44;
    v27 = v45;
    if (v49)
    {
      v43 = v24;
      if (v45)
      {
        if (v44)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v48)
                  {
                    if (v24)
                    {
                      v51.receiver = self;
                      v51.super_class = (Class)RTPlaceTypeClassifier;
                      v29 = -[RTPlaceTypeClassifier init](&v51, sel_init);
                      p_isa = (id *)&v29->super.isa;
                      if (v29)
                      {
                        objc_storeStrong((id *)&v29->_biomeManager, a3);
                        objc_storeStrong(p_isa + 2, v39);
                        objc_storeStrong(p_isa + 5, a7);
                        objc_storeStrong(p_isa + 6, v40);
                        objc_storeStrong(p_isa + 7, a9);
                        objc_storeStrong(p_isa + 8, a10);
                        objc_storeStrong(p_isa + 9, a11);
                        objc_storeStrong(p_isa + 10, a12);
                        objc_storeStrong(p_isa + 3, v41);
                        objc_storeStrong(p_isa + 4, v42);
                        objc_storeStrong(p_isa + 12, a13);
                        objc_storeStrong(p_isa + 11, a14);
                      }
                      v31 = p_isa;
                      self = v31;
                      goto LABEL_42;
                    }
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v36 = "Invalid parameter not satisfying: visitManager";
                      goto LABEL_40;
                    }
LABEL_41:

                    v31 = 0;
LABEL_42:
                    v33 = v43;
                    goto LABEL_43;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    goto LABEL_41;
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: queue";
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    goto LABEL_41;
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: placeTypeClassifierMetricsCalculator";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v35 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  goto LABEL_41;
                *(_WORD *)buf = 0;
                v36 = "Invalid parameter not satisfying: mapsSupportManager";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v35 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                goto LABEL_41;
              *(_WORD *)buf = 0;
              v36 = "Invalid parameter not satisfying: mapServiceManager";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v35 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              goto LABEL_41;
            *(_WORD *)buf = 0;
            v36 = "Invalid parameter not satisfying: locationManager";
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v35 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            goto LABEL_41;
          *(_WORD *)buf = 0;
          v36 = "Invalid parameter not satisfying: learnedLocationStore";
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v35 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          goto LABEL_41;
        *(_WORD *)buf = 0;
        v36 = "Invalid parameter not satisfying: distanceCalculator";
      }
LABEL_40:
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
      goto LABEL_41;
    }
    v33 = v24;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }
  }
  else
  {
    v33 = v24;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    v28 = v44;
    v27 = v45;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactsManager", buf, 2u);
    }
  }

  v31 = 0;
  v26 = v49;
LABEL_43:

  return v31;
}

- (BOOL)isRottedMeCard:(id)a3 inferredPlace:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  BOOL v15;
  dispatch_semaphore_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v50;
  id v51;
  _QWORD v52[4];
  NSObject *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  id *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  id v68;
  _BYTE buf[12];
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  _QWORD v78[4];

  v78[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v51 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3024000.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier distanceCalculator](self, "distanceCalculator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v7, "distanceFromLocation:toLocation:error:", v9, v11, &v68);
  v13 = v12;
  v14 = v68;

  v15 = 0;
  if (!v14 && v13 >= 1000.0)
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__106;
    v66 = __Block_byref_object_dispose__106;
    v67 = 0;
    v56 = 0;
    v57 = (id *)&v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__106;
    v60 = __Block_byref_object_dispose__106;
    v61 = 0;
    v16 = dispatch_semaphore_create(0);
    -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __54__RTPlaceTypeClassifier_isRottedMeCard_inferredPlace___block_invoke;
    v52[3] = &unk_1E9297478;
    v54 = &v62;
    v55 = &v56;
    v19 = v16;
    v53 = v19;
    objc_msgSend(v17, "fetchLocationOfInterestWithMapItem:handler:", v18, v52);

    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v20, v22))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v21);
    v25 = v24;
    v26 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filteredArrayUsingPredicate:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "submitToCoreAnalytics:type:duration:", v30, 1, v25);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v32 = (void *)MEMORY[0x1E0CB35C8];
    v78[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v78, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_retainAutorelease(v34);

      v36 = 0;
    }
    else
    {
LABEL_8:
      v35 = 0;
      v36 = 1;
    }

    v37 = v35;
    if ((v36 & 1) == 0)
      objc_storeStrong(v57 + 5, v35);
    objc_msgSend((id)v63[5], "lastObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "entryDate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      v41 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v41 = (id)objc_claimAutoreleasedReturnValue();
    }
    v42 = v41;

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend((id)v63[5], "count");
      objc_msgSend((id)v63[5], "lastObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v57[5];
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v44;
      v70 = 2048;
      v71 = v45;
      v72 = 2112;
      v73 = v46;
      v74 = 2112;
      v75 = v6;
      v76 = 2112;
      v77 = v47;
      _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "%@, fetched %lu visits, most recent visit, %@, for place, %@, error, %@", buf, 0x34u);

    }
    if (v57[5])
      v15 = 0;
    else
      v15 = objc_msgSend(v42, "compare:", v50) == -1;

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v62, 8);

  }
  return v15;
}

void __54__RTPlaceTypeClassifier_isRottedMeCard_inferredPlace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "visits");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getStoredPlacesWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
  uint64_t v8;
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
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v40;
  _QWORD v41[5];
  NSObject *v42;
  __int128 *v43;
  uint64_t *v44;
  SEL v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;
  uint8_t buf[8];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  v52 = 0u;
  v40 = objc_msgSend(&unk_1E932C8E0, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v40)
  {
    v37 = *(_QWORD *)v53;
    v35 = *MEMORY[0x1E0D18598];
    v36 = *MEMORY[0x1E0CB2D50];
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(&unk_1E932C8E0);
        v5 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v4);
        v6 = dispatch_semaphore_create(0);
        *(_QWORD *)&v56 = 0;
        *((_QWORD *)&v56 + 1) = &v56;
        v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__106;
        v59 = __Block_byref_object_dispose__106;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v46 = 0;
        v47 = (id *)&v46;
        v48 = 0x3032000000;
        v49 = __Block_byref_object_copy__106;
        v50 = __Block_byref_object_dispose__106;
        v51 = 0;
        -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v5, "unsignedIntegerValue");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke;
        v41[3] = &unk_1E9299490;
        v41[4] = self;
        v43 = &v56;
        v44 = &v46;
        v45 = a2;
        v9 = v6;
        v42 = v9;
        objc_msgSend(v7, "fetchLocationsOfInterestWithPlaceType:handler:", v8, v41);

        v10 = v9;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v10, v12))
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v11);
        v15 = v14;
        v16 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
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
        v62 = v36;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v62, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", v35, 15, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = objc_retainAutorelease(v24);

          v26 = 0;
        }
        else
        {
LABEL_11:
          v25 = 0;
          v26 = 1;
        }

        v27 = v25;
        if ((v26 & 1) == 0)
          objc_storeStrong(v47 + 5, v25);
        v28 = v47[5];
        if (v28)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v28);
        }
        else if (*(_QWORD *)(*((_QWORD *)&v56 + 1) + 40))
        {
          objc_msgSend(v34, "addObjectsFromArray:");
        }

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v56, 8);

        if (v28)
        {
          v32 = 0;
          v31 = v34;
          goto LABEL_26;
        }
        ++v4;
      }
      while (v40 != v4);
      v40 = objc_msgSend(&unk_1E932C8E0, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v40)
        continue;
      break;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_msgSend(v34, "count");
    LODWORD(v56) = 134217984;
    *(_QWORD *)((char *)&v56 + 4) = v30;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEFAULT, "%lu existing places with known type", (uint8_t *)&v56, 0xCu);
  }

  objc_msgSend(v34, "enumerateObjectsUsingBlock:", &__block_literal_global_82);
  v31 = v34;
  v32 = v34;
LABEL_26:

  return v32;
}

void __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[7];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2048;
    v22 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %lu learned location of interest from learned location store", buf, 0x20u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke_7;
  v16[3] = &unk_1E9299468;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 32);
  v16[5] = v12;
  v16[6] = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v16);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;
  v15 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2048;
    v17 = a3 + 1;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location of interest %lu, %@", (uint8_t *)&v12, 0x2Au);

  }
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v5, "place");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

void __50__RTPlaceTypeClassifier_getStoredPlacesWithError___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = a3 + 1;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "existing place %lu, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)donateInferredPlaces:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "typeSource") == 1)
        {
          if (objc_msgSend(v9, "type") == 1)
          {
            v10 = 1;
          }
          else if (objc_msgSend(v9, "type") == 2)
          {
            v10 = 2;
          }
          else if (objc_msgSend(v9, "type") == 3)
          {
            v10 = 3;
          }
          else
          {
            v10 = 0;
          }
          -[RTPlaceTypeClassifier contactsManager](self, "contactsManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __46__RTPlaceTypeClassifier_donateInferredPlaces___block_invoke;
          v13[3] = &unk_1E92A1888;
          v13[4] = v9;
          objc_msgSend(v11, "donateAddressFromMapItem:addressLabelType:handler:", v12, v10, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void __46__RTPlaceTypeClassifier_donateInferredPlaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v9;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "error, %@, while donating place, %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = *(void **)(a1 + 32);
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "successfully donated place, %@, postalAddress, %@", (uint8_t *)&v11, 0x16u);
  }

}

- (id)replaceBusinessMapItemWithReverseGeocodedMapItemForHome:(id)a3
{
  id v4;
  void *v5;
  char v6;
  dispatch_semaphore_t v7;
  RTLearnedLocationStore *learnedLocationStore;
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
  RTLearnedPlace *v28;
  id v29;
  NSObject *v30;
  void *v31;
  RTLearnedLocationStore *v32;
  NSObject *v33;
  NSObject *v34;
  dispatch_time_t v35;
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
  NSObject *v50;
  void *v51;
  void *v52;
  BOOL v53;
  NSObject *v54;
  id v55;
  objc_class *v56;
  void *v57;
  RTMapServiceManager *mapServiceManager;
  NSObject *v59;
  NSObject *v60;
  dispatch_time_t v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  char v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v86;
  void *v87;
  RTLearnedPlace *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _QWORD v95[4];
  NSObject *v96;
  _BYTE *v97;
  uint64_t *v98;
  _QWORD v99[4];
  NSObject *v100;
  _BYTE *v101;
  uint64_t *v102;
  _QWORD v103[4];
  NSObject *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  id *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  _BYTE v119[12];
  __int16 v120;
  id v121;
  __int16 v122;
  id v123;
  uint64_t v124;
  id *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  _BYTE buf[24];
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  uint64_t v134;
  id *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  _BYTE v140[24];
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  _QWORD v144[4];

  v144[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validMUID");

  if ((v6 & 1) != 0)
  {
    v113 = 0;
    v114 = &v113;
    v115 = 0x3032000000;
    v116 = __Block_byref_object_copy__106;
    v117 = __Block_byref_object_dispose__106;
    v118 = 0;
    v107 = 0;
    v108 = (id *)&v107;
    v109 = 0x3032000000;
    v110 = __Block_byref_object_copy__106;
    v111 = __Block_byref_object_dispose__106;
    v112 = 0;
    v7 = dispatch_semaphore_create(0);
    learnedLocationStore = self->_learnedLocationStore;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke;
    v103[3] = &unk_1E9298D70;
    v105 = &v113;
    v106 = &v107;
    v10 = v7;
    v104 = v10;
    -[RTLearnedLocationStore fetchLastVisitToPlaceWithIdentifier:handler:](learnedLocationStore, "fetchLastVisitToPlaceWithIdentifier:handler:", v9, v103);

    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
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
      *(_WORD *)v140 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v140, 2u);
    }

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v134 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v140 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, &v134, 1);
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
LABEL_8:
      v26 = 0;
      v27 = 1;
    }

    v29 = v26;
    if ((v27 & 1) == 0)
      objc_storeStrong(v108 + 5, v26);
    if (v108[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v75 = v108[5];
        *(_DWORD *)v140 = 138412546;
        *(_QWORD *)&v140[4] = v4;
        *(_WORD *)&v140[12] = 2112;
        *(_QWORD *)&v140[14] = v75;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Failed to look up last visit for place, %@, error, %@", v140, 0x16u);
      }

      v28 = (RTLearnedPlace *)v4;
    }
    else
    {
      objc_msgSend((id)v114[5], "location");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "location");
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)v140 = 0;
      *(_QWORD *)&v140[8] = v140;
      *(_QWORD *)&v140[16] = 0x3032000000;
      v141 = __Block_byref_object_copy__106;
      v142 = __Block_byref_object_dispose__106;
      v143 = 0;
      v134 = 0;
      v135 = (id *)&v134;
      v136 = 0x3032000000;
      v137 = __Block_byref_object_copy__106;
      v138 = __Block_byref_object_dispose__106;
      v139 = 0;
      v32 = self->_learnedLocationStore;
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_14;
      v99[3] = &unk_1E9296EE0;
      v101 = v140;
      v102 = &v134;
      v33 = v11;
      v100 = v33;
      -[RTLearnedLocationStore fetchPlacesWithinDistance:location:handler:](v32, "fetchPlacesWithinDistance:location:handler:", v94, v99, 250.0);
      v34 = v33;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v34, v35))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "timeIntervalSinceDate:", v92);
      v37 = v36;
      v38 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
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
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v44 = (void *)MEMORY[0x1E0CB35C8];
      v124 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v124, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        v47 = objc_retainAutorelease(v46);

        v48 = 0;
      }
      else
      {
LABEL_20:
        v48 = 1;
        v47 = v29;
      }

      v49 = v47;
      if ((v48 & 1) == 0)
        objc_storeStrong(v135 + 5, v47);
      if (v135[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v78 = v135[5];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v94;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v78;
          _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "Failed to look up for places nearby, %@, error, %@", buf, 0x16u);
        }

        v28 = (RTLearnedPlace *)v4;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_18);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)&v140[8] + 40), "filteredArrayUsingPredicate:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "count") == 0;

        if (v53)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v131 = __Block_byref_object_copy__106;
          v132 = __Block_byref_object_dispose__106;
          v133 = 0;
          v124 = 0;
          v125 = (id *)&v124;
          v126 = 0x3032000000;
          v127 = __Block_byref_object_copy__106;
          v128 = __Block_byref_object_dispose__106;
          v129 = 0;
          v55 = objc_alloc(MEMORY[0x1E0D183F8]);
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)objc_msgSend(v55, "initWithUseBackgroundTraits:analyticsIdentifier:", 1, v57);

          mapServiceManager = self->_mapServiceManager;
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_20;
          v95[3] = &unk_1E9296EE0;
          v97 = buf;
          v98 = &v124;
          v59 = v34;
          v96 = v59;
          -[RTMapServiceManager fetchMapItemsFromLocation:options:handler:](mapServiceManager, "fetchMapItemsFromLocation:options:handler:", v94, v93, v95);
          v60 = v59;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v60, v61))
            goto LABEL_36;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "timeIntervalSinceDate:", v90);
          v63 = v62;
          v64 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "filteredArrayUsingPredicate:", v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "firstObject");
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "submitToCoreAnalytics:type:duration:", v68, 1, v63);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v119 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v119, 2u);
          }

          v70 = (void *)MEMORY[0x1E0CB35C8];
          v144[0] = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)v119 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v144, 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72)
          {
            v73 = objc_retainAutorelease(v72);

            v74 = 0;
          }
          else
          {
LABEL_36:
            v74 = 1;
            v73 = v49;
          }

          v76 = v73;
          if ((v74 & 1) == 0)
            objc_storeStrong(v125 + 5, v73);
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && !v125[5])
          {
            v88 = [RTLearnedPlace alloc];
            objc_msgSend(v4, "identifier");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v79 = objc_msgSend(v4, "type");
            v80 = objc_msgSend(v4, "typeSource");
            v81 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            objc_msgSend(v4, "customLabel");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "creationDate");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "expirationDate");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v88, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v91, v79, v80, v81, v82, v83, v84);

          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              v86 = v108[5];
              *(_DWORD *)v119 = 138412802;
              *(_QWORD *)&v119[4] = v94;
              v120 = 2112;
              v121 = v4;
              v122 = 2112;
              v123 = v86;
              _os_log_error_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_ERROR, "Failed to reverse geocode last visit location, %@, for place, %@, error, %@", v119, 0x20u);
            }

            v28 = (RTLearnedPlace *)v4;
          }

          _Block_object_dispose(&v124, 8);
          _Block_object_dispose(buf, 8);

          v49 = v76;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v94;
            _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_INFO, "There exists another reverseGeocode LearnedPlace nearby this location %@", buf, 0xCu);
          }

          v28 = (RTLearnedPlace *)v4;
        }

      }
      _Block_object_dispose(&v134, 8);

      _Block_object_dispose(v140, 8);
      v29 = v49;
    }

    _Block_object_dispose(&v107, 8);
    _Block_object_dispose(&v113, 8);

  }
  else
  {
    v28 = (RTLearnedPlace *)v4;
  }

  return v28;
}

void __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_14(uint64_t a1, void *a2, void *a3)
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

uint64_t __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "source") & 1;

  return v3;
}

void __81__RTPlaceTypeClassifier_replaceBusinessMapItemWithReverseGeocodedMapItemForHome___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)coalescePlacesFromExperts:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  char *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  objc_class *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  objc_class *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  const char *v105;
  objc_class *v106;
  objc_class *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t m;
  void *v120;
  void *v121;
  NSObject *v122;
  void *v123;
  void *v124;
  objc_class *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t n;
  void *v132;
  void *v133;
  void *v135;
  void *obj;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  RTLearnedPlace *v141;
  void *v142;
  char *v143;
  id v144;
  id v145;
  void *v146;
  id v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  _BYTE v192[128];
  uint8_t v193[128];
  uint8_t buf[4];
  void *v195;
  __int16 v196;
  void *v197;
  __int16 v198;
  void *v199;
  __int16 v200;
  void *v201;
  __int16 v202;
  void *v203;
  __int16 v204;
  void *v205;
  __int16 v206;
  void *v207;
  _BYTE v208[128];
  _BYTE v209[128];
  _BYTE v210[128];
  _BYTE v211[128];
  _BYTE v212[128];
  _BYTE v213[128];
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v139 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v145 = (id)objc_opt_new();
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v3;
  objc_msgSend(v3, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v187, v213, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v188;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v188 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(v13, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v16);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v187, v213, 16);
    }
    while (v10);
  }

  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v183, v212, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v184;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v184 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * j);
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "setObject:forKeyedSubscript:", v24, v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v183, v212, 16);
    }
    while (v21);
  }

  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  objc_msgSend(v139, "allValues");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v211, 16);
  v142 = v4;
  v146 = v5;
  if (v140)
  {
    v138 = *(_QWORD *)v180;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v180 != v138)
          objc_enumerationMutation(obj);
        v143 = v26;
        v27 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)v26);
        v175 = 0u;
        v176 = 0u;
        v177 = 0u;
        v178 = 0u;
        objc_msgSend(v4, "allValues");
        v148 = (id)objc_claimAutoreleasedReturnValue();
        v152 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v175, v210, 16);
        if (!v152)
        {
          v28 = &unk_1E932D780;
          goto LABEL_43;
        }
        v150 = *(_QWORD *)v176;
        v28 = &unk_1E932D780;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v176 != v150)
              objc_enumerationMutation(v148);
            v30 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v29);
            objc_msgSend(v27, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "isEqual:", v32);

            v34 = &unk_1E9328A90;
            if ((v33 & 1) == 0)
            {
              v35 = (void *)MEMORY[0x1E0CB37E8];
              -[RTPlaceTypeClassifier distanceCalculator](self, "distanceCalculator");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "mapItem");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "location");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "mapItem");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "location");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "distanceFromLocation:toLocation:error:", v38, v40, 0);
              objc_msgSend(v35, "numberWithDouble:");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              v5 = v146;
            }
            objc_msgSend(v27, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v42 || (objc_msgSend(v28, "doubleValue"), v44 = v43, objc_msgSend(v34, "doubleValue"), v44 > v45))
            {

LABEL_32:
              v46 = v34;

              objc_msgSend(v27, "identifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, v41);
              v28 = v46;
LABEL_35:

              goto LABEL_36;
            }
            if (v28 != v34)
            {

              goto LABEL_35;
            }
            v47 = objc_msgSend(v27, "type");
            v48 = objc_msgSend(v30, "type");

            if (v47 == v48)
              goto LABEL_32;
LABEL_36:

            ++v29;
          }
          while (v152 != v29);
          v49 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v175, v210, 16);
          v152 = v49;
        }
        while (v49);
LABEL_43:

        v4 = v142;
        v26 = v143 + 1;
      }
      while (v143 + 1 != (char *)v140);
      v140 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v211, 16);
    }
    while (v140);
  }

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  objc_msgSend(v4, "allValues");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v171, v209, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v172;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v172 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * k);
        objc_msgSend(v55, "identifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setObject:forKeyedSubscript:", v55, v56);

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v171, v209, 16);
    }
    while (v52);
  }

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend(v139, "allValues");
  v144 = (id)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v167, v208, 16);
  if (v151)
  {
    v149 = *(id *)v168;
    do
    {
      v57 = 0;
      do
      {
        if (*(id *)v168 != v149)
          objc_enumerationMutation(v144);
        v58 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v57);
        objc_msgSend(v58, "identifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = (void *)MEMORY[0x1E0CB37E8];
        -[RTPlaceTypeClassifier distanceCalculator](self, "distanceCalculator");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "mapItem");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "location");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "mapItem");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "location");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "distanceFromLocation:toLocation:error:", v64, v66, 0);
        objc_msgSend(v61, "numberWithDouble:");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "doubleValue");
        if (v68 >= 250.0)
        {
          v153 = v67;
          v89 = v60;
          v165 = 0u;
          v166 = 0u;
          v163 = 0u;
          v164 = 0u;
          objc_msgSend(v4, "allValues");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v163, v193, 16);
          if (v91)
          {
            v92 = v91;
            v93 = *(_QWORD *)v164;
LABEL_64:
            v94 = 0;
            while (1)
            {
              if (*(_QWORD *)v164 != v93)
                objc_enumerationMutation(v90);
              v95 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v94);
              v96 = objc_msgSend(v95, "type");
              if (v96 == objc_msgSend(v58, "type")
                && !-[RTPlaceTypeClassifier isRottedMeCard:inferredPlace:](self, "isRottedMeCard:inferredPlace:", v95, v58))
              {
                break;
              }
              if (v92 == ++v94)
              {
                v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v163, v193, 16);
                if (v92)
                  goto LABEL_64;
                goto LABEL_71;
              }
            }

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v79 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              goto LABEL_76;
            v106 = (objc_class *)objc_opt_class();
            NSStringFromClass(v106);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = v79;
            +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v58, "type"));
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v58, "type"));
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v195 = v99;
            v196 = 2112;
            v197 = v100;
            v198 = 2112;
            v199 = v102;
            v200 = 2112;
            v201 = v103;
            v202 = 2112;
            v203 = v58;
            v104 = v101;
            v105 = "%@, %@, case 2.2, skipping inferred %@ because all meCard %@ are not rotten, %@";
LABEL_75:
            _os_log_impl(&dword_1D1A22000, v104, OS_LOG_TYPE_DEFAULT, v105, buf, 0x34u);

            v79 = v101;
          }
          else
          {
LABEL_71:

            objc_msgSend(v58, "identifier");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "setObject:forKeyedSubscript:", v58, v97);

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              v98 = (objc_class *)objc_opt_class();
              NSStringFromClass(v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = v79;
              +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v58, "type"));
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v58, "type"));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              v195 = v99;
              v196 = 2112;
              v197 = v100;
              v198 = 2112;
              v199 = v102;
              v200 = 2112;
              v201 = v103;
              v202 = 2112;
              v203 = v58;
              v104 = v101;
              v105 = "%@, %@, case 2.1, yielding inferred %@ since all meCard %@ are rotten, %@";
              goto LABEL_75;
            }
          }
LABEL_76:
          v5 = v146;
          v60 = v89;
LABEL_77:
          v67 = v153;
          goto LABEL_78;
        }
        v69 = objc_msgSend(v60, "type");
        if (v69 == objc_msgSend(v58, "type"))
        {
          v153 = v67;
          v141 = [RTLearnedPlace alloc];
          objc_msgSend(v60, "identifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v60, "type");
          v72 = objc_msgSend(v60, "typeSource");
          v73 = objc_msgSend(v58, "typeSource") | v72;
          objc_msgSend(v60, "mapItem");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "customLabel");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "creationDate");
          v76 = v60;
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "expirationDate");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v141, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v70, v71, v73, v74, v75, v77, v78);

          v60 = v76;
          -[NSObject identifier](v79, "identifier");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "setObject:forKeyedSubscript:", v79, v80);

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            v82 = (objc_class *)objc_opt_class();
            NSStringFromClass(v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v79;
            +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v76, "type"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v58, "type"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v153, "doubleValue");
            *(_DWORD *)buf = 138413826;
            v195 = v83;
            v196 = 2112;
            v197 = v84;
            v198 = 2112;
            v199 = v86;
            v200 = 2112;
            v201 = v87;
            v202 = 2048;
            v203 = v88;
            v204 = 2112;
            v205 = v76;
            v206 = 2112;
            v207 = v58;
            _os_log_impl(&dword_1D1A22000, v81, OS_LOG_TYPE_DEFAULT, "%@, %@, case 1.1, snapping inferred %@ to meCard %@ which are %f meters distance apart, meCard place, %@, inferred place, %@", buf, 0x48u);

            v79 = v85;
          }

          v4 = v142;
          v5 = v146;
          goto LABEL_77;
        }
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v79 = objc_claimAutoreleasedReturnValue();
        v5 = v146;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          v107 = (objc_class *)objc_opt_class();
          NSStringFromClass(v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v154 = v67;
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v79;
          +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v60, "type"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTLearnedPlace placeTypeToString:](RTLearnedPlace, "placeTypeToString:", objc_msgSend(v58, "type"));
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v154, "doubleValue");
          *(_DWORD *)buf = 138413826;
          v195 = v108;
          v196 = 2112;
          v197 = v109;
          v198 = 2112;
          v199 = v111;
          v200 = 2112;
          v201 = v112;
          v202 = 2048;
          v203 = v113;
          v204 = 2112;
          v205 = v60;
          v206 = 2112;
          v207 = v58;
          _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_DEFAULT, "%@, %@, case 1.2, skip snapping inferred %@ to meCard %@ which are at %f meters distance apart due to placeType mismatch, meCard place, %@, inferred place, %@", buf, 0x48u);

          v79 = v110;
          v67 = v154;

        }
LABEL_78:

        ++v57;
      }
      while (v57 != v151);
      v114 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v167, v208, 16);
      v151 = v114;
    }
    while (v114);
  }

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  objc_msgSend(v145, "allValues");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v159, v192, 16);
  if (v116)
  {
    v117 = v116;
    v118 = *(_QWORD *)v160;
    do
    {
      for (m = 0; m != v117; ++m)
      {
        if (*(_QWORD *)v160 != v118)
          objc_enumerationMutation(v115);
        v120 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * m);
        if (objc_msgSend(v120, "type") == 1 && objc_msgSend(v120, "typeSource") == 1)
        {
          -[RTPlaceTypeClassifier replaceBusinessMapItemWithReverseGeocodedMapItemForHome:](self, "replaceBusinessMapItemWithReverseGeocodedMapItemForHome:", v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v122 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v120, "identifier");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v195 = v123;
            v196 = 2112;
            v197 = v120;
            v198 = 2112;
            v199 = v121;
            _os_log_impl(&dword_1D1A22000, v122, OS_LOG_TYPE_INFO, "Replacing business map item with reverse geocoded map item for home loi, identifier, %@, original place, %@, updated place, %@,", buf, 0x20u);

          }
          objc_msgSend(v121, "identifier");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "setObject:forKeyedSubscript:", v121, v124);

        }
      }
      v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v159, v192, 16);
    }
    while (v117);
  }

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v125 = (objc_class *)objc_opt_class();
  NSStringFromClass(v125);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "objectForKey:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v155, v191, 16);
  if (v128)
  {
    v129 = v128;
    v130 = *(_QWORD *)v156;
    do
    {
      for (n = 0; n != v129; ++n)
      {
        if (*(_QWORD *)v156 != v130)
          objc_enumerationMutation(v127);
        v132 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * n);
        objc_msgSend(v132, "identifier");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setObject:forKeyedSubscript:", v132, v133);

      }
      v129 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v155, v191, 16);
    }
    while (v129);
  }

  return v145;
}

- (id)mergeExistingPlaces:(id)a3 intoUpdatedPlace:(id)a4 typesInMeCard:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  RTLearnedPlace *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  RTLearnedPlace *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    v46 = *(_QWORD *)v50;
    v43 = v7;
    do
    {
      v11 = 0;
      v47 = v9;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (RTLearnedPlace *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v12, "mapItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "source") & 4) != 0)
          {
            objc_msgSend(v17, "setExtendedAttributes:", 0);
            objc_msgSend(v12, "mapItem");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSource:", objc_msgSend(v26, "source") & 0xFFFFFFFFFFFFFFFBLL);

          }
          if ((objc_msgSend(v17, "source") & 8) != 0)
          {
            objc_msgSend(v12, "mapItem");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSource:", objc_msgSend(v27, "source") & 0xFFFFFFFFFFFFFFF7);

          }
          if ((objc_msgSend(v17, "source") & 0x20000) != 0)
          {
            objc_msgSend(v12, "mapItem");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setSource:", objc_msgSend(v28, "source") & 0xFFFFFFFFFFFDFFFFLL);

          }
          v29 = [RTLearnedPlace alloc];
          objc_msgSend(v12, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "customLabel");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "creationDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "expirationDate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v29, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v30, 0, 0, v17, v31, v32, v33);

          if (v14)
          {
            -[RTLearnedPlace identifier](v14, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v14, v34);

          }
LABEL_21:
          v10 = v46;
          v9 = v47;
LABEL_22:

          goto LABEL_23;
        }
        v15 = -[RTLearnedPlace type](v14, "type");
        if (v15 == objc_msgSend(v12, "type"))
        {
          v16 = -[RTLearnedPlace typeSource](v14, "typeSource");
          if (v16 == objc_msgSend(v12, "typeSource"))
          {
            -[RTLearnedPlace mapItem](v14, "mapItem");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "muid");
            objc_msgSend(v12, "mapItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18 != objc_msgSend(v19, "muid"))
            {

              goto LABEL_22;
            }
            -[RTLearnedPlace mapItem](v14, "mapItem");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "address");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "mapItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "address");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v20;
            if (!objc_msgSend(v20, "isEqualToAddress:", v22))
            {

              v7 = v43;
              goto LABEL_22;
            }
            -[RTLearnedPlace mapItem](v14, "mapItem");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "location");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "mapItem");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "location");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v23, "isEqualToLocation:", v25);

            if (v42)
            {
              objc_msgSend(v12, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v43;
              objc_msgSend(v43, "removeObjectForKey:", v17);
              goto LABEL_21;
            }
            v7 = v43;
            v10 = v46;
            v9 = v47;
          }
        }
LABEL_23:

        ++v11;
      }
      while (v9 != v11);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      v9 = v35;
    }
    while (v35);
  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    v54 = v37;
    _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "Finalized %lu places to be updated from merging the existing and coalesced places (from experts)", buf, 0xCu);
  }

  objc_msgSend(v7, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "enumerateObjectsUsingBlock:", &__block_literal_global_29);

  objc_msgSend(v7, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __76__RTPlaceTypeClassifier_mergeExistingPlaces_intoUpdatedPlace_typesInMeCard___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "finalized place, %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)getExperts
{
  void *v3;
  RTPlaceTypeClassifierExpertContacts *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RTPlaceTypeClassifierExpertContacts *v11;
  RTPlaceTypeClassifierExpertInferred *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RTPlaceTypeClassifierExpertInferred *v19;
  RTPlaceTypeClassifierExpertFallback *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  RTPlaceTypeClassifierExpertFallback *v26;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [RTPlaceTypeClassifierExpertContacts alloc];
  -[RTPlaceTypeClassifier contactsManager](self, "contactsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier distanceCalculator](self, "distanceCalculator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier mapServiceManager](self, "mapServiceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier mapsSupportManager](self, "mapsSupportManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[RTPlaceTypeClassifierExpertContacts initWithContactsManager:distanceCalculator:learnedLocationStore:mapServiceManager:mapsSupportManager:placeTypeClassifierMetricsCalculator:](v4, "initWithContactsManager:distanceCalculator:learnedLocationStore:mapServiceManager:mapsSupportManager:placeTypeClassifierMetricsCalculator:", v5, v6, v7, v8, v9, v10);

  objc_msgSend(v3, "addObject:", v11);
  v12 = [RTPlaceTypeClassifierExpertInferred alloc];
  -[RTPlaceTypeClassifier biomeManager](self, "biomeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier defaultsManager](self, "defaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier distanceCalculator](self, "distanceCalculator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier platform](self, "platform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[RTPlaceTypeClassifierExpertInferred initWithBiomeManager:defaultsManager:distanceCalculator:learnedLocationStore:placeTypeClassifierMetricsCalculator:platform:](v12, "initWithBiomeManager:defaultsManager:distanceCalculator:learnedLocationStore:placeTypeClassifierMetricsCalculator:platform:", v13, v14, v15, v16, v17, v18);

  objc_msgSend(v3, "addObject:", v19);
  v20 = [RTPlaceTypeClassifierExpertFallback alloc];
  -[RTPlaceTypeClassifier distanceCalculator](self, "distanceCalculator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier locationManager](self, "locationManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier mapServiceManager](self, "mapServiceManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier visitManager](self, "visitManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[RTPlaceTypeClassifierExpertFallback initWithDistanceCalculator:learnedLocationStore:locationManager:mapServiceManager:visitManager:](v20, "initWithDistanceCalculator:learnedLocationStore:locationManager:mapServiceManager:visitManager:", v21, v22, v23, v24, v25);

  objc_msgSend(v3, "addObject:", v26);
  return v3;
}

- (BOOL)updatePlaces:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
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
  id v31;
  dispatch_semaphore_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  dispatch_time_t v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  RTLearnedPlace *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  id v59;
  RTLearnedPlace *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  RTLearnedPlace *v80;
  void *v81;
  RTLearnedPlace *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  RTLearnedPlace *v97;
  void *v98;
  dispatch_semaphore_t v99;
  void *v100;
  void *v101;
  void *v102;
  dispatch_semaphore_t v103;
  id v104;
  dispatch_semaphore_t v105;
  void *v106;
  void *v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  dispatch_time_t v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  char v125;
  id v126;
  NSObject *v127;
  uint64_t v128;
  RTLearnedPlace *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  RTLearnedPlace *v137;
  RTLearnedLocationOfInterest *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  id v145;
  void *v146;
  RTLearnedPlace *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  NSObject *v154;
  RTLearnedLocationOfInterest *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  BOOL v160;
  dispatch_semaphore_t v161;
  void *v162;
  NSObject *v163;
  void *v164;
  dispatch_time_t v165;
  void *v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  NSObject *v174;
  void *v175;
  void *v176;
  void *v177;
  id v178;
  char v179;
  id v180;
  NSObject *v181;
  uint64_t v182;
  id v183;
  dispatch_semaphore_t v184;
  void *v185;
  NSObject *v186;
  void *v187;
  dispatch_time_t v188;
  void *v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  NSObject *v197;
  void *v198;
  void *v199;
  void *v200;
  id v201;
  char v202;
  id v203;
  NSObject *v204;
  uint64_t v205;
  uint64_t v206;
  dispatch_semaphore_t v207;
  void *v208;
  NSObject *v209;
  NSObject *v210;
  void *v211;
  dispatch_time_t v212;
  void *v213;
  double v214;
  double v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  NSObject *v221;
  void *v222;
  void *v223;
  void *v224;
  id v225;
  char v226;
  id v227;
  NSObject *v228;
  uint64_t v229;
  uint64_t v230;
  dispatch_semaphore_t v231;
  void *v232;
  NSObject *v233;
  NSObject *v234;
  void *v235;
  dispatch_time_t v236;
  void *v237;
  double v238;
  double v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  NSObject *v245;
  void *v246;
  void *v247;
  void *v248;
  id v249;
  char v250;
  id v251;
  NSObject *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  void *v256;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v262;
  void *v263;
  void *v264;
  NSObject *v265;
  id v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  void *v299;
  uint64_t v300;
  void *v301;
  uint64_t v302;
  void *v303;
  void *v304;
  void *v305;
  uint64_t v306;
  void *v307;
  void *v308;
  uint64_t v309;
  void *v310;
  void *v311;
  id v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  id obj;
  void *v348;
  uint64_t v349;
  void *v350;
  uint64_t v351;
  void *v352;
  void *v353;
  void *v354;
  uint64_t v355;
  id v356;
  void *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *context;
  id v362;
  RTLearnedLocation *v363;
  dispatch_semaphore_t v364;
  dispatch_semaphore_t v365;
  dispatch_semaphore_t v366;
  NSObject *v367;
  NSObject *dsema;
  NSObject *dsemaa;
  _QWORD v371[4];
  NSObject *v372;
  _BYTE *v373;
  _QWORD v374[4];
  NSObject *v375;
  _BYTE *v376;
  _QWORD v377[4];
  NSObject *v378;
  _BYTE *v379;
  _QWORD v380[4];
  NSObject *v381;
  uint64_t *v382;
  _QWORD v383[4];
  NSObject *v384;
  _BYTE *v385;
  _BYTE *v386;
  _QWORD v387[4];
  id v388;
  void *v389;
  NSObject *v390;
  _BYTE *v391;
  _QWORD v392[4];
  id v393;
  void *v394;
  NSObject *v395;
  uint64_t *v396;
  uint64_t v397;
  id *v398;
  uint64_t v399;
  uint64_t (*v400)(uint64_t, uint64_t);
  void (*v401)(uint64_t);
  id v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  _BYTE buf[12];
  __int16 v408;
  uint64_t v409;
  _BYTE v410[24];
  uint64_t (*v411)(uint64_t, uint64_t);
  void (*v412)(uint64_t);
  id v413;
  _BYTE v414[24];
  uint64_t (*v415)(uint64_t, uint64_t);
  void (*v416)(uint64_t);
  id v417;
  _BYTE v418[24];
  uint64_t (*v419)(uint64_t, uint64_t);
  void (*v420)(uint64_t);
  id v421;
  _BYTE v422[128];
  _QWORD v423[4];

  v423[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForObjectsFromCurrentDevice");
  v353 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForObjectsNotFromCurrentDevice");
  v352 = (void *)objc_claimAutoreleasedReturnValue();

  v405 = 0u;
  v406 = 0u;
  v403 = 0u;
  v404 = 0u;
  obj = v4;
  v355 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v403, v422, 16);
  if (v355)
  {
    v351 = *(_QWORD *)v404;
    v358 = *MEMORY[0x1E0D18598];
    v359 = *MEMORY[0x1E0CB2D50];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v404 != v351)
        {
          v8 = v7;
          objc_enumerationMutation(obj);
          v7 = v8;
        }
        v360 = v7;
        v9 = *(void **)(*((_QWORD *)&v403 + 1) + 8 * v7);
        context = (void *)MEMORY[0x1D8231EA8]();
        v397 = 0;
        v398 = (id *)&v397;
        v399 = 0x3032000000;
        v400 = __Block_byref_object_copy__106;
        v401 = __Block_byref_object_dispose__106;
        v402 = 0;
        v10 = dispatch_semaphore_create(0);
        -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mapItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v392[0] = MEMORY[0x1E0C809B0];
        v392[1] = 3221225472;
        v392[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke;
        v392[3] = &unk_1E92A18F0;
        v13 = v354;
        v396 = &v397;
        v393 = v13;
        v394 = v9;
        v14 = v10;
        v395 = v14;
        objc_msgSend(v11, "fetchPlaceWithMapItem:predicate:handler:", v12, v353, v392);

        v15 = v14;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v15, v17))
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", v16);
        v20 = v19;
        v21 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
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
          *(_WORD *)v418 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v418, 2u);
        }

        v27 = (void *)MEMORY[0x1E0CB35C8];
        *(_QWORD *)v414 = v359;
        *(_QWORD *)v418 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v418, v414, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", v358, 15, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = objc_retainAutorelease(v29);

        }
        else
        {
LABEL_11:
          v30 = 0;
        }

        v31 = v30;
        *(_QWORD *)v418 = 0;
        *(_QWORD *)&v418[8] = v418;
        *(_QWORD *)&v418[16] = 0x3032000000;
        v419 = __Block_byref_object_copy__106;
        v420 = __Block_byref_object_dispose__106;
        v421 = 0;
        v32 = dispatch_semaphore_create(0);

        -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mapItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v387[0] = MEMORY[0x1E0C809B0];
        v387[1] = 3221225472;
        v387[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_31;
        v387[3] = &unk_1E92A1918;
        v35 = v13;
        v391 = v418;
        v356 = v35;
        v388 = v35;
        v389 = v9;
        v36 = v32;
        v390 = v36;
        objc_msgSend(v33, "fetchPlacesWithMapItem:predicate:handler:", v34, v352, v387);

        dsema = v36;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = dispatch_time(0, 3600000000000);
        v39 = v31;
        if (dispatch_semaphore_wait(dsema, v38))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "timeIntervalSinceDate:", v37);
          v42 = v41;
          v43 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "firstObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "submitToCoreAnalytics:type:duration:", v47, 1, v42);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v414 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v414, 2u);
          }

          v49 = (void *)MEMORY[0x1E0CB35C8];
          *(_QWORD *)v410 = v359;
          *(_QWORD *)v414 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v414, v410, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", v358, 15, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = v31;
          if (v51)
          {
            v39 = objc_retainAutorelease(v51);

          }
        }

        v362 = v39;
        if (v398[5])
        {
          if (objc_msgSend(v9, "typeSource") == 8)
          {
            v52 = [RTLearnedPlace alloc];
            objc_msgSend(v9, "identifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "mapItem");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "customLabel");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "creationDate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "expirationDate");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v364 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v52, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v53, 0, 0, v54, v55, v56, v57);

            objc_msgSend(v348, "addObject:", v364);
            v58 = v398;
            v59 = v9;
            v60 = (RTLearnedPlace *)v58[5];
            v58[5] = v59;
            goto LABEL_34;
          }
          objc_msgSend(v9, "mapItem");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "address");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v398[5], "mapItem");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "address");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v84, "isEqualToAddress:", v86))
          {
            objc_msgSend(v9, "mapItem");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "location");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "location");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend(v88, "isEqualToLocation:", v90);

            if ((v91 & 1) != 0)
            {
              v364 = 0;
LABEL_28:
              if (objc_msgSend(v398[5], "type") || objc_msgSend(v398[5], "typeSource") || (v103 = v364) != 0)
              {
                v97 = [RTLearnedPlace alloc];
                objc_msgSend(v398[5], "identifier");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v364;
                if (!v364)
                {
                  objc_msgSend(v398[5], "mapItem");
                  v265 = objc_claimAutoreleasedReturnValue();
                  v99 = v265;
                }
                objc_msgSend(v398[5], "customLabel");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v398[5], "creationDate");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v398[5], "expirationDate");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v97, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v98, 0, 0, v99, v100, v101, v102);

                if (!v364)
                objc_msgSend(v348, "addObject:", v60);
                objc_storeStrong(v398 + 5, v60);
LABEL_34:

                v103 = v364;
              }

              goto LABEL_36;
            }
            v365 = (dispatch_semaphore_t)objc_alloc(MEMORY[0x1E0D183E8]);
            objc_msgSend(v398[5], "mapItem");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "identifier");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "name");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v350, "category");
            v319 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v346 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v346, "address");
            v316 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "mapItem");
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v343, "location");
            v313 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v340 = (void *)objc_claimAutoreleasedReturnValue();
            v302 = objc_msgSend(v340, "source");
            objc_msgSend(v398[5], "mapItem");
            v337 = (void *)objc_claimAutoreleasedReturnValue();
            v300 = objc_msgSend(v337, "mapItemPlaceType");
            objc_msgSend(v398[5], "mapItem");
            v334 = (void *)objc_claimAutoreleasedReturnValue();
            v298 = objc_msgSend(v334, "muid");
            objc_msgSend(v398[5], "mapItem");
            v331 = (void *)objc_claimAutoreleasedReturnValue();
            v296 = objc_msgSend(v331, "resultProviderID");
            objc_msgSend(v398[5], "mapItem");
            v328 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v328, "geoMapItemHandle");
            v307 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v325 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v325, "creationDate");
            v310 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v322 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v322, "expirationDate");
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "extendedAttributes");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "displayLanguage");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v398[5], "mapItem");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v258) = objc_msgSend(v96, "disputed");
            v364 = -[NSObject initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:](v365, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v84, v86, v319, v316, v313, v302, v300, v298, v296, v307, v310, v304, v93, v95, v258);

          }
          else
          {
            v364 = 0;
          }

          goto LABEL_28;
        }
        if (!objc_msgSend(*(id *)(*(_QWORD *)&v418[8] + 40), "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v364 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
          -[NSObject dateByAddingTimeInterval:](v364, "dateByAddingTimeInterval:", 4838400.0);
          v349 = objc_claimAutoreleasedReturnValue();
          v266 = objc_alloc(MEMORY[0x1E0D18330]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v344 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v344, "address");
          v341 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v341, "geoAddressData");
          v281 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v338, "address");
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v335, "subPremises");
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v332 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v332, "address");
          v329 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v329, "subThoroughfare");
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v326 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v326, "address");
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v323, "thoroughfare");
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v320, "address");
          v317 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v317, "subLocality");
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v314 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v314, "address");
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v311, "locality");
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v308 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v308, "address");
          v305 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v305, "subAdministrativeArea");
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v303 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v303, "address");
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v301, "administrativeArea");
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v299 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v299, "address");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v297, "administrativeAreaCode");
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v295, "address");
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v294, "postalCode");
          v276 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v293, "address");
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v292, "country");
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v291 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v291, "address");
          v290 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v290, "countryCode");
          v270 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v289, "address");
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v288, "inlandWater");
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v287, "address");
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v286, "ocean");
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v285 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v285, "address");
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v284, "areasOfInterest");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "address");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isIsland");
          objc_msgSend(v9, "mapItem");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "address");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "iso3166CountryCode");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "address");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "iso3166SubdivisionCode");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v260) = v63;
          v267 = (void *)objc_msgSend(v266, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v275, v281, v274, v280, v279, v278, v283, v273, v277, v272, v276, v271, v270, v269,
                           v268,
                           v282,
                           v260,
                           v364,
                           v349,
                           v66,
                           v69);

          v312 = objc_alloc(MEMORY[0x1E0D183E8]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v324 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v345 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v345, "name");
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v342 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v342, "category");
          v318 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v339 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "location");
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v336 = (void *)objc_claimAutoreleasedReturnValue();
          v309 = objc_msgSend(v336, "source");
          objc_msgSend(v9, "mapItem");
          v333 = (void *)objc_claimAutoreleasedReturnValue();
          v306 = objc_msgSend(v333, "mapItemPlaceType");
          objc_msgSend(v9, "mapItem");
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v330, "muid");
          objc_msgSend(v9, "mapItem");
          v327 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v327, "resultProviderID");
          objc_msgSend(v9, "mapItem");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "geoMapItemHandle");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "extendedAttributes");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "displayLanguage");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mapItem");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v259) = objc_msgSend(v78, "disputed");
          v79 = (void *)objc_msgSend(v312, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v324, v321, v318, v267, v315, v309, v306, v70, v71, v73, v364, v349, v75, v77, v259);

          v80 = [RTLearnedPlace alloc];
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v80, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v81, 0, 0, v79, 0, v364, v349);

          objc_msgSend(v263, "addObject:", v82);
          objc_storeStrong(v398 + 5, v82);

          v60 = (RTLearnedPlace *)v349;
          goto LABEL_34;
        }
LABEL_36:
        v104 = v398[5];
        if (v104)
        {
          v366 = (dispatch_semaphore_t)v104;
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)&v418[8] + 40), "firstObject");
          v366 = (dispatch_semaphore_t)(id)objc_claimAutoreleasedReturnValue();

        }
        *(_QWORD *)v414 = 0;
        *(_QWORD *)&v414[8] = v414;
        *(_QWORD *)&v414[16] = 0x3032000000;
        v415 = __Block_byref_object_copy__106;
        v416 = __Block_byref_object_dispose__106;
        v417 = 0;
        *(_QWORD *)v410 = 0;
        *(_QWORD *)&v410[8] = v410;
        *(_QWORD *)&v410[16] = 0x3032000000;
        v411 = __Block_byref_object_copy__106;
        v412 = __Block_byref_object_dispose__106;
        v413 = 0;
        v105 = dispatch_semaphore_create(0);
        -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v383[0] = MEMORY[0x1E0C809B0];
        v383[1] = 3221225472;
        v383[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_35;
        v383[3] = &unk_1E9297478;
        v385 = v410;
        v386 = v414;
        v108 = v105;
        v384 = v108;
        objc_msgSend(v106, "fetchLocationOfInterestWithIdentifier:handler:", v107, v383);

        v109 = v108;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v109, v111))
          goto LABEL_44;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "timeIntervalSinceDate:", v110);
        v114 = v113;
        v115 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "filteredArrayUsingPredicate:", v116);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "firstObject");
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v115, "submitToCoreAnalytics:type:duration:", v119, 1, v114);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v120, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v121 = (void *)MEMORY[0x1E0CB35C8];
        v423[0] = v359;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v423, 1);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "errorWithDomain:code:userInfo:", v358, 15, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        if (v123)
        {
          v124 = objc_retainAutorelease(v123);

          v125 = 0;
        }
        else
        {
LABEL_44:
          v125 = 1;
          v124 = v362;
        }

        v126 = v124;
        if ((v125 & 1) == 0)
          objc_storeStrong((id *)(*(_QWORD *)&v414[8] + 40), v124);
        if (*(_QWORD *)(*(_QWORD *)&v414[8] + 40))
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            v128 = *(_QWORD *)(*(_QWORD *)&v414[8] + 40);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v9;
            v408 = 2112;
            v409 = v128;
            _os_log_impl(&dword_1D1A22000, v127, OS_LOG_TYPE_INFO, "failed to fetch locationofInterest, %@, error, %@", buf, 0x16u);
          }

          objc_msgSend(v356, "addObject:", *(_QWORD *)(*(_QWORD *)&v414[8] + 40));
        }
        else
        {
          if (*(_QWORD *)(*(_QWORD *)&v410[8] + 40))
          {
            v129 = [RTLearnedPlace alloc];
            objc_msgSend(v9, "identifier");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = objc_msgSend(v9, "type");
            v132 = objc_msgSend(v9, "typeSource");
            -[NSObject mapItem](v366, "mapItem");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "customLabel");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "creationDate");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "expirationDate");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v129, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v130, v131, v132, v133, v134, v135, v136);

            v138 = [RTLearnedLocationOfInterest alloc];
            objc_msgSend(*(id *)(*(_QWORD *)&v410[8] + 40), "identifier");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v410[8] + 40), "location");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v410[8] + 40), "visits");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)&v410[8] + 40), "transitions");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v143 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v138, "initWithIdentifier:location:place:visits:transitions:", v139, v140, v137, v141, v142);
            v144 = *(void **)(*(_QWORD *)&v410[8] + 40);
            *(_QWORD *)(*(_QWORD *)&v410[8] + 40) = v143;

            if (*(_QWORD *)(*(_QWORD *)&v410[8] + 40))
              objc_msgSend(v264, "addObject:");
          }
          else
          {
            v145 = v398[5];
            if (v145)
              objc_msgSend(v145, "mapItem");
            else
              objc_msgSend(v9, "mapItem");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "location");
            v137 = (RTLearnedPlace *)(id)objc_claimAutoreleasedReturnValue();

            v363 = -[RTLearnedLocation initWithLocation:dataPointCount:confidence:]([RTLearnedLocation alloc], "initWithLocation:dataPointCount:confidence:", v137, 0, 0.0);
            if (v363)
            {
              v147 = [RTLearnedPlace alloc];
              -[NSObject identifier](v366, "identifier");
              v357 = (void *)objc_claimAutoreleasedReturnValue();
              v148 = objc_msgSend(v9, "type");
              v149 = objc_msgSend(v9, "typeSource");
              -[NSObject mapItem](v366, "mapItem");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject customLabel](v366, "customLabel");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject creationDate](v366, "creationDate");
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject expirationDate](v366, "expirationDate");
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              v154 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v147, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v357, v148, v149, v150, v151, v152, v153);

              v155 = [RTLearnedLocationOfInterest alloc];
              -[NSObject identifier](v154, "identifier");
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              v157 = -[RTLearnedLocationOfInterest initWithIdentifier:location:place:visits:transitions:](v155, "initWithIdentifier:location:place:visits:transitions:", v156, v363, v154, 0, 0);
              v158 = *(void **)(*(_QWORD *)&v410[8] + 40);
              *(_QWORD *)(*(_QWORD *)&v410[8] + 40) = v157;

              if (*(_QWORD *)(*(_QWORD *)&v410[8] + 40))
                objc_msgSend(v262, "addObject:");
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v154 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v9;
                v408 = 2048;
                v409 = 0;
                _os_log_error_impl(&dword_1D1A22000, v154, OS_LOG_TYPE_ERROR, "failed to create locationOfInterest for place, %@, with %lu visits", buf, 0x16u);
              }
            }

          }
        }

        _Block_object_dispose(v410, 8);
        _Block_object_dispose(v414, 8);

        _Block_object_dispose(v418, 8);
        _Block_object_dispose(&v397, 8);

        objc_autoreleasePoolPop(context);
        v7 = v360 + 1;
      }
      while (v355 != v360 + 1);
      v355 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v403, v422, 16);
    }
    while (v355);
  }

  if (objc_msgSend(v354, "count"))
  {
    if (a4)
    {
      _RTSafeArray();
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v160 = 0;
  }
  else
  {
    v397 = 0;
    v398 = (id *)&v397;
    v399 = 0x3032000000;
    v400 = __Block_byref_object_copy__106;
    v401 = __Block_byref_object_dispose__106;
    v402 = 0;
    v161 = dispatch_semaphore_create(0);
    -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v380[0] = MEMORY[0x1E0C809B0];
    v380[1] = 3221225472;
    v380[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_38;
    v380[3] = &unk_1E9297038;
    v382 = &v397;
    v163 = v161;
    v381 = v163;
    objc_msgSend(v162, "storePlaces:handler:", v263, v380);

    dsemaa = v163;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsemaa, v165))
      goto LABEL_78;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "timeIntervalSinceDate:", v164);
    v168 = v167;
    v169 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "filteredArrayUsingPredicate:", v170);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "firstObject");
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v169, "submitToCoreAnalytics:type:duration:", v173, 1, v168);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v174 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v174, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v418 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v174, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v418, 2u);
    }

    v175 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v414 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v418 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v418, v414, 1);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v176);
    v177 = (void *)objc_claimAutoreleasedReturnValue();

    if (v177)
    {
      v178 = objc_retainAutorelease(v177);

      v179 = 0;
    }
    else
    {
LABEL_78:
      v178 = 0;
      v179 = 1;
    }

    v180 = v178;
    if ((v179 & 1) == 0)
      objc_storeStrong(v398 + 5, v178);
    if (v398[5])
      objc_msgSend(v354, "addObject:");
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v181 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
    {
      v182 = objc_msgSend(v263, "count");
      v183 = v398[5];
      *(_DWORD *)v418 = 134218242;
      *(_QWORD *)&v418[4] = v182;
      *(_WORD *)&v418[12] = 2112;
      *(_QWORD *)&v418[14] = v183;
      _os_log_impl(&dword_1D1A22000, v181, OS_LOG_TYPE_INFO, "added %lu placeholder places for meCard postalAddress mapItems, error, %@", v418, 0x16u);
    }

    objc_msgSend(v263, "enumerateObjectsUsingBlock:", &__block_literal_global_41);
    *(_QWORD *)v418 = 0;
    *(_QWORD *)&v418[8] = v418;
    *(_QWORD *)&v418[16] = 0x3032000000;
    v419 = __Block_byref_object_copy__106;
    v420 = __Block_byref_object_dispose__106;
    v421 = 0;
    v184 = dispatch_semaphore_create(0);
    -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v377[0] = MEMORY[0x1E0C809B0];
    v377[1] = 3221225472;
    v377[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_42;
    v377[3] = &unk_1E9297038;
    v379 = v418;
    v186 = v184;
    v378 = v186;
    objc_msgSend(v185, "updatePlaces:handler:", v348, v377);

    v367 = v186;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v367, v188))
      goto LABEL_90;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "timeIntervalSinceDate:", v187);
    v191 = v190;
    v192 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "filteredArrayUsingPredicate:", v193);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "firstObject");
    v196 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v192, "submitToCoreAnalytics:type:duration:", v196, 1, v191);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v197 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v414 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v197, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v414, 2u);
    }

    v198 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)v410 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v414 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v414, v410, 1);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v199);
    v200 = (void *)objc_claimAutoreleasedReturnValue();

    if (v200)
    {
      v201 = objc_retainAutorelease(v200);

      v202 = 0;
    }
    else
    {
LABEL_90:
      v202 = 1;
      v201 = v180;
    }

    v203 = v201;
    if ((v202 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&v418[8] + 40), v201);
    if (*(_QWORD *)(*(_QWORD *)&v418[8] + 40))
      objc_msgSend(v354, "addObject:");
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v204 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
    {
      v205 = objc_msgSend(v348, "count");
      v206 = *(_QWORD *)(*(_QWORD *)&v418[8] + 40);
      *(_DWORD *)v414 = 134218242;
      *(_QWORD *)&v414[4] = v205;
      *(_WORD *)&v414[12] = 2112;
      *(_QWORD *)&v414[14] = v206;
      _os_log_impl(&dword_1D1A22000, v204, OS_LOG_TYPE_INFO, "updated %lu places, error, %@", v414, 0x16u);
    }

    objc_msgSend(v348, "enumerateObjectsUsingBlock:", &__block_literal_global_44);
    *(_QWORD *)v414 = 0;
    *(_QWORD *)&v414[8] = v414;
    *(_QWORD *)&v414[16] = 0x3032000000;
    v415 = __Block_byref_object_copy__106;
    v416 = __Block_byref_object_dispose__106;
    v417 = 0;
    v207 = dispatch_semaphore_create(0);
    -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    v374[0] = MEMORY[0x1E0C809B0];
    v374[1] = 3221225472;
    v374[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_45;
    v374[3] = &unk_1E9297038;
    v376 = v414;
    v209 = v207;
    v375 = v209;
    objc_msgSend(v208, "storeLocationsOfInterest:handler:", v262, v374);

    v210 = v209;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v210, v212))
      goto LABEL_102;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "timeIntervalSinceDate:", v211);
    v215 = v214;
    v216 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "filteredArrayUsingPredicate:", v217);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v219, "firstObject");
    v220 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v216, "submitToCoreAnalytics:type:duration:", v220, 1, v215);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v221 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v221, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v410 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v221, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v410, 2u);
    }

    v222 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v410 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v410, buf, 1);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v222, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();

    if (v224)
    {
      v225 = objc_retainAutorelease(v224);

      v226 = 0;
    }
    else
    {
LABEL_102:
      v226 = 1;
      v225 = v203;
    }

    v227 = v225;
    if ((v226 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&v414[8] + 40), v225);
    if (*(_QWORD *)(*(_QWORD *)&v414[8] + 40))
      objc_msgSend(v354, "addObject:");
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v228 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v228, OS_LOG_TYPE_INFO))
    {
      v229 = objc_msgSend(v262, "count");
      v230 = *(_QWORD *)(*(_QWORD *)&v414[8] + 40);
      *(_DWORD *)v410 = 134218242;
      *(_QWORD *)&v410[4] = v229;
      *(_WORD *)&v410[12] = 2112;
      *(_QWORD *)&v410[14] = v230;
      _os_log_impl(&dword_1D1A22000, v228, OS_LOG_TYPE_INFO, "added %lu placeholder locations of interests for meCard postalAddress mapItems, error, %@", v410, 0x16u);
    }

    objc_msgSend(v262, "enumerateObjectsUsingBlock:", &__block_literal_global_47);
    *(_QWORD *)v410 = 0;
    *(_QWORD *)&v410[8] = v410;
    *(_QWORD *)&v410[16] = 0x3032000000;
    v411 = __Block_byref_object_copy__106;
    v412 = __Block_byref_object_dispose__106;
    v413 = 0;
    v231 = dispatch_semaphore_create(0);
    -[RTPlaceTypeClassifier learnedLocationStore](self, "learnedLocationStore");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    v371[0] = MEMORY[0x1E0C809B0];
    v371[1] = 3221225472;
    v371[2] = __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_48;
    v371[3] = &unk_1E9297038;
    v373 = v410;
    v233 = v231;
    v372 = v233;
    objc_msgSend(v232, "updateLocationsOfInterest:handler:", v264, v371);

    v234 = v233;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v234, v236))
      goto LABEL_114;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "timeIntervalSinceDate:", v235);
    v239 = v238;
    v240 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_152_0);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "filteredArrayUsingPredicate:", v241);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "firstObject");
    v244 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v240, "submitToCoreAnalytics:type:duration:", v244, 1, v239);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v245 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v245, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v245, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v246 = (void *)MEMORY[0x1E0CB35C8];
    v423[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v423, 1);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v247);
    v248 = (void *)objc_claimAutoreleasedReturnValue();

    if (v248)
    {
      v249 = objc_retainAutorelease(v248);

      v250 = 0;
    }
    else
    {
LABEL_114:
      v250 = 1;
      v249 = v227;
    }

    v251 = v249;
    if ((v250 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&v410[8] + 40), v249);
    if (*(_QWORD *)(*(_QWORD *)&v410[8] + 40))
      objc_msgSend(v354, "addObject:");
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v252 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v252, OS_LOG_TYPE_INFO))
    {
      v253 = objc_msgSend(v264, "count");
      v254 = *(_QWORD *)(*(_QWORD *)&v410[8] + 40);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v253;
      v408 = 2112;
      v409 = v254;
      _os_log_impl(&dword_1D1A22000, v252, OS_LOG_TYPE_INFO, "updated %lu learnedLocationsOfInterest, error, %@", buf, 0x16u);
    }

    objc_msgSend(v264, "enumerateObjectsUsingBlock:", &__block_literal_global_50);
    v255 = objc_msgSend(v354, "count");
    v160 = v255 == 0;
    if (a4 && v255)
    {
      _RTSafeArray();
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(v410, 8);

    _Block_object_dispose(v414, 8);
    _Block_object_dispose(v418, 8);

    _Block_object_dispose(&v397, 8);
  }

  return v160;
}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "fetched place, %@, from current device with mapItem, %@, error, %@", (uint8_t *)&v10, 0x20u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v6, "count");
    objc_msgSend(*(id *)(a1 + 40), "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218498;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "fetched %lu places, from other devices with mapItem, %@, error, %@", (uint8_t *)&v11, 0x20u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_35(uint64_t a1, void *a2, void *a3)
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

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_38(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_40(uint64_t a1, void *a2, uint64_t a3)
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
    v7 = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stored place %lu : %@", (uint8_t *)&v6, 0x16u);
  }

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_42(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_43(uint64_t a1, void *a2, uint64_t a3)
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
    v7 = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "updated place %lu : %@", (uint8_t *)&v6, 0x16u);
  }

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_45(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_46(uint64_t a1, void *a2, uint64_t a3)
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
    v7 = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stored location of interest %lu : %@", (uint8_t *)&v6, 0x16u);
  }

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_48(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __44__RTPlaceTypeClassifier_updatePlaces_error___block_invoke_49(uint64_t a1, void *a2, uint64_t a3)
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
    v7 = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "updated location of interest %lu : %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)getClassificationsFromExperts:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  id *v35;
  id v36;
  void *v37;
  uint64_t v38;
  RTPlaceTypeClassifier *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v35 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = v5;
  v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v54;
    v36 = v7;
    v37 = v6;
    v39 = self;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v40)
        objc_enumerationMutation(v7);
      v9 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v8);
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_class();
      if (v12 == objc_opt_class())
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v13 = v6;
        v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v50;
          v38 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v50 != v26)
                objc_enumerationMutation(v13);
              v28 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v48 = 0u;
              objc_msgSend(v13, "objectForKeyedSubscript:", v28, v35);
              v23 = (id)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v46;
                while (2)
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v46 != v31)
                      objc_enumerationMutation(v23);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "type") == 1)
                    {
                      v7 = v36;
                      v6 = v37;
                      self = v39;
                      goto LABEL_35;
                    }
                  }
                  v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
                  if (v30)
                    continue;
                  break;
                }
              }

              self = v39;
              v26 = v38;
            }
            v25 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
            v7 = v36;
            v6 = v37;
          }
          while (v25);
        }

      }
      v44 = 0;
      objc_msgSend(v9, "classifyWithError:", &v44, v35);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v44;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 138412802;
        v58 = v11;
        v59 = 2048;
        v60 = v16;
        v61 = 2112;
        v62 = v14;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "expert, %@, classified places, %lu, error, %@", buf, 0x20u);
      }

      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __61__RTPlaceTypeClassifier_getClassificationsFromExperts_error___block_invoke;
      v42[3] = &unk_1E92A19E0;
      v17 = v11;
      v43 = v17;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v42);
      if (v14)
      {
        if (v35)
          *v35 = objc_retainAutorelease(v14);

        v33 = 0;
        goto LABEL_41;
      }
      v18 = objc_opt_class();
      if (v18 != objc_opt_class())
        goto LABEL_15;
      -[RTPlaceTypeClassifier platform](self, "platform");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "watchPlatform"))
      {
        -[RTPlaceTypeClassifier platform](self, "platform");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isTinkerPaired");

        if (!v21)
          goto LABEL_15;
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_52);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "filteredArrayUsingPredicate:", v19);
        v22 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v22;
      }

LABEL_15:
      if (objc_msgSend(v13, "count"))
        objc_msgSend(v6, "setObject:forKey:", v13, v17);
      v23 = v43;
LABEL_35:

      if (++v8 == v41)
      {
        v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
        if (v41)
          goto LABEL_3;
        break;
      }
    }
  }

  v33 = v6;
LABEL_41:

  return v33;
}

void __61__RTPlaceTypeClassifier_getClassificationsFromExperts_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3 + 1;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "expert, %@, classified place %lu, %@", (uint8_t *)&v8, 0x20u);
  }

}

BOOL __61__RTPlaceTypeClassifier_getClassificationsFromExperts_error___block_invoke_51(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") != 2;
}

- (BOOL)processExpertClassifications:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  const char *aSelector;
  id *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  RTPlaceTypeClassifier *v73;
  id v74[2];
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
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v92 = v10;
    v93 = 2112;
    v94 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "%@, %@, fetching stored places before classification", buf, 0x16u);

  }
  v87 = 0;
  -[RTPlaceTypeClassifier getStoredPlacesWithError:](self, "getStoredPlacesWithError:", &v87);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v87;
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
    aSelector = a2;
    v73 = self;
    -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](self, "placeTypeClassifierMetricsCalculator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v12;
    objc_msgSend(v16, "storeMetricsData:source:", v12, 3);

    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v84 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "type"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
      }
      while (v23);
    }
    v67 = a4;
    v70 = v21;

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v80 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "type"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(&unk_1E932C8F8, "containsObject:", v36);

          if (v37)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v35, "type"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "setObject:forKey:", &unk_1E9328AA8, v38);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      }
      while (v32);
    }

    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v43 = v41;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v76 != v46)
            objc_enumerationMutation(v43);
          v48 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v48, "type"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50
            && -[RTPlaceTypeClassifier isRottedMeCard:inferredPlace:](v73, "isRottedMeCard:inferredPlace:", v48, v50))
          {
            objc_msgSend(v42, "addObject:", v48);
          }

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
      }
      while (v45);
    }

    -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](v73, "placeTypeClassifierMetricsCalculator");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "storeMetricsData:source:", v42, 10);

    -[RTPlaceTypeClassifier coalescePlacesFromExperts:](v73, "coalescePlacesFromExperts:", v7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allValues");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceTypeClassifier donateInferredPlaces:](v73, "donateInferredPlaces:", v53);

    -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](v73, "placeTypeClassifierMetricsCalculator");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allValues");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "storeMetricsData:source:", v55, 1);

    v12 = v71;
    -[RTPlaceTypeClassifier mergeExistingPlaces:intoUpdatedPlace:typesInMeCard:](v73, "mergeExistingPlaces:intoUpdatedPlace:typesInMeCard:", v71, v52, v72);
    v74[1] = 0;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[RTPlaceTypeClassifier updatePlaces:error:](v73, "updatePlaces:error:");
    v56 = 0;
    if (v15)
    {
      v68 = v56;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = (objc_class *)objc_opt_class();
        NSStringFromClass(v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v92 = v59;
        v93 = 2112;
        v94 = v60;
        _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_DEFAULT, "%@, %@, fetching stored places after classification", buf, 0x16u);

      }
      v74[0] = 0;
      -[RTPlaceTypeClassifier getStoredPlacesWithError:](v73, "getStoredPlacesWithError:", v74);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v74[0];
      -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](v73, "placeTypeClassifierMetricsCalculator");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "storeMetricsData:source:", v61, 14);

      -[RTPlaceTypeClassifier placeTypeClassifierMetricsCalculator](v73, "placeTypeClassifierMetricsCalculator");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "submitMetrics");

      v12 = v71;
      v56 = v68;
    }
    else if (v67)
    {
      v64 = v56;
      v14 = 0;
      *v67 = objc_retainAutorelease(v56);
      v56 = v64;
    }
    else
    {
      v14 = 0;
    }

  }
  return v15;
}

- (BOOL)classifyWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v11;
  id v12;

  -[RTPlaceTypeClassifier getExperts](self, "getExperts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[RTPlaceTypeClassifier getClassificationsFromExperts:error:](self, "getClassificationsFromExperts:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v7)
  {
    if (!a3)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = objc_retainAutorelease(v7);
    goto LABEL_6;
  }
  v11 = 0;
  -[RTPlaceTypeClassifier processExpertClassifications:error:](self, "processExpertClassifications:error:", v6, &v11);
  v9 = v11 == 0;
  if (a3 && v11)
  {
LABEL_6:
    v9 = 0;
    *a3 = v7;
  }
LABEL_8:

  return v9;
}

- (RTBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (void)setBiomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManager, a3);
}

- (RTContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_contactsManager, a3);
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

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
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

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeTypeClassifierMetricsCalculator, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
}

@end
