@implementation RTStateModel

- (RTStateModel)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLearnedLocationsOfInterest_metricManager_queue_);
}

- (RTStateModel)initWithLearnedLocationsOfInterest:(id)a3 metricManager:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  RTStateModel *v13;
  RTStateModel *v14;
  uint64_t v15;
  NSMutableDictionary *stateModelLut;
  void *v17;
  uint64_t v18;
  void *v19;
  RTStateModelLocation *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  RTStateDepiction *v32;
  void *v33;
  void *v34;
  RTStateDepiction *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  uint64_t v67;
  RTStateTransitionOneTimeTrans *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  RTStateModel *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  char *v89;
  void *v90;
  id v91;
  id v92;
  id obj;
  id obja;
  uint64_t v95;
  uint64_t v96;
  RTStateModel *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  objc_super v125;
  uint8_t buf[4];
  const char *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      v125.receiver = self;
      v125.super_class = (Class)RTStateModel;
      v13 = -[RTStateModel init](&v125, sel_init);
      v14 = v13;
      if (v13)
      {
        v90 = v12;
        v91 = v10;
        objc_storeStrong((id *)&v13->_metricManager, a4);
        objc_storeStrong((id *)&v14->_queue, a5);
        v15 = objc_opt_new();
        stateModelLut = v14->_stateModelLut;
        v97 = v14;
        v14->_stateModelLut = (NSMutableDictionary *)v15;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v92 = v9;
        obj = v9;
        v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
        if (v98)
        {
          v95 = *(_QWORD *)v122;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v122 != v95)
                objc_enumerationMutation(obj);
              v107 = v18;
              v19 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v18);
              v20 = [RTStateModelLocation alloc];
              objc_msgSend(v19, "location");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "location");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[RTStateModelLocation initWithRTLocation:](v20, "initWithRTLocation:", v22);

              v24 = (void *)MEMORY[0x1E0D183C0];
              objc_msgSend(v19, "place");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v24, "typeFromPlaceType:", objc_msgSend(v25, "type"));

              v27 = (void *)MEMORY[0x1E0D183C0];
              objc_msgSend(v19, "place");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v27, "typeSourceFromPlaceTypeSource:", objc_msgSend(v28, "typeSource"));

              objc_msgSend(v19, "place");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "customLabel");
              v31 = objc_claimAutoreleasedReturnValue();

              v32 = [RTStateDepiction alloc];
              objc_msgSend(v19, "place");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "mapItem");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = (id)v23;
              v102 = (void *)v31;
              v35 = -[RTStateDepiction initWithLocation:type:typeSource:customLabel:mapItem:](v32, "initWithLocation:type:typeSource:customLabel:mapItem:", v23, v26, v29, v31, v34);

              v36 = (void *)objc_opt_new();
              objc_msgSend(v19, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setUniqueId:", v37);

              objc_msgSend(v36, "setStateDepiction:", v35);
              -[RTStateModel stateModelLut](v97, "stateModelLut");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "uniqueId");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKey:", v36, v39);

              objc_msgSend(v19, "identifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v36;
              objc_msgSend(v106, "setObject:forKey:", v36, v40);

              v119 = 0u;
              v120 = 0u;
              v117 = 0u;
              v118 = 0u;
              objc_msgSend(v19, "visits");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v118;
                do
                {
                  for (i = 0; i != v43; ++i)
                  {
                    if (*(_QWORD *)v118 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
                    objc_msgSend(v46, "entryDate", v90, v91);
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "timeIntervalSinceReferenceDate");
                    v49 = v48;
                    objc_msgSend(v46, "exitDate");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "timeIntervalSinceReferenceDate");
                    -[RTStateDepiction submitEntry:exit:](v35, "submitEntry:exit:", v49, v51);

                    objc_msgSend(v46, "identifier");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "setObject:forKey:", v19, v52);

                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
                }
                while (v43);
              }

              v18 = v107 + 1;
            }
            while (v107 + 1 != v98);
            v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v137, 16);
          }
          while (v98);
        }

        v115 = 0u;
        v116 = 0u;
        v113 = 0u;
        v114 = 0u;
        obja = obj;
        v99 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
        if (v99)
        {
          v96 = *(_QWORD *)v114;
          v103 = v17;
          do
          {
            v53 = 0;
            do
            {
              if (*(_QWORD *)v114 != v96)
                objc_enumerationMutation(obja);
              v101 = v53;
              v54 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v53);
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              v112 = 0u;
              objc_msgSend(v54, "transitions", v90, v91);
              v105 = (id)objc_claimAutoreleasedReturnValue();
              v108 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
              if (v108)
              {
                v55 = *(_QWORD *)v110;
                do
                {
                  for (j = 0; j != v108; ++j)
                  {
                    if (*(_QWORD *)v110 != v55)
                      objc_enumerationMutation(v105);
                    v57 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
                    objc_msgSend(v57, "visitIdentifierOrigin");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectForKey:", v58);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v57, "visitIdentifierDestination");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectForKey:", v60);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v59, "identifier");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v106, "objectForKey:", v62);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v61, "identifier");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v106, "objectForKey:", v64);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v63)
                      v66 = v65 == 0;
                    else
                      v66 = 1;
                    if (v66)
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
                      v74 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138413058;
                        v127 = (const char *)v59;
                        v128 = 2112;
                        v129 = v63;
                        v130 = 2112;
                        v131 = v61;
                        v132 = 2112;
                        v133 = v65;
                        _os_log_debug_impl(&dword_1D1A22000, v74, OS_LOG_TYPE_DEBUG, "transition missing endpoint. origin locationOfInterest, %@, state, %@, destination locationOfInterest, %@, state, %@", buf, 0x2Au);
                      }
                    }
                    else
                    {
                      v67 = v55;
                      v68 = [RTStateTransitionOneTimeTrans alloc];
                      objc_msgSend(v57, "startDate");
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v69, "timeIntervalSinceReferenceDate");
                      v71 = v70;
                      objc_msgSend(v57, "stopDate");
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v72, "timeIntervalSinceReferenceDate");
                      v74 = -[RTStateTransitionOneTimeTrans initWithStart:stop:motionActivityType:](v68, "initWithStart:stop:motionActivityType:", 0, v71, v73);

                      objc_msgSend(v63, "stateTransitions");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "uniqueId");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "objectForKey:", v76);
                      v77 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v77)
                      {
                        objc_msgSend(v63, "stateTransitions");
                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                        v79 = (void *)objc_opt_new();
                        objc_msgSend(v65, "uniqueId");
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v78, "setObject:forKey:", v79, v80);

                      }
                      objc_msgSend(v63, "stateTransitions");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "uniqueId");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v81, "objectForKey:", v82);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v83, "submitTransition:", v74);

                      v55 = v67;
                      v17 = v103;
                    }

                  }
                  v108 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v109, v134, 16);
                }
                while (v108);
              }

              v53 = v101 + 1;
            }
            while (v101 + 1 != v99);
            v99 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v113, v135, 16);
          }
          while (v99);
        }

        v14 = v97;
        -[RTStateModel updateInternalState](v97, "updateInternalState");

        v10 = v91;
        v9 = v92;
        v12 = v90;
      }
      self = v14;
      v84 = self;
      goto LABEL_53;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v127 = "-[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:]";
      v128 = 1024;
      LODWORD(v129) = 199;
      _os_log_error_impl(&dword_1D1A22000, v85, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: metricManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
      goto LABEL_50;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v86 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v127 = "-[RTStateModel initWithLearnedLocationsOfInterest:metricManager:queue:]";
    v128 = 1024;
    LODWORD(v129) = 200;
    _os_log_error_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
  }

LABEL_50:
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v87 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v89 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v127 = v89;
    _os_log_error_impl(&dword_1D1A22000, v87, OS_LOG_TYPE_ERROR, "%@ failed due to null parameter", buf, 0xCu);

  }
  v84 = 0;
LABEL_53:

  return v84;
}

- (void)updateInternalState
{
  void *v3;
  RTStateModelEarliestLatestEl *v4;
  RTStateModelEarliestLatestEl *v5;
  NSObject *v6;
  id v7;
  void *v8;
  double v9;
  _QWORD v10[8];
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0x426D1A94A2000000;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0xC26D1A94A2000000;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__123;
  v13[4] = __Block_byref_object_dispose__123;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__123;
  v11[4] = __Block_byref_object_dispose__123;
  v12 = 0;
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__RTStateModel_updateInternalState__block_invoke;
  v10[3] = &unk_1E92A2BE8;
  v10[4] = &v19;
  v10[5] = &v15;
  v10[6] = v11;
  v10[7] = v13;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);

  v4 = [RTStateModelEarliestLatestEl alloc];
  v5 = -[RTStateModelEarliestLatestEl initWithEarliest:andLatest:](v4, "initWithEarliest:andLatest:", v20[3], v16[3]);
  -[RTStateModel setEarliestLatestStateModelEl:](self, "setEarliestLatestStateModelEl:", v5);

  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "stringFromTimestamp:", v20[3]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "stringFromTimestamp:", v16[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16[3] - v20[3];
    *(_DWORD *)buf = 138412802;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v27 = 2048;
    v28 = v9 / 604800.0;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "earliest entry %@, latest entry %@, total duration, %f wks", buf, 0x20u);

  }
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

