@implementation SMSuggestionsMetricsManager

- (SMSuggestionsMetricsManager)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 sessionStore:(id)a5 suggestionsStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SMSuggestionsMetricsManager *v15;
  SMSuggestionsMetricsManager *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SMSuggestionsMetricsManager;
  v15 = -[RTNotifier init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_defaultsManager, a3);
    objc_storeStrong((id *)&v16->_deviceLocationPredictor, a4);
    objc_storeStrong((id *)&v16->_sessionStore, a5);
    objc_storeStrong((id *)&v16->_suggestionsStore, a6);
    -[SMSuggestionsMetricsManager setup](v16, "setup");
  }

  return v16;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SMSuggestionsMetricsManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __36__SMSuggestionsMetricsManager_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_collectAndSubmitMetricsUponNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_submitWorkoutAlwaysPromptResponseMetricUponNotification_, CFSTR("SMSubmitSuggesionsWorkoutAlwaysPromptResponseNotification"), 0);

}

- (void)submitWorkoutAlwaysPromptResponseMetricUponNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__SMSuggestionsMetricsManager_submitWorkoutAlwaysPromptResponseMetricUponNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __87__SMSuggestionsMetricsManager_submitWorkoutAlwaysPromptResponseMetricUponNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitWorkoutAlwaysPromptResponseMetricUponNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_submitWorkoutAlwaysPromptResponseMetricUponNotification:(id)a3
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "%@, unexpected call to submit workout always prompt response on non-watch", (uint8_t *)&v6, 0xCu);

  }
}

- (void)collectAndSubmitMetricsUponNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SMSuggestionsMetricsManager_collectAndSubmitMetricsUponNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __71__SMSuggestionsMetricsManager_collectAndSubmitMetricsUponNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_collectAndSubmitMetricsUponNotification:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_collectAndSubmitMetricsUponNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  void *v27;
  void *v28;
  id v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v39 = v27;
      v40 = 2080;
      v41 = "-[SMSuggestionsMetricsManager _collectAndSubmitMetricsUponNotification:]";
      v42 = 1024;
      v43 = 176;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unknown notification name, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("RTMetricManagerDailyMetricNotification"));

  if ((v9 & 1) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = objc_msgSend(&unk_1E932CB50, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v10)
    {
      v11 = v10;
      v29 = v4;
      v12 = 0;
      v30 = 0;
      v13 = *(_QWORD *)v34;
      while (1)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(&unk_1E932CB50);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x1D8231EA8]();
          v17 = objc_msgSend(v15, "unsignedIntValue");
          v32 = v12;
          -[SMSuggestionsMetricsManager _computeMetricsForEvent:error:](self, "_computeMetricsForEvent:error:", v17, &v32);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v32;

          if (v19)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
LABEL_20:
              -[NSObject localizedDescription](v19, "localizedDescription");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v39 = v23;
              _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);

            }
LABEL_16:

            v12 = v19;
            goto LABEL_17;
          }
          v21 = objc_msgSend(v15, "unsignedIntValue");
          v31 = 0;
          v30 = -[SMSuggestionsMetricsManager _submitMetrics:event:error:](self, "_submitMetrics:event:error:", v18, v21, &v31);
          v22 = v31;
          if (v22)
          {
            v19 = v22;
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_20;
            goto LABEL_16;
          }
          v12 = 0;
LABEL_17:

          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v11 != v14);
        v24 = objc_msgSend(&unk_1E932CB50, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        v11 = v24;
        if (!v24)
          goto LABEL_26;
      }
    }
    v25 = 0;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    v29 = v4;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v28;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "unknown notification name, %@", buf, 0xCu);

    }
    v30 = 0;
LABEL_26:

    v4 = v29;
    v25 = v30;
  }

  return v25;
}

- (id)_computeMetricsForEvent:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 3uLL:
      v15 = 0;
      -[SMSuggestionsMetricsManager _computeWorkoutAlwaysPromptMetricsWithError:](self, "_computeWorkoutAlwaysPromptMetricsWithError:", &v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;
      break;
    case 2uLL:
      v16 = 0;
      -[SMSuggestionsMetricsManager _computeUsageMetricsWithError:](self, "_computeUsageMetricsWithError:", &v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v16;
      break;
    case 1uLL:
      v17 = 0;
      -[SMSuggestionsMetricsManager _computeDetailsMetricsWithError:](self, "_computeDetailsMetricsWithError:", &v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v17;
      break;
    default:
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D8BB70];
      v18 = *MEMORY[0x1E0CB2D50];
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "stringFromSuggestionsMetricsEvent:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("requires a valid suggestions metric event. Passed, %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 7, v14);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v5 = 0;
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
  }
  v7 = v6;
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v7);
LABEL_9:

  return v5;
}

