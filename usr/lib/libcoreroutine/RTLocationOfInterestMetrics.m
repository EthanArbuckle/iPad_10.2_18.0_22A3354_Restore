@implementation RTLocationOfInterestMetrics

- (RTLocationOfInterestMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedLocationStore_locationStore_);
}

- (RTLocationOfInterestMetrics)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 locationStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTLocationOfInterestMetrics *v15;
  id *p_isa;
  RTLocationOfInterestMetrics *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: defaultsManager";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_14;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_13;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_13;
    }
LABEL_14:

    v17 = 0;
    goto LABEL_15;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTLocationOfInterestMetrics;
  v15 = -[RTLocationOfInterestMetrics init](&v21, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_defaultsManager, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }
  self = p_isa;
  v17 = self;
LABEL_15:

  return v17;
}

- (BOOL)collectMetricsWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  RTLearnedLocationStore *learnedLocationStore;
  NSObject *v12;
  id v13;
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
  uint64_t v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  NSObject *v38;
  id v39;
  uint64_t v40;
  void *v42;
  uint64_t v43;
  const char *aSelector;
  RTStoredLocationOfInterestEnumerationOptions *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  NSObject *v53;
  id v54;
  RTLocationOfInterestMetrics *v55;
  __int128 *p_buf;
  _QWORD *v57;
  _QWORD v58[3];
  int v59;
  _BYTE v60[128];
  _BYTE v61[12];
  __int16 v62;
  uint64_t v63;
  __int128 buf;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[4];

  aSelector = a2;
  v69[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(aSelector);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, collecting LOI metrics", (uint8_t *)&buf, 0xCu);

  }
  v6 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3628800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  v46 = -[RTStoredLocationOfInterestEnumerationOptions initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:]([RTStoredLocationOfInterestEnumerationOptions alloc], "initWithAscendingVisitEntryDate:batchSize:dateInterval:singleVisit:", 1, 5, v47, 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__14;
  v67 = __Block_byref_object_dispose__14;
  v68 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = 0;
  learnedLocationStore = self->_learnedLocationStore;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __55__RTLocationOfInterestMetrics_collectMetricsWithError___block_invoke;
  v52[3] = &unk_1E92987F8;
  p_buf = &buf;
  v12 = v10;
  v53 = v12;
  v57 = v58;
  v13 = v9;
  v54 = v13;
  v55 = self;
  -[RTLearnedLocationStore enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:](learnedLocationStore, "enumerateStoredLocationsOfInterestWithOptions:enumerationBlock:", v46, v52);
  v14 = v12;
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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_10);
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
    *(_WORD *)v61 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v61, 2u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v69[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v61 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v69, 1);
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
    objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v29);
  v32 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v32)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v61 = 138412546;
      *(_QWORD *)&v61[4] = v42;
      v62 = 2112;
      v63 = v43;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, error, %@", v61, 0x16u);

    }
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }
  else
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v34 = v13;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v49 != v36)
            objc_enumerationMutation(v34);
          -[RTLocationOfInterestMetrics _submitMetric:](self, "_submitMetric:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), aSelector);
        }
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      }
      while (v35);
    }

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(aSelector);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v34, "count");
      *(_DWORD *)v61 = 138412546;
      *(_QWORD *)&v61[4] = v39;
      v62 = 2048;
      v63 = v40;
      _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, submitted %lu LOI metrics", v61, 0x16u);

    }
    -[RTDefaultsManager setObject:forKey:](self->_defaultsManager, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("RTDefaultsLearnedLocationEngineLocationOfInterestMetricsSubmitted"));
  }

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&buf, 8);

  return v32 == 0;
}

void __55__RTLocationOfInterestMetrics_collectMetricsWithError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  signed int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) && objc_msgSend(v7, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v10)
      goto LABEL_18;
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (1)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count", (_QWORD)v18) > 9)
        {
          v16 = RTCommonRandomInt();
          if (v16 > 9)
            goto LABEL_16;
          v17 = v16;
          objc_msgSend(*(id *)(a1 + 48), "_metricForLocationOfInterest:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", v17, v15);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 48), "_metricForLocationOfInterest:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
        }

