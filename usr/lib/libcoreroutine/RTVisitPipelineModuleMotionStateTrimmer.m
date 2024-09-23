@implementation RTVisitPipelineModuleMotionStateTrimmer

- (RTVisitPipelineModuleMotionStateTrimmer)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMotionActivityManager_defaultsManager_);
}

- (RTVisitPipelineModuleMotionStateTrimmer)initWithMotionActivityManager:(id)a3 defaultsManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTVisitPipelineModuleMotionStateTrimmer *v10;
  RTVisitPipelineModuleMotionStateTrimmer *v11;
  RTVisitPipelineMotionAccumulatorParams *v12;
  RTVisitPipelineMotionAccumulatorParams *motionAccumulatorParams;
  RTVisitPipelineModuleMotionStateTrimmer *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: motionActivityManager";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTVisitPipelineModuleMotionStateTrimmer;
  v10 = -[RTVisitPipelineModuleMotionStateTrimmer init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_motionActivityManager, a3);
    v12 = -[RTVisitPipelineMotionAccumulatorParams initWithDefaultsManager:]([RTVisitPipelineMotionAccumulatorParams alloc], "initWithDefaultsManager:", v9);
    motionAccumulatorParams = v11->_motionAccumulatorParams;
    v11->_motionAccumulatorParams = v12;

  }
  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

- (id)_fetchActivitiesWithinDateInterval:(id)a3 error:(id *)a4
{
  id v7;
  dispatch_semaphore_t v8;
  RTMotionActivityManager *motionActivityManager;
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
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  int v40;
  objc_class *v42;
  id v43;
  void *v44;
  objc_class *v45;
  id v46;
  void *v47;
  void *v48;
  const char *aSelector;
  NSObject *dsema;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  NSObject *v56;
  uint8_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint8_t v65[8];
  uint8_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  _BYTE buf[12];
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    *(_QWORD *)v65 = 0;
    v66 = v65;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__83;
    v69 = __Block_byref_object_dispose__83;
    v70 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__83;
    v63 = __Block_byref_object_dispose__83;
    v64 = 0;
    v8 = dispatch_semaphore_create(0);
    motionActivityManager = self->_motionActivityManager;
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __84__RTVisitPipelineModuleMotionStateTrimmer__fetchActivitiesWithinDateInterval_error___block_invoke;
    v55[3] = &unk_1E9296EE0;
    v57 = v65;
    v58 = &v59;
    v12 = v8;
    v56 = v12;
    -[RTMotionActivityManager fetchMotionActivitiesFromStartDate:endDate:handler:](motionActivityManager, "fetchMotionActivitiesFromStartDate:endDate:handler:", v10, v11, v55);

    dsema = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(dsema, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_68);
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
      v77[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v77, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v26 = objc_retainAutorelease(v26);

      }
    }
    else
    {
      v26 = 0;
    }

    v29 = v26;
    v30 = v29;
    if (a4 && v29)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v43;
        v73 = 2112;
        v74 = v44;
        v75 = 2112;
        v76 = v30;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v32 = objc_retainAutorelease(v30);
    }
    else
    {
      if (!a4 || !v60[5])
      {
        v28 = (id)objc_opt_new();
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v34 = *((id *)v66 + 5);
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v52 != v36)
                objc_enumerationMutation(v34);
              v38 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(v38, "startDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v7, "containsDate:", v39);

              if (v40)
                objc_msgSend(v28, "addObject:", v38);
            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
          }
          while (v35);
        }

        goto LABEL_33;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)v60[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v46;
        v73 = 2112;
        v74 = v47;
        v75 = 2112;
        v76 = v48;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v32 = objc_retainAutorelease((id)v60[5]);
    }
    *a4 = v32;
    v28 = *((id *)v66 + 5);
LABEL_33:

    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(v65, 8);

    goto LABEL_34;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v65 = 0;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v65, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
    v28 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = 0;
  }
LABEL_34:

  return v28;
}