- (id)_computeDetailsMetricsWithError:(id *)a3
{
  void *v3;
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  void *v7;
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
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  objc_class *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  BOOL v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  NSObject *v78;
  objc_class *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t m;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _BOOL4 v101;
  NSObject *v102;
  objc_class *v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  id *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  double v128;
  void *v129;
  double v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  int v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  objc_class *v146;
  id v147;
  void *v148;
  objc_class *v149;
  id v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  NSObject *dsema;
  id obj;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  _BOOL4 v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *context;
  uint64_t i;
  char v182;
  void *v183;
  id v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  id v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  id v201;
  double v202;
  double v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  _QWORD v213[4];
  NSObject *v214;
  uint64_t *v215;
  uint64_t *v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t (*v220)(uint64_t, uint64_t);
  void (*v221)(uint64_t);
  id v222;
  uint64_t v223;
  uint64_t *v224;
  uint64_t v225;
  uint64_t (*v226)(uint64_t, uint64_t);
  void (*v227)(uint64_t);
  id v228;
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE buf[12];
  __int16 v234;
  id v235;
  __int16 v236;
  uint64_t v237;
  _QWORD v238[4];

  v238[1] = *MEMORY[0x1E0C80C00];
  v223 = 0;
  v224 = &v223;
  v225 = 0x3032000000;
  v226 = __Block_byref_object_copy__159;
  v227 = __Block_byref_object_dispose__159;
  v228 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v3;
  v170 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0D8BA98]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v156, v155);
  v154 = (void *)objc_msgSend(v4, "initWithIncludeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 1, 1, 1, v5, 0, 0, 0);

  v6 = dispatch_semaphore_create(0);
  v217 = 0;
  v218 = &v217;
  v219 = 0x3032000000;
  v220 = __Block_byref_object_copy__159;
  v221 = __Block_byref_object_dispose__159;
  v222 = 0;
  -[SMSuggestionsMetricsManager suggestionsStore](self, "suggestionsStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v213[0] = MEMORY[0x1E0C809B0];
  v213[1] = 3221225472;
  v213[2] = __63__SMSuggestionsMetricsManager__computeDetailsMetricsWithError___block_invoke;
  v213[3] = &unk_1E9296EE0;
  v215 = &v217;
  v216 = &v223;
  v8 = v6;
  v214 = v8;
  objc_msgSend(v7, "fetchSuggestionsWithOptions:handler:", v154, v213);

  dsema = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
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
  v238[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v238, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  v24 = v23;
  v153 = v24;
  if (a3 && v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v146 = (objc_class *)objc_opt_class();
      NSStringFromClass(v146);
      v147 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v147;
      v234 = 2112;
      v235 = v148;
      v236 = 2112;
      v237 = (uint64_t)v153;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v26 = v153;
    goto LABEL_140;
  }
  if (a3 && v224[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v149 = (objc_class *)objc_opt_class();
      NSStringFromClass(v149);
      v150 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = v224[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v150;
      v234 = 2112;
      v235 = v151;
      v236 = 2112;
      v237 = v152;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    goto LABEL_139;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend((id)v218[5], "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v30;
    v234 = 2112;
    v235 = v31;
    v236 = 2048;
    v237 = v32;
    _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, fetchedSuggestions with count, %lu", buf, 0x20u);

  }
  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  obj = (id)v218[5];
  v162 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v232, 16);
  if (v162)
  {
    v161 = *(_QWORD *)v210;
    do
    {
      for (i = 0; i != v162; ++i)
      {
        if (*(_QWORD *)v210 != v161)
          objc_enumerationMutation(obj);
        v188 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * i);
        context = (void *)MEMORY[0x1D8231EA8]();
        v185 = (void *)objc_opt_new();
        v33 = (void *)v224[5];
        v224[5] = 0;

        objc_msgSend(v188, "sourceLocation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "creationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id *)(v224 + 5);
        v208 = (id)v224[5];
        -[SMSuggestionsMetricsManager _getNPLOIsWithOnlyHighConfidence:location:date:error:](self, "_getNPLOIsWithOnlyHighConfidence:location:date:error:", 1, v34, v35, &v208);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v36, v208);

        v206 = 0u;
        v207 = 0u;
        v204 = 0u;
        v205 = 0u;
        v184 = v37;
        v38 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v204, v231, 16);
        if (!v38)
        {
          v182 = 0;
          goto LABEL_45;
        }
        v182 = 0;
        v186 = *(_QWORD *)v205;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v205 != v186)
              objc_enumerationMutation(v184);
            v40 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * j);
            v41 = (void *)MEMORY[0x1D8231EA8]();
            *(_QWORD *)buf = 0;
            v238[0] = 0;
            v203 = 0.0;
            v202 = 0.0;
            objc_msgSend(v40, "locationOfInterest");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "location");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "latitude");
            objc_msgSend(v40, "locationOfInterest");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "location");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "longitude");
            RTCommonCalculateBoundingBox();

            objc_msgSend(v188, "destinationLocation");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v46)
              goto LABEL_32;
            v47 = *(double *)buf;
            objc_msgSend(v188, "destinationLocation");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "latitude");
            if (v47 > v49)
            {

LABEL_32:
              v50 = 0;
              goto LABEL_40;
            }
            objc_msgSend(v188, "destinationLocation");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "latitude");
            if (v52 <= v203)
            {
              v53 = *(double *)v238;
              objc_msgSend(v188, "destinationLocation");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "longitude");
              if (v53 <= v55)
              {
                objc_msgSend(v188, "destinationLocation");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "longitude");
                v50 = v57 <= v202;

              }
              else
              {
                v50 = 0;
              }

            }
            else
            {
              v50 = 0;
            }

            v182 |= v50;
LABEL_40:
            objc_autoreleasePoolPop(v41);
            if (v50)
              goto LABEL_45;
          }
          v38 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v204, v231, 16);
        }
        while (v38);