void __35__RTStateModel_updateInternalState__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "stateDepiction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntyExit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stateDepiction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getEarliestLatestEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
  objc_msgSend(v8, "earliestEl_s");
  if (v9 > v10)
  {
    objc_msgSend(v8, "earliestEl_s");
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v11;
  }
  v12 = *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v8, "latestEl_s");
  if (v12 < v13)
  {
    objc_msgSend(v8, "latestEl_s");
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v14;
  }
  v15 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  if (!v15 || (objc_msgSend(v15, "exit_s"), v17 = v16, objc_msgSend(v6, "exit_s"), v17 < v18))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);
  }

}

- (id)_getNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5
{
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  const char *v13;
  double v14;
  double v15;
  double Current;
  void *v17;
  double v18;
  double v19;
  unsigned int v20;
  _BOOL4 v21;
  _BOOL4 v22;
  double v23;
  double v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  int v31;
  char v32;
  int v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  NSObject *v58;
  void *v59;
  int v60;
  NSObject *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  _BOOL4 v82;
  id v83;
  void *v84;
  id v85;
  RTStateModelLocation *v86;
  void *v87;
  id v88;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v95;
  RTStateModelLocation *v96;
  _QWORD v97[4];
  RTStateModelLocation *v98;
  id v99;
  double v100;
  char v101;
  _QWORD v102[5];
  id v103;
  double v104;
  _QWORD v105[5];
  RTStateModelLocation *v106;
  id v107;
  id v108;
  id v109;
  double v110;
  double v111;
  char v112;
  _QWORD v113[5];
  id v114;
  id v115;
  double v116;
  _QWORD v117[4];
  id v118;
  uint8_t *v119;
  uint8_t v120[8];
  uint8_t *v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD v124[5];
  RTStateModelLocation *v125;
  id v126;
  id v127;
  id v128;
  double v129;
  double v130;
  _QWORD v131[7];
  int v132;
  _BYTE buf[24];
  uint64_t (*v134)(uint64_t, uint64_t);
  _BYTE v135[20];
  __int16 v136;
  int v137;
  __int16 v138;
  const __CFString *v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v94 = a3;
  v91 = a4;
  objc_msgSend(v91, "timeIntervalSinceReferenceDate");
  v10 = v9;
  v11 = 3600.0;
  if (a5 >= 3600.0)
  {
    v11 = 86400.0;
    if (a5 <= 86400.0)
      goto LABEL_7;
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0x40F5180000000000;
      v13 = "Forcing maximum prediction window %fs";
      goto LABEL_86;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0x40AC200000000000;
      v13 = "Forcing minimum prediction window %fs";
LABEL_86:
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);
    }
  }

  a5 = v11;
LABEL_7:
  -[RTStateModel getMaxDistFromInterval:withVelocity:](self, "getMaxDistFromInterval:withVelocity:", a5, 20.0);
  v15 = v14;
  v96 = -[RTStateModelLocation initWithRTLocation:]([RTStateModelLocation alloc], "initWithRTLocation:", v94);
  v92 = (void *)objc_opt_new();
  Current = CFAbsoluteTimeGetCurrent();
  -[RTStateModel earliestLatestStateModelEl](self, "earliestLatestStateModelEl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[RTStateModel getNumberOfWeeksInStateModel](self, "getNumberOfWeeksInStateModel");
    v19 = v18;
    v20 = vcvtmd_s64_f64(v18);
    if (v18 <= 6.0)
      LODWORD(v17) = v20;
    else
      LODWORD(v17) = 6;
  }
  else
  {
    v19 = 0.0;
  }
  if (v96)
  {
    -[RTStateModel findClusterWithLocation:](self, "findClusterWithLocation:");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v95 = 0;
  }
  v21 = -[RTStateModel anyClusterOfInterestWithinDistance:ofLocation:andEnteredEarlierThan:](self, "anyClusterOfInterestWithinDistance:ofLocation:andEnteredEarlierThan:", v94, v15, Current + -1209600.0);
  v22 = v21;
  v23 = 0.0;
  if (v19 >= 2.0)
    v23 = 1.0;
  if (v21)
    v24 = 1.0;
  else
    v24 = v23;
  if (v21)
    v25 = v17;
  else
    v25 = 1;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "stringFromDate");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    v30 = CFSTR("YES");
    *(_DWORD *)buf = 138413827;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    if (v22)
      v30 = CFSTR("NO");
    *(_QWORD *)&buf[14] = v96;
    *(_WORD *)&buf[22] = 2112;
    v134 = (uint64_t (*)(uint64_t, uint64_t))v28;
    *(_WORD *)v135 = 2048;
    *(double *)&v135[2] = a5;
    *(_WORD *)&v135[10] = 2049;
    *(double *)&v135[12] = v19;
    v136 = 1025;
    v137 = v25;
    v138 = 2112;
    v139 = v30;
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, location, %@, startDate, %@, predictionWindow, %.2f, number of weeks in State Model, %{private}f, number of weeks for prediciton, %{private}d, sparse mode, %@", buf, 0x44u);

  }
  -[RTStateModel getOOStClusterData:predictionWindow:numOfWeeks:refLoc:](self, "getOOStClusterData:predictionWindow:numOfWeeks:refLoc:", v25, v96, v10, a5);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = !v22;
  if (v95)
    v32 = !v22;
  else
    v32 = 1;
  if ((v32 & 1) != 0)
  {
    v33 = 0;
    v34 = 0;
    goto LABEL_57;
  }
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v95;
    _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "reference location resolves to inside the state model, %@", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v134 = __Block_byref_object_copy__123;
  *(_QWORD *)v135 = __Block_byref_object_dispose__123;
  *(_QWORD *)&v135[8] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v95, "stateTransitions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke;
  v131[3] = &unk_1E92A2C10;
  *(double *)&v131[5] = v10;
  *(double *)&v131[6] = a5;
  v132 = v25;
  v131[4] = buf;
  objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v131);

  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v19 <= 2.0)
  {
    v34 = v37;
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v120 = 0;
      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "Selecting Daily Intervals - IN-STATE-OP", v120, 2u);
    }

    objc_msgSend(v34, "sortUsingComparator:", &__block_literal_global_65);
    v41 = 0;
  }
  else
  {
    v38 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v124[0] = MEMORY[0x1E0C809B0];
    v124[1] = 3221225472;
    v124[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2;
    v124[3] = &unk_1E92A2C38;
    v124[4] = self;
    v125 = v96;
    v129 = Current;
    v126 = v93;
    v130 = v15;
    v39 = v90;
    v127 = v39;
    v128 = v37;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v124);

    v34 = v39;
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v120 = 0;
      _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "Selecting Weekly Intervals - IN-STATE-OP", v120, 2u);
    }

    objc_msgSend(v34, "sortUsingComparator:", &__block_literal_global_97);
    v41 = objc_msgSend(v34, "count") == 0;
  }
  objc_msgSend(v34, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stateUUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "uniqueId");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44 == v45;

  if (v46)
  {

    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v120 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_DEBUG, "We are staying home and not really going anywhere - reverting into out of state model to verify!!", v120, 2u);
    }

    v34 = 0;
    v41 = 1;
  }
  else
  {
    *(_QWORD *)v120 = 0;
    v121 = v120;
    v122 = 0x2020000000;
    v123 = -1;
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_66;
    v117[3] = &unk_1E929CB30;
    v118 = v95;
    v119 = v120;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v117);
    if ((*((_QWORD *)v121 + 3) & 0x8000000000000000) == 0)
      objc_msgSend(v34, "removeObjectAtIndex:");

    _Block_object_dispose(v120, 8);
  }
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "firstObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "stateUUID");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
    goto LABEL_53;
  objc_msgSend(v51, "stateDepiction");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "location");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "Latitude_deg");
  objc_msgSend(v51, "stateDepiction");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "location");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "Longitude_deg");
  -[RTStateModelLocation Latitude_deg](v96, "Latitude_deg");
  -[RTStateModelLocation Longitude_deg](v96, "Longitude_deg");
  RTCommonCalculateDistanceHighPrecision();
  v57 = v56;

  if (v57 < 700.0)
  {

    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v120 = 0;
      _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "in-state recommendation is too close in distance - reverting to out of State estimate", v120, 2u);
    }

    v34 = 0;
  }
  else
  {
LABEL_53:
    if (!v41)
    {
      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_67;
      v113[3] = &unk_1E92A2CA0;
      v113[4] = self;
      v114 = v90;
      v116 = v24;
      v115 = v92;
      objc_msgSend(v34, "enumerateObjectsUsingBlock:", v113);

      v33 = 0;
      goto LABEL_56;
    }
  }
  v33 = 1;
LABEL_56:
  v59 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

  _Block_object_dispose(buf, 8);
  v31 = !v22;