LABEL_16:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v11)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
  }
  *a4 = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_19:

}

- (int)_signalEnvironmentTypeForLocationOfInterest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  void *v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  RTLocationStore *locationStore;
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
  NSObject *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  id v49;
  NSObject *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v65;
  NSObject *v66;
  _QWORD v67[4];
  id v68;
  _QWORD *v69;
  _BYTE *v70;
  SEL v71;
  _QWORD v72[4];
  id v73;
  NSObject *v74;
  uint64_t *v75;
  _QWORD *v76;
  uint8_t *v77;
  uint64_t *v78;
  uint64_t v79;
  id *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t v85[8];
  uint8_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[4];
  _BYTE v96[12];
  __int16 v97;
  void *v98;
  __int16 v99;
  uint64_t v100;
  _BYTE buf[24];
  int v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  if (v57)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v61 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v61, v60);
    v3 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v57, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latitude");
    v7 = v6;
    objc_msgSend(v57, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    v11 = CLLocationCoordinate2DMake(v7, v10);
    objc_msgSend(v57, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)objc_msgSend(v3, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v14, v11.latitude, v11.longitude, 0.0, 250.0, -1.0);

    v62 = (void *)objc_opt_new();
    v95[0] = 0;
    v95[1] = v95;
    v95[2] = 0x2020000000;
    v95[3] = 0;
    v91 = 0;
    v92 = &v91;
    v93 = 0x2020000000;
    v94 = 0;
    *(_QWORD *)v85 = 0;
    v86 = v85;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__14;
    v89 = __Block_byref_object_dispose__14;
    v90 = 0;
    v79 = 0;
    v80 = (id *)&v79;
    v81 = 0x3032000000;
    v82 = __Block_byref_object_copy__14;
    v83 = __Block_byref_object_dispose__14;
    v84 = 0;
    v58 = *MEMORY[0x1E0D18598];
    v59 = *MEMORY[0x1E0CB2D50];
    do
    {
      v15 = (void *)MEMORY[0x1D8231EA8]();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v66, 200, v65, 200.0);
      v17 = dispatch_semaphore_create(0);
      locationStore = self->_locationStore;
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke;
      v72[3] = &unk_1E9298820;
      v75 = &v91;
      v63 = v62;
      v73 = v63;
      v76 = v95;
      v77 = v85;
      v78 = &v79;
      v19 = v17;
      v74 = v19;
      -[RTLocationStore fetchStoredLocationsWithOptions:handler:](locationStore, "fetchStoredLocationsWithOptions:handler:", v16, v72);
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
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_10);
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
      *(_QWORD *)v96 = v59;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v96, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v58, 15, v33);
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
        objc_storeStrong(v80 + 5, v35);
      if (v80[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v80[5];
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v43;
          _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v39 = 1;
      }
      else
      {
        objc_msgSend(*((id *)v86 + 5), "dateByAddingTimeInterval:", 1.0);
        v40 = objc_claimAutoreleasedReturnValue();

        -[NSObject endDate](v66, "endDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v92[3] && !objc_msgSend(v41, "isBeforeDate:", v40))
        {
          v39 = 0;
          v38 = v66;
          v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v40, v41);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v44;
            _os_log_debug_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_DEBUG, "%@, no more locations to fetch.", buf, 0xCu);

          }
          v39 = 6;
        }
        v60 = v41;
        v61 = v40;
      }

      objc_autoreleasePoolPop(v15);
    }
    while (!v39);
    if (v39 == 6)
    {
      if (!v80[5])
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v102 = 0;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke_22;
        v67[3] = &unk_1E9298848;
        v71 = a2;
        v49 = v57;
        v68 = v49;
        v69 = v95;
        v70 = buf;
        objc_msgSend(v63, "enumerateKeysAndObjectsUsingBlock:", v67);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v51 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "identifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(unsigned int *)(*(_QWORD *)&buf[8] + 24);
          *(_DWORD *)v96 = 138412802;
          *(_QWORD *)&v96[4] = v51;
          v97 = 2112;
          v98 = v52;
          v99 = 2048;
          v100 = v53;
          _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%@, LOI identifier, %@, selected signal environment type, %lu", v96, 0x20u);

        }
        v46 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);

        _Block_object_dispose(buf, 8);
        goto LABEL_29;
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v80[5];
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v55;
        _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
    }
    v46 = 0;