LABEL_45:

        v58 = v224[5];
        if (v58)
        {
          v59 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v182 & 1);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v169;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v59, CFSTR("nploi_match_historicalSessionDestination"));
        if (!v58)

        v60 = v224[5];
        if (v60)
        {
          v61 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v184, "count"));
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v168;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v61, CFSTR("nploiCount"));
        if (!v60)

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v188, "suggestionUserType"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v62, CFSTR("policy"));

        v63 = (void *)v224[5];
        v224[5] = 0;

        v64 = (id *)(v224 + 5);
        v201 = (id)v224[5];
        -[SMSuggestionsMetricsManager _getSessionConfigurationsForSuggestion:timeWindow:error:](self, "_getSessionConfigurationsForSuggestion:timeWindow:error:", v188, &v201, 30.0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v64, v201);
        v66 = v224[5];
        if (v66)
        {
          v67 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v167;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v67, CFSTR("previousSessionCount_plusMinus30"));
        if (!v66)

        v68 = (void *)objc_opt_new();
        v200 = 0u;
        v198 = 0u;
        v199 = 0u;
        v197 = 0u;
        v69 = v65;
        v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v197, v230, 16);
        if (v70)
        {
          v71 = *(_QWORD *)v198;
          do
          {
            for (k = 0; k != v70; ++k)
            {
              if (*(_QWORD *)v198 != v71)
                objc_enumerationMutation(v69);
              v73 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * k);
              v74 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v73, "conversation");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "receiverHandles");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = (unint64_t)objc_msgSend(v76, "count") > 1;

              if (v77)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v78 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                {
                  v79 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v79);
                  v80 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v81 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v80;
                  v234 = 2112;
                  v235 = v81;
                  v236 = 2112;
                  v237 = (uint64_t)v73;
                  _os_log_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_INFO, "%@, %@, not considering group sessions for metric, %@", buf, 0x20u);

                }
              }
              else
              {
                objc_msgSend(v73, "conversation");
                v78 = objc_claimAutoreleasedReturnValue();
                -[NSObject receiverHandles](v78, "receiverHandles");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "firstObject");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "primaryHandle");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "addObject:", v84);

              }
              objc_autoreleasePoolPop(v74);
            }
            v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v197, v230, 16);
          }
          while (v70);
        }

        v85 = v224[5];
        if (v85)
        {
          v86 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v166;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v86, CFSTR("previousSessionReceiverCount_plusMinus30"));
        if (!v85)

        v87 = (void *)v224[5];
        v224[5] = 0;

        v88 = (id *)(v224 + 5);
        v196 = (id)v224[5];
        -[SMSuggestionsMetricsManager _getSessionConfigurationsForSuggestion:timeWindow:error:](self, "_getSessionConfigurationsForSuggestion:timeWindow:error:", v188, &v196, 60.0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v88, v196);

        v90 = v224[5];
        if (v90)
        {
          v91 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v89, "count"));
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v165;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v91, CFSTR("previousSessionCount_plusMinus60"));
        if (!v90)

        v92 = (void *)objc_opt_new();
        v194 = 0u;
        v195 = 0u;
        v192 = 0u;
        v193 = 0u;
        v93 = v89;
        v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v192, v229, 16);
        if (v94)
        {
          v95 = *(_QWORD *)v193;
          do
          {
            for (m = 0; m != v94; ++m)
            {
              if (*(_QWORD *)v193 != v95)
                objc_enumerationMutation(v93);
              v97 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * m);
              v98 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v97, "conversation");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "receiverHandles");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = (unint64_t)objc_msgSend(v100, "count") > 1;

              if (v101)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v102 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
                {
                  v103 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v103);
                  v104 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v105 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v104;
                  v234 = 2112;
                  v235 = v105;
                  v236 = 2112;
                  v237 = (uint64_t)v97;
                  _os_log_impl(&dword_1D1A22000, v102, OS_LOG_TYPE_INFO, "%@, %@, not considering group sessions for metric, %@", buf, 0x20u);

                }
              }
              else
              {
                objc_msgSend(v97, "conversation");
                v102 = objc_claimAutoreleasedReturnValue();
                -[NSObject receiverHandles](v102, "receiverHandles");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "firstObject");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "primaryHandle");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "addObject:", v108);

              }
              objc_autoreleasePoolPop(v98);
            }
            v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v192, v229, 16);
          }
          while (v94);
        }

        v109 = v224[5];
        if (v109)
        {
          v110 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v92, "count"));
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v164;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v110, CFSTR("previousSessionReceiverCount_plusMinus60"));
        if (!v109)

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v188, "suppressionReason") == 1);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v111, CFSTR("suggestionPresented"));

        v112 = (void *)v224[5];
        v224[5] = 0;

        if (objc_msgSend(v188, "suppressionReason") == 1)
        {
          v113 = (id *)(v224 + 5);
          v191 = (id)v224[5];
          -[SMSuggestionsMetricsManager _getSelectedSessionForSuggestion:error:](self, "_getSelectedSessionForSuggestion:error:", v188, &v191);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v113, v191);
        }
        else
        {
          v187 = 0;
        }
        v114 = v224[5];
        if (v114)
        {
          v115 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v187 != 0);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v163;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v115, CFSTR("suggestionSelected"));
        if (!v114)

        *(_QWORD *)buf = 0;
        v238[0] = 0;
        v203 = 0.0;
        v202 = 0.0;
        objc_msgSend(v187, "destination");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "location");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "latitude");
        objc_msgSend(v187, "destination");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "location");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "longitude");
        RTCommonCalculateBoundingBox();

        objc_msgSend(v188, "destinationLocation");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        if (v120)
        {
          v121 = *(double *)buf;
          objc_msgSend(v188, "destinationLocation");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "latitude");
          if (v121 <= v123)
          {
            objc_msgSend(v188, "destinationLocation");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "latitude");
            if (v125 <= v203)
            {
              v126 = *(double *)v238;
              objc_msgSend(v188, "destinationLocation");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "longitude");
              if (v126 <= v128)
              {
                objc_msgSend(v188, "destinationLocation");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "longitude");
                v173 = v130 <= v202;

              }
              else
              {
                v173 = 0;
              }

            }
            else
            {
              v173 = 0;
            }

          }
          else
          {
            v173 = 0;
          }

        }
        else
        {
          v173 = 0;
        }

        objc_msgSend(v188, "buddy");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "phoneNumber");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        if (v131)
        {
          objc_msgSend(v188, "buddy");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "phoneNumber");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "conversation");
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "receiverHandles");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v177, "firstObject");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "primaryHandle");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v174, "isEqualToString:", v175) & 1) != 0)
          {
            LOBYTE(v132) = 1;
            goto LABEL_126;
          }
        }
        objc_msgSend(v188, "buddy");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "email");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v134)
        {

          if (!v131)
          {

            goto LABEL_129;
          }
          LOBYTE(v132) = 0;
LABEL_126:

          if ((v132 & 1) == 0)
            goto LABEL_129;
          goto LABEL_127;
        }
        objc_msgSend(v188, "buddy");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "email");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "conversation");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "receiverHandles");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "firstObject");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "primaryHandle");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = objc_msgSend(v171, "isEqualToString:", v138);

        if (v131)
          goto LABEL_126;

        if (!v132)
        {
LABEL_129:
          v139 = 1;
          goto LABEL_130;
        }
LABEL_127:
        v139 = !v173;
LABEL_130:
        if (v187 && !v224[5])
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v139);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = 1;
          v141 = v160;
        }
        else
        {
          v140 = 0;
          v141 = 0;
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v141, CFSTR("suggestionSelected_configurationModified"));
        if (v140)

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v188, "suppressionReason"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v142, CFSTR("suppressionReason"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v188, "suggestionTrigger"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v143, CFSTR("trigger"));

        objc_msgSend(v170, "addObject:", v185);
        objc_autoreleasePoolPop(context);
      }
      v162 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v232, 16);
    }
    while (v162);
  }

  if (a3)
  {
LABEL_139:
    v26 = (void *)v224[5];
LABEL_140:
    *a3 = objc_retainAutorelease(v26);
  }
  v144 = v170;

  _Block_object_dispose(&v217, 8);
  _Block_object_dispose(&v223, 8);

  return v144;
}