LABEL_57:
  if (v95)
    v60 = v33;
  else
    v60 = 1;
  if ((v60 | v31) == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = CFSTR("YES");
      if (v95)
        v63 = CFSTR("YES");
      else
        v63 = CFSTR("NO");
      if (v33)
        v64 = CFSTR("YES");
      else
        v64 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v64;
      if (v22)
        v62 = CFSTR("NO");
      *(_WORD *)&buf[22] = 2112;
      v134 = (uint64_t (*)(uint64_t, uint64_t))v62;
      _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "Entering OutOfState: state at reference location, %@, revertToOutOfStateLogic requested, %@, sparseData, %@", buf, 0x20u);
    }

    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v93, "selectOOStStates");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_68;
    v105[3] = &unk_1E92A2CC8;
    v105[4] = self;
    v106 = v96;
    v110 = Current;
    v112 = v31;
    v68 = v93;
    v107 = v68;
    v111 = v15;
    v69 = v66;
    v108 = v69;
    v70 = v65;
    v109 = v70;
    objc_msgSend(v67, "enumerateObjectsUsingBlock:", v105);

    if (v22)
    {
      v71 = v69;
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v72, OS_LOG_TYPE_INFO, "Selecting Weekly Intervals - OUT-OF-STATE-OP", buf, 2u);
      }

      objc_msgSend(v71, "sortUsingComparator:", &__block_literal_global_70);
    }
    else
    {
      v71 = v70;
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_INFO, "Selecting Daily Intervals - OUT-OF-STATE-OP", buf, 2u);
      }

      objc_msgSend(v71, "sortUsingComparator:", &__block_literal_global_72);
    }

    v74 = v71;
    if (v33)
    {
      objc_msgSend(v71, "firstObject");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "weekly");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "density");
      v78 = v77;
      objc_msgSend(v34, "firstObject");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "weekly");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "density");
      v82 = v78 > v81;

      if (v82)
        v74 = v71;
      else
        v74 = v34;
    }
    v83 = v74;
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2_73;
    v102[3] = &unk_1E92A2808;
    v102[4] = self;
    v104 = v24;
    v103 = v92;
    objc_msgSend(v83, "enumerateObjectsUsingBlock:", v102);
    objc_msgSend(v68, "setSelectOOStStates:", 0);

  }
  else
  {
    LOBYTE(v31) = 0;
    v71 = 0;
  }
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_3;
  v97[3] = &unk_1E92A2D30;
  v101 = v31;
  v98 = v96;
  v100 = v15;
  v85 = v92;
  v99 = v85;
  v86 = v96;
  objc_msgSend(v84, "enumerateKeysAndObjectsUsingBlock:", v97);

  v87 = v99;
  v88 = v85;

  return v88;
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "getPredTrans:duration:numOfWeeks:uniqueID:", *(unsigned int *)(a1 + 56), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  int v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  NSObject *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  int v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  _BYTE v115[48];
  __int16 v116;
  int v117;
  __int16 v118;
  double v119;
  __int16 v120;
  double v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stateModelLut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stateDepiction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Latitude_deg");
  objc_msgSend(v6, "stateDepiction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Longitude_deg");
  objc_msgSend(*(id *)(a1 + 40), "Latitude_deg");
  objc_msgSend(*(id *)(a1 + 40), "Longitude_deg");
  RTCommonCalculateDistanceHighPrecision();
  v12 = v11;

  objc_msgSend(v3, "weekly");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latestTransTimeStart_s");
  v15 = v14;

  if (v15 <= -1.0)
  {
    v19 = 1.0e12;
  }
  else
  {
    v16 = *(double *)(a1 + 72);
    objc_msgSend(v3, "weekly");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "latestTransTimeStart_s");
    v19 = v16 - v18;

  }
  objc_msgSend(v3, "weekly");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "density");
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
  if (v22 * v23 <= 0.3)
    goto LABEL_12;
  objc_msgSend(v3, "weekly");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v24, "numOfTrans") < 2 || v12 <= 700.0 || v12 >= *(double *)(a1 + 80))
  {

LABEL_12:
    goto LABEL_13;
  }

  if (v19 < 1900800.0)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    objc_msgSend(v3, "weekly");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "predResidualStart_s");
    v27 = v26 / 3600.0;
    objc_msgSend(v3, "weekly");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "resUncStart_s");
    v29 = v28 / 3600.0;
    objc_msgSend(v3, "weekly");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "predResidualStop_s");
    v31 = v30 / 3600.0;
    objc_msgSend(v3, "weekly");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "resUncStop_s");
    v33 = v32 / 3600.0;
    objc_msgSend(v3, "weekly");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "primaryStopDate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "stringFromDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "weekly");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "numOfTrans");
    objc_msgSend(v3, "weekly");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "density");
    v39 = v38;
    objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
    v41 = v39 * v40;
    objc_msgSend(v3, "daily");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "density");
    v44 = v43;
    objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
    *(_DWORD *)buf = 138414339;
    v113 = v6;
    v114 = 2049;
    *(double *)v115 = v27;
    *(_WORD *)&v115[8] = 2048;
    *(double *)&v115[10] = v29;
    *(_WORD *)&v115[18] = 2049;
    *(double *)&v115[20] = v31;
    *(_WORD *)&v115[28] = 2048;
    *(double *)&v115[30] = v33;
    *(_WORD *)&v115[38] = 2112;
    *(_QWORD *)&v115[40] = v34;
    v116 = 1025;
    v117 = v36;
    v118 = 2049;
    v119 = v41;
    v120 = 2049;
    v121 = v44 * v45;
    _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "Recommending WEEKLY INTERVAL, state, %@, start Trans %{private}f [h], unc Res %f [h], stop Trans %{private}f [h], unc Res %f [h], primaryStopDate, %@, num Of Trans %{private}d, weeklyDens %{private}f, dailyDens %{private}f", buf, 0x58u);

    goto LABEL_15;
  }
LABEL_13:
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v25 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    goto LABEL_16;
  objc_msgSend(v3, "weekly");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v34, "numOfTrans");
  objc_msgSend(v3, "weekly");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "density");
  v49 = v48;
  objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
  v51 = v49 * v50;
  objc_msgSend(v3, "daily");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "density");
  v54 = v53;
  objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
  *(_DWORD *)buf = 138413571;
  v113 = v6;
  v114 = 1025;
  *(_DWORD *)v115 = v46;
  *(_WORD *)&v115[4] = 2049;
  *(double *)&v115[6] = v19;
  *(_WORD *)&v115[14] = 2049;
  *(double *)&v115[16] = v51;
  *(_WORD *)&v115[24] = 2049;
  *(double *)&v115[26] = v54 * v55;
  *(_WORD *)&v115[34] = 2049;
  *(double *)&v115[36] = v12;
  _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "Dropping WEEKLY INTERVAL, state, %@, numOfTrans %{private}d, ageOfTrans %{private}f, weeklyDens %{private}f, dailyDens %{private}f, dist %{private}f", buf, 0x3Au);

LABEL_15:
LABEL_16:

  objc_msgSend(v3, "daily");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "latestTransTimeStart_s");
  v58 = v57;

  if (v58 <= -1.0)
  {
    v62 = 1.0e12;
  }
  else
  {
    v59 = *(double *)(a1 + 72);
    objc_msgSend(v3, "daily");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "latestTransTimeStart_s");
    v62 = v59 - v61;

  }
  objc_msgSend(v3, "daily");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "density");
  v65 = v64;
  objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
  if (v65 * v66 <= 0.2)
    goto LABEL_27;
  objc_msgSend(v3, "daily");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v67, "numOfTrans") < 3 || v12 <= 700.0 || v12 >= *(double *)(a1 + 80))
  {

LABEL_27:
    goto LABEL_28;
  }

  if (v62 < 432000.0)
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "daily");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "predResidualStart_s");
      v70 = v69 / 3600.0;
      objc_msgSend(v3, "daily");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "resUncStart_s");
      v72 = v71 / 3600.0;
      objc_msgSend(v3, "daily");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "predResidualStop_s");
      v74 = v73 / 3600.0;
      objc_msgSend(v3, "daily");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "resUncStop_s");
      v76 = v75 / 3600.0;
      objc_msgSend(v3, "daily");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "primaryStopDate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "stringFromDate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "daily");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "numOfTrans");
      objc_msgSend(v3, "daily");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "density");
      v83 = v82;
      objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
      v85 = v83 * v84;
      objc_msgSend(v3, "weekly");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "density");
      v88 = v87;
      objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
      *(_DWORD *)buf = 138414339;
      v113 = v6;
      v114 = 2049;
      *(double *)v115 = v70;
      *(_WORD *)&v115[8] = 2049;
      *(double *)&v115[10] = v72;
      *(_WORD *)&v115[18] = 2049;
      *(double *)&v115[20] = v74;
      *(_WORD *)&v115[28] = 2048;
      *(double *)&v115[30] = v76;
      *(_WORD *)&v115[38] = 2112;
      *(_QWORD *)&v115[40] = v78;
      v116 = 1025;
      v117 = v80;
      v118 = 2049;
      v119 = v85;
      v120 = 2049;
      v121 = v88 * v89;
      _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "Recommending DAILY INTERVAL, state, %@, start Trans %{private}f [h], unc Res %{private}f [h], stop Trans %{private}f [h], unc Res %f [h], primaryStopDate, %@, num Of Trans %{private}d, dailyDens %{private}f, weeklyDens %{private}f", buf, 0x58u);

    }
    goto LABEL_30;
  }
