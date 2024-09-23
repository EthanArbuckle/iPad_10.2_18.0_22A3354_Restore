@implementation RTInferredMapItemFuser

- (RTInferredMapItemFuser)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedLocationStore_);
}

- (RTInferredMapItemFuser)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTInferredMapItemFuserParameters *v11;
  RTInferredMapItemFuser *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[RTInferredMapItemFuserParameters initWithDefaultsManager:]([RTInferredMapItemFuserParameters alloc], "initWithDefaultsManager:", v10);

  v12 = -[RTInferredMapItemFuser initWithDistanceCalculator:parameters:learnedLocationStore:](self, "initWithDistanceCalculator:parameters:learnedLocationStore:", v9, v11, v8);
  return v12;
}

- (RTInferredMapItemFuser)initWithDistanceCalculator:(id)a3 parameters:(id)a4 learnedLocationStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTInferredMapItemFuser *v12;
  RTInferredMapItemFuser *v13;
  uint64_t v14;
  NSUUID *placeholderUUID;
  RTInferredMapItemDeduper *v16;
  uint64_t v17;
  RTInferredMapItemDeduper *deduper;
  NSObject *v19;
  RTInferredMapItemFuserParameters *parameters;
  RTInferredMapItemFuser *v21;
  NSObject *v22;
  const char *v23;
  objc_super v25;
  uint8_t buf[4];
  RTInferredMapItemFuserParameters *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v21 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_11;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v25.receiver = self;
  v25.super_class = (Class)RTInferredMapItemFuser;
  v12 = -[RTInferredMapItemFuser init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_distanceCalculator, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    placeholderUUID = v13->_placeholderUUID;
    v13->_placeholderUUID = (NSUUID *)v14;

    v16 = [RTInferredMapItemDeduper alloc];
    v17 = -[RTInferredMapItemDeduper initWithDeduperFunction:](v16, "initWithDeduperFunction:", deduperFunctionGroupedLabelType);
    deduper = v13->_deduper;
    v13->_deduper = (RTInferredMapItemDeduper *)v17;

    objc_storeStrong((id *)&v13->_parameters, a4);
    objc_storeStrong((id *)&v13->_learnedLocationStore, a5);
    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      parameters = v13->_parameters;
      *(_DWORD *)buf = 138412290;
      v27 = parameters;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "created fuser with parameters, %@", buf, 0xCu);
    }

  }
  self = v13;
  v21 = self;
LABEL_12:

  return v21;
}

- (id)filterCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  RTDistanceCalculator *distanceCalculator;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  dispatch_semaphore_t v28;
  void *v29;
  void *v30;
  void *v31;
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
  NSObject *v50;
  char v51;
  int v52;
  RTDistanceCalculator *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  NSObject *v68;
  id v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  void *v80;
  NSObject *dsema;
  id obj;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  _QWORD v88[4];
  NSObject *v89;
  uint8_t *v90;
  uint64_t *v91;
  uint64_t v92;
  id *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint8_t v98[8];
  uint8_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE buf[12];
  __int16 v110;
  void *v111;
  _BYTE v112[128];
  _QWORD v113[4];

  v113[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v80 = v7;
  v83 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v98 = 0;
      _os_log_error_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", v98, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
      v69 = (id)objc_claimAutoreleasedReturnValue();
LABEL_52:
      v67 = 0;
      *a5 = v69;
      goto LABEL_59;
    }
LABEL_53:
    v67 = 0;
    goto LABEL_59;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v98 = 0;
      _os_log_error_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", v98, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("referenceLocation"));
      v69 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v7;
  v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  if (v86)
  {
    v85 = *(_QWORD *)v106;
    v76 = *MEMORY[0x1E0D18598];
    v77 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)&v9 = 138412546;
    v75 = v9;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v106 != v85)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v10);
        objc_msgSend(v11, "firstObject", v75);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "mapItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "extendedAttributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "wifiFingerprintLabelType") == 2;

        if (v15)
        {
          objc_msgSend(v84, "addObject:", v11);
          goto LABEL_17;
        }
        distanceCalculator = self->_distanceCalculator;
        objc_msgSend(v11, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "mapItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v19, v83, &v104);
        v21 = v20;
        v22 = v104;

        if (v22)
        {
          v71 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v22, "userInfo");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 1, v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (a5)
            *a5 = objc_retainAutorelease(v73);

LABEL_57:
          v67 = 0;
          v66 = v84;
          goto LABEL_58;
        }
        -[RTInferredMapItemFuserParameters distanceThreshold](self->_parameters, "distanceThreshold");
        if (v21 <= v23)
        {
          v24 = 0;
LABEL_15:
          objc_msgSend(v84, "addObject:", v11);
LABEL_16:

          goto LABEL_17;
        }
        objc_msgSend(v11, "firstObject");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "mapItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "source") & 0x2000) == 0)
        {

          goto LABEL_16;
        }
        -[RTInferredMapItemFuser learnedLocationStore](self, "learnedLocationStore");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (!v27)
        {
          *(_QWORD *)v98 = 0;
          v99 = v98;
          v100 = 0x3032000000;
          v101 = __Block_byref_object_copy__148;
          v102 = __Block_byref_object_dispose__148;
          v103 = 0;
          v92 = 0;
          v93 = (id *)&v92;
          v94 = 0x3032000000;
          v95 = __Block_byref_object_copy__148;
          v96 = __Block_byref_object_dispose__148;
          v97 = 0;
          v28 = dispatch_semaphore_create(0);
          -[RTInferredMapItemFuser learnedLocationStore](self, "learnedLocationStore");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "mapItem");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v88[0] = MEMORY[0x1E0C809B0];
          v88[1] = 3221225472;
          v88[2] = __67__RTInferredMapItemFuser_filterCandidates_referenceLocation_error___block_invoke;
          v88[3] = &unk_1E9297478;
          v90 = v98;
          v91 = &v92;
          v32 = v28;
          v89 = v32;
          objc_msgSend(v29, "fetchLocationOfInterestWithMapItem:handler:", v31, v88);

          dsema = v32;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v34))
            goto LABEL_25;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "timeIntervalSinceDate:", v33);
          v37 = v36;
          v38 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_168_0);
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
          v113[0] = v77;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v113, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "errorWithDomain:code:userInfo:", v76, 15, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            v47 = objc_retainAutorelease(v46);

            v48 = 0;
          }
          else
          {
LABEL_25:
            v47 = 0;
            v48 = 1;
          }

          v49 = v47;
          if ((v48 & 1) == 0)
            objc_storeStrong(v93 + 5, v47);
          if (v93[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityFusion);
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v62 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "firstObject");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "mapItem");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v75;
              *(_QWORD *)&buf[4] = v62;
              v110 = 2112;
              v111 = v64;
              _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "%@, Failed to fetch LOI with mapItem, %@", buf, 0x16u);

            }
LABEL_32:
            v24 = 0;
            v51 = 0;
            v52 = 1;
          }
          else
          {
            v53 = self->_distanceCalculator;
            objc_msgSend(*((id *)v99 + 5), "location");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "location");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = 0;
            -[RTDistanceCalculator distanceFromLocation:toLocation:error:](v53, "distanceFromLocation:toLocation:error:", v55, v83, &v87);
            v57 = v56;
            v24 = v87;

            if (v24)
            {
              v58 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(v24, "userInfo");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 1, v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (a5)
                *a5 = objc_retainAutorelease(v60);

              v51 = 0;
              v52 = 0;
            }
            else
            {
              -[RTInferredMapItemFuserParameters distanceThreshold](self->_parameters, "distanceThreshold");
              if (v57 > v61)
                goto LABEL_32;
              v24 = 0;
              v52 = 0;
              v51 = 1;
            }
          }

          _Block_object_dispose(&v92, 8);
          _Block_object_dispose(v98, 8);

          if ((v51 & 1) != 0)
            goto LABEL_15;

          if (!v52)
            goto LABEL_57;
        }