void __84__RTVisitPipelineModuleMotionStateTrimmer__fetchActivitiesWithinDateInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_trimVisitClusterForMotionActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  RTVisitPipelineMotionAccumulator *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  RTVisitPipelineMotionAccumulator *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  objc_class *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  RTVisitCluster *v87;
  RTVisitLocationPoints *v88;
  RTVisitCluster *v89;
  objc_class *v91;
  void *v92;
  char *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  objc_class *v98;
  void *v99;
  char *v100;
  uint64_t v101;
  objc_class *v102;
  void *v103;
  void *v104;
  char *v105;
  uint64_t v106;
  objc_class *v107;
  void *v108;
  void *v109;
  char *v110;
  objc_class *v111;
  void *v112;
  char *v113;
  objc_class *v114;
  void *v115;
  char *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  objc_class *v122;
  void *v123;
  char *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  char *aSelectora;
  char *aSelectorb;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  RTVisitPipelineModuleMotionStateTrimmer *v145;
  void *v146;
  void *v147;
  void *v148;
  os_log_t log;
  void *v150;
  void *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  uint8_t buf[4];
  void *v167;
  __int16 v168;
  char *v169;
  __int16 v170;
  uint64_t v171;
  __int16 v172;
  id v173;
  __int16 v174;
  void *v175;
  __int16 v176;
  void *v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  uint64_t v181;
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v91 = (objc_class *)objc_opt_class();
    NSStringFromClass(v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v93 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visit");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "entry");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visit");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "exit");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v167 = v92;
    v168 = 2112;
    v169 = v93;
    v170 = 2112;
    v171 = (uint64_t)v95;
    v172 = 2112;
    v173 = v97;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@ %@: Trimming input cluster for motion, between %@ and %@", buf, 0x2Au);

  }
  objc_msgSend(v4, "visit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entry");
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "visit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exit");
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x1E0C99D68]);
  -[RTVisitPipelineMotionAccumulatorParams maxTimeToTrim](self->_motionAccumulatorParams, "maxTimeToTrim");
  v10 = v9;
  objc_msgSend(v4, "points");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithTimeInterval:sinceDate:", v12, v10);

  -[RTVisitPipelineMotionAccumulatorParams maxTimeToTrim](self->_motionAccumulatorParams, "maxTimeToTrim");
  v15 = v14;
  -[RTVisitPipelineMotionAccumulatorParams motionLookWindowOutsideVisit](self->_motionAccumulatorParams, "motionLookWindowOutsideVisit");
  objc_msgSend(v13, "dateByAddingTimeInterval:", -(v15 + v16));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v13;
  v165 = 0;
  v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v140, v13);
  -[RTVisitPipelineModuleMotionStateTrimmer _fetchActivitiesWithinDateInterval:error:](self, "_fetchActivitiesWithinDateInterval:error:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  if (v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v107 = (objc_class *)objc_opt_class();
      NSStringFromClass(v107);
      v108 = v17;
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v110 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v167 = v109;
      v168 = 2112;
      v169 = v110;
      v170 = 2112;
      v171 = (uint64_t)v18;
      v172 = 2112;
      v173 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "%@ %@: Failed to fetch motion activities at start, error, %@, for cluster %@", buf, 0x2Au);

      v17 = v108;
    }

  }
  v145 = self;
  v20 = -[RTVisitPipelineMotionAccumulator initWithParams:processInReverse:]([RTVisitPipelineMotionAccumulator alloc], "initWithParams:processInReverse:", self->_motionAccumulatorParams, 1);
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v142 = v17;
  objc_msgSend(v17, "reverseObjectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v162;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v162 != v24)
          objc_enumerationMutation(v21);
        -[RTVisitPipelineMotionAccumulator processMotionActivity:](v20, "processMotionActivity:", *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * i));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
    }
    while (v23);
  }

  objc_msgSend(v144, "startDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitPipelineMotionAccumulator finishMotionObservations:](v20, "finishMotionObservations:", v26);

  -[RTVisitPipelineMotionAccumulator getTrimDate](v20, "getTrimDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v27;
  if (v27)
  {
    objc_msgSend(v27, "laterDate:", v151);
    v28 = objc_claimAutoreleasedReturnValue();

    v151 = (void *)v28;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v98 = (objc_class *)objc_opt_class();
    NSStringFromClass(v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v100 = (char *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v142, "count");
    *(_DWORD *)buf = 138412802;
    v167 = v99;
    v168 = 2112;
    v169 = v100;
    v170 = 2048;
    v171 = v101;
    _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "%@ %@: Visit start, number of detected moving activities: %lu.", buf, 0x20u);

  }
  v30 = objc_alloc(MEMORY[0x1E0C99D68]);
  -[RTVisitPipelineMotionAccumulatorParams maxTimeToTrim](v145->_motionAccumulatorParams, "maxTimeToTrim");
  v32 = -v31;
  objc_msgSend(v4, "visit");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "exit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v30, "initWithTimeInterval:sinceDate:", v34, v32);

  v36 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v4, "visit");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entry");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v35;
  objc_msgSend(v35, "laterDate:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitPipelineMotionAccumulatorParams maxTimeToTrim](v145->_motionAccumulatorParams, "maxTimeToTrim");
  v41 = v40;
  -[RTVisitPipelineMotionAccumulatorParams motionLookWindowOutsideVisit](v145->_motionAccumulatorParams, "motionLookWindowOutsideVisit");
  v43 = objc_msgSend(v36, "initWithStartDate:duration:", v39, v41 + v42);

  v44 = (void *)v43;
  v160 = v18;
  -[RTVisitPipelineModuleMotionStateTrimmer _fetchActivitiesWithinDateInterval:error:](v145, "_fetchActivitiesWithinDateInterval:error:", v43, &v160);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v160;

  if (v46)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v111 = (objc_class *)objc_opt_class();
      NSStringFromClass(v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v113 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v167 = v112;
      v168 = 2112;
      v169 = v113;
      v170 = 2112;
      v171 = (uint64_t)v46;
      v172 = 2112;
      v173 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEBUG, "%@ %@: Failed to fetch motion activities at end, error, %@, for cluster %@", buf, 0x2Au);

    }
  }
  v48 = -[RTVisitPipelineMotionAccumulator initWithParams:processInReverse:]([RTVisitPipelineMotionAccumulator alloc], "initWithParams:processInReverse:", v145->_motionAccumulatorParams, 0);
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v49 = v45;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v156, v183, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v157;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v157 != v52)
          objc_enumerationMutation(v49);
        -[RTVisitPipelineMotionAccumulator processMotionActivity:](v48, "processMotionActivity:", *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * j));
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v156, v183, 16);
    }
    while (v51);
  }

  objc_msgSend(v44, "endDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitPipelineMotionAccumulator finishMotionObservations:](v48, "finishMotionObservations:", v54);

  -[RTVisitPipelineMotionAccumulator getTrimDate](v48, "getTrimDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v55;
  if (v55)
  {
    objc_msgSend(v55, "earlierDate:", v150);
    v56 = objc_claimAutoreleasedReturnValue();

    v150 = (void *)v56;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    v102 = (objc_class *)objc_opt_class();
    NSStringFromClass(v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v104 = v44;
    v105 = (char *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v49, "count");
    *(_DWORD *)buf = 138412802;
    v167 = v103;
    v168 = 2112;
    v169 = v105;
    v170 = 2048;
    v171 = v106;
    _os_log_debug_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_DEBUG, "%@ %@: Visit end, number of detected moving activities: %lu.", buf, 0x20u);

    v44 = v104;
  }

  v143 = v4;
  if ((objc_msgSend(v151, "isOnOrBefore:", v150) & 1) != 0)
  {
    v132 = v44;
    v133 = v46;
    log = (os_log_t)objc_opt_new();
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    objc_msgSend(v4, "points");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "locations");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v152, v182, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v153;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v153 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * k);
          objc_msgSend(v64, "date");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "compare:", v151);

          if (v66 != -1)
          {
            objc_msgSend(v64, "date");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v150, "compare:", v67);

            if (v68 != -1)
              -[NSObject addObject:](log, "addObject:", v64);
          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v152, v182, 16);
      }
      while (v61);
    }

    v69 = -[NSObject count](log, "count");
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v69)
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        aSelectora = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "visit");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "entry");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "stringFromDate");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "stringFromDate");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "visit");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "exit");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "stringFromDate");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "stringFromDate");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "points");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "locations");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "count");
        v79 = -[NSObject count](log, "count");
        *(_DWORD *)buf = 138414082;
        v167 = v146;
        v168 = 2112;
        v169 = aSelectora;
        v170 = 2112;
        v171 = (uint64_t)v73;
        v172 = 2112;
        v173 = v74;
        v174 = 2112;
        v175 = v75;
        v176 = 2112;
        v177 = v76;
        v178 = 2048;
        v179 = v78;
        v180 = 2048;
        v181 = v79;
        _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_INFO, "%@ %@: Visit trimming, entry date %@ -> %@, exit date %@ -> %@ Locations count %lu -> %lu", buf, 0x52u);

      }
      v131 = objc_alloc(MEMORY[0x1E0D18578]);
      objc_msgSend(v143, "visit");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v147, "type");
      objc_msgSend(v143, "visit");
      aSelectorb = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(aSelectorb, "location");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = -[NSObject count](log, "count");
      objc_msgSend(v143, "visit");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "confidence");
      v84 = v83;
      objc_msgSend(v143, "visit");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "placeInference");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v131, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v151, v129, v80, v151, v150, v81, v84, v86);

      v87 = [RTVisitCluster alloc];
      v88 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", log);
      v89 = -[RTVisitCluster initWithPoints:visit:](v87, "initWithPoints:visit:", v88, v71);

      v44 = v132;
      v46 = v133;
    }
    else
    {
      v46 = v133;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
      {
        v122 = (objc_class *)objc_opt_class();
        NSStringFromClass(v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v124 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v167 = v123;
        v168 = 2112;
        v169 = v124;
        v170 = 2112;
        v171 = (uint64_t)v151;
        v172 = 2112;
        v173 = v150;
        _os_log_debug_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_DEBUG, "%@ %@: Visit culled, no locations between %@ and %@", buf, 0x2Au);

      }
      v89 = 0;
      v44 = v132;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v114 = (objc_class *)objc_opt_class();
      NSStringFromClass(v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v116 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "visit");
      v117 = v4;
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "entry");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "visit");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "exit");
      v120 = v44;
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v167 = v115;
      v168 = 2112;
      v169 = v116;
      v170 = 2112;
      v171 = (uint64_t)v118;
      v172 = 2112;
      v173 = v121;
      _os_log_debug_impl(&dword_1D1A22000, log, OS_LOG_TYPE_DEBUG, "%@ %@: Visit culled, only motion between %@ and %@", buf, 0x2Au);

      v44 = v120;
    }
    v89 = 0;
  }

  return v89;
}