LABEL_28:
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "daily");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "numOfTrans");
    objc_msgSend(v3, "daily");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "density");
    v94 = v93;
    objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
    v96 = v94 * v95;
    objc_msgSend(v3, "weekly");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "density");
    v99 = v98;
    objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
    *(_DWORD *)buf = 138413571;
    v113 = v6;
    v114 = 1024;
    *(_DWORD *)v115 = v91;
    *(_WORD *)&v115[4] = 2049;
    *(double *)&v115[6] = v62;
    *(_WORD *)&v115[14] = 2049;
    *(double *)&v115[16] = v96;
    *(_WORD *)&v115[24] = 2049;
    *(double *)&v115[26] = v99 * v100;
    *(_WORD *)&v115[34] = 2049;
    *(double *)&v115[36] = v12;
    _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "Dropping DAILY INTERVAL, state, %@, numOfTrans %d, ageOfTrans %{private}f, dailyDens %{private}f, weeklyDens %{private}f, dist %{private}f", buf, 0x3Au);

  }
LABEL_30:

}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "weekly");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "density");
  v7 = v6;
  objc_msgSend(v4, "weekly");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "density");
  v10 = v9;

  if (v7 <= v10)
    return 1;
  else
    return -1;
}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "daily");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "density");
  v7 = v6;
  objc_msgSend(v4, "daily");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "density");
  v10 = v9;

  if (v7 <= v10)
    return 1;
  else
    return -1;
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_66(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a2, "stateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "Remove transition into itself!!", v8, 2u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_67(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stateModelLut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stateUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(v13, "weekly");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryStopDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "weekly");
  }
  else
  {
    objc_msgSend(v13, "daily");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryStopDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "daily");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "motionActivityType");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithOneState:", v5);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithLocationOfInterest:confidence:nextEntryTime:motionActivityType:", v11, v7, v10, *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  NSObject *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  const char *v87;
  double v88;
  double v89;
  int v90;
  uint64_t v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  double v103;
  __int16 v104;
  int v105;
  __int16 v106;
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  double v113;
  __int16 v114;
  double v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "stateModelLut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stateDepiction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Latitude_deg");
  objc_msgSend(v6, "stateDepiction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Longitude_deg");
  objc_msgSend(*(id *)(a1 + 40), "Latitude_deg");
  objc_msgSend(*(id *)(a1 + 40), "Longitude_deg");
  RTCommonCalculateDistanceHighPrecision();
  v12 = v11;

  objc_msgSend(v3, "weekly");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latestVisitTime_s");
  v15 = v14;

  if (v15 <= -1.0)
  {
    v19 = 1.0e12;
  }
  else
  {
    v16 = *(double *)(a1 + 72);
    objc_msgSend(v3, "weekly");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "latestVisitTime_s");
    v19 = v16 - v18;

  }
  if (*(_BYTE *)(a1 + 88))
    goto LABEL_16;
  objc_msgSend(v3, "weekly");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "density");
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
  if (v22 * v23 <= 0.4)
  {
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v3, "weekly");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v24, "numOfClustEntries") < 2
    || v12 <= 700.0
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v25 <= 0.0)
    || v12 >= *(double *)(a1 + 80)
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v26 <= 0.0))
  {

    goto LABEL_15;
  }

  if (v19 < 1900800.0)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "weekly");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "aggregateTime_s");
      v29 = v28 / 3600.0;
      objc_msgSend(v3, "weekly");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "numOfClustEntries");
      v32 = *(_QWORD *)(a1 + 80);
      objc_msgSend(v3, "weekly");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "density");
      v35 = v34;
      objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
      v37 = v35 * v36;
      objc_msgSend(v3, "daily");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "density");
      v40 = v39;
      objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
      *(_DWORD *)buf = 138414083;
      v101 = v6;
      v102 = 2049;
      v103 = v29;
      v104 = 1025;
      v105 = v31;
      v106 = 2049;
      v107 = v12;
      v108 = 2049;
      v109 = v19 / 3600.0;
      v110 = 2049;
      v111 = v32;
      v112 = 2049;
      v113 = v37;
      v114 = 2049;
      v115 = v40 * v41;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "Recommending WEEKLY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to Clust %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, weeklyDens %{private}f, dailyDens %{private}f ", buf, 0x4Eu);

    }
    goto LABEL_18;
  }
LABEL_16:
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "weekly");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "aggregateTime_s");
    v44 = v43 / 3600.0;
    objc_msgSend(v3, "weekly");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "numOfClustEntries");
    v47 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v3, "weekly");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "density");
    v50 = v49;
    objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
    v52 = v50 * v51;
    objc_msgSend(v3, "daily");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "density");
    v55 = v54;
    objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
    *(_DWORD *)buf = 138414083;
    v101 = v6;
    v102 = 2049;
    v103 = v44;
    v104 = 1025;
    v105 = v46;
    v106 = 2049;
    v107 = v12;
    v108 = 2049;
    v109 = v19 / 3600.0;
    v110 = 2049;
    v111 = v47;
    v112 = 2049;
    v113 = v52;
    v114 = 2049;
    v115 = v55 * v56;
    _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "Dropping WEEKLY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to Clust %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, weeklyDens %{private}f, dailyDens %{private}f", buf, 0x4Eu);

  }
LABEL_18:

  objc_msgSend(v3, "daily");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "latestVisitTime_s");
  v59 = v58;

  if (v59 <= -1.0)
  {
    v63 = 1.0e12;
  }
  else
  {
    v60 = *(double *)(a1 + 72);
    objc_msgSend(v3, "daily");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "latestVisitTime_s");
    v63 = v60 - v62;

  }
  objc_msgSend(v3, "daily");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "density");
  v66 = v65;
  objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
  if (v66 * v67 <= 0.2)
    goto LABEL_31;
  objc_msgSend(v3, "daily");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v68, "numOfClustEntries") < 3
    || v12 <= 700.0
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v69 <= 0.0)
    || v12 >= *(double *)(a1 + 80)
    || (objc_msgSend(*(id *)(a1 + 40), "uncertainty_m"), v70 <= 0.0))
  {

LABEL_31:
    goto LABEL_32;
  }

  if (v63 < 432000.0)
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "daily");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "aggregateTime_s");
      v74 = v73 / 3600.0;
      objc_msgSend(v3, "daily");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "numOfClustEntries");
      v77 = *(_QWORD *)(a1 + 80);
      objc_msgSend(v3, "daily");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "density");
      v80 = v79;
      objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
      v82 = v80 * v81;
      objc_msgSend(v3, "weekly");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "density");
      v85 = v84;
      objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
      *(_DWORD *)buf = 138414083;
      v101 = v6;
      v102 = 2049;
      v103 = v74;
      v104 = 1025;
      v105 = v76;
      v106 = 2049;
      v107 = v12;
      v108 = 2049;
      v109 = v63 / 3600.0;
      v110 = 2049;
      v111 = v77;
      v112 = 2049;
      v113 = v82;
      v114 = 2049;
      v115 = v85 * v86;
      v87 = "Recommending DAILY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to"
            " Clust %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, dailyDens %{private}f, w"
            "eeklyDens %{private}f";
LABEL_34:
      _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_INFO, v87, buf, 0x4Eu);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
LABEL_32:
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "daily");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "aggregateTime_s");
    v89 = v88 / 3600.0;
    objc_msgSend(v3, "daily");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v75, "numOfClustEntries");
    v91 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v3, "daily");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "density");
    v93 = v92;
    objc_msgSend(*(id *)(a1 + 48), "dailyDensityCorrection");
    v95 = v93 * v94;
    objc_msgSend(v3, "weekly");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "density");
    v97 = v96;
    objc_msgSend(*(id *)(a1 + 48), "weeklyDensityCorrection");
    *(_DWORD *)buf = 138414083;
    v101 = v6;
    v102 = 2049;
    v103 = v89;
    v104 = 1025;
    v105 = v90;
    v106 = 2049;
    v107 = v12;
    v108 = 2049;
    v109 = v63 / 3600.0;
    v110 = 2049;
    v111 = v91;
    v112 = 2049;
    v113 = v95;
    v114 = 2049;
    v115 = v97 * v98;
    v87 = "Dropping DAILY INTERVAL, state, %@, lifespan %{private}f, numOfClustEntries %{private}d, LastLoc Dist to Clust"
          " %{private}f, ageLatestClust visit %{private}f, Max Cluster Dist %{private}f, dailyDens %{private}f, weeklyDens %{private}f";
    goto LABEL_34;
  }