void __63__SMSuggestionsMetricsManager__computeDetailsMetricsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_computeUsageMetricsWithError:(id *)a3
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void **v18;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v31 = 0;
  -[SMSuggestionsMetricsManager _getSuggestionsConsideredMetricsWithError:](self, "_getSuggestionsConsideredMetricsWithError:", &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  v9 = v8;
  if (a3 && v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v21;
      v38 = 2112;
      v39 = v22;
      v40 = 2112;
      v41 = v9;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v11 = objc_retainAutorelease(v9);
    *a3 = v11;
    v35 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);
    v30 = v9;
    -[SMSuggestionsMetricsManager _getSuggestionsPresentedMetricsWithError:](self, "_getSuggestionsPresentedMetricsWithError:", &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;

    if (a3 && v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v37 = v24;
        v38 = 2112;
        v39 = v25;
        v40 = 2112;
        v41 = v14;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v11 = objc_retainAutorelease(v14);
      *a3 = v11;
      v34 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "addEntriesFromDictionary:", v13);
      v29 = v14;
      -[SMSuggestionsMetricsManager _getSuggestionsSelectedMetricsWithError:](self, "_getSuggestionsSelectedMetricsWithError:", &v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v29;

      if (a3 && v11)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v37 = v27;
          v38 = 2112;
          v39 = v28;
          v40 = 2112;
          v41 = v11;
          _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        *a3 = objc_retainAutorelease(v11);
        v33 = v6;
        v18 = &v33;
      }
      else
      {
        objc_msgSend(v6, "addEntriesFromDictionary:", v16);
        if (a3)
          *a3 = objc_retainAutorelease(v11);
        v32 = v6;
        v18 = &v32;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (id)_getSuggestionsConsideredMetricsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604800.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419200.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = -[SMSuggestionsMetricsManager _getSuggestionsCountConsideredForPastDate:endDate:error:](self, "_getSuggestionsCountConsideredForPastDate:endDate:error:", v7, v6, &v35);
  v11 = v35;
  v12 = v11;
  if (a3 && v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = v5;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v15;
      v38 = 2112;
      v39 = v17;
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      v5 = v16;
    }
    goto LABEL_15;
  }
  v32 = v5;
  v34 = v11;
  v18 = -[SMSuggestionsMetricsManager _getSuggestionsCountConsideredForPastDate:endDate:error:](self, "_getSuggestionsCountConsideredForPastDate:endDate:error:", v8, v6, &v34);
  v19 = v34;

  if (a3 && v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v19;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v12 = v19;
LABEL_14:
    v5 = v32;
LABEL_15:

    goto LABEL_16;
  }
  v33 = v19;
  v30 = -[SMSuggestionsMetricsManager _getSuggestionsCountConsideredForPastDate:endDate:error:](self, "_getSuggestionsCountConsideredForPastDate:endDate:error:", v9, v6, &v33);
  v12 = v33;

  if (a3 && v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  if (v10 == -1)
  {
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsConsidered_daily"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, CFSTR("suggestionsConsidered_daily"));

  }
  if (v18 == -1)
  {
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsConsidered_weekly"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v22, CFSTR("suggestionsConsidered_weekly"));

  }
  if (v30 == -1)
  {
    v5 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsConsidered_monthly"));
    if (!a3)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v23, CFSTR("suggestionsConsidered_monthly"));

    if (!a3)
      goto LABEL_17;
  }
LABEL_16:
  v12 = objc_retainAutorelease(v12);
  *a3 = v12;
LABEL_17:

  return v5;
}

- (int64_t)_getSuggestionsCountConsideredForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  int64_t v33;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  objc_class *v40;
  id v41;
  void *v42;
  objc_class *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[12];
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a5)
      goto LABEL_18;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    *a5 = v31;
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (!a5)
      goto LABEL_18;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v9, "compare:", v10) == -1)
  {
    *(_QWORD *)buf = 0;
    v60 = buf;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__159;
    v63 = __Block_byref_object_dispose__159;
    v64 = 0;
    v12 = objc_alloc(MEMORY[0x1E0D8BA98]);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v11);
    v50 = (void *)objc_msgSend(v12, "initWithIncludeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 1, 0, 0, v13, 0, 0, 0);

    v14 = dispatch_semaphore_create(0);
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    -[SMSuggestionsMetricsManager suggestionsStore](self, "suggestionsStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __87__SMSuggestionsMetricsManager__getSuggestionsCountConsideredForPastDate_endDate_error___block_invoke;
    v51[3] = &unk_1E92971F0;
    v53 = &v55;
    v54 = buf;
    v16 = v14;
    v52 = v16;
    objc_msgSend(v15, "fetchSuggestionsCountWithOptions:handler:", v50, v51);

    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v17, v18))
      goto LABEL_20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timeIntervalSinceDate:", v49);
    v20 = v19;
    v47 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "submitToCoreAnalytics:type:duration:", v24, 1, v20);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v65 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v65, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v70[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v65 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v70, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

    }
    else
    {
LABEL_20:
      v29 = 0;
    }

    v35 = v29;
    v36 = v35;
    if (a5 && v35)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v65 = 138412802;
        *(_QWORD *)&v65[4] = v41;
        v66 = 2112;
        v67 = v42;
        v68 = 2112;
        v69 = v36;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);

      }
      v38 = objc_retainAutorelease(v36);
    }
    else
    {
      if (!a5 || !*((_QWORD *)v60 + 5))
      {
        v33 = v56[3];
        goto LABEL_33;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)*((_QWORD *)v60 + 5);
        *(_DWORD *)v65 = 138412802;
        *(_QWORD *)&v65[4] = v44;
        v66 = 2112;
        v67 = v45;
        v68 = 2112;
        v69 = v46;
        _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);

      }
      v38 = objc_retainAutorelease(*((id *)v60 + 5));
    }
    *a5 = v38;
    v33 = -1;
LABEL_33:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_19;
  }
LABEL_18:
  v33 = -1;
LABEL_19:

  return v33;
}

void __87__SMSuggestionsMetricsManager__getSuggestionsCountConsideredForPastDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_getSuggestionsPresentedMetricsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604800.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419200.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = -[SMSuggestionsMetricsManager _getSuggestionsCountPresentedForPastDate:endDate:error:](self, "_getSuggestionsCountPresentedForPastDate:endDate:error:", v7, v6, &v35);
  v11 = v35;
  v12 = v11;
  if (a3 && v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = v5;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v15;
      v38 = 2112;
      v39 = v17;
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      v5 = v16;
    }
    goto LABEL_15;
  }
  v32 = v5;
  v34 = v11;
  v18 = -[SMSuggestionsMetricsManager _getSuggestionsCountPresentedForPastDate:endDate:error:](self, "_getSuggestionsCountPresentedForPastDate:endDate:error:", v8, v6, &v34);
  v19 = v34;

  if (a3 && v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v19;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v12 = v19;
LABEL_14:
    v5 = v32;
LABEL_15:

    goto LABEL_16;
  }
  v33 = v19;
  v30 = -[SMSuggestionsMetricsManager _getSuggestionsCountPresentedForPastDate:endDate:error:](self, "_getSuggestionsCountPresentedForPastDate:endDate:error:", v9, v6, &v33);
  v12 = v33;

  if (a3 && v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  if (v10 == -1)
  {
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsPresented_daily"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, CFSTR("suggestionsPresented_daily"));

  }
  if (v18 == -1)
  {
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsPresented_weekly"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v22, CFSTR("suggestionsPresented_weekly"));

  }
  if (v30 == -1)
  {
    v5 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsPresented_monthly"));
    if (!a3)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v23, CFSTR("suggestionsPresented_monthly"));

    if (!a3)
      goto LABEL_17;
  }
LABEL_16:
  v12 = objc_retainAutorelease(v12);
  *a3 = v12;
LABEL_17:

  return v5;
}