LABEL_17:
        ++v10;
      }
      while (v86 != v10);
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
      v86 = v65;
    }
    while (v65);
  }

  v66 = v84;
  v67 = v84;
LABEL_58:

LABEL_59:
  return v67;
}

void __67__RTInferredMapItemFuser_filterCandidates_referenceLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)snapToBestKnownPlaceType:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  id v21;
  id v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[16];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (!v7)
      goto LABEL_14;
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v26;
    v11 = -1.79769313e308;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "secondObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        if (v15)
        {
          objc_msgSend(v13, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "confidence");
          v18 = v17;

          if (v18 > v11)
          {
            objc_msgSend(v13, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "confidence");
            v11 = v20;

            v21 = v13;
            v9 = v21;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v8);
    if (v9)
    {
      v30 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_14:
      v22 = v6;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (id)snapToBestAOICandidate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  id v24;
  NSObject *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[8];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (!v7)
      goto LABEL_14;
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    v11 = -1.79769313e308;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mapItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "extendedAttributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "wifiFingerprintLabelType");

        if (v17 == 2)
        {
          objc_msgSend(v13, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "confidence");
          v20 = v19;

          if (v20 > v11)
          {
            v21 = v13;

            objc_msgSend(v21, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "confidence");
            v11 = v23;

            v9 = v21;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v8);
    if (v9)
    {
      v32 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_14:
      v24 = v6;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (id)filterLearnedPlaceCandidates:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int16 v21;
  RTDistanceCalculator *distanceCalculator;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  id v37;
  NSObject *v38;
  const __CFString *v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id *v46;
  id v47;
  void *v48;
  id v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[8];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      v46 = a5;
      v49 = v8;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v47 = v7;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      v48 = v10;
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = *(_QWORD *)v53;
        v16 = -1.0;
        v17 = 1.79769313e308;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v53 != v15)
              objc_enumerationMutation(v11);
            v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_msgSend(v19, "firstObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "source");

            if ((v21 & 0x2000) != 0)
            {
              distanceCalculator = self->_distanceCalculator;
              objc_msgSend(v19, "firstObject");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "mapItem");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "location");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = 0;
              -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v25, v49, &v51);
              v27 = v26;
              v28 = v51;

              if (v28)
              {
                v42 = (void *)MEMORY[0x1E0CB35C8];
                objc_msgSend(v28, "userInfo");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 1, v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                  *v46 = objc_retainAutorelease(v44);

                v41 = 0;
                goto LABEL_34;
              }
              objc_msgSend(v19, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "confidence");
              v31 = v30;

              objc_msgSend(v19, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "confidence");
              v34 = v33;

              v10 = v48;
              if (v31 > v16 || v34 == v16 && v27 < v17)
              {
                objc_msgSend(v19, "firstObject");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "confidence");
                v16 = v36;

                v37 = v19;
                v17 = v27;
                v14 = v37;
              }
            }
            else
            {
              objc_msgSend(v10, "addObject:", v19);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
          if (v13)
            continue;
          break;
        }
      }
      else
      {
        v14 = 0;
      }

      if (objc_msgSend(v10, "count"))
      {
        v41 = v10;
LABEL_34:
        v7 = v47;
        v9 = v49;
      }
      else
      {
        v9 = v49;
        if (!v14)
        {
          v41 = (id)MEMORY[0x1E0C9AA60];
          v7 = v47;
          goto LABEL_36;
        }
        v57 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v7 = v47;
      }

LABEL_36:
      goto LABEL_37;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a5)
    {
      v39 = CFSTR("referenceLocation");
      goto LABEL_26;
    }
LABEL_30:
    v41 = 0;
    goto LABEL_37;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
  }

  if (!a5)
    goto LABEL_30;
  v39 = CFSTR("candidates");
LABEL_26:
  _RTErrorInvalidParameterCreate((uint64_t)v39);
  v41 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

  return v41;
}

- (id)filterUnknownLearnedPlaceCandidates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_114);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __62__RTInferredMapItemFuser_filterUnknownLearnedPlaceCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "source") & 0x2000) != 0)
  {
    objc_msgSend(v2, "secondObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "unsignedIntegerValue") != 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)preprocessCandidates:(id)a3 referenceLocation:(id)a4 snapToBestKnownPlaceAndAoi:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v7 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
LABEL_15:
      v18 = 0;
      *a6 = v20;
      goto LABEL_47;
    }
    v11 = 0;
LABEL_22:
    v18 = 0;
    goto LABEL_47;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("referenceLocation"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  if ((unint64_t)objc_msgSend(v11, "count") > 1)
  {
    v56 = 0;
    -[RTInferredMapItemFuser filterCandidates:referenceLocation:error:](self, "filterCandidates:referenceLocation:error:", v11, v13, &v56);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v56;

    if (v23)
    {
      _rt_log_facility_get_os_log(RTLogFacilityFusion);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v58 = v36;
        v59 = 2112;
        v60 = v23;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, filter candidate error, %@", buf, 0x16u);

      }
      v18 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v23);
      goto LABEL_27;
    }
    if ((unint64_t)objc_msgSend(v22, "count") <= 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityFusion);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v58 = v26;
        v59 = 2112;
        v60 = v28;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, exiting after filtering based on location, fused map item, %@", buf, 0x16u);

      }
      v29 = v22;
LABEL_40:
      v11 = v29;
      v18 = v29;
      goto LABEL_46;
    }
    if (v7)
    {
      v55 = 0;
      -[RTInferredMapItemFuser snapToBestKnownPlaceType:error:](self, "snapToBestKnownPlaceType:error:", v22, &v55);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v55;

      if (v30)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v48;
          v59 = 2112;
          v60 = v30;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, snap to home work error, %@", buf, 0x16u);

        }
        v18 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v30);
LABEL_45:

        goto LABEL_46;
      }
      if ((unint64_t)objc_msgSend(v11, "count") <= 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v38;
          v59 = 2112;
          v60 = v40;
          _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, fused early, fused map item, %@", buf, 0x16u);

        }
        v18 = v11;
        goto LABEL_45;
      }
      v54 = 0;
      -[RTInferredMapItemFuser snapToBestAOICandidate:error:](self, "snapToBestAOICandidate:error:", v11, &v54);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v54;

      if (v42)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v51;
          v59 = 2112;
          v60 = v42;
          _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v18 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v42);
LABEL_59:

LABEL_27:
        v11 = v22;