LABEL_35:

}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "weekly");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "density");
  v7 = v6;
  objc_msgSend(v4, "weekly");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "density");
  v10 = v9;

  if (v7 <= v10)
    return 1;
  else
    return -1;
}

uint64_t __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "daily");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "density");
  v7 = v6;
  objc_msgSend(v4, "daily");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "density");
  v10 = v9;

  if (v7 <= v10)
    return 1;
  else
    return -1;
}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_2_73(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "stateModelLut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithOneState:", v9);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithLocationOfInterest:confidence:nextEntryTime:motionActivityType:", v7, 0, 0, *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __88__RTStateModel__getNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "stateDepiction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type"))
  {
    if (!*(_BYTE *)(a1 + 56))
    {
LABEL_10:

      v7 = v21;
      goto LABEL_11;
    }
    objc_msgSend(v21, "stateDepiction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    v7 = v21;
    if (v6 != 1)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v21, "stateDepiction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Latitude_deg");
  objc_msgSend(v21, "stateDepiction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Longitude_deg");
  objc_msgSend(*(id *)(a1 + 32), "Latitude_deg");
  objc_msgSend(*(id *)(a1 + 32), "Longitude_deg");
  RTCommonCalculateDistanceHighPrecision();
  v13 = v12;

  v7 = v21;
  if (v13 > 700.0 && v13 < *(double *)(a1 + 48))
  {
    v14 = *(void **)(a1 + 40);
    v15 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v21, "uniqueId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("locationOfInterest.identifier"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v7 = v21;
    if (!v19)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithOneState:", v21);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithLocationOfInterest:confidence:nextEntryTime:motionActivityType:", v4, 0, 0, 0.0);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

      goto LABEL_10;
    }
  }
LABEL_11:

}

- (id)getPredictedLocationsOfInterestWithCriteria:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  int v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "referenceDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  -[RTStateModel getNumberOfWeeksInStateModel](self, "getNumberOfWeeksInStateModel");
  v11 = (int)v10;
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke;
  v25[3] = &unk_1E92A2D58;
  v28 = v9;
  v14 = v5;
  v26 = v14;
  v29 = v11;
  v15 = v6;
  v27 = v15;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v25);

  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_81);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke_3;
  v23[3] = &unk_1E92974C8;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "referenceDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 138412802;
    v31 = v19;
    v32 = 2112;
    v33 = v21;
    v34 = 2048;
    v35 = v22;
    _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@%@ found %lu PLOIs", buf, 0x20u);

  }
  return v16;
}

void __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  v5 = a2;
  objc_msgSend(v11, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "windowDuration");
  objc_msgSend(v6, "getPredState:predictionWindow:numOfWeeks:uniqueID:", *(unsigned int *)(a1 + 56), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTStateModel getOutOfStateConfidenceWithOneStatePred:](RTStateModel, "getOutOfStateConfidenceWithOneStatePred:", v9);
  if (v10 >= 1.0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

uint64_t __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "stateDepiction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getLastVisit");
  v7 = v6;
  objc_msgSend(v4, "stateDepiction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "getLastVisit");
  v10 = v9;

  if (v7 <= v10)
    return 1;
  else
    return -1;
}

void __60__RTStateModel_getPredictedLocationsOfInterestWithCriteria___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0D183C0];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithOneState:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithLocationOfInterest:confidence:nextEntryTime:motionActivityType:", v6, 0, 0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)findClusterWithLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__123;
  v18 = __Block_byref_object_dispose__123;
  v19 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x7FF0000000000000;
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__RTStateModel_findClusterWithLocation___block_invoke;
  v9[3] = &unk_1E92A2DA0;
  v6 = v4;
  v10 = v6;
  v11 = v13;
  v12 = &v14;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (id)v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __40__RTStateModel_findClusterWithLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  uint8_t v25[16];

  v5 = a3;
  objc_msgSend(v5, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "Longitude_deg");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "Longitude_deg");
  if (vabdd_f64(v9, v10) >= 180.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v25 = 0;
      _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "Cluster aggregation falls into DateLine ", v25, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "Latitude_deg");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "Longitude_deg");
    v14 = v13;
    objc_msgSend(v7, "Latitude_deg");
    v16 = v15;
    objc_msgSend(v7, "Longitude_deg");
    +[RTStateModel getDistfromLat:fromLon:toLat:toLon:](RTStateModel, "getDistfromLat:fromLon:toLat:toLon:", v12, v14, v16, v17);
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 32), "uncertainty_m");
    v21 = v20;
    objc_msgSend(v7, "uncertainty_m");
    +[RTStateModel deriveClusterThresholdFromUncClustAplha:andUncClustBeta:](RTStateModel, "deriveClusterThresholdFromUncClustAplha:andUncClustBeta:", v21, v22);
    if (v19 <= v23 && v19 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
    }
  }

}

- (id)getLocationsOfInterestWithinDistance:(double)a3 ofLocation:(id)a4
{
  id v6;
  RTStateModelLocation *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  RTStateModelLocation *v12;
  id v13;
  double v14;

  v6 = a4;
  v7 = -[RTStateModelLocation initWithCLLocation:]([RTStateModelLocation alloc], "initWithCLLocation:", v6);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 > 0.0)
  {
    -[RTStateModel stateModelLut](self, "stateModelLut");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__RTStateModel_getLocationsOfInterestWithinDistance_ofLocation___block_invoke;
    v11[3] = &unk_1E92A2DC8;
    v14 = a3;
    v12 = v7;
    v13 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  objc_msgSend(v8, "sortUsingComparator:", &__block_literal_global_83);

  return v8;
}

void __64__RTStateModel_getLocationsOfInterestWithinDistance_ofLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stateDepiction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "Latitude_deg");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "Longitude_deg");
    v11 = v10;
    objc_msgSend(v6, "Latitude_deg");
    v13 = v12;
    objc_msgSend(v6, "Longitude_deg");
    +[RTStateModel getDistfromLat:fromLon:toLat:toLon:](RTStateModel, "getDistfromLat:fromLon:toLat:toLon:", v9, v11, v13, v14);
    if (v7 > v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithOneState:", v4);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = *(_QWORD *)(a1 + 48);
        v19 = *(_QWORD *)(a1 + 32);
        v20 = 134218498;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        v24 = 2112;
        v25 = v4;
        _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "Found an LOI within %.2fm of %@, loi, %@", (uint8_t *)&v20, 0x20u);
      }

    }
  }

}

uint64_t __64__RTStateModel_getLocationsOfInterestWithinDistance_ofLocation___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "visits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 > v8)
    return -1;
  else
    return 1;
}

- (BOOL)anyClusterOfInterestWithinDistance:(double)a3 ofLocation:(id)a4 andEnteredEarlierThan:(double)a5
{
  id v8;
  RTStateModelLocation *v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  RTStateModelLocation *v14;
  uint64_t *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v9 = -[RTStateModelLocation initWithRTLocation:]([RTStateModelLocation alloc], "initWithRTLocation:", v8);
  if (a3 > 0.0 && a5 > 0.0)
  {
    -[RTStateModel stateModelLut](self, "stateModelLut");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__RTStateModel_anyClusterOfInterestWithinDistance_ofLocation_andEnteredEarlierThan___block_invoke;
    v13[3] = &unk_1E92A2E10;
    v16 = a3;
    v17 = a5;
    v14 = v9;
    v15 = &v18;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __84__RTStateModel_anyClusterOfInterestWithinDistance_ofLocation_andEnteredEarlierThan___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "Latitude_deg");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "Longitude_deg");
    v12 = v11;
    objc_msgSend(v7, "Latitude_deg");
    v14 = v13;
    objc_msgSend(v7, "Longitude_deg");
    +[RTStateModel getDistfromLat:fromLon:toLat:toLon:](RTStateModel, "getDistfromLat:fromLon:toLat:toLon:", v10, v12, v14, v15);
    if (v8 > v16)
    {
      objc_msgSend(v20, "stateDepiction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "getEarliestLatestEntry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "earliestEl_s");
      if (v19 < *(double *)(a1 + 56))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }

    }
  }

}

- (double)getNumberOfWeeksInStateModel
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double result;

  -[RTStateModel earliestLatestStateModelEl](self, "earliestLatestStateModelEl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestEl_s");
  v5 = v4;

  -[RTStateModel earliestLatestStateModelEl](self, "earliestLatestStateModelEl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earliestEl_s");
  v8 = v7;

  result = (v5 - v8) / 604800.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)getMaxDistFromInterval:(double)a3 withVelocity:(double)a4
{
  BOOL v4;
  double result;

  v4 = a4 <= 0.0 || a3 <= 0.0;
  result = a3 * a4;
  if (v4)
    return 72000.0;
  return result;
}