- (int64_t)_getSuggestionsCountPresentedForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  int64_t v33;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  objc_class *v40;
  id v41;
  void *v42;
  objc_class *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t *v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[8];
  uint8_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[12];
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[4];

  v70[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a5)
      goto LABEL_18;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    *a5 = v31;
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (!a5)
      goto LABEL_18;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v9, "compare:", v10) == -1)
  {
    *(_QWORD *)buf = 0;
    v60 = buf;
    v61 = 0x3032000000;
    v62 = __Block_byref_object_copy__159;
    v63 = __Block_byref_object_dispose__159;
    v64 = 0;
    v12 = objc_alloc(MEMORY[0x1E0D8BA98]);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v11);
    v50 = (void *)objc_msgSend(v12, "initWithIncludeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", 0, 0, 0, v13, 0, 0, 0);

    v14 = dispatch_semaphore_create(0);
    v55 = 0;
    v56 = &v55;
    v57 = 0x2020000000;
    v58 = 0;
    -[SMSuggestionsMetricsManager suggestionsStore](self, "suggestionsStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __86__SMSuggestionsMetricsManager__getSuggestionsCountPresentedForPastDate_endDate_error___block_invoke;
    v51[3] = &unk_1E92971F0;
    v53 = &v55;
    v54 = buf;
    v16 = v14;
    v52 = v16;
    objc_msgSend(v15, "fetchSuggestionsCountWithOptions:handler:", v50, v51);

    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v17, v18))
      goto LABEL_20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timeIntervalSinceDate:", v49);
    v20 = v19;
    v47 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "submitToCoreAnalytics:type:duration:", v24, 1, v20);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v65 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v65, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v70[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v65 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v70, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

    }
    else
    {
LABEL_20:
      v29 = 0;
    }

    v35 = v29;
    v36 = v35;
    if (a5 && v35)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v65 = 138412802;
        *(_QWORD *)&v65[4] = v41;
        v66 = 2112;
        v67 = v42;
        v68 = 2112;
        v69 = v36;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);

      }
      v38 = objc_retainAutorelease(v36);
    }
    else
    {
      if (!a5 || !*((_QWORD *)v60 + 5))
      {
        v33 = v56[3];
        goto LABEL_33;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)*((_QWORD *)v60 + 5);
        *(_DWORD *)v65 = 138412802;
        *(_QWORD *)&v65[4] = v44;
        v66 = 2112;
        v67 = v45;
        v68 = 2112;
        v69 = v46;
        _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v65, 0x20u);

      }
      v38 = objc_retainAutorelease(*((id *)v60 + 5));
    }
    *a5 = v38;
    v33 = -1;
LABEL_33:

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_19;
  }
LABEL_18:
  v33 = -1;
LABEL_19:

  return v33;
}

void __86__SMSuggestionsMetricsManager__getSuggestionsCountPresentedForPastDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_getSuggestionsSelectedMetricsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -604800.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -2419200.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v10 = -[SMSuggestionsMetricsManager _getSuggestionsCountSelectedForPastDate:endDate:error:](self, "_getSuggestionsCountSelectedForPastDate:endDate:error:", v7, v6, &v35);
  v11 = v35;
  v12 = v11;
  if (a3 && v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = v5;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v15;
      v38 = 2112;
      v39 = v17;
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      v5 = v16;
    }
    goto LABEL_15;
  }
  v32 = v5;
  v34 = v11;
  v18 = -[SMSuggestionsMetricsManager _getSuggestionsCountSelectedForPastDate:endDate:error:](self, "_getSuggestionsCountSelectedForPastDate:endDate:error:", v8, v6, &v34);
  v19 = v34;

  if (a3 && v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v25;
      v38 = 2112;
      v39 = v26;
      v40 = 2112;
      v41 = v19;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v12 = v19;
LABEL_14:
    v5 = v32;
LABEL_15:

    goto LABEL_16;
  }
  v33 = v19;
  v30 = -[SMSuggestionsMetricsManager _getSuggestionsCountSelectedForPastDate:endDate:error:](self, "_getSuggestionsCountSelectedForPastDate:endDate:error:", v9, v6, &v33);
  v12 = v33;

  if (a3 && v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    goto LABEL_14;
  }
  if (v10 == -1)
  {
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsSelected_daily"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, CFSTR("suggestionsSelected_daily"));

  }
  if (v18 == -1)
  {
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsSelected_weekly"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v22, CFSTR("suggestionsSelected_weekly"));

  }
  if (v30 == -1)
  {
    v5 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, CFSTR("suggestionsSelected_monthly"));
    if (!a3)
      goto LABEL_17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v32;
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v23, CFSTR("suggestionsSelected_monthly"));

    if (!a3)
      goto LABEL_17;
  }
LABEL_16:
  v12 = objc_retainAutorelease(v12);
  *a3 = v12;
LABEL_17:

  return v5;
}

- (int64_t)_getSuggestionsCountSelectedForPastDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
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
  NSObject *v31;
  id v32;
  NSObject *v33;
  int64_t v34;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t (*v37)(uint64_t, uint64_t);
  NSObject *v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  NSObject *v40;
  id v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  dispatch_semaphore_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  dispatch_time_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
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
  _BOOL4 v69;
  NSObject *v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  NSObject *v72;
  id v73;
  void *v74;
  objc_class *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  objc_class *v82;
  id v83;
  void *v84;
  uint64_t v85;
  SEL v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  int v98;
  objc_class *v99;
  id v100;
  void *v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  objc_class *v103;
  id v104;
  void *v105;
  objc_class *v106;
  id v107;
  void *v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  uint64_t v110;
  void *v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void *v113;
  NSObject *dsema;
  id obj;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  const char *aSelector;
  SEL aSelectora;
  void *v121;
  void *v122;
  SMSuggestionsMetricsManager *context;
  void *contexta;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  NSObject *v134;
  _BYTE *v135;
  uint8_t *v136;
  _QWORD v137[4];
  NSObject *v138;
  uint64_t *v139;
  uint8_t *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  uint8_t buf[8];
  uint8_t *v148;
  uint64_t v149;
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  _BYTE v153[128];
  _BYTE v154[128];
  uint64_t v155;
  void *v156;
  _BYTE v157[12];
  __int16 v158;
  void *v159;
  __int16 v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  _BYTE v162[24];
  uint64_t (*v163)(uint64_t, uint64_t);
  void (*v164)(uint64_t);
  id v165;
  uint64_t v166;
  void *v167;
  _QWORD v168[4];

  v168[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v121 = v10;
  v122 = v9;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", buf, 2u);
    }

    if (!a5)
      goto LABEL_18;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    *a5 = v32;
    goto LABEL_18;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (!a5)
      goto LABEL_18;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v9, "compare:", v10) != -1)
  {
LABEL_18:
    v34 = -1;
    goto LABEL_19;
  }
  context = self;
  aSelector = a2;
  *(_QWORD *)buf = 0;
  v148 = buf;
  v149 = 0x3032000000;
  v150 = __Block_byref_object_copy__159;
  v151 = __Block_byref_object_dispose__159;
  v152 = 0;
  v11 = objc_alloc(MEMORY[0x1E0D8BA98]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v121);
  v116 = *MEMORY[0x1E0D8BD40];
  v113 = (void *)objc_msgSend(v11, "initWithBatchSize:fetchLimit:offset:includeSuppressed:sortByCreationDate:ascending:dateInterval:filteredToSuggestionTriggers:filteredToSuggestionUserTypes:filteredToSessionTypes:", *MEMORY[0x1E0D8BD40], 10000, *MEMORY[0x1E0D8BD40], 0, 1, 1, v12, 0, 0, 0);

  v13 = dispatch_semaphore_create(0);
  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = __Block_byref_object_copy__159;
  v145 = __Block_byref_object_dispose__159;
  v146 = 0;
  -[SMSuggestionsMetricsManager suggestionsStore](context, "suggestionsStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = MEMORY[0x1E0C809B0];
  v137[1] = 3221225472;
  v137[2] = __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke;
  v137[3] = &unk_1E9296EE0;
  v139 = &v141;
  v140 = buf;
  v15 = v13;
  v138 = v15;
  objc_msgSend(v14, "fetchSuggestionsWithOptions:handler:", v113, v137);

  dsema = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v17))
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
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
    *(_WORD *)v162 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v162, 2u);
  }

  v27 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v157 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v162 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, v157, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_retainAutorelease(v29);

  }
  else
  {
LABEL_20:
    v30 = 0;
  }

  v36 = (uint64_t (*)(uint64_t, uint64_t))v30;
  v37 = v36;
  if (a5 && v36)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v82 = (objc_class *)objc_opt_class();
      NSStringFromClass(v82);
      v83 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v162 = 138412802;
      *(_QWORD *)&v162[4] = v83;
      *(_WORD *)&v162[12] = 2112;
      *(_QWORD *)&v162[14] = v84;
      *(_WORD *)&v162[22] = 2112;
      v163 = v37;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v162, 0x20u);

    }
    v39 = objc_retainAutorelease(v37);
    v37 = v39;
    goto LABEL_34;
  }
  if (a5 && *((_QWORD *)v148 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v99 = (objc_class *)objc_opt_class();
      NSStringFromClass(v99);
      v100 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v148 + 5);
      *(_DWORD *)v162 = 138412802;
      *(_QWORD *)&v162[4] = v100;
      *(_WORD *)&v162[12] = 2112;
      *(_QWORD *)&v162[14] = v101;
      *(_WORD *)&v162[22] = 2112;
      v163 = v102;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v162, 0x20u);

    }
    v39 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(*((id *)v148 + 5));
    goto LABEL_34;
  }
  if (objc_msgSend((id)v142[5], "count") == 10000)
  {
    v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v166 = *MEMORY[0x1E0CB2D50];
    v42 = (void *)MEMORY[0x1E0CB3940];
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringWithFormat:", CFSTR("%@, %@, suggestions reached max database objects count, %lu, dropping further evaluation"), v44, v45, objc_msgSend((id)v142[5], "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v41, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 12, v47);
    v49 = (void *)*((_QWORD *)v148 + 5);
    *((_QWORD *)v148 + 5) = v48;

    if (!a5)
    {
LABEL_35:
      v34 = -1;
      goto LABEL_36;
    }
    v39 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(*((id *)v148 + 5));