- (id)process:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  id v25;
  NSObject *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v7)
    {
      v8 = v7;
      v25 = v4;
      v9 = *(_QWORD *)v29;
      v26 = v6;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v11, "visit");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "entry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
          if (v13)
          {
            if (v15)
            {
              v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v33 = v19;
              v34 = 2112;
              v35 = v20;
              v36 = 2112;
              v37 = v11;
              _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@ %@: working on cluster, %@", buf, 0x20u);

              v6 = v26;
            }

            -[RTVisitPipelineModuleMotionStateTrimmer _trimVisitClusterForMotionActivity:](self, "_trimVisitClusterForMotionActivity:", v11);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v15)
            {
              v21 = (objc_class *)objc_opt_class();
              NSStringFromClass(v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v33 = v22;
              v34 = 2112;
              v35 = v23;
              v36 = 2112;
              v37 = v11;
              _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@ %@: skipping cluster with null visit entry, %@ ", buf, 0x20u);

              v6 = v26;
            }

            v16 = v11;
          }
          v17 = v16;
          if (v16)
            objc_msgSend(v5, "addObject:", v16);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v8);
      v4 = v25;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inClusters.count", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (RTVisitPipelineMotionAccumulatorParams)motionAccumulatorParams
{
  return self->_motionAccumulatorParams;
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_motionAccumulatorParams, 0);
}

@end