- (id)getOOStClusterData:(double)a3 predictionWindow:(double)a4 numOfWeeks:(int)a5 refLoc:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  RTStateModelAggOutOfStateSelection *v25;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *);
  void *v32;
  id v33;
  id v34;
  RTStateModel *v35;
  id v36;
  id v37;
  double v38;
  double v39;
  int v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke;
  v32 = &unk_1E92A2E38;
  v38 = a3;
  v39 = a4;
  v40 = a5;
  v33 = v13;
  v34 = v10;
  v35 = self;
  v15 = v11;
  v36 = v15;
  v16 = v12;
  v37 = v16;
  v17 = v10;
  v18 = v13;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v29);

  v19 = a5;
  v20 = 1.0;
  v21 = (double)a5;
  v22 = 1.0;
  if (objc_msgSend(v15, "count", v29, v30, v31, v32) < (unint64_t)a5)
    v22 = v21 / (double)(unint64_t)(a5 - objc_msgSend(v15, "count"));
  v23 = 7 * a5;
  if (objc_msgSend(v16, "count") < (unint64_t)(7 * v19))
    v20 = v21 * 7.0 / (double)(unint64_t)(v23 - objc_msgSend(v15, "count"));
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v27 = objc_msgSend(v15, "count");
    v28 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 67175425;
    v42 = v27;
    v43 = 1025;
    v44 = v28;
    v45 = 2049;
    v46 = v22;
    v47 = 2049;
    v48 = v20;
    _os_log_debug_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEBUG, "Number of weeks out of region %{private}d, number of days of region %{private}d, weekly correction factor %{private}f, daily correction factor %{private}f", buf, 0x22u);
  }

  v25 = -[RTStateModelAggOutOfStateSelection initWithSelectOOStStates:dailyDensityCorrection:weeklyDensityCorrection:]([RTStateModelAggOutOfStateSelection alloc], "initWithSelectOOStStates:dailyDensityCorrection:weeklyDensityCorrection:", v18, v20, v22);
  return v25;
}

void __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "stateDepiction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getPredState:predictionWindow:numOfWeeks:uniqueID:", *(unsigned int *)(a1 + 88), v6, *(double *)(a1 + 72) + 3600.0, *(double *)(a1 + 80));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "daily");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v9, "numOfClustEntries") < 1)
  {
    objc_msgSend(v8, "weekly");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numOfClustEntries");

    if (v11 < 1)
    {
      v13 = 0;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "stateDepiction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "daily");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v36, "numOfClustEntries");
    objc_msgSend(v8, "daily");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "aggregateTime_s");
    v27 = v26 / 3600.0;
    objc_msgSend(v8, "daily");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "latestVisitTime_s");
    v30 = v29 / 3600.0;
    objc_msgSend(v8, "daily");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "density");
    v33 = v32;
    objc_msgSend(v8, "weekly");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "density");
    *(_DWORD *)buf = 138413571;
    v42 = v13;
    v43 = 1025;
    v44 = v24;
    v45 = 2049;
    v46 = v27;
    v47 = 2049;
    v48 = v30;
    v49 = 2049;
    v50 = v33;
    v51 = 2049;
    v52 = v35;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "Out of state data aggregation, location, %@, in %{private}d, aggregateTime %{private}f [h], latestVisit %{private}f, density Daily %{private}f, density Weekly %{private}f ", buf, 0x3Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(v13, "Latitude_deg");
  objc_msgSend(v13, "Longitude_deg");
  objc_msgSend(*(id *)(a1 + 40), "Latitude_deg");
  objc_msgSend(*(id *)(a1 + 40), "Longitude_deg");
  RTCommonCalculateDistanceHighPrecision();
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 48), "getMaxDistFromInterval:withVelocity:", *(double *)(a1 + 80), 20.0);
  if (v16 > v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v13;
      _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "Out of region state at location, %@", buf, 0xCu);
    }

    objc_msgSend(v8, "weekly");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "visitHist");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_84;
    v39[3] = &unk_1E92A2A80;
    v40 = *(id *)(a1 + 56);
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v39);

    objc_msgSend(v8, "daily");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "visitHist");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v21;
    v37[1] = 3221225472;
    v37[2] = __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_2;
    v37[3] = &unk_1E92A2A80;
    v38 = *(id *)(a1 + 64);
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v37);

  }
LABEL_11:

}

void __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_84(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
}

void __70__RTStateModel_getOOStClusterData_predictionWindow_numOfWeeks_refLoc___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
}

+ (double)getOutOfStateConfidenceWithOneStatePred:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  _DWORD v30[2];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "daily");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v4, "numOfClustEntries") <= 0)
  {

    v8 = 0.0;
  }
  else
  {
    objc_msgSend(v3, "daily");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aggregateTime_s");
    v7 = v6;

    v8 = 0.0;
    if (v7 <= 0.0)
      goto LABEL_6;
    objc_msgSend(v3, "daily");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aggregateTime_s");
    v11 = v10;

    if (v11 > 1800.0)
      goto LABEL_4;
    objc_msgSend(v3, "weekly");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)objc_msgSend(v14, "numOfClustEntries") <= 0)
    {

    }
    else
    {
      objc_msgSend(v3, "weekly");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "aggregateTime_s");
      v17 = v16;

      if (v17 > 0.0)
      {
        objc_msgSend(v3, "weekly");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "aggregateTime_s");
        v20 = v19;

        if (v20 > 1800.0)
LABEL_4:
          v8 = 1.0;
      }
    }
  }
LABEL_6:
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "daily");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "numOfClustEntries");
    objc_msgSend(v3, "daily");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "aggregateTime_s");
    v25 = v24;
    objc_msgSend(v3, "weekly");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "numOfClustEntries");
    objc_msgSend(v3, "weekly");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "aggregateTime_s");
    v30[0] = 67175681;
    v30[1] = v22;
    v31 = 2049;
    v32 = v25;
    v33 = 1025;
    v34 = v27;
    v35 = 2049;
    v36 = v29;
    v37 = 2048;
    v38 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "Evaluating Confidence for OOST: numOfDailyEntries %{private}d, aggTimeDaily %{private}f, numOfWeeklyEntries %{private}d, aggTimeWeekly %{private}f, Confidence %f", (uint8_t *)v30, 0x2Cu);

  }
  return v8;
}

+ (double)deriveClusterThresholdFromUncClustAplha:(double)a3 andUncClustBeta:(double)a4
{
  double v4;
  double result;

  v4 = a3 + a4;
  result = 250.0;
  if (v4 <= 250.0)
  {
    result = v4;
    if (v4 < 200.0)
      return 200.0;
  }
  return result;
}

- (id)getPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTStateModelLocation *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  RTStateModelLocation *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  id v44;
  void *v45;
  NSObject *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  RTStateModelLocation *v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  _QWORD v75[2];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  NSObject *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v65 = 0;
  if (v6 && v7)
  {
    v9 = [RTStateModelLocation alloc];
    objc_msgSend(v6, "latitude");
    v11 = v10;
    objc_msgSend(v6, "longitude");
    v13 = v12;
    objc_msgSend(v6, "horizontalUncertainty");
    v15 = v14;
    objc_msgSend(v6, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v18 = -[RTStateModelLocation initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:](v9, "initWithLat:Lon:Uncertainty:confidence:andTimestamp_s:", v11, v13, v15, 0.0, v17);

    -[RTStateModel findClusterWithLocation:](self, "findClusterWithLocation:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stateDepiction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getRecentVisits:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      v61 = v19;
      v62 = v18;
      v64 = v6;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "components:fromDate:", 764, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)objc_opt_new();
      v25 = (void *)objc_opt_new();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __57__RTStateModel_getPredictedExitDatesFromLocation_onDate___block_invoke;
      v70[3] = &unk_1E92A2E60;
      v59 = v23;
      v71 = v59;
      v63 = v8;
      v72 = v8;
      v26 = v24;
      v73 = v26;
      v27 = v25;
      v74 = v27;
      v60 = v21;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v70);
      objc_msgSend(v26, "valueForKeyPath:", CFSTR("@max.self"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v28, "stringFromDate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v77 = v55;
        _os_log_debug_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_DEBUG, "latest exit date, %@", buf, 0xCu);

      }
      v58 = v26;
      +[RTStateModelAlgorithms bucketizeDates:bucketInterval:latestDate:](RTStateModelAlgorithms, "bucketizeDates:bucketInterval:latestDate:", v26, v28, 7200.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v28;
      v57 = v27;
      +[RTStateModelAlgorithms bucketizeDates:bucketInterval:latestDate:](RTStateModelAlgorithms, "bucketizeDates:bucketInterval:latestDate:", v27, v28, 7200.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (id)objc_opt_new();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v32 = v30;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v67;
        do
        {
          v36 = 0;
          do
          {
            if (*(_QWORD *)v67 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v36);
            objc_msgSend(v32, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            _rt_log_facility_get_os_log(RTLogFacilityStateModel);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              v47 = objc_msgSend(v38, "numOfDates");
              *(_DWORD *)buf = 134218242;
              v77 = (void *)v47;
              v78 = 2112;
              v79 = v37;
              _os_log_debug_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_DEBUG, "%lu exit dates in bucket %@", buf, 0x16u);
            }

            if ((int)objc_msgSend(v38, "numOfDates") <= 2)
            {
              _rt_log_facility_get_os_log(RTLogFacilityStateModel);
              v40 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                goto LABEL_21;
              *(_DWORD *)buf = 138412290;
              v77 = v37;
              v41 = v40;
              v42 = "device does not have enough exits in this bucket, %@";
LABEL_24:
              _os_log_debug_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);
              goto LABEL_21;
            }
            objc_msgSend(v31, "objectForKey:", v37);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v43)
            {
              _rt_log_facility_get_os_log(RTLogFacilityStateModel);
              v40 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                goto LABEL_21;
              *(_DWORD *)buf = 138412290;
              v77 = v37;
              v41 = v40;
              v42 = "device does not have any weekly exits during this bucket, %@";
              goto LABEL_24;
            }
            fmin((double)(int)objc_msgSend(v38, "numOfDates") / 7.0, 1.0);
            v44 = objc_alloc(MEMORY[0x1E0D18448]);
            objc_msgSend(v38, "averageDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stdDeviation");
            v40 = objc_msgSend(v44, "initWithDate:uncertainty:confidence:", v45);

            objc_msgSend(v65, "addObject:", v40);
            _rt_log_facility_get_os_log(RTLogFacilityStateModel);
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v38, "averageDate");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stdDeviation");
              *(_DWORD *)buf = 138412802;
              v77 = v48;
              v78 = 2048;
              v79 = v49;
              v80 = 2112;
              v81 = v40;
              _os_log_debug_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_DEBUG, "bucketExitAverage, %@, bucketExitStdDeviation, %.4f, predictedExitDate, %@", buf, 0x20u);

            }