LABEL_46:

        goto LABEL_47;
      }
      if ((unint64_t)objc_msgSend(v22, "count") <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          _rt_log_facility_get_os_log(RTLogFacilityFusion);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "firstObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "firstObject");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v58 = v45;
            v59 = 2112;
            v60 = v47;
            _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, fused early, fused map item, %@", buf, 0x16u);

          }
        }
        v18 = v22;
        goto LABEL_59;
      }
      v53 = 0;
      -[RTInferredMapItemFuser filterLearnedPlaceCandidates:referenceLocation:error:](self, "filterLearnedPlaceCandidates:referenceLocation:error:", v22, v13, &v53);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v49 = v53;

      if (v49)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v58 = v52;
          v59 = 2112;
          v60 = v49;
          _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "%@, filter learned place error, %@", buf, 0x16u);

        }
        if (a6)
          *a6 = objc_retainAutorelease(v49);

        v18 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      -[RTInferredMapItemFuser filterUnknownLearnedPlaceCandidates:](self, "filterUnknownLearnedPlaceCandidates:", v22);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((unint64_t)objc_msgSend(v11, "count") <= 1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityFusion);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v58 = v33;
        v59 = 2112;
        v60 = v35;
        _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@, exiting after filtering learned place, fused map item, %@", buf, 0x16u);

      }
    }
    v29 = v11;
    goto LABEL_40;
  }
  _rt_log_facility_get_os_log(RTLogFacilityFusion);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v58 = v15;
    v59 = 2112;
    v60 = v17;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, exiting before filtering based on location, fused map item, %@", buf, 0x16u);

  }
  v11 = v11;
  v18 = v11;
LABEL_47:

  return v18;
}

- (id)populateMapItemSourceEntriesForDedupedInferredMapItems:(id)a3 error:(id *)a4
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
  void *v18;
  NSObject *v19;
  RTInferredMapItemFuser *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v21 = self;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v22 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v12, "mapItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E9329450, v14);
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v12, "source") | objc_msgSend(v17, "unsignedIntegerValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v14);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E9329450, v21->_placeholderUUID);
    v6 = v22;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dedupedInferredMapItems", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dedupedInferredMapItems"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)partitionDedupedInferredMapItems:(id)a3 intoNonAoiDedupedInferredMapItems:(id *)a4 aoiDedupedInferredMapItems:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  BOOL v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  id *v30;
  id *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[16];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dedupedInferredMapItems", buf, 2u);
    }

    if (!a6)
      goto LABEL_28;
    v26 = CFSTR("dedupedInferredMapItems");
    goto LABEL_27;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outNonAoiDedupedInferredMapItems", buf, 2u);
    }

    if (!a6)
      goto LABEL_28;
    v26 = CFSTR("outNonAoiDedupedInferredMapItems");
LABEL_27:
    _RTErrorInvalidParameterCreate((uint64_t)v26);
    v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAoiDedupedInferredMapItems", buf, 2u);
    }

    if (a6)
    {
      v26 = CFSTR("outAoiDedupedInferredMapItems");
      goto LABEL_27;
    }
LABEL_28:
    v24 = 0;
    goto LABEL_29;
  }
  v30 = a4;
  v31 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = v9;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v17, "mapItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "extendedAttributes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "wifiFingerprintLabelType");

        if (v20 == 2)
          v21 = v10;
        else
          v21 = v11;
        objc_msgSend(v21, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }

  v22 = objc_retainAutorelease(v11);
  *v30 = v22;
  v23 = objc_retainAutorelease(v10);
  *v31 = v23;

  v24 = 1;
  v9 = v32;
LABEL_29:

  return v24;
}

- (BOOL)initializeEntriesForNonAoiDedupedInferredMapItems:(id)a3 aoiDedupedInferredMapItems:(id)a4 nonAoiUUIDToLogProbMap:(id *)a5 aoiUUIDToProbArrayMap:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  BOOL v42;
  NSObject *v43;
  const __CFString *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  RTInferredMapItemFuser *v49;
  id *v50;
  id *v51;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[16];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = v13;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiDedupedInferredMapItems", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v44 = CFSTR("nonAoiDedupedInferredMapItems");
    goto LABEL_40;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiDedupedInferredMapItems", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v44 = CFSTR("aoiDedupedInferredMapItems");
    goto LABEL_40;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outNonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v44 = CFSTR("outNonAoiUUIDToLogProbMap");
LABEL_40:
    _RTErrorInvalidParameterCreate((uint64_t)v44);
    v42 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outAoiUUIDToProbArrayMap", buf, 2u);
    }

    if (a7)
    {
      v44 = CFSTR("outAoiUUIDToProbArrayMap");
      goto LABEL_40;
    }
LABEL_41:
    v42 = 0;
    goto LABEL_42;
  }
  v49 = self;
  v50 = a5;
  v51 = a6;
  v53 = v13;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v52 = v12;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v59 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v21, "mapItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          objc_msgSend(v21, "mapItem");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E9329468, v26);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v18);
  }

  objc_msgSend(v15, "setObject:forKeyedSubscript:", &unk_1E9329468, v49->_placeholderUUID);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v28 = v53;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v55 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v33, "mapItem");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "mapItem");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v37, v39);

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v30);
  }

  v40 = objc_retainAutorelease(v15);
  *v50 = v40;
  v41 = objc_retainAutorelease(v27);
  *v51 = v41;

  v42 = 1;
  v12 = v52;
  v14 = v53;
LABEL_42:

  return v42;
}

- (BOOL)updateAoiUUIDToProbArrayMap:(id)a3 aoiDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _RTMap *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const __CFString *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];

  v52[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v41 = v8;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiUUIDToProbArrayMap", buf, 2u);
    }

    if (a5)
    {
      v30 = CFSTR("aoiUUIDToProbArrayMap");
LABEL_20:
      _RTErrorInvalidParameterCreate((uint64_t)v30);
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_21:
    v17 = 0;
    goto LABEL_27;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v30 = CFSTR("aoiDedupedInferredMapItems");
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v11 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v9);
  -[_RTMap withBlock:](v11, "withBlock:", &__block_literal_global_48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v13, "isEqualToSet:", v16);
  if ((v17 & 1) != 0)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v19)
    {
      v20 = v19;
      v37 = v16;
      v38 = v13;
      v39 = v12;
      v40 = v10;
      v21 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v23, "mapItem", v37, v38);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "confidence");
          objc_msgSend(v27, "numberWithDouble:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v28);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v20);
      v12 = v39;
      v10 = v40;
      v16 = v37;
      v13 = v38;
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("uniqueAoiUUIDsFromArray != uniqueAoiUUIDsFromMap");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 7, v33);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v36;
      v49 = 2112;
      v50 = v18;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v18);
  }

LABEL_27:
  return v17;
}

id __87__RTInferredMapItemFuser_updateAoiUUIDToProbArrayMap_aoiDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 bluePOIDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  _RTMap *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  double v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  const __CFString *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  RTInferredMapItemFuser *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;
  const __CFString *v115;
  _BYTE v116[128];
  uint64_t v117;
  const __CFString *v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  id v122;
  uint64_t v123;
  _QWORD v124[4];

  v124[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", self->_placeholderUUID);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v93 = self;
        v13 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v11);
        -[_RTMap withBlock:](v13, "withBlock:", &__block_literal_global_59);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0C99E60];
        v94 = v9;
        objc_msgSend(v9, "allKeys");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isSubsetOfSet:", v18) & 1) != 0)
        {
          v91 = v15;
          v92 = v18;
          v90 = v14;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v19 = v11;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v108;
            v23 = 0.0;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v108 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v107 + 1) + 8 * i), "confidence");
                v23 = v23 + v25;
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v107, v116, 16);
            }
            while (v21);

            if (v23 > 1.0)
            {
              v26 = (void *)MEMORY[0x1E0CB35C8];
              v114 = *MEMORY[0x1E0CB2D50];
              v115 = CFSTR("Blue POI candidates total confidence is > 1.0");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 6, v27);
              v28 = (id)objc_claimAutoreleasedReturnValue();

              _rt_log_facility_get_os_log(RTLogFacilityFusion);
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v120 = v87;
                v121 = 2112;
                v122 = v28;
                _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

              }
              v14 = v90;
              v18 = v92;
              if (!a5)
              {
LABEL_16:
                v30 = 0;
LABEL_66:

                v9 = v94;
                goto LABEL_67;
              }