LABEL_29:
    _Block_object_dispose(&v79, 8);

    _Block_object_dispose(v85, 8);
    _Block_object_dispose(&v91, 8);
    _Block_object_dispose(v95, 8);

    v47 = v61;
    goto LABEL_33;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v85 = 0;
    _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", v85, 2u);
  }
  v46 = 0;
LABEL_33:

  return v46;
}

void __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v33 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "count");
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v35 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v35)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "signalEnvironmentType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = (void *)MEMORY[0x1E0CB37E8];
        if (v12)
        {
          v14 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "signalEnvironmentType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "numberWithInt:", objc_msgSend(v16, "unsignedIntValue") + 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "signalEnvironmentType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "signalEnvironmentType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, v16);
        }

        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v22 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "signalEnvironmentType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "unsignedIntValue");

        v26 = v25;
        if (v21 > v25)
          v26 = v21;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v26;
        objc_msgSend(v9, "timestamp");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v29 = *(void **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = v27;

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
  }

  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v33;
  v32 = v33;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __75__RTLocationOfInterestMetrics__signalEnvironmentTypeForLocationOfInterest___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v5, "unsignedIntValue");
    v16 = 2048;
    v17 = objc_msgSend(v6, "unsignedIntValue");
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, locationOfInterest identifier, %@, signal environment type, %lu, count, %lu", (uint8_t *)&v10, 0x2Au);

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == objc_msgSend(v6, "unsignedIntValue"))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "unsignedIntValue");

}