LABEL_34:
    *a5 = v39;
    goto LABEL_35;
  }
  v50 = objc_alloc(MEMORY[0x1E0D8B9F8]);
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v122, v121);
  LOBYTE(v110) = 0;
  v111 = (void *)objc_msgSend(v50, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v116, 10000, 1, 1, &unk_1E932CB68, 0, v110, v51, 0, 0, 0, 0);

  v52 = dispatch_semaphore_create(0);
  *(_QWORD *)v162 = 0;
  *(_QWORD *)&v162[8] = v162;
  *(_QWORD *)&v162[16] = 0x3032000000;
  v163 = __Block_byref_object_copy__159;
  v164 = __Block_byref_object_dispose__159;
  v165 = 0;
  -[SMSuggestionsMetricsManager sessionStore](context, "sessionStore");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke_95;
  v133[3] = &unk_1E9296EE0;
  v135 = v162;
  v136 = buf;
  v54 = v52;
  v134 = v54;
  objc_msgSend(v53, "fetchSessionConfigurationsWithOptions:handler:", v111, v133);

  dsema = v54;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = dispatch_time(0, 3600000000000);
  v57 = v37;
  if (dispatch_semaphore_wait(dsema, v56))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "timeIntervalSinceDate:", v55);
    v59 = v58;
    v60 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
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
      *(_WORD *)v157 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v157, 2u);
    }

    v66 = (void *)MEMORY[0x1E0CB35C8];
    v168[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v157 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v168, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v37;
    if (v68)
    {
      v57 = objc_retainAutorelease(v68);

    }
  }

  v112 = v57;
  if (v112)
    v69 = a5 != 0;
  else
    v69 = 0;
  if (v69)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v103 = (objc_class *)objc_opt_class();
      NSStringFromClass(v103);
      v104 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v157 = 138412802;
      *(_QWORD *)&v157[4] = v104;
      v158 = 2112;
      v159 = v105;
      v160 = 2112;
      v161 = v112;
      _os_log_error_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v157, 0x20u);

    }
    v71 = objc_retainAutorelease(v112);
    goto LABEL_57;
  }
  if (a5 && *((_QWORD *)v148 + 5))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v106 = (objc_class *)objc_opt_class();
      NSStringFromClass(v106);
      v107 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (uint64_t (*)(uint64_t, uint64_t))*((_QWORD *)v148 + 5);
      *(_DWORD *)v157 = 138412802;
      *(_QWORD *)&v157[4] = v107;
      v158 = 2112;
      v159 = v108;
      v160 = 2112;
      v161 = v109;
      _os_log_error_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v157, 0x20u);

    }
    v71 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(*((id *)v148 + 5));
    goto LABEL_57;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)&v162[8] + 40), "count") == 10000)
  {
    v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v155 = *MEMORY[0x1E0CB2D50];
    v74 = (void *)MEMORY[0x1E0CB3940];
    v75 = (objc_class *)objc_opt_class();
    NSStringFromClass(v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stringWithFormat:", CFSTR("%@, %@, session configs reached max database objects count, %lu, dropping further evaluation"), v76, v77, objc_msgSend(*(id *)(*(_QWORD *)&v162[8] + 40), "count"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v73, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 12, v79);
    v81 = (void *)*((_QWORD *)v148 + 5);
    *((_QWORD *)v148 + 5) = v80;

    if (!a5)
    {
LABEL_58:
      v34 = -1;
      goto LABEL_59;
    }
    v71 = (uint64_t (*)(uint64_t, uint64_t))objc_retainAutorelease(*((id *)v148 + 5));
LABEL_57:
    *a5 = v71;
    goto LABEL_58;
  }
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  obj = *(id *)(*(_QWORD *)&v162[8] + 40);
  v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v154, 16);
  v34 = 0;
  if (!v85)
    goto LABEL_81;
  v118 = *(_QWORD *)v130;
  do
  {
    v86 = 0;
    aSelectora = (SEL)v85;
    do
    {
      if (*(_QWORD *)v130 != v118)
        objc_enumerationMutation(obj);
      v87 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)v86);
      contexta = (void *)MEMORY[0x1D8231EA8]();
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v88 = (id)v142[5];
      v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v125, v153, 16);
      if (v89)
      {
        v90 = *(_QWORD *)v126;
        do
        {
          for (i = 0; i != v89; ++i)
          {
            if (*(_QWORD *)v126 != v90)
              objc_enumerationMutation(v88);
            v92 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
            v93 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(v87, "sessionStartDate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "creationDate");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "timeIntervalSinceDate:", v95);
            v97 = v96;

            if (v97 < 0.0 || v97 > 7200.0)
            {
              if (v97 < 0.0)
              {
                v98 = 0;
                goto LABEL_76;
              }
            }
            else
            {
              ++v34;
            }
            v98 = 1;
LABEL_76:
            objc_autoreleasePoolPop(v93);
            if (!v98)
              goto LABEL_79;
          }
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v125, v153, 16);
        }
        while (v89);
      }