LABEL_35:
              v28 = objc_retainAutorelease(v28);
              v30 = 0;
              *a5 = v28;
              goto LABEL_66;
            }
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v92);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "minusSet:", v15);
          if (objc_msgSend(v19, "count"))
          {
            v88 = v28;
            v89 = v11;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v42 = v19;
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
            if (v43)
            {
              v44 = v43;
              v45 = *(_QWORD *)v104;
              do
              {
                for (j = 0; j != v44; ++j)
                {
                  if (*(_QWORD *)v104 != v45)
                    objc_enumerationMutation(v42);
                  v47 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
                  objc_msgSend(v47, "mapItem");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "identifier");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v41, "objectForKeyedSubscript:", v49);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v50)
                    objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_1E932D550, v49);
                  v51 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v41, "objectForKeyedSubscript:", v49);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "doubleValue");
                  v54 = v53;
                  objc_msgSend(v47, "confidence");
                  objc_msgSend(v51, "numberWithDouble:", v54 + v55);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "setObject:forKeyedSubscript:", v56, v49);

                }
                v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v103, v113, 16);
              }
              while (v44);
            }

            v101 = 0u;
            v102 = 0u;
            v99 = 0u;
            v100 = 0u;
            v57 = v41;
            v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
            if (v58)
            {
              v59 = v58;
              v60 = *(_QWORD *)v100;
              do
              {
                for (k = 0; k != v59; ++k)
                {
                  if (*(_QWORD *)v100 != v60)
                    objc_enumerationMutation(v57);
                  v62 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * k);
                  v63 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v94, "objectForKeyedSubscript:", v62);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "doubleValue");
                  v66 = v65;
                  objc_msgSend(v57, "objectForKeyedSubscript:", v62);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "doubleValue");
                  RTCommonSafeLog();
                  objc_msgSend(v63, "numberWithDouble:", v66 + v68);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "setObject:forKeyedSubscript:", v69, v62);

                }
                v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v99, v112, 16);
              }
              while (v59);
            }

            objc_msgSend(v88, "count");
            -[RTInferredMapItemFuserParameters placeholderMultiplier](v93->_parameters, "placeholderMultiplier");
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v98 = 0u;
            v28 = v88;
            v70 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
            if (v70)
            {
              v71 = v70;
              v72 = *(_QWORD *)v96;
              do
              {
                for (m = 0; m != v71; ++m)
                {
                  if (*(_QWORD *)v96 != v72)
                    objc_enumerationMutation(v28);
                  v74 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * m);
                  v75 = objc_msgSend(v74, "isEqual:", v93->_placeholderUUID);
                  v76 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v94, "objectForKeyedSubscript:", v74);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "doubleValue");
                  v79 = v78;
                  RTCommonSafeLog();
                  v81 = v79 + v80;
                  if (v75)
                  {
                    -[RTInferredMapItemFuserParameters placeholderMultiplier](v93->_parameters, "placeholderMultiplier");
                    RTCommonSafeLog();
                    v81 = v81 + v82;
                  }
                  objc_msgSend(v76, "numberWithDouble:", v81);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "setObject:forKeyedSubscript:", v83, v74);

                }
                v71 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v95, v111, 16);
              }
              while (v71);
            }

            v30 = 1;
            v11 = v89;
            v14 = v90;
            v15 = v91;
          }
          else
          {
            v30 = 1;
            v14 = v90;
          }
          v18 = v92;
          goto LABEL_66;
        }
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v117 = *MEMORY[0x1E0CB2D50];
        v118 = CFSTR("uniqueBluePOIUUIDs is not a subset of uniqueNonAoiUUIDsFromMap");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 8, v39);
        v28 = (id)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v120 = v86;
          v121 = 2112;
          v122 = v28;
          _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        if (!a5)
          goto LABEL_16;
        goto LABEL_35;
      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v123 = *MEMORY[0x1E0CB2D50];
      v124[0] = CFSTR("nonAoiUUIDToLogProbMap must contain the placeholder UUID");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, &v123, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 9, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityFusion);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v120 = v85;
        v121 = 2112;
        v122 = v36;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v36);

      goto LABEL_31;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bluePOIDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v32 = CFSTR("bluePOIDedupedInferredMapItems");
      goto LABEL_25;
    }
LABEL_31:
    v30 = 0;
    goto LABEL_67;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
  }

  if (!a5)
    goto LABEL_31;
  v32 = CFSTR("nonAoiUUIDToLogProbMap");
LABEL_25:
  _RTErrorInvalidParameterCreate((uint64_t)v32);
  v30 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v30;
}

id __92__RTInferredMapItemFuser_updateNonAoiUUIDToLogProbMap_bluePOIDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 nonBluePOIDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  RTInferredMapItemFuser *v13;
  _RTMap *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  RTInferredMapItemFuser *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  RTInferredMapItemFuser *v46;
  int v47;
  unint64_t v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  BOOL v58;
  NSObject *v59;
  const __CFString *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v74;
  void *v75;
  void *v76;
  const char *aSelector;
  id *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id obj;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;
  const __CFString *v99;
  _BYTE v100[128];
  uint64_t v101;
  const __CFString *v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  id v106;
  uint64_t v107;
  _QWORD v108[4];

  v108[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (!a5)
      goto LABEL_41;
    v60 = CFSTR("nonAoiUUIDToLogProbMap");
    goto LABEL_35;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonBluePOIDedupedInferredMapItems", buf, 2u);
    }

    if (!a5)
      goto LABEL_41;
    v60 = CFSTR("nonBluePOIDedupedInferredMapItems");
LABEL_35:
    _RTErrorInvalidParameterCreate((uint64_t)v60);
    v58 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", self->_placeholderUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v62 = (void *)MEMORY[0x1E0CB35C8];
    v107 = *MEMORY[0x1E0CB2D50];
    v108[0] = CFSTR("nonAoiUUIDToLogProbMap must contain the placeholder UUID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 9, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v104 = v74;
      v105 = 2112;
      v106 = v64;
      _os_log_error_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v64);