LABEL_21:

            ++v36;
          }
          while (v34 != v36);
          v50 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
          v34 = v50;
        }
        while (v50);
      }

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v51;
      v75[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "sortUsingDescriptors:", v53);

      v8 = v63;
      v6 = v64;
      v19 = v61;
      v18 = v62;
      v21 = v60;
    }
    else
    {
      v65 = 0;
    }

  }
  return v65;
}

void __57__RTStateModel_getPredictedExitDatesFromLocation_onDate___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "EntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "entry_s");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "exit_s");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v5;
  objc_msgSend(v8, "components:fromDate:", 764, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "setYear:", objc_msgSend(a1[4], "year"));
  objc_msgSend(v10, "setMonth:", objc_msgSend(a1[4], "month"));
  objc_msgSend(v10, "setDay:", objc_msgSend(a1[4], "day"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[5], "compare:", v12) == -1)
  {
    objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateFromComponents:", v10);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "components:fromDateComponents:toDateComponents:options:", 764, v9, v10, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v7;
  objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v16, v7, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "laterDate:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "isEqualToDate:", a1[5]) & 1) != 0)
  {
    objc_msgSend(a1[5], "earlierDate:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToDate:", a1[5]);

    if (v21)
    {
      objc_msgSend(a1[6], "addObject:", v18);
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v18, "stringFromDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringFromDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringFromDate");
        *(_DWORD *)buf = 138412802;
        v30 = v26;
        v31 = 2112;
        v32 = v24;
        v33 = 2112;
        v34 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v34;
        _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "potential exit date, %@ (%@ - %@)", buf, 0x20u);

      }
      v23 = objc_msgSend(v9, "weekday");
      if (v23 == objc_msgSend(v10, "weekday"))
        objc_msgSend(a1[7], "addObject:", v18);
    }
  }
  else
  {

  }
}

- (id)getPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    objc_msgSend(v8, "earlierDate:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v9)
    {
      v10 = 0;
    }
    else
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v14 = v13;
      -[RTStateModel getNumberOfWeeksInStateModel](self, "getNumberOfWeeksInStateModel");
      v16 = (int)v15;
      objc_msgSend(v9, "timeIntervalSinceDate:", v7);
      v18 = v17;
      -[RTStateModel stateModelLut](self, "stateModelLut");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke;
      v34[3] = &unk_1E92A2E88;
      v36 = v14;
      v37 = v18;
      v38 = v16;
      v21 = v12;
      v35 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v34);

      v22 = (void *)objc_opt_new();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("stateDepiction.getNumOfVisitsOverall"), 1);
      v47[0] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sortedArrayUsingDescriptors:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v20;
      v32[1] = 3221225472;
      v32[2] = __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke_2;
      v32[3] = &unk_1E92974C8;
      v10 = v22;
      v33 = v10;
      objc_msgSend(v25, "enumerateObjectsUsingBlock:", v32);

      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v10, "count");
        objc_msgSend(v7, "stringFromDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringFromDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v40 = v27;
        v41 = 2048;
        v42 = v28;
        v43 = 2112;
        v44 = v29;
        v45 = 2112;
        v46 = v30;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@ found %lu PLOIs the device may travel to between startDate, %@, endDate, %@", buf, 0x2Au);

      }
    }
  }

  return v10;
}

void __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  v5 = a2;
  objc_msgSend(v9, "stateDepiction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getPredState:predictionWindow:numOfWeeks:uniqueID:", *(unsigned int *)(a1 + 56), v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTStateModel getOutOfStateConfidenceWithOneStatePred:](RTStateModel, "getOutOfStateConfidenceWithOneStatePred:", v7);
  if (v8 >= 1.0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

void __72__RTStateModel_getPredictedLocationsOfInterestBetweenStartDate_endDate___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0D183C0];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithOneState:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithLocationOfInterest:confidence:nextEntryTime:motionActivityType:", v6, 0, 0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (void)collectMetricsWithIntervalSinceLastUpdate:(double)a3
{
  void *v5;
  _QWORD v6[6];

  -[RTStateModel metricManager](self, "metricManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke;
  v6[3] = &unk_1E92A2EB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  objc_msgSend(v5, "fetchDiagnosticsEnabled:", v6);

}

void __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[6];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke_2;
    v4[3] = &unk_1E9297BF0;
    v4[4] = *(_QWORD *)(a1 + 32);
    v4[5] = *(_QWORD *)(a1 + 40);
    dispatch_async(v3, v4);

  }
}

void __58__RTStateModel_collectMetricsWithIntervalSinceLastUpdate___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "logStateModelAvailabilityMetricWithIntervalSinceLastUpdate:untilNow:", v2, *(double *)(a1 + 40));

}

- (RTStateModelEarliestLatestEl)earliestLatestStateModelEl
{
  return self->_earliestLatestStateModelEl;
}

- (void)setEarliestLatestStateModelEl:(id)a3
{
  objc_storeStrong((id *)&self->_earliestLatestStateModelEl, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (NSMutableDictionary)stateModelLut
{
  return self->_stateModelLut;
}

- (void)setStateModelLut:(id)a3
{
  objc_storeStrong((id *)&self->_stateModelLut, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateModelLut, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_earliestLatestStateModelEl, 0);
}

- (void)logStateModelAvailabilityMetricWithIntervalSinceLastUpdate:(double)a3 untilNow:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
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
  id v19;

  v19 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", -fmin(a3, 4233600.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 124, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMinute:", 0);
  objc_msgSend(v8, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateFromComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "earlierDate:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v10)
    {
      do
      {
        -[RTStateModel getMostRecentLocationForDate:](self, "getMostRecentLocationForDate:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v13);
          -[RTStateModel _getNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:](self, "_getNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:", v14, v10, 3600.0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTStateModel calculateStateModelAvailabilityPrecisionRecallOnDate:predictedLocations:isHighConfidenceOnly:](self, "calculateStateModelAvailabilityPrecisionRecallOnDate:predictedLocations:isHighConfidenceOnly:", v10, v15, 0);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.confidence > 0"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "filteredArrayUsingPredicate:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[RTStateModel calculateStateModelAvailabilityPrecisionRecallOnDate:predictedLocations:isHighConfidenceOnly:](self, "calculateStateModelAvailabilityPrecisionRecallOnDate:predictedLocations:isHighConfidenceOnly:", v10, v17, 1);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v10, 3600.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "earlierDate:", v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v12;
      }
      while (v18 == v12);
    }
    else
    {
      v12 = v10;
    }
  }
  else
  {
    v12 = 0;
  }

}

- (unsigned)calculateStateModelAvailabilityPrecisionRecallOnDate:(id)a3 predictedLocations:(id)a4 isHighConfidenceOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  id *v12;
  int v13;
  void *v14;
  unsigned int v15;
  _QWORD v17[4];
  _QWORD v18[2];
  BOOL v19;
  _QWORD v20[4];
  _QWORD v21[2];
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  if (objc_msgSend(v9, "count"))
  {
    if (v5)
      v10 = 6;
    else
      v10 = 2;
    v11 = MEMORY[0x1E0C809B0];
    *((_DWORD *)v24 + 6) = v10;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke;
    v20[3] = &unk_1E92A2F00;
    v21[0] = v8;
    v21[1] = &v23;
    v22 = v5;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);
    v12 = (id *)v21;
  }
  else
  {
    if (v5)
      v13 = 7;
    else
      v13 = 3;
    *((_DWORD *)v24 + 6) = v13;
    -[RTStateModel stateModelLut](self, "stateModelLut");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_3;
    v17[3] = &unk_1E92A2F28;
    v18[0] = v8;
    v18[1] = &v23;
    v19 = v5;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);
    v12 = (id *)v18;

  }
  v15 = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  objc_msgSend(a2, "locationOfInterest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visits");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_2;
  v10[3] = &unk_1E92A2ED8;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v7;
  v12 = v8;
  v14 = *(_BYTE *)(a1 + 48);
  v13 = a4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v7, 3600.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "betweenDate:andDate:", *(_QWORD *)(a1 + 32), v11);
  if ((_DWORD)v7)
  {
    if (*(_BYTE *)(a1 + 56))
      v10 = 5;
    else
      v10 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }

}