LABEL_79:

      objc_autoreleasePoolPop(contexta);
      ++v86;
    }
    while (v86 != aSelectora);
    v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v154, 16);
  }
  while (v85);
LABEL_81:

LABEL_59:
  _Block_object_dispose(v162, 8);

  v37 = v112;
LABEL_36:

  _Block_object_dispose(&v141, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:
  return v34;
}

void __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __85__SMSuggestionsMetricsManager__getSuggestionsCountSelectedForPastDate_endDate_error___block_invoke_95(uint64_t a1, void *a2, void *a3)
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

- (id)_getSelectedSessionForSuggestion:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  objc_class *v46;
  id v47;
  void *v48;
  uint64_t v49;
  const char *aSelector;
  void *v51;
  SMSuggestionsMetricsManager *v52;
  _QWORD v53[4];
  NSObject *v54;
  uint8_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t buf[8];
  uint8_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _BYTE v69[12];
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "suppressionReason") == 1)
    {
      v52 = self;
      aSelector = a2;
      v9 = objc_alloc(MEMORY[0x1E0D8B9F8]);
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v8, "creationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithStartDate:duration:", v11, 7200.0);
      v13 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v8, "creationDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x1E0D8BD40];
      v16 = (void *)objc_msgSend(v13, "initWithStartDate:duration:", v14, 86400.0);
      LOBYTE(v49) = 1;
      v17 = objc_msgSend(v9, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v15, 1, 1, 1, &unk_1E932CB80, v12, v49, v16, 0, 0, 0, 0);

      v18 = dispatch_semaphore_create(0);
      *(_QWORD *)buf = 0;
      v64 = buf;
      v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__159;
      v67 = __Block_byref_object_dispose__159;
      v68 = 0;
      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__159;
      v61 = __Block_byref_object_dispose__159;
      v62 = 0;
      -[SMSuggestionsMetricsManager sessionStore](v52, "sessionStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __70__SMSuggestionsMetricsManager__getSelectedSessionForSuggestion_error___block_invoke;
      v53[3] = &unk_1E9296EE0;
      v55 = buf;
      v56 = &v57;
      v20 = v18;
      v54 = v20;
      objc_msgSend(v19, "fetchSessionConfigurationsWithOptions:handler:", v17, v53);
      v51 = (void *)v17;

      v21 = v20;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v21, v23))
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v22);
      v26 = v25;
      v27 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v69 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v69, 2u);
      }

      v33 = (void *)MEMORY[0x1E0CB35C8];
      v74[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v69 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v74, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = objc_retainAutorelease(v35);

      }
      else
      {
LABEL_18:
        v36 = 0;
      }

      v41 = v36;
      v42 = v41;
      if (a4 && v41)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v47 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v69 = 138412802;
          *(_QWORD *)&v69[4] = v47;
          v70 = 2112;
          v71 = v48;
          v72 = 2112;
          v73 = v42;
          _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v69, 0x20u);

        }
        v44 = v42;
      }
      else
      {
        if (!a4)
        {
LABEL_27:
          objc_msgSend(*((id *)v64 + 5), "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          _Block_object_dispose(&v57, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_28;
        }
        v44 = (void *)v58[5];
      }
      *a4 = objc_retainAutorelease(v44);
      goto LABEL_27;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion.suppressionReason == SMSuggestionSuppressionReasonNotSuppressed", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("suggestion.suppressionReason == SMSuggestionSuppressionReasonNotSuppressed"));
      v38 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_17:
    v40 = 0;
    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", buf, 2u);
  }

  if (!a4)
    goto LABEL_17;
  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("suggestion"));
  v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v40 = 0;
  *a4 = v38;
LABEL_28:

  return v40;
}

void __70__SMSuggestionsMetricsManager__getSelectedSessionForSuggestion_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getSessionConfigurationsForSuggestion:(id)a3 timeWindow:(double)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  dispatch_semaphore_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  id v43;
  objc_class *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _QWORD v52[4];
  NSObject *v53;
  uint64_t *v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t v62[8];
  uint8_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE buf[12];
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D8B9F8]);
    v9 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v7, "creationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", -a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithStartDate:duration:", v11, a4 + a4);
    v13 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingTimeInterval:", -2419200.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D8BD30];
    v17 = (void *)objc_msgSend(v13, "initWithStartDate:duration:", v15, 2419200.0);
    LOBYTE(v48) = 1;
    v18 = objc_msgSend(v8, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", v16, v16, 1, 0, &unk_1E932CB98, v12, v48, v17, 0, 0, 0, 0);

    v19 = dispatch_semaphore_create(0);
    *(_QWORD *)v62 = 0;
    v63 = v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__159;
    v66 = __Block_byref_object_dispose__159;
    v67 = 0;
    v56 = 0;
    v57 = &v56;
    v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__159;
    v60 = __Block_byref_object_dispose__159;
    v61 = 0;
    -[SMSuggestionsMetricsManager sessionStore](self, "sessionStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __87__SMSuggestionsMetricsManager__getSessionConfigurationsForSuggestion_timeWindow_error___block_invoke;
    v52[3] = &unk_1E9296EE0;
    v54 = &v56;
    v55 = v62;
    v21 = v19;
    v53 = v21;
    objc_msgSend(v20, "fetchSessionConfigurationsWithOptions:handler:", v18, v52);
    v49 = (void *)v18;

    v22 = v21;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v22, v24))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", v23);
    v27 = v26;
    v28 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "filteredArrayUsingPredicate:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "submitToCoreAnalytics:type:duration:", v32, 1, v27);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v34 = (void *)MEMORY[0x1E0CB35C8];
    v73[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v73, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = objc_retainAutorelease(v36);

    }
    else
    {
LABEL_7:
      v37 = 0;
    }

    v38 = v37;
    v39 = v38;
    if (a5 && v38)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v45 = (objc_class *)objc_opt_class();
        NSStringFromClass(v45);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v46;
        v69 = 2112;
        v70 = v47;
        v71 = 2112;
        v72 = v39;
        _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v41 = v39;
    }
    else
    {
      if (!a5)
      {
LABEL_21:
        v43 = (id)v57[5];

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(v62, 8);

        goto LABEL_22;
      }
      v41 = (void *)*((_QWORD *)v63 + 5);
    }
    *a5 = objc_retainAutorelease(v41);
    goto LABEL_21;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v62 = 0;
    _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: suggestion", v62, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("suggestion"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = (id)MEMORY[0x1E0C9AA60];