LABEL_41:
    v58 = 0;
    goto LABEL_54;
  }
  v13 = self;
  v14 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v11);
  -[_RTMap withBlock:](v14, "withBlock:", &__block_literal_global_67);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isSubsetOfSet:", v19) & 1) != 0)
  {
    v20 = objc_msgSend(v9, "count");
    -[RTInferredMapItemFuserParameters placeholderMultiplier](v13->_parameters, "placeholderMultiplier");
    v22 = v21;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v11;
    v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
    if (v85)
    {
      v79 = v19;
      v80 = v16;
      aSelector = a2;
      v78 = a5;
      v81 = v15;
      v82 = v11;
      v84 = *(_QWORD *)v94;
      v23 = v22 + (double)(unint64_t)(v20 - 1) + -1.0;
      v24 = 0x1E0CB3000uLL;
      v25 = v13;
      while (2)
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v94 != v84)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v26);
          objc_msgSend(v27, "mapItem", aSelector);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "confidence");
          if ((1.0 - v30) / v23 < 0.0)
          {
            v69 = (void *)MEMORY[0x1E0CB35C8];
            v98 = *MEMORY[0x1E0CB2D50];
            v99 = CFSTR("remainder < 0.0");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 6, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityFusion);
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(aSelector);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v104 = v76;
              v105 = 2112;
              v106 = v71;
              _os_log_error_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

            }
            if (v78)
              *v78 = objc_retainAutorelease(v71);

            v58 = 0;
            goto LABEL_51;
          }
          v86 = v26;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          objc_msgSend(v9, "allKeys");
          v88 = (id)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v90;
            do
            {
              v34 = 0;
              v87 = v32;
              do
              {
                if (*(_QWORD *)v90 != v33)
                  objc_enumerationMutation(v88);
                v35 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v34);
                if (objc_msgSend(v35, "isEqual:", v29))
                {
                  v36 = *(void **)(v24 + 2024);
                  objc_msgSend(v9, "objectForKeyedSubscript:", v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "doubleValue");
                  v39 = v38;
                  RTCommonSafeLog();
                  objc_msgSend(v36, "numberWithDouble:", v39 + v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v42 = v33;
                  v43 = v29;
                  v44 = objc_msgSend(v35, "isEqual:", v25->_placeholderUUID);
                  v45 = v9;
                  v46 = v25;
                  v47 = v44;
                  v48 = v24;
                  v49 = *(void **)(v24 + 2024);
                  v50 = v45;
                  objc_msgSend(v45, "objectForKeyedSubscript:", v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "doubleValue");
                  v52 = v51;
                  RTCommonSafeLog();
                  v54 = v52 + v53;
                  if (v47)
                  {
                    -[RTInferredMapItemFuserParameters placeholderMultiplier](v46->_parameters, "placeholderMultiplier");
                    RTCommonSafeLog();
                    v56 = v54 + v55;
                    v57 = v49;
                  }
                  else
                  {
                    v57 = v49;
                    v56 = v54;
                  }
                  objc_msgSend(v57, "numberWithDouble:", v56);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v46;
                  v9 = v50;
                  v24 = v48;
                  v29 = v43;
                  v33 = v42;
                  v32 = v87;
                }
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, v35);

                ++v34;
              }
              while (v32 != v34);
              v32 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
            }
            while (v32);
          }

          v26 = v86 + 1;
        }
        while (v86 + 1 != v85);
        v58 = 1;
        v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v100, 16);
        if (v85)
          continue;
        break;
      }
LABEL_51:
      v15 = v81;
      v11 = v82;
      v19 = v79;
      v16 = v80;
    }
    else
    {
      v58 = 1;
    }
  }
  else
  {
    v66 = (void *)MEMORY[0x1E0CB35C8];
    v101 = *MEMORY[0x1E0CB2D50];
    v102 = CFSTR("uniqueNonBluePOIUUIDs is not a subset of uniqueNonAoiUUIDs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 8, v67);
    obj = (id)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v104 = v75;
      v105 = 2112;
      v106 = obj;
      _os_log_error_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    v58 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(obj);
  }

LABEL_54:
  return v58;
}

id __95__RTInferredMapItemFuser_updateNonAoiUUIDToLogProbMap_nonBluePOIDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateNonAoiUUIDToLogProbMap:(id)a3 nonAoiDedupedInferredMapItems:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  _RTMap *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  BOOL v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  void *context;
  RTInferredMapItemFuser *contexta;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (a5)
    {
      v20 = CFSTR("nonAoiUUIDToLogProbMap");
LABEL_13:
      _RTErrorInvalidParameterCreate((uint64_t)v20);
      v22 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_14:
    v22 = 0;
    goto LABEL_41;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiDedupedInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v20 = CFSTR("nonAoiDedupedInferredMapItems");
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  context = (void *)MEMORY[0x1D8231EA8]();
  v12 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v11);
  -[_RTMap withBlock:](v12, "withBlock:", &__block_literal_global_72_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", self->_placeholderUUID);
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isEqualToSet:", v17) & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = CFSTR("uniqueNonAoiUUIDsFromArray is not equal to uniqueNonAoiUUIDsFromMap");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 7, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v41;
      v53 = 2112;
      v54 = v18;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(context);
  if (v18)
  {
    v22 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v18);
  }
  else
  {
    contexta = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = v11;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (objc_msgSend(v33, "source") == 0x4000)
            v34 = v26;
          else
            v34 = v27;
          objc_msgSend(v34, "addObject:", v33);
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v30);
    }

    v45 = 0;
    v35 = -[RTInferredMapItemFuser updateNonAoiUUIDToLogProbMap:bluePOIDedupedInferredMapItems:error:](contexta, "updateNonAoiUUIDToLogProbMap:bluePOIDedupedInferredMapItems:error:", v9, v26, &v45);
    v36 = v45;
    v37 = v36;
    if (v35)
    {
      v44 = 0;
      v22 = -[RTInferredMapItemFuser updateNonAoiUUIDToLogProbMap:nonBluePOIDedupedInferredMapItems:error:](contexta, "updateNonAoiUUIDToLogProbMap:nonBluePOIDedupedInferredMapItems:error:", v9, v27, &v44);
      v38 = v44;
      v39 = v38;
      if (a5 && !v22)
        *a5 = objc_retainAutorelease(v38);

    }
    else
    {
      v22 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v36);
    }
    v18 = 0;

  }
LABEL_41:

  return v22;
}

id __91__RTInferredMapItemFuser_updateNonAoiUUIDToLogProbMap_nonAoiDedupedInferredMapItems_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subtractMaxLogarithmFromLogProbMap:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[16];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v38;
      v12 = -1.79769313e308;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          if (v17 > v12)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            v12 = v19;

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v10);
    }
    else
    {
      v12 = -1.79769313e308;
    }
    v32 = v6;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v8, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          objc_msgSend(v27, "numberWithDouble:", v29 - v12);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v23);
    }

    v6 = v32;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: logProbMap", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("logProbMap"));
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (double)logSumExpOfLogProbMap:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  long double v10;
  uint64_t i;
  void *v12;
  long double v13;
  NSObject *v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v10 = v10 + exp(v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }
    v15 = log(v10);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: logProbMap", buf, 2u);
    }

    v15 = 0.0;
    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("logProbMap"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v15;
}