void __126__RTStateModel_RTMetricManager__calculateStateModelAvailabilityPrecisionRecallOnDate_predictedLocations_isHighConfidenceOnly___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v6 = a3;
  objc_msgSend(v6, "stateDepiction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "getRecentVisits:");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stateDepiction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", *(_QWORD *)(a1 + 32), 3600.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "getRecentVisits:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);
  objc_msgSend(v11, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    if (*(_BYTE *)(a1 + 48))
      v14 = 8;
    else
      v14 = 4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;
    *a4 = 1;
  }

}

- (id)getMostRecentLocationForDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  CLLocationDegrees v12;
  void *v13;
  void *v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  RTStateModelLocation *v34;
  void *v35;
  NSObject *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  uint64_t *v45;
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t *v49;
  _QWORD v50[4];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__123;
  v59 = __Block_byref_object_dispose__123;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0x7FF0000000000000;
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke;
  v46[3] = &unk_1E92A2DA0;
  v41 = v4;
  v47 = v41;
  v48 = &v55;
  v49 = &v51;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v46);

  if (v56[5])
    goto LABEL_3;
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_3;
  v42[3] = &unk_1E92A2DA0;
  v43 = v41;
  v44 = v50;
  v45 = &v55;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v42);

  if (v56[5])
  {
LABEL_3:
    v8 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend((id)v56[5], "stateDepiction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "Latitude_deg");
    v12 = v11;
    objc_msgSend((id)v56[5], "stateDepiction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "Longitude_deg");
    v16 = CLLocationCoordinate2DMake(v12, v15);
    objc_msgSend((id)v56[5], "stateDepiction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uncertainty_m");
    v20 = v19;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v8, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v21, v16.latitude, v16.longitude, 0.0, v20, 0.0, 0.0, 0.0);

    if (*((_BYTE *)v52 + 24))
    {
      v23 = v22;
    }
    else
    {
      -[RTStateModel getEndingCoordinateWithStartingLocation:distance:](self, "getEndingCoordinateWithStartingLocation:distance:", v22, 1000.0);
      v25 = v24;
      v27 = v26;
      v28 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend((id)v56[5], "stateDepiction");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "location");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "uncertainty_m");
      v32 = v31;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v28, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v33, v25, v27, 0.0, v32, 0.0);

      v34 = -[RTStateModelLocation initWithCLLocation:]([RTStateModelLocation alloc], "initWithCLLocation:", v23);
      -[RTStateModel findClusterWithLocation:](self, "findClusterWithLocation:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v23, "coordinate");
          v39 = v38;
          objc_msgSend(v23, "coordinate");
          *(_DWORD *)buf = 134283777;
          v62 = v39;
          v63 = 2049;
          v64 = v40;
          _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Attempted to move user out of state by estimation but ended up inside a location of interest at %{private}f, %{private}f.", buf, 0x16u);
        }

      }
    }
  }
  else
  {
    v23 = 0;
  }

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v23;
}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  v6 = a3;
  objc_msgSend(v6, "stateDepiction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getRecentVisits:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_2;
  v10[3] = &unk_1E92A2F50;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v14 = a4;
  v13 = *(_OWORD *)(a1 + 40);
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a2;
  objc_msgSend(v7, "EntryExit_s");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entry_s");
  objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v7, "EntryExit_s");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "exit_s");
  objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "betweenDate:andDate:", v12, v11))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    *a4 = 1;
    **(_BYTE **)(a1 + 64) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;

  v4 = a3;
  objc_msgSend(v4, "stateDepiction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getRecentVisits:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_4;
  v9[3] = &unk_1E92A2F78;
  v7 = *(id *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 40);
  v10 = v7;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __62__RTStateModel_RTMetricManager__getMostRecentLocationForDate___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;

  objc_msgSend(a2, "EntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entry_s");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v7 = vabdd_f64(v5, v6);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(double *)(v8 + 24);
  if (v7 < v9)
    v9 = v7;
  if (v9 == v7)
  {
    *(double *)(v8 + 24) = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
  }
}

- (CLLocationCoordinate2D)getEndingCoordinateWithStartingLocation:(id)a3 distance:(double)a4
{
  id v6;
  RTStateModelLocation *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __double2 v15;
  __double2 v16;
  long double v17;
  long double v18;
  long double v19;
  CLLocationCoordinate2D v20;
  double latitude;
  double longitude;
  _QWORD v23[5];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  CLLocationCoordinate2D result;

  v6 = a3;
  v7 = -[RTStateModelLocation initWithCLLocation:]([RTStateModelLocation alloc], "initWithCLLocation:", v6);
  -[RTStateModel getAllLOIsWithinDistance:ofLocation:](self, "getAllLOIsWithinDistance:ofLocation:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x2020000000;
  v27 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__RTStateModel_RTMetricManager__getEndingCoordinateWithStartingLocation_distance___block_invoke;
  v23[3] = &unk_1E929CB08;
  v23[4] = &v24;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v23);
  objc_msgSend(v6, "coordinate");
  v10 = v9;
  objc_msgSend(v6, "coordinate");
  v11 = v10 * 0.0174532925;
  v13 = v12 * 0.0174532925;
  v14 = (v25[3] + 1000.0) / 1000.0 / 6371.0;
  v15 = __sincos_stret(v11);
  v16 = __sincos_stret(v14);
  v17 = asin(v15.__cosval * v16.__sinval * 6.123234e-17 + v15.__sinval * v16.__cosval);
  v18 = sin(v17);
  v19 = atan2(v15.__cosval * v16.__sinval, v16.__cosval - v15.__sinval * v18);
  v20 = CLLocationCoordinate2DMake(v17 * 57.2957795, (v13 + v19) * 57.2957795);
  _Block_object_dispose(&v24, 8);

  latitude = v20.latitude;
  longitude = v20.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

void __82__RTStateModel_RTMetricManager__getEndingCoordinateWithStartingLocation_distance___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  objc_msgSend(a2, "stateDepiction");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uncertainty_m");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

- (id)getAllLOIsWithinDistance:(double)a3 ofLocation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  -[RTStateModel _getRecursivelyAllLOIsWithinDistance:ofLocation:previouslyFoundLocationsOfInterest:](self, "_getRecursivelyAllLOIsWithinDistance:ofLocation:previouslyFoundLocationsOfInterest:", v6, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_getRecursivelyAllLOIsWithinDistance:(double)a3 ofLocation:(id)a4 previouslyFoundLocationsOfInterest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  RTStateModel *v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;
  double v27;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  -[RTStateModel stateModelLut](self, "stateModelLut");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke;
  v24[3] = &unk_1E92A2DC8;
  v13 = v8;
  v25 = v13;
  v27 = a3;
  v14 = v10;
  v26 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v24);

  objc_msgSend(v14, "minusSet:", v9);
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v9);
    objc_msgSend(v15, "unionSet:", v14);
    objc_msgSend(v14, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke_2;
    v20[3] = &unk_1E92A2808;
    v17 = v15;
    v21 = v17;
    v22 = self;
    v23 = a3;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);

    v18 = v17;
  }
  else
  {
    v18 = v14;
  }

  return v18;
}

void __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  objc_msgSend(*(id *)(a1 + 32), "Latitude_deg");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "Longitude_deg");
  v7 = v6;
  objc_msgSend(v17, "stateDepiction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Latitude_deg");
  v11 = v10;
  objc_msgSend(v17, "stateDepiction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "Longitude_deg");
  +[RTStateModel getDistfromLat:fromLon:toLat:toLon:](RTStateModel, "getDistfromLat:fromLon:toLat:toLon:", v5, v7, v11, v14);
  v16 = v15;

  if (v16 <= *(double *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);

}

void __116__RTStateModel_RTMetricManager___getRecursivelyAllLOIsWithinDistance_ofLocation_previouslyFoundLocationsOfInterest___block_invoke_2(double *a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)*((_QWORD *)a1 + 4);
  v4 = (void *)*((_QWORD *)a1 + 5);
  v5 = a1[6];
  objc_msgSend(a2, "stateDepiction");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_getRecursivelyAllLOIsWithinDistance:ofLocation:previouslyFoundLocationsOfInterest:", v6, *((_QWORD *)a1 + 4), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

}

@end