- (id)_countNearbyLocationsOfInterestForLocationOfInterest:(id)a3 outError:(id *)a4
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  RTLearnedLocationStore *learnedLocationStore;
  void *v10;
  void *v11;
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
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  RTDistanceCalculator *distanceCalculator;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v57;
  SEL aSelector;
  const char *aSelectora;
  id v60;
  id v61;
  NSObject *dsema;
  void *v63;
  id obja;
  id v67;
  _QWORD v68[4];
  id v69;
  const char *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[4];
  NSObject *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t v80;
  id *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint8_t buf[24];
  _BYTE v93[128];
  uint64_t v94;
  const __CFString *v95;
  _QWORD v96[3];

  aSelector = a2;
  v96[1] = *MEMORY[0x1E0C80C00];
  v67 = a3;
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", &unk_1E932CD20, &unk_1E932CD30, &unk_1E932CD40);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v63, "count"));
  if (objc_msgSend(v63, "count"))
  {
    v5 = 0;
    do
      objc_msgSend(v4, "setObject:atIndexedSubscript:", &unk_1E9326960, v5++, aSelector);
    while (v5 < objc_msgSend(v63, "count"));
  }
  objc_msgSend(v67, "location", aSelector);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = __Block_byref_object_copy__14;
    v90 = __Block_byref_object_dispose__14;
    v91 = (id)objc_opt_new();
    v80 = 0;
    v81 = (id *)&v80;
    v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__14;
    v84 = __Block_byref_object_dispose__14;
    v85 = 0;
    learnedLocationStore = self->_learnedLocationStore;
    objc_msgSend(v67, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke;
    v76[3] = &unk_1E9296EE0;
    v78 = &v80;
    v79 = &v86;
    v12 = v8;
    v77 = v12;
    -[RTLearnedLocationStore fetchLocationsOfInterestWithinDistance:location:handler:](learnedLocationStore, "fetchLocationsOfInterestWithinDistance:location:handler:", v11, v76, 1000.0);

    dsema = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v14))
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_10);
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
    v96[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v96, 1);
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
LABEL_10:
      v27 = 0;
      v28 = 1;
    }

    v60 = v27;
    if ((v28 & 1) == 0)
      objc_storeStrong(v81 + 5, v27);
    v29 = v81[5];
    if (v29)
    {
      if (a4)
      {
        v30 = 0;
        *a4 = objc_retainAutorelease(v29);
      }
      else
      {
LABEL_36:
        v30 = 0;
      }
    }
    else
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obja = (id)v87[5];
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v73;
        while (2)
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v73 != v34)
              objc_enumerationMutation(obja);
            v36 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v36, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v37 == v38;

            if (!v39)
            {
              distanceCalculator = self->_distanceCalculator;
              objc_msgSend(v67, "location");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "location");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "location");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "location");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = 0;
              -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v42, v44, &v71);
              v46 = v45;
              v47 = v71;

              if (!v47 && v46 > 0.0)
              {
                v48 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v49, v63);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "numberWithUnsignedInt:", objc_msgSend(v50, "unsignedIntValue") - 1);
                v51 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v51, "intValue") & 0x80000000) != 0)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
                  {
                    NSStringFromSelector(aSelectora);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v57;
                    _os_log_fault_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_FAULT, "%@, negative bin index!", buf, 0xCu);

                  }
                  goto LABEL_36;
                }
                v52 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v51, "unsignedIntValue"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "numberWithUnsignedInt:", objc_msgSend(v53, "unsignedIntValue") + 1);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:atIndexedSubscript:", v54, objc_msgSend(v51, "unsignedIntValue"));

              }
            }
          }
          v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
          if (v33)
            continue;
          break;
        }
      }

      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke_32;
      v68[3] = &unk_1E9298870;
      v70 = aSelectora;
      v69 = v63;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v68);
      v30 = v4;

    }
    _Block_object_dispose(&v80, 8);

    _Block_object_dispose(&v86, 8);
    goto LABEL_38;
  }
  v31 = (void *)MEMORY[0x1E0CB35C8];
  v94 = *MEMORY[0x1E0CB2D50];
  v95 = CFSTR("requires a LOI with non-nil location");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v32);
  v60 = (id)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
    v30 = 0;
LABEL_38:

    goto LABEL_39;
  }
  v61 = objc_retainAutorelease(v60);
  v30 = 0;
  *a4 = v61;

LABEL_39:
  return v30;
}

void __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v7 = obj;
  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v6);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __93__RTLocationOfInterestMetrics__countNearbyLocationsOfInterestForLocationOfInterest_outError___block_invoke_32(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v11 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
    if (v11 <= a3)
    {
      v13 = 0x408F400000000000;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
      a1 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "doubleValue");
      v13 = v12;
    }
    v14 = 138413314;
    v15 = v7;
    v16 = 2048;
    v17 = a3;
    v18 = 2048;
    v19 = v10;
    v20 = 2048;
    v21 = v13;
    v22 = 2048;
    v23 = objc_msgSend(v5, "unsignedIntValue");
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, bin idx, %lu, min distance, %.2f, max distance, %.2f, nearby LOI count, %lu", (uint8_t *)&v14, 0x34u);
    if (v11 > a3)

  }
}