- (id)normalizeNonAoiUUIDToLogProbMap:(id)a3 aoiUUIDToProbArrayMap:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t k;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v56;
  void *v57;
  void *v58;
  const char *aSelector;
  id *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  _BYTE v78[128];
  uint64_t v79;
  void *v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v77 = 0;
      -[RTInferredMapItemFuser subtractMaxLogarithmFromLogProbMap:error:](self, "subtractMaxLogarithmFromLogProbMap:error:", v9, &v77);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v77;

      if (v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v84 = v56;
          v85 = 2112;
          v86 = v13;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

        }
        v15 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v13);
      }
      else
      {
        v76 = 0;
        -[RTInferredMapItemFuser logSumExpOfLogProbMap:error:](self, "logSumExpOfLogProbMap:error:", v12, &v76);
        v19 = v18;
        v20 = v76;
        if (v20)
        {
          _rt_log_facility_get_os_log(RTLogFacilityFusion);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v84 = v57;
            v85 = 2112;
            v86 = v20;
            _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v15 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v20);
        }
        else
        {
          aSelector = a2;
          v60 = a5;
          v62 = v11;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count") + objc_msgSend(v12, "count"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v61 = v12;
          v23 = v12;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v73;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v73 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
                v29 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v23, "objectForKeyedSubscript:", v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "doubleValue");
                objc_msgSend(v29, "numberWithDouble:", (double)exp(v31 - v19));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, v28);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
            }
            while (v25);
          }

          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v33 = v62;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
          if (v34)
          {
            v35 = v34;
            v63 = *(_QWORD *)v69;
            while (2)
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v69 != v63)
                  objc_enumerationMutation(v33);
                v37 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
                objc_msgSend(v33, "objectForKeyedSubscript:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "count");

                if (!v39)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry %@ in aoiUUIDToProbArrayMap has count 0"), v37);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v51 = (void *)MEMORY[0x1E0CB35C8];
                  v79 = *MEMORY[0x1E0CB2D50];
                  v80 = v50;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 0, v52);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  _rt_log_facility_get_os_log(RTLogFacilityFusion);
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(aSelector);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v84 = v58;
                    v85 = 2112;
                    v86 = v53;
                    _os_log_error_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

                  }
                  v12 = v61;
                  v11 = v62;
                  if (v60)
                    *v60 = objc_retainAutorelease(v53);

                  v15 = 0;
                  goto LABEL_56;
                }
                v66 = 0u;
                v67 = 0u;
                v64 = 0u;
                v65 = 0u;
                objc_msgSend(v33, "objectForKeyedSubscript:", v37);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v65;
                  v44 = 0.0;
                  do
                  {
                    for (k = 0; k != v42; ++k)
                    {
                      if (*(_QWORD *)v65 != v43)
                        objc_enumerationMutation(v40);
                      objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "doubleValue");
                      v44 = v44 + v46;
                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v64, v78, 16);
                  }
                  while (v42);
                }
                else
                {
                  v44 = 0.0;
                }

                v47 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v33, "objectForKeyedSubscript:", v37);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "numberWithDouble:", v44 / (double)(unint64_t)objc_msgSend(v48, "count"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v49, v37);

              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
              if (v35)
                continue;
              break;
            }
          }

          v15 = v22;
          v12 = v61;
          v11 = v62;
LABEL_56:
          v20 = 0;

        }
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: aoiUUIDToProbArrayMap", buf, 2u);
      }

      if (a5)
      {
        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("aoiUUIDToProbArrayMap"));
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      v12 = v9;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nonAoiUUIDToLogProbMap", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("nonAoiUUIDToLogProbMap"));
      v12 = 0;
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
      v15 = 0;
    }
  }

  return v15;
}

- (id)fusedInferredMapItemsFromUUIDToProbMap:(id)a3 inferredMapItemDeduperState:(id)a4 uuidToFusedMapItemSourceMap:(id)a5 referenceLocation:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  RTFusedInferredMapItem *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  RTFusedInferredMapItem *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const __CFString *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  id *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  const char *aSelector;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  const __CFString *v87;
  _BYTE v88[128];
  uint64_t v89;
  const __CFString *v90;
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  uint64_t v95;
  _QWORD v96[4];

  v96[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuidToProbMap", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v46 = CFSTR("uuidToProbMap");
    goto LABEL_35;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemDeduperState", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v46 = CFSTR("inferredMapItemDeduperState");
    goto LABEL_35;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: uuidToFusedMapItemSourceMap", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v46 = CFSTR("uuidToFusedMapItemSourceMap");
    goto LABEL_35;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (!a7)
      goto LABEL_41;
    v46 = CFSTR("referenceLocation");
LABEL_35:
    _RTErrorInvalidParameterCreate((uint64_t)v46);
    v44 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", self->_placeholderUUID);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v50 = (void *)MEMORY[0x1E0CB35C8];
    v95 = *MEMORY[0x1E0CB2D50];
    v96[0] = CFSTR("uuidToProbMap must contain the placeholder UUID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, &v95, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 9, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v68;
      v93 = 2112;
      v94 = v52;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a7)
      *a7 = objc_retainAutorelease(v52);

LABEL_41:
    v44 = 0;
    goto LABEL_58;
  }
  aSelector = a2;
  v19 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v15, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v21, "isEqualToSet:", v24) & 1) == 0)
  {
    v54 = (void *)MEMORY[0x1E0CB35C8];
    v89 = *MEMORY[0x1E0CB2D50];
    v90 = CFSTR("probMapUUIDs != sourceMapUUIDs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 7, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityFusion);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v69;
      v93 = 2112;
      v94 = v56;
      _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    if (a7)
    {
      v58 = objc_retainAutorelease(v56);
      v44 = 0;
      *a7 = v58;
      v25 = v58;
    }
    else
    {
      v44 = 0;
      v25 = v56;
    }
    goto LABEL_57;
  }
  v76 = v24;
  v72 = a7;
  v73 = v21;
  v74 = v17;
  v80 = v15;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v75 = v13;
  v26 = v13;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
  if (!v27)
    goto LABEL_18;
  v28 = v27;
  v29 = *(_QWORD *)v83;
  v78 = v26;
  v79 = v25;
  while (2)
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v83 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      if ((objc_msgSend(v31, "isEqual:", self->_placeholderUUID) & 1) == 0)
      {
        v81 = 0;
        objc_msgSend(v14, "mapItemForDedupedUUID:error:", v31, &v81);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v81;
        v34 = v33;
        if (v33)
        {
          v59 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v33, "userInfo");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 5, v60);
          v61 = (id)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityFusion);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v92 = v70;
            v93 = 2112;
            v94 = v61;
            _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v17 = v74;
          v13 = v75;
          v15 = v80;
          v63 = v72;
          v21 = v73;
          if (!v72)
            goto LABEL_56;
        }
        else
        {
          v35 = v28;
          v36 = v14;
          v37 = [RTFusedInferredMapItem alloc];
          objc_msgSend(v26, "objectForKeyedSubscript:", v31);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValue");
          v40 = v39;
          objc_msgSend(v80, "objectForKeyedSubscript:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](v37, "initWithMapItem:confidence:source:", v32, objc_msgSend(v41, "unsignedIntegerValue"), v40);

          v43 = v32;
          if (v42)
          {
            v25 = v79;
            objc_msgSend(v79, "addObject:", v42);

            v14 = v36;
            v26 = v78;
            v28 = v35;
            continue;
          }
          v64 = (void *)MEMORY[0x1E0CB35C8];
          v86 = *MEMORY[0x1E0CB2D50];
          v87 = CFSTR("fusedInferredMapItem was nil");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 4, v65);
          v61 = (id)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityFusion);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(aSelector);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v92 = v71;
            v93 = 2112;
            v94 = v61;
            _os_log_error_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

          }
          v17 = v74;
          v13 = v75;
          v14 = v36;
          v15 = v80;
          v63 = v72;
          v21 = v73;
          v34 = 0;
          if (!v72)
          {
            v34 = 0;
            goto LABEL_56;
          }
        }
        v61 = objc_retainAutorelease(v61);
        *v63 = v61;
LABEL_56:

        v44 = 0;
        v24 = v76;
        v25 = v79;
        goto LABEL_57;
      }
    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v88, 16);
    if (v28)
      continue;
    break;
  }
LABEL_18:

  -[RTInferredMapItemFuserParameters confidenceEqualityEpsilon](self->_parameters, "confidenceEqualityEpsilon");
  v17 = v74;
  +[RTFusedInferredMapItem sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:](RTFusedInferredMapItem, "sortFusedInferredMapItems:confidenceEqualityEpsilon:referenceLocation:distanceCalculator:ascending:", v25, v74, self->_distanceCalculator, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v75;
  v24 = v76;
  v15 = v80;
  v21 = v73;
LABEL_57:

LABEL_58:
  return v44;
}

