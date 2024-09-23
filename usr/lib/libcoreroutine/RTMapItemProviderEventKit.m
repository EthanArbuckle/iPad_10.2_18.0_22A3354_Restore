@implementation RTMapItemProviderEventKit

- (RTMapItemProviderEventKit)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_eventManager_mapServiceManager_);
}

- (RTMapItemProviderEventKit)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 mapServiceManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  RTMapItemProviderEventKit *v18;
  RTMapItemProviderEventKitParameters *v19;
  uint8_t v21[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsMapItemProviderEventKitConfidence"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
    }
    else
    {
      v16 = 0.95;
    }
    v19 = -[RTMapItemProviderEventKitParameters initWithConfidence:]([RTMapItemProviderEventKitParameters alloc], "initWithConfidence:", v16);
    self = -[RTMapItemProviderEventKit initWithDefaultsManager:distanceCalculator:eventManager:mapServiceManager:parameters:](self, "initWithDefaultsManager:distanceCalculator:eventManager:mapServiceManager:parameters:", v10, v11, v12, v13, v19);

    v18 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v21, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (RTMapItemProviderEventKit)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 mapServiceManager:(id)a6 parameters:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  RTMapItemProviderEventKit *v18;
  id *p_isa;
  NSObject *v20;
  id v21;
  RTMapItemProviderEventKit *v22;
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
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: eventManager";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_16;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_15;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: parameters";
      goto LABEL_15;
    }
LABEL_16:

    v22 = 0;
    goto LABEL_17;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTMapItemProviderEventKit;
  v18 = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v26, sel_initWithDefaultsManager_distanceCalculator_, v12, v13);
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_eventManager, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = p_isa[5];
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderEventKit with parameters, %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v22 = self;
LABEL_17:

  return v22;
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  intptr_t v15;
  uint64_t *v16;
  uint64_t *v17;
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
  id v29;
  char v30;
  uint64_t i;
  void *v32;
  void *v33;
  dispatch_semaphore_t v34;
  id v35;
  uint64_t v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  dispatch_time_t v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  char v59;
  id v60;
  _RTMap *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id obj;
  uint64_t v76;
  uint64_t v77;
  void *v79;
  id v80;
  id v81;
  _QWORD v82[5];
  _QWORD v83[4];
  NSObject *v84;
  uint64_t *v85;
  uint8_t *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[4];
  NSObject *v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t v95;
  id *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint8_t v113[8];
  uint8_t *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  void (*v117)(uint64_t);
  id v118;
  _BYTE v119[128];
  uint64_t v120;
  uint8_t buf[8];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "distance");
  v6 = v5;
  v79 = v4;
  objc_msgSend(v4, "location");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v7, -3600.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, 3600.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__169;
  v105 = __Block_byref_object_dispose__169;
  v106 = 0;
  v95 = 0;
  v96 = (id *)&v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__169;
  v99 = __Block_byref_object_dispose__169;
  v100 = 0;
  v9 = dispatch_semaphore_create(0);
  -[RTMapItemProviderEventKit eventManager](self, "eventManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke;
  v91[3] = &unk_1E9296EE0;
  v93 = &v101;
  v94 = &v95;
  v11 = v9;
  v92 = v11;
  objc_msgSend(v10, "fetchEventsBetweenStartDate:endDate:handler:", v70, v69, v91);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  v15 = dispatch_semaphore_wait(v12, v14);
  v16 = (uint64_t *)MEMORY[0x1E0D18598];
  v17 = (uint64_t *)MEMORY[0x1E0CB2D50];
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v13);
    v20 = v19;
    v21 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_124);
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
      *(_WORD *)v113 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v113, 2u);
    }

    v27 = (void *)MEMORY[0x1E0CB35C8];
    v107 = *v17;
    *(_QWORD *)v113 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, &v107, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *v16, 15, v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v29 = objc_retainAutorelease(v29);

      v30 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v29 = 0;
  }
  v30 = 1;
LABEL_8:

  v80 = v29;
  if ((v30 & 1) == 0)
    objc_storeStrong(v96 + 5, v29);
  if (v96[5])
    objc_msgSend(v74, "addObject:");
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = (id)v102[5];
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v119, 16);
  if (v77)
  {
    v76 = *(_QWORD *)v88;
    v71 = *v16;
    v72 = *v17;
    do
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v88 != v76)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v32, "locationMapItemHandle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          *(_QWORD *)v113 = 0;
          v114 = v113;
          v115 = 0x3032000000;
          v116 = __Block_byref_object_copy__169;
          v117 = __Block_byref_object_dispose__169;
          v118 = 0;
          v107 = 0;
          v108 = &v107;
          v109 = 0x3032000000;
          v110 = __Block_byref_object_copy__169;
          v111 = __Block_byref_object_dispose__169;
          v112 = 0;
          v34 = dispatch_semaphore_create(0);

          v35 = objc_alloc(MEMORY[0x1E0D183F8]);
          v36 = objc_msgSend(v79, "useBackground");
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "clientIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v35, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", v36, v38, v39);

          -[RTMapItemProviderEventKit mapServiceManager](self, "mapServiceManager");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "locationMapItemHandle");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v83[0] = MEMORY[0x1E0C809B0];
          v83[1] = 3221225472;
          v83[2] = __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_2;
          v83[3] = &unk_1E9298D98;
          v85 = &v107;
          v86 = v113;
          v43 = v34;
          v84 = v43;
          objc_msgSend(v41, "fetchMapItemFromHandle:options:handler:", v42, v40, v83);

          v12 = v43;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v12, v45))
            goto LABEL_23;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "timeIntervalSinceDate:", v44);
          v48 = v47;
          v49 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_124);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "filteredArrayUsingPredicate:", v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "firstObject");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "submitToCoreAnalytics:type:duration:", v53, 1, v48);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v55 = (void *)MEMORY[0x1E0CB35C8];
          v120 = v72;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v120, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "errorWithDomain:code:userInfo:", v71, 15, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
          {
            v58 = objc_retainAutorelease(v57);

            v59 = 0;
          }
          else
          {
LABEL_23:
            v59 = 1;
            v58 = v80;
          }

          v60 = v58;
          if ((v59 & 1) == 0)
            objc_storeStrong((id *)v114 + 5, v58);
          if (*((_QWORD *)v114 + 5))
            objc_msgSend(v74, "addObject:");
          if (v108[5])
            objc_msgSend(v73, "addObject:");

          _Block_object_dispose(&v107, 8);
          _Block_object_dispose(v113, 8);

          v80 = v60;
        }
      }
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v119, 16);
    }
    while (v77);
  }

  v61 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v73);
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_3;
  v82[3] = &unk_1E9298788;
  v82[4] = self;
  -[_RTMap withBlock:](v61, "withBlock:", v82);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0;
  -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v62, v68, 256, &v81, v6);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v81;

  if (v64)
    objc_msgSend(v74, "addObject:", v64);
  if (a4 && objc_msgSend(v74, "count"))
  {
    _RTSafeArray();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v95, 8);

  _Block_object_dispose(&v101, 8);
  return v63;
}

void __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

id __55__RTMapItemProviderEventKit_mapItemsWithOptions_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0D183A8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "confidence");
  v6 = (void *)objc_msgSend(v5, "initWithMapItem:confidence:source:", v4, 256);

  return v6;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTMapItemProviderEventKitParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
}

@end