LABEL_22:

  return v43;
}

void __87__SMSuggestionsMetricsManager__getSessionConfigurationsForSuggestion_timeWindow_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getNPLOIsWithOnlyHighConfidence:(BOOL)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v9;
  dispatch_semaphore_t v10;
  void *v11;
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
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  void *v45;
  objc_class *v47;
  id v48;
  void *v49;
  uint64_t v50;
  objc_class *v51;
  id v52;
  void *v53;
  _BOOL4 v55;
  void *v56;
  id v57;
  _QWORD v58[4];
  NSObject *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _BYTE buf[12];
  __int16 v75;
  id v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  const __CFString *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  _QWORD v85[4];

  v55 = a3;
  v85[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v57 = a5;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__159;
  v72 = __Block_byref_object_dispose__159;
  v73 = 0;
  v10 = dispatch_semaphore_create(0);
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__159;
  v66 = __Block_byref_object_dispose__159;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v67 = (id)objc_claimAutoreleasedReturnValue();
  -[SMSuggestionsMetricsManager deviceLocationPredictor](self, "deviceLocationPredictor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __84__SMSuggestionsMetricsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke;
  v58[3] = &unk_1E9296EE0;
  v60 = &v62;
  v61 = &v68;
  v12 = v10;
  v59 = v12;
  objc_msgSend(v11, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:handler:", v9, v57, v58, 3600.0);
  v56 = v9;

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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_184);
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
  v85[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v85, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_retainAutorelease(v27);

  }
  else
  {
LABEL_6:
    v28 = 0;
  }

  v29 = v28;
  v30 = v29;
  if (a6)
  {
    if (v69[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v69[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v48;
        v75 = 2112;
        v76 = v49;
        v77 = 2112;
        v78 = v50;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v32 = (void *)v69[5];
LABEL_16:
      *a6 = objc_retainAutorelease(v32);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    if (v29)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v51 = (objc_class *)objc_opt_class();
        NSStringFromClass(v51);
        v52 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v52;
        v75 = 2112;
        v76 = v53;
        v77 = 2112;
        v78 = (uint64_t)v30;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v32 = v30;
      goto LABEL_16;
    }
  }
  v35 = (void *)v63[5];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_117);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "filteredArrayUsingPredicate:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend((id)v63[5], "count");
    v43 = objc_msgSend(v37, "count");
    v44 = CFSTR("NO");
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)&buf[4] = v40;
    v75 = 2112;
    if (v55)
      v44 = CFSTR("YES");
    v76 = v41;
    v77 = 2048;
    v78 = v42;
    v79 = 2112;
    v80 = v44;
    v81 = 2048;
    v82 = v43;
    v83 = 2112;
    v84 = v56;
    _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, nplois fetched count, %lu, onlyHighConfidence, %@, nplois with only high confidence count, %lu, w.r.t the location, %@", buf, 0x3Eu);

  }
  if (v55)
  {
    v45 = v37;
    if (a6)
    {
      *a6 = objc_retainAutorelease((id)v69[5]);
      v45 = v37;
    }
  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease((id)v69[5]);
    v45 = (void *)v63[5];
  }
  v34 = v45;

LABEL_28:
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v34;
}

void __84__SMSuggestionsMetricsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

BOOL __84__SMSuggestionsMetricsManager__getNPLOIsWithOnlyHighConfidence_location_date_error___block_invoke_107(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "confidence");
  return v2 == 1.0;
}

- (id)_computeWorkoutAlwaysPromptMetricsWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)_submitMetrics:(id)a3 event:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *k;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id *v43;
  id v44;
  id obj;
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
  __int128 v57;
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v64 = v11;
      v65 = 2112;
      v66 = v12;
      v67 = 2048;
      v68 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, %@, submitting metrics with count, %lu", buf, 0x20u);

    }
    switch(a4)
    {
      case 3uLL:
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        obj = v8;
        v13 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        if (v13)
        {
          v43 = a5;
          v44 = v8;
          v23 = *(_QWORD *)v47;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v47 != v23)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
              v26 = (void *)MEMORY[0x1D8231EA8]();
              v27 = objc_alloc(MEMORY[0x1E0CB3940]);
              v28 = (void *)objc_msgSend(v27, "initWithCString:encoding:", RTAnalyticsEventSMSuggestionsWorkoutAlwaysPromptConsidered, 1);
              log_analytics_submission(v28, v25);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEvent();

              objc_autoreleasePoolPop(v26);
            }
            v13 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
          }
          while (v13);
          goto LABEL_34;
        }
        break;
      case 2uLL:
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        obj = v8;
        v13 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        if (v13)
        {
          v43 = a5;
          v44 = v8;
          v30 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v51 != v30)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
              v33 = (void *)MEMORY[0x1D8231EA8]();
              v34 = objc_alloc(MEMORY[0x1E0CB3940]);
              v35 = (void *)objc_msgSend(v34, "initWithCString:encoding:", RTAnalyticsEventSMSuggestionsUsage, 1);
              log_analytics_submission(v35, v32);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEvent();

              objc_autoreleasePoolPop(v33);
            }
            v13 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          }
          while (v13);
          goto LABEL_34;
        }
        break;
      case 1uLL:
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        obj = v8;
        v13 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v13)
        {
          v43 = a5;
          v44 = v8;
          v14 = *(_QWORD *)v55;
          do
          {
            for (k = 0; k != v13; k = (char *)k + 1)
            {
              if (*(_QWORD *)v55 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)k);
              v17 = (void *)MEMORY[0x1D8231EA8]();
              v18 = objc_alloc(MEMORY[0x1E0CB3940]);
              v19 = (void *)objc_msgSend(v18, "initWithCString:encoding:", RTAnalyticsEventSMSuggestionsDetails, 1);
              log_analytics_submission(v19, v16);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              AnalyticsSendEvent();

              objc_autoreleasePoolPop(v17);
            }
            v13 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v13);
LABEL_34:
          a5 = v43;
          v8 = v44;
        }
        break;
      default:
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0D8BB70];
        v58 = *MEMORY[0x1E0CB2D50];
        v39 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "stringFromSuggestionsMetricsEvent:", a4);
        obj = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("requires a valid suggestions metric event. Passed, %@"), obj);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 7, v41);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }

    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v22 = v13 == 0;

    goto LABEL_39;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metrics", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("metrics"));
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_39:

  return v22;
}

+ (id)stringFromSuggestionsMetricsEvent:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("SuggestionsMetricsEventDetails");
  else
    return off_1E92A5130[a3];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocationPredictor, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (void)setSuggestionsStore:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