- (id)fusedInferredMapItemsUsingCandidates:(id)a3 referenceLocation:(id)a4 snapToBestKnownPlaceAndAoi:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  _RTMap *v24;
  _RTMap *v25;
  void *v26;
  RTInferredMapItemDeduperState *v27;
  RTInferredMapItemDeduper *deduper;
  void *v29;
  id v30;
  void *v31;
  RTInferredMapItemDeduperState *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  BOOL v38;
  id v39;
  id v40;
  BOOL v41;
  id v42;
  BOOL v43;
  BOOL v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  RTInferredMapItemDeduperState *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  dispatch_once_t *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  dispatch_once_t *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  id obj;
  void *v88;
  void *v89;
  RTInferredMapItemDeduperState *v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  _QWORD v114[5];
  id v115;
  _QWORD v116[5];
  uint8_t v117[128];
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  uint64_t v121;
  uint64_t v122;

  v7 = a5;
  v122 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (v12)
  {
    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityFusion);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v119 = v14;
        v120 = 2048;
        v121 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, original candidates count, %lu", buf, 0x16u);

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v116[0] = MEMORY[0x1E0C809B0];
        v116[1] = 3221225472;
        v116[2] = __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke;
        v116[3] = &__block_descriptor_40_e23_v32__0__RTPair_8Q16_B24l;
        v116[4] = a2;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v116);
      }
      v115 = 0;
      -[RTInferredMapItemFuser preprocessCandidates:referenceLocation:snapToBestKnownPlaceAndAoi:error:](self, "preprocessCandidates:referenceLocation:snapToBestKnownPlaceAndAoi:error:", v11, v12, v7, &v115);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v115;

      if (v16)
      {
        v17 = 0;
        if (a6)
          *a6 = objc_retainAutorelease(v16);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityFusion);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 138412546;
          v119 = v21;
          v120 = 2048;
          v121 = v22;
          _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, preprocessed candidates count, %lu", buf, 0x16u);

        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v114[0] = MEMORY[0x1E0C809B0];
          v114[1] = 3221225472;
          v114[2] = __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_94;
          v114[3] = &__block_descriptor_40_e23_v32__0__RTPair_8Q16_B24l;
          v114[4] = a2;
          objc_msgSend(v15, "enumerateObjectsUsingBlock:", v114);
        }
        v23 = objc_msgSend(v15, "count");
        v24 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v15);
        v25 = v24;
        if (v23 > 1)
        {
          -[_RTMap withBlock:](v24, "withBlock:", &__block_literal_global_99);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = objc_alloc_init(RTInferredMapItemDeduperState);
          deduper = self->_deduper;
          v113 = 0;
          -[RTInferredMapItemDeduper dedupeInferredMapItems:state:error:](deduper, "dedupeInferredMapItems:state:error:", v26, v27, &v113);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v113;
          v97 = v30;
          if (v30)
          {
            v95 = v26;
            v31 = v29;
            v32 = v27;
            v33 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v30, "userInfo");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("RTInferredMapItemFuserErrorDomain"), 5, v34);
            v35 = (id)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityFusion);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v119 = v49;
              v120 = 2112;
              v121 = (uint64_t)v35;
              _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, deduping error, %@", buf, 0x16u);

            }
            if (a6)
            {
              v35 = objc_retainAutorelease(v35);
              v17 = 0;
              *a6 = v35;
            }
            else
            {
              v17 = 0;
            }
            v27 = v32;
            v29 = v31;
            v26 = v95;
          }
          else
          {
            v112 = 0;
            -[RTInferredMapItemFuser populateMapItemSourceEntriesForDedupedInferredMapItems:error:](self, "populateMapItemSourceEntriesForDedupedInferredMapItems:error:", v29, &v112);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v112;
            if (v94)
            {
              _rt_log_facility_get_os_log(RTLogFacilityFusion);
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(a2);
                v53 = v26;
                v54 = v29;
                v55 = v27;
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v119 = v56;
                v120 = 2112;
                v121 = (uint64_t)v94;
                _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, populate error, %@", buf, 0x16u);

                v27 = v55;
                v29 = v54;
                v26 = v53;
              }

              if (a6)
              {
                v35 = v94;
                v17 = 0;
                *a6 = objc_retainAutorelease(v94);
              }
              else
              {
                v17 = 0;
                v35 = v94;
              }
            }
            else
            {
              v89 = v29;
              v90 = v27;
              v110 = 0;
              v111 = 0;
              v109 = 0;
              v38 = -[RTInferredMapItemFuser partitionDedupedInferredMapItems:intoNonAoiDedupedInferredMapItems:aoiDedupedInferredMapItems:error:](self, "partitionDedupedInferredMapItems:intoNonAoiDedupedInferredMapItems:aoiDedupedInferredMapItems:error:", v29, &v111, &v110, &v109);
              v39 = v111;
              v40 = v110;
              v91 = v109;
              v92 = v39;
              v88 = v40;
              if (v38)
              {
                v107 = 0;
                v108 = 0;
                v106 = 0;
                v41 = -[RTInferredMapItemFuser initializeEntriesForNonAoiDedupedInferredMapItems:aoiDedupedInferredMapItems:nonAoiUUIDToLogProbMap:aoiUUIDToProbArrayMap:error:](self, "initializeEntriesForNonAoiDedupedInferredMapItems:aoiDedupedInferredMapItems:nonAoiUUIDToLogProbMap:aoiUUIDToProbArrayMap:error:", v39, v40, &v108, &v107, &v106);
                v84 = v108;
                v42 = v107;
                v85 = v106;
                v83 = v42;
                if (v41)
                {
                  v105 = 0;
                  v43 = -[RTInferredMapItemFuser updateAoiUUIDToProbArrayMap:aoiDedupedInferredMapItems:error:](self, "updateAoiUUIDToProbArrayMap:aoiDedupedInferredMapItems:error:", v42, v40, &v105);
                  v82 = v105;
                  v29 = v89;
                  if (v43)
                  {
                    v104 = 0;
                    v44 = -[RTInferredMapItemFuser updateNonAoiUUIDToLogProbMap:nonAoiDedupedInferredMapItems:error:](self, "updateNonAoiUUIDToLogProbMap:nonAoiDedupedInferredMapItems:error:", v84, v92, &v104);
                    v81 = v104;
                    if (v44)
                    {
                      v103 = 0;
                      -[RTInferredMapItemFuser normalizeNonAoiUUIDToLogProbMap:aoiUUIDToProbArrayMap:error:](self, "normalizeNonAoiUUIDToLogProbMap:aoiUUIDToProbArrayMap:error:", v84, v42, &v103);
                      v45 = objc_claimAutoreleasedReturnValue();
                      v79 = (void *)v45;
                      v80 = v103;
                      if (v80)
                      {
                        _rt_log_facility_get_os_log(RTLogFacilityFusion);
                        v46 = objc_claimAutoreleasedReturnValue();
                        v27 = v90;
                        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                        {
                          NSStringFromSelector(a2);
                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v119 = v75;
                          v120 = 2112;
                          v121 = (uint64_t)v80;
                          _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, "%@, normalize error, %@", buf, 0x16u);

                          v27 = v90;
                        }

                        v17 = 0;
                        if (a6)
                          *a6 = objc_retainAutorelease(v80);
                        v35 = 0;
                        v48 = v91;
                        v51 = v92;
                      }
                      else
                      {
                        v102 = 0;
                        v27 = v90;
                        -[RTInferredMapItemFuser fusedInferredMapItemsFromUUIDToProbMap:inferredMapItemDeduperState:uuidToFusedMapItemSourceMap:referenceLocation:error:](self, "fusedInferredMapItemsFromUUIDToProbMap:inferredMapItemDeduperState:uuidToFusedMapItemSourceMap:referenceLocation:error:", v45, v90, v93, v12, &v102);
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        v77 = v59;
                        v78 = v102;
                        if (v78)
                        {
                          _rt_log_facility_get_os_log(RTLogFacilityFusion);
                          v60 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                          {
                            NSStringFromSelector(a2);
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412546;
                            v119 = v76;
                            v120 = 2112;
                            v121 = (uint64_t)v78;
                            _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "%@, generate error, %@", buf, 0x16u);

                            v27 = v90;
                          }

                          v17 = 0;
                          if (a6)
                            *a6 = objc_retainAutorelease(v78);
                        }
                        else
                        {
                          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                          {
                            v96 = v26;
                            v100 = 0u;
                            v101 = 0u;
                            v98 = 0u;
                            v99 = 0u;
                            obj = v59;
                            v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
                            if (v62)
                            {
                              v63 = v62;
                              v64 = *(_QWORD *)v99;
                              v65 = RTLogFacilityFusion;
                              do
                              {
                                v66 = 0;
                                v86 = v63;
                                do
                                {
                                  if (*(_QWORD *)v99 != v64)
                                    objc_enumerationMutation(obj);
                                  v67 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v66);
                                  _rt_log_facility_get_os_log(v65);
                                  v68 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                                  {
                                    NSStringFromSelector(a2);
                                    v69 = v65;
                                    v70 = v64;
                                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                                    *(_DWORD *)buf = 138412546;
                                    v119 = v71;
                                    v120 = 2112;
                                    v121 = v67;
                                    _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "%@, fused map item, %@", buf, 0x16u);

                                    v64 = v70;
                                    v65 = v69;
                                    v63 = v86;
                                  }

                                  ++v66;
                                }
                                while (v63 != v66);
                                v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
                              }
                              while (v63);
                            }

                            v26 = v96;
                            v29 = v89;
                            v27 = v90;
                            v59 = v77;
                          }
                          v17 = v59;
                        }
                        v35 = 0;
                        v48 = v91;
                        v51 = v92;

                      }
                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityFusion);
                      v57 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      {
                        NSStringFromSelector(a2);
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v119 = v74;
                        v120 = 2112;
                        v121 = (uint64_t)v81;
                        _os_log_error_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_ERROR, "%@, update non aoi error, %@", buf, 0x16u);

                      }
                      v17 = 0;
                      if (a6)
                        *a6 = objc_retainAutorelease(v81);
                      v27 = v90;
                      v48 = v91;
                      v35 = 0;
                      v51 = v92;
                    }

                  }
                  else
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityFusion);
                    v52 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                    {
                      NSStringFromSelector(a2);
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v119 = v72;
                      v120 = 2112;
                      v121 = (uint64_t)v82;
                      _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "%@, update aoi error, %@", buf, 0x16u);

                    }
                    v17 = 0;
                    if (a6)
                      *a6 = objc_retainAutorelease(v82);
                    v27 = v90;
                    v48 = v91;
                    v35 = 0;
                    v51 = v92;
                  }

                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityFusion);
                  v50 = objc_claimAutoreleasedReturnValue();
                  v29 = v89;
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    NSStringFromSelector(a2);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v119 = v61;
                    v120 = 2112;
                    v121 = (uint64_t)v85;
                    _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "%@, initialize error, %@", buf, 0x16u);

                  }
                  v17 = 0;
                  if (a6)
                    *a6 = objc_retainAutorelease(v85);
                  v27 = v90;
                  v48 = v91;
                  v35 = 0;
                  v51 = v92;
                }

              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityFusion);
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(a2);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v119 = v58;
                  v120 = 2112;
                  v121 = (uint64_t)v91;
                  _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, partition error, %@", buf, 0x16u);

                }
                v29 = v89;
                if (a6)
                {
                  v48 = v91;
                  v17 = 0;
                  *a6 = objc_retainAutorelease(v91);
                  v27 = v90;
                }
                else
                {
                  v17 = 0;
                  v27 = v90;
                  v48 = v91;
                }
                v35 = 0;
                v51 = v92;
              }

            }
          }

        }
        else
        {
          -[_RTMap withBlock:](v24, "withBlock:", &__block_literal_global_97_0);
          v17 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: candidates", buf, 2u);
      }

      if (a6)
      {
        _RTErrorInvalidParameterCreate((uint64_t)CFSTR("candidates"));
        v15 = 0;
        v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
        v17 = 0;
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceLocation", buf, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("referenceLocation"));
      v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    v15 = v11;
  }

  return v17;
}

