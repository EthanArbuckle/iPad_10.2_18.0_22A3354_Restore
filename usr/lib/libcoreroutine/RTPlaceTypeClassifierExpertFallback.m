@implementation RTPlaceTypeClassifierExpertFallback

- (RTPlaceTypeClassifierExpertFallback)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_learnedLocationStore_locationManager_mapServiceManager_visitManager_);
}

- (RTPlaceTypeClassifierExpertFallback)initWithDistanceCalculator:(id)a3 learnedLocationStore:(id)a4 locationManager:(id)a5 mapServiceManager:(id)a6 visitManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RTPlaceTypeClassifierExpertFallback *v18;
  id *p_isa;
  RTPlaceTypeClassifierExpertFallback *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v25;
  id v26;
  objc_super v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v15)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: mapServiceManager";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  v26 = v17;
  if (v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)RTPlaceTypeClassifierExpertFallback;
    v18 = -[RTPlaceTypeClassifierExpertFallback init](&v27, sel_init);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_distanceCalculator, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitManager", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_19:

  return v20;
}

- (id)classifyWithError:(id *)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  objc_class *v43;
  id v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  dispatch_semaphore_t v54;
  void *v55;
  uint64_t v56;
  dispatch_time_t v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  char v71;
  id v72;
  NSObject *v73;
  objc_class *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  void *v83;
  uint64_t v84;
  void *v85;
  double v86;
  double v87;
  uint64_t v88;
  NSObject *v89;
  objc_class *v90;
  id v91;
  void *v92;
  uint64_t *v93;
  uint64_t v94;
  void *v96;
  void *v97;
  id v98;
  NSObject *v101;
  double v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  id v109;
  _QWORD v110[4];
  NSObject *v111;
  uint64_t *v112;
  uint64_t *v113;
  _QWORD v114[4];
  NSObject *v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;
  double *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  _QWORD v136[4];
  NSObject *v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t v140;
  id *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  id v151;
  uint64_t v152;
  _BYTE buf[12];
  __int16 v154;
  void *v155;
  __int16 v156;
  id v157;
  __int16 v158;
  double v159;
  __int16 v160;
  id v161;
  __int16 v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t (*v167)(uint64_t, uint64_t);
  void (*v168)(uint64_t);
  id v169;
  _QWORD v170[4];

  v170[1] = *MEMORY[0x1E0C80C00];
  v146 = 0;
  v147 = &v146;
  v148 = 0x3032000000;
  v149 = __Block_byref_object_copy__68;
  v150 = __Block_byref_object_dispose__68;
  v151 = 0;
  v140 = 0;
  v141 = (id *)&v140;
  v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__68;
  v144 = __Block_byref_object_dispose__68;
  v145 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTPlaceTypeClassifierExpertFallback learnedLocationStore](self, "learnedLocationStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = MEMORY[0x1E0C809B0];
  v136[1] = 3221225472;
  v136[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke;
  v136[3] = &unk_1E9297478;
  v138 = &v146;
  v139 = &v140;
  v6 = v4;
  v137 = v6;
  objc_msgSend(v5, "fetchLocationOfInterestVisitedLastWithHandler:", v136);

  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v7, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_52);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v19 = (void *)MEMORY[0x1E0CB35C8];
  v164 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v164, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = objc_retainAutorelease(v21);

    v23 = 0;
  }
  else
  {
LABEL_6:
    v22 = 0;
    v23 = 1;
  }

  v24 = v22;
  if ((v23 & 1) == 0)
    objc_storeStrong(v141 + 5, v22);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v147[5];
    v30 = v141[5];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v27;
    v154 = 2112;
    v155 = v28;
    v156 = 2112;
    v157 = v29;
    v158 = 2112;
    v159 = *(double *)&v30;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, locationsOfInterestVisitedLast, %@, error, %@", buf, 0x2Au);

  }
  v31 = v141[5];
  if (!v31 && !v147[5])
  {
    v33 = dispatch_group_create();
    v164 = 0;
    v165 = &v164;
    v166 = 0x3032000000;
    v167 = __Block_byref_object_copy__68;
    v168 = __Block_byref_object_dispose__68;
    v169 = 0;
    v130 = 0;
    v131 = &v130;
    v132 = 0x3032000000;
    v133 = __Block_byref_object_copy__68;
    v134 = __Block_byref_object_dispose__68;
    v135 = 0;
    v124 = 0;
    v125 = (double *)&v124;
    v126 = 0x3032000000;
    v127 = __Block_byref_object_copy__68;
    v128 = __Block_byref_object_dispose__68;
    v129 = 0;
    v118 = 0;
    v119 = &v118;
    v120 = 0x3032000000;
    v121 = __Block_byref_object_copy__68;
    v122 = __Block_byref_object_dispose__68;
    v123 = 0;
    dispatch_group_enter(v33);
    -[RTPlaceTypeClassifierExpertFallback locationManager](self, "locationManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = MEMORY[0x1E0C809B0];
    v114[1] = 3221225472;
    v114[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_3;
    v114[3] = &unk_1E929AB38;
    v116 = &v124;
    v117 = &v164;
    v35 = v33;
    v115 = v35;
    objc_msgSend(v34, "fetchCurrentLocationWithHandler:", v114);

    dispatch_group_enter(v35);
    -[RTPlaceTypeClassifierExpertFallback visitManager](self, "visitManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc(MEMORY[0x1E0D18508]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E93282C8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v37, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, v38, 0, 0, &unk_1E93282B0, v39);
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_11;
    v110[3] = &unk_1E9296EE0;
    v112 = &v118;
    v113 = &v130;
    v41 = v35;
    v111 = v41;
    objc_msgSend(v36, "fetchStoredVisitsWithOptions:handler:", v40, v110);

    dispatch_group_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)v165[5];
      v47 = v125[5];
      v48 = (void *)v131[5];
      v49 = v119[5];
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v44;
      v154 = 2112;
      v155 = v45;
      v156 = 2112;
      v157 = v46;
      v158 = 2112;
      v159 = v47;
      v160 = 2112;
      v161 = v48;
      v162 = 2112;
      v163 = v49;
      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, fetched current location, %@, fetchLocationError, %@, fetched current visit, %@, fetchVisitError, %@", buf, 0x3Eu);

    }
    v50 = (void *)*((_QWORD *)v125 + 5);
    if (v50 || (v51 = (void *)v165[5]) == 0)
    {
      if (a3)
      {
        v32 = 0;
        *a3 = objc_retainAutorelease(v50);
LABEL_51:

        _Block_object_dispose(&v118, 8);
        _Block_object_dispose(&v124, 8);

        _Block_object_dispose(&v130, 8);
        _Block_object_dispose(&v164, 8);

        goto LABEL_52;
      }
    }
    else
    {
      v52 = v51;
      if (v119[5])
        goto LABEL_23;
      objc_msgSend((id)v131[5], "location");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v80)
        goto LABEL_23;
      objc_msgSend((id)v131[5], "exit");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v81 == 0;

      if (!v82)
        goto LABEL_23;
      -[RTPlaceTypeClassifierExpertFallback distanceCalculator](self, "distanceCalculator");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v165[5];
      objc_msgSend((id)v131[5], "location");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = 0;
      objc_msgSend(v83, "distanceFromLocation:toLocation:error:", v84, v85, &v109);
      v87 = v86;
      v98 = v109;

      if (v87 < 250.0)
      {
        objc_msgSend((id)v131[5], "location");
        v88 = objc_claimAutoreleasedReturnValue();

        v52 = (id)v88;
      }
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        v90 = (objc_class *)objc_opt_class();
        NSStringFromClass(v90);
        v91 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v91;
        v154 = 2112;
        v155 = v92;
        v156 = 2112;
        v157 = v52;
        v158 = 2048;
        v159 = v87;
        v160 = 2112;
        v161 = v98;
        _os_log_impl(&dword_1D1A22000, v89, OS_LOG_TYPE_INFO, "%@, %@, selected current location, %@, distance, %.1f, error, %@", buf, 0x34u);

      }
      if (v52)
      {
LABEL_23:
        -[RTPlaceTypeClassifierExpertFallback learnedLocationStore](self, "learnedLocationStore");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "predicateForObjectsFromCurrentDevice");
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = dispatch_semaphore_create(0);
        v103 = 0;
        v104 = &v103;
        v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__68;
        v107 = __Block_byref_object_dispose__68;
        v108 = 0;
        -[RTPlaceTypeClassifierExpertFallback learnedLocationStore](self, "learnedLocationStore");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v54;
        v102 = COERCE_DOUBLE(v52);
        objc_msgSend(v55, "fetchPlacesWithinDistance:location:predicate:handler:", 250.0);

        v7 = v101;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v7, v57))
          goto LABEL_28;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "timeIntervalSinceDate:", v56);
        v59 = v58;
        v60 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_52);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "filteredArrayUsingPredicate:", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "firstObject");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "submitToCoreAnalytics:type:duration:", v64, 1, v59);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v66 = (void *)MEMORY[0x1E0CB35C8];
        v170[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v170, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
        {
          v69 = objc_retainAutorelease(v68);

          v70 = (void *)v56;
          v71 = 0;
        }
        else
        {
LABEL_28:
          v70 = (void *)v56;
          v71 = 1;
          v69 = v24;
        }

        v72 = v69;
        if ((v71 & 1) == 0)
          objc_storeStrong(v141 + 5, v69);
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = (objc_class *)objc_opt_class();
          NSStringFromClass(v74);
          v75 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = (void *)v104[5];
          v78 = v141[5];
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v75;
          v154 = 2112;
          v155 = v76;
          v156 = 2112;
          v157 = v77;
          v158 = 2112;
          v159 = v102;
          v160 = 2112;
          v161 = v78;
          _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_INFO, "%@, %@, current place, %@, current location, %@, error, %@", buf, 0x34u);

        }
        v79 = v141[5];
        if (v79 || (v93 = v104, (v94 = v104[5]) == 0))
        {
          v32 = 0;
          if (a3)
            *a3 = objc_retainAutorelease(v79);
        }
        else
        {
          if (a3)
          {
            *a3 = 0;
            v94 = v93[5];
          }
          v152 = v94;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v152, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
        }

        _Block_object_dispose(&v103, 8);
        v24 = v72;
        goto LABEL_51;
      }
      if (a3)
      {
        v32 = 0;
        *a3 = 0;
        goto LABEL_51;
      }
    }
    v32 = 0;
    goto LABEL_51;
  }
  v32 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v31);