- (id)_metricForLocationOfInterest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  RTDistanceCalculator *distanceCalculator;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t i;
  void *v73;
  unint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  id v101;
  id v102;
  void *v103;
  void *v104;
  os_log_t log;
  void *v106;
  id v107;
  _QWORD v108[6];
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  id v115;
  _BYTE buf[24];
  void *v117;
  __int16 v118;
  double v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v106 = v5;
  if (v5)
  {
    v6 = v5;
    v107 = (id)objc_opt_new();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    log = (os_log_t)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NSObject horizontalUncertainty](log, "horizontalUncertainty");
    objc_msgSend(v8, "numberWithInt:", (int)fmin(v9, 200.0));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v10, CFSTR("horizontalUncertainty"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject sourceAccuracy](log, "sourceAccuracy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v11, CFSTR("sourceAccuracy"));

    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v106, "place");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v14, CFSTR("placeType"));

    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v106, "place");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "extendedAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberWithBool:", objc_msgSend(v18, "isMe"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v19, CFSTR("isMeCardAddress"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[RTLocationOfInterestMetrics _signalEnvironmentTypeForLocationOfInterest:](self, "_signalEnvironmentTypeForLocationOfInterest:", v106));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v20, CFSTR("signalEnvironment"));

    distanceCalculator = self->_distanceCalculator;
    objc_msgSend(v106, "place");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mapItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0;
    -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v24, log, &v115);
    v26 = v25;
    v102 = v115;

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "place");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "mapItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "location");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = log;
      *(_WORD *)&buf[22] = 2112;
      v117 = v31;
      v118 = 2048;
      v119 = v26;
      v120 = 2112;
      v121 = v102;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, LOI centroid, %@, mapItem centroid, %@, distance, %f, error, %@", buf, 0x34u);

    }
    if (!v102)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)fmin(v26, 200.0));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setObject:forKeyedSubscript:", v32, CFSTR("distanceFromMapItem"));

      -[NSObject horizontalUncertainty](log, "horizontalUncertainty");
      if (v33 != 0.0)
      {
        v34 = (void *)MEMORY[0x1E0CB37E8];
        -[NSObject horizontalUncertainty](log, "horizontalUncertainty");
        objc_msgSend(v34, "numberWithDouble:", v26 / v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setObject:forKeyedSubscript:", v36, CFSTR("ratioBetweenDistanceAndHorizontalUncertainty"));

      }
    }
    objc_msgSend(v106, "place");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "mapItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "location");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "referenceFrame") == 2;

    if (!v40)
    {
      *(_QWORD *)buf = 0;
      v109 = 0;
      v114 = 0;
      -[NSObject latitude](log, "latitude");
      -[NSObject longitude](log, "longitude");
      objc_msgSend(v106, "place");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "mapItem");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "location");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "latitude");
      objc_msgSend(v106, "place");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "mapItem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "location");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "longitude");
      v47 = RTCommonConvertGeodeticToLocalFrame();

      if (v47)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f,%.1f"), v109, *(_QWORD *)buf);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setObject:forKeyedSubscript:", v48, CFSTR("distanceFromMapItemIn2D"));

      }
    }
    v113 = 0;
    -[RTLocationOfInterestMetrics _countNearbyLocationsOfInterestForLocationOfInterest:outError:](self, "_countNearbyLocationsOfInterestForLocationOfInterest:outError:", v106, &v113);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v113;
    if (objc_msgSend(v104, "count"))
    {
      v49 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("nearbyLOICountInDistanceBucket"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "objectAtIndex:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setObject:forKeyedSubscript:", v51, v50);

        ++v49;
      }
      while (v49 < objc_msgSend(v104, "count"));
    }
    objc_msgSend(v107, "setObject:forKeyedSubscript:", &unk_1E932CD50, CFSTR("intervalBetweenFirstVisitAndLastVisit"));
    objc_msgSend(v107, "setObject:forKeyedSubscript:", &unk_1E9326960, CFSTR("visitCount"));
    objc_msgSend(v107, "setObject:forKeyedSubscript:", &unk_1E9326960, CFSTR("highAccuracyVisitCount"));
    objc_msgSend(v107, "setObject:forKeyedSubscript:", &unk_1E9326960, CFSTR("lowAccuracyVisitCount"));
    objc_msgSend(v106, "visits");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count") == 0;

    if (!v53)
    {
      objc_msgSend(v106, "visits");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (unint64_t)objc_msgSend(v54, "count") > 1;

      if (v55)
      {
        objc_msgSend(v106, "visits");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "lastObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "exitDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "visits");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "firstObject");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "entryDate");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "timeIntervalSinceDate:", v61);
        v63 = v62;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(v63 / 86400.0));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setObject:forKeyedSubscript:", v64, CFSTR("intervalBetweenFirstVisitAndLastVisit"));

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v117 = 0;
      v109 = 0;
      v110 = &v109;
      v111 = 0x2020000000;
      v112 = 0;
      objc_msgSend(v106, "visits");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = MEMORY[0x1E0C809B0];
      v108[1] = 3221225472;
      v108[2] = __60__RTLocationOfInterestMetrics__metricForLocationOfInterest___block_invoke;
      v108[3] = &unk_1E9298898;
      v108[4] = buf;
      v108[5] = &v109;
      objc_msgSend(v65, "enumerateObjectsUsingBlock:", v108);

      v66 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v106, "visits");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setObject:forKeyedSubscript:", v68, CFSTR("visitCount"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setObject:forKeyedSubscript:", v69, CFSTR("highAccuracyVisitCount"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v110[3]);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setObject:forKeyedSubscript:", v70, CFSTR("lowAccuracyVisitCount"));

      objc_msgSend(v106, "visits");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationOfInterestMetrics _shuffledIndicesForArraySize:](self, "_shuffledIndicesForArraySize:", objc_msgSend(v71, "count"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      for (i = 0; ; ++i)
      {
        objc_msgSend(v106, "visits");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v73, "count");

        v75 = 20;
        if (v74 < 0x14)
          v75 = v74;
        if (i >= v75)
          break;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("visit"), i);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu"), CFSTR("dwellIntervalVisit"), i);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "visits");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "objectAtIndexedSubscript:", i);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectAtIndex:", objc_msgSend(v79, "unsignedIntValue"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v80, "exitDate");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "entryDate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "timeIntervalSinceDate:", v83);
        objc_msgSend(v81, "numberWithInt:", (int)(v84 / 900.0));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "setObject:forKeyedSubscript:", v85, v77);

        v114 = 0;
        -[NSObject latitude](log, "latitude");
        -[NSObject longitude](log, "longitude");
        objc_msgSend(v80, "location");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "location");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "latitude");
        objc_msgSend(v80, "location");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "location");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "longitude");
        v90 = RTCommonConvertGeodeticToLocalFrame();

        if (v90)
        {
          v91 = (void *)MEMORY[0x1E0CB3940];
          v92 = v114;
          objc_msgSend(v80, "location");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "location");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "horizontalUncertainty");
          v96 = v95;
          objc_msgSend(v80, "location");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "location");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "stringWithFormat:", CFSTR("%.1f,%.1f,%.1f,%lu"), 0, v92, v96, objc_msgSend(v98, "sourceAccuracy"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v107, "setObject:forKeyedSubscript:", v99, v76);
        }

      }
      _Block_object_dispose(&v109, 8);
      _Block_object_dispose(buf, 8);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", buf, 2u);
    }
    v107 = 0;
  }

  return v107;
}

void __60__RTLocationOfInterestMetrics__metricForLocationOfInterest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceAccuracy");

  if (v5 == 2)
    v6 = *(_QWORD *)(a1 + 32);
  else
    v6 = *(_QWORD *)(a1 + 40);
  ++*(_QWORD *)(*(_QWORD *)(v6 + 8) + 24);
}

- (id)_shuffledIndicesForArraySize:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  if (a3)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
    v7 = 0;
    do
    {
      objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", v7, v7 + (int)RTCommonRandomInt());
      ++v7;
      --v3;
    }
    while (v3);
    v8 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: arraySize > 0", v11, 2u);
    }

    v8 = 0;
  }
  return v8;
}

- (void)_submitMetric:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = objc_msgSend(v4, "initWithCString:encoding:", RTAnalyticsEventLocationOfInterestMetrics, 1);
    log_analytics_submission(v5, v3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metric", buf, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