void __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFusion);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, original candidate, %lu, %@", (uint8_t *)&v8, 0x20u);

  }
}

void __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_94(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityFusion);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, input candidate, %lu, %@", (uint8_t *)&v8, 0x20u);

  }
}

RTFusedInferredMapItem *__114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_95(uint64_t a1, void *a2)
{
  id v2;
  RTFusedInferredMapItem *v3;
  void *v4;
  RTFusedInferredMapItem *v5;

  v2 = a2;
  v3 = [RTFusedInferredMapItem alloc];
  objc_msgSend(v2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[RTFusedInferredMapItem initWithInferredMapItem:](v3, "initWithInferredMapItem:", v4);
  return v5;
}

uint64_t __114__RTInferredMapItemFuser_fusedInferredMapItemsUsingCandidates_referenceLocation_snapToBestKnownPlaceAndAoi_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "firstObject");
}

- (id)highestConfidenceAoiMapItemFromFusedInferredMapItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "mapItem", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "extendedAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 && objc_msgSend(v12, "wifiFingerprintLabelType") == 2)
          {
            if (v7)
            {
              objc_msgSend(v10, "confidence");
              v14 = v13;
              objc_msgSend(v7, "confidence");
              if (v14 > v15)
              {
                v16 = v10;

                v7 = v16;
              }
            }
            else
            {
              v7 = v10;
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)bestFromFusedInferredMapItems:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v6, "firstObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "confidence"),
        v10 = v9,
        -[RTInferredMapItemFuserParameters aoiConsiderThreshold](self->_parameters, "aoiConsiderThreshold"),
        v12 = v11,
        v8,
        v10 >= v12))
  {
LABEL_11:
    objc_msgSend(v6, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[RTInferredMapItemFuser highestConfidenceAoiMapItemFromFusedInferredMapItems:](self, "highestConfidenceAoiMapItemFromFusedInferredMapItems:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13
    || (objc_msgSend(v13, "confidence"),
        v16 = v15,
        -[RTInferredMapItemFuserParameters aoiUseThreshold](self->_parameters, "aoiUseThreshold"),
        v16 <= v17))
  {

    goto LABEL_11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityFusion);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v19;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, using AOI fusedInferredMapItem, %@", (uint8_t *)&v21, 0x16u);

  }
LABEL_12:

  return v14;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTInferredMapItemFuserParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTInferredMapItemDeduper)deduper
{
  return self->_deduper;
}

- (void)setDeduper:(id)a3
{
  objc_storeStrong((id *)&self->_deduper, a3);
}

- (NSUUID)placeholderUUID
{
  return self->_placeholderUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderUUID, 0);
  objc_storeStrong((id *)&self->_deduper, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