LABEL_52:

  _Block_object_dispose(&v140, 8);
  _Block_object_dispose(&v146, 8);

  return v32;
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v9)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v9);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_11(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v12, "mapItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v12);
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      v46 = v16;
      v47 = 2112;
      v48 = v17;
      v49 = 2112;
      v50 = v18;
      v51 = 2112;
      v52 = v19;
      v53 = 2112;
      v54 = v6;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, fetched place, %@, current location, %@, error, %@", buf, 0x34u);

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v23 = objc_alloc(MEMORY[0x1E0D183F8]);
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v23, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", 1, v25, 0);

      objc_msgSend(*(id *)(a1 + 40), "mapServiceManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_15;
      v34[3] = &unk_1E929D850;
      v28 = *(_QWORD *)(a1 + 48);
      v38 = *(_QWORD *)(a1 + 56);
      v29 = *(id *)(a1 + 32);
      v30 = *(_QWORD *)(a1 + 40);
      v31 = *(void **)(a1 + 48);
      v35 = v29;
      v36 = v30;
      v40 = *(_QWORD *)(a1 + 72);
      v32 = v31;
      v33 = *(_QWORD *)(a1 + 64);
      v37 = v32;
      v39 = v33;
      objc_msgSend(v27, "fetchMapItemsFromLocation:options:handler:", v28, v26, v34);

      goto LABEL_17;
    }
    objc_msgSend(*(id *)(a1 + 40), "updatePlace:");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_17:

}

void __57__RTPlaceTypeClassifierExpertFallback_classifyWithError___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  RTLearnedPlace *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (v6)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSource:", 0x20000);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v7;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, created mapItem, %@, current location, %@, error, %@", buf, 0x34u);

    }
    v13 = [RTLearnedPlace alloc];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v13, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v14, 1, 8, v7, 0, v15, v16);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

- (id)updatePlace:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  RTLearnedPlace *v20;
  void *v21;
  void *v22;
  RTLearnedPlace *v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "dateByAddingTimeInterval:", 4838400.0);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_alloc(MEMORY[0x1E0D18330]);
    objc_msgSend(v3, "mapItem");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "address");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "identifier");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "address");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "geoAddressData");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "address");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "subPremises");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "address");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "subThoroughfare");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "address");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "thoroughfare");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "address");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "subLocality");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "address");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "locality");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "address");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "subAdministrativeArea");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "address");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "administrativeArea");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "address");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "administrativeAreaCode");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "address");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "postalCode");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "address");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "country");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "address");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "countryCode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "address");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "inlandWater");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "address");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "ocean");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "address");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "areasOfInterest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "address");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v30, "isIsland");
    objc_msgSend(v3, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iso3166CountryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iso3166SubdivisionCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = v5;
    v93 = (void *)objc_msgSend(v92, "initWithIdentifier:geoAddressData:subPremises:subThoroughfare:thoroughfare:subLocality:locality:subAdministrativeArea:administrativeArea:administrativeAreaCode:postalCode:country:countryCode:inlandWater:ocean:areasOfInterest:isIsland:creationDate:expirationDate:iso3166CountryCode:iso3166SubdivisionCode:", v90, v88, v86, v84, v82, v78, v80, v75, v73, v71, v69, v67, v32, v29, v28,
                    v4,
                    v27,
                    v95,
                    v94,
                    v8,
                    v11);

    v76 = objc_alloc(MEMORY[0x1E0D183E8]);
    objc_msgSend(v3, "mapItem");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "identifier");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "category");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "location");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v81, "mapItemPlaceType");
    objc_msgSend(v3, "mapItem");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v79, "muid");
    objc_msgSend(v3, "mapItem");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v72, "resultProviderID");
    objc_msgSend(v3, "mapItem");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "geoMapItemHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extendedAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayLanguage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = objc_msgSend(v19, "disputed");
    v77 = (void *)objc_msgSend(v76, "initWithIdentifier:name:category:address:location:source:mapItemPlaceType:muid:resultProviderID:geoMapItemHandle:creationDate:expirationDate:extendedAttributes:displayLanguage:disputed:", v91, v12, v74, v93, v70, 0x20000, v66, v64, v13, v14, v95, v94, v16, v18, v26);

    v20 = [RTLearnedPlace alloc];
    objc_msgSend(v3, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "customLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[RTLearnedPlace initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:](v20, "initWithIdentifier:type:typeSource:mapItem:customLabel:creationDate:expirationDate:", v21, 1, 8, v77, v22, v95, v94);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", buf, 2u);
    }

    v23 = 0;
  }

  return v23;
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

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
