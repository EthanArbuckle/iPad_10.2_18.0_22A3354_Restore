@implementation PPRoutineSupport

+ (BOOL)importCoreRoutineDataWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  uint64_t (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  char v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  dispatch_semaphore_t v34;
  NSObject *v35;
  int v36;
  BOOL v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v41;
  void *v42;
  _QWORD v44[4];
  NSObject *v45;
  uint64_t (**v46)(_QWORD);
  __int128 *p_buf;
  uint64_t *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  char v53;
  char v54;
  uint8_t v55[16];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  id v60;
  id v61;
  __int128 buf;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = (uint64_t (**)(_QWORD))a4;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport running CoreRoutine import", (uint8_t *)&buf, 2u);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D70DD8];
  objc_msgSend(v7, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", *MEMORY[0x1E0D70DD8], 0, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v8, 0, 0, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5[2](v5) & 1) == 0)
  {
    pp_default_log_handle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v38, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: deferring before deletions.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_21;
  }
  v12 = objc_msgSend(v9, "containsObject:", &unk_1E7E59240);
  v13 = objc_msgSend(v11, "containsObject:", &unk_1E7E59258);
  v14 = v13;
  if (((v12 | v13) & 1) == 0)
  {
    pp_default_log_handle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v38, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: Core Routine blocked for both named entities and locations, skipping.", (uint8_t *)&buf, 2u);
    }
LABEL_21:

LABEL_28:
    v37 = 1;
    goto LABEL_29;
  }
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v16 = objc_msgSend(v15, "deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:", CFSTR("com.apple.CoreRoutine"), 0, &v61);
  v17 = v61;

  if ((v16 & 1) == 0)
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport failed to purge CoreRoutine locations from PPNamedEntityStore: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  v20 = objc_msgSend(v19, "deleteAllLocationsFromSourcesWithBundleId:deletedCount:error:", CFSTR("com.apple.CoreRoutine"), 0, &v60);
  v21 = v60;

  if ((v20 & 1) == 0)
  {
    pp_default_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport failed to purge CoreRoutine locations from PPLocationStore: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if ((v5[2](v5) & 1) == 0)
  {
    pp_default_log_handle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v39, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: deferring after deletions.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_28;
  }
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__2860;
  v65 = __Block_byref_object_dispose__2861;
  v66 = 0;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "dateByAddingTimeInterval:", -4233600.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  defaultRTRoutineManager();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "routineExtractionScoreCountWeight");
    v27 = v26;

    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "routineExtractionScoreDurationWeight");
    v30 = v29;

    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "routineExtractionScoreDecayHalfLifeDays");
    v33 = v32;

    v34 = dispatch_semaphore_create(0);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __71__PPRoutineSupport_importCoreRoutineDataWithError_shouldContinueBlock___block_invoke;
    v44[3] = &unk_1E7E15F58;
    p_buf = &buf;
    v48 = &v56;
    v35 = v34;
    v45 = v35;
    v49 = a1;
    v46 = v5;
    v50 = v27;
    v51 = v30;
    v52 = 0.693 / (v33 * 86400.0);
    v53 = v12;
    v54 = v14;
    objc_msgSend(v24, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v42, v23, v44);
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v35);

    v36 = *((unsigned __int8 *)v57 + 24);
    if (a3 && !*((_BYTE *)v57 + 24))
    {
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
      v36 = *((unsigned __int8 *)v57 + 24);
    }
    v37 = v36 != 0;
  }
  else
  {
    pp_default_log_handle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v55 = 0;
      _os_log_error_impl(&dword_1C392E000, v41, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to initialize default RTRoutineManager.", v55, 2u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 25, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    v37 = 0;
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v56, 8);
LABEL_29:

  return v37;
}

+ (id)locationsOfInterestVisitedBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  __int16 v14[8];
  _QWORD v15[4];
  NSObject *v16;
  uint8_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  defaultRTRoutineManager();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__2860;
    v22 = __Block_byref_object_dispose__2861;
    v23 = 0;
    v8 = dispatch_semaphore_create(0);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__PPRoutineSupport_locationsOfInterestVisitedBetweenStartDate_endDate___block_invoke;
    v15[3] = &unk_1E7E1B6E8;
    v17 = buf;
    v9 = v8;
    v16 = v9;
    objc_msgSend(v7, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v5, v6, v15);
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v9, 10.0) == 1)
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v14[0] = 0;
        _os_log_fault_impl(&dword_1C392E000, v10, OS_LOG_TYPE_FAULT, "RTRoutineManager LOI fetching taking more than 10 seconds", (uint8_t *)v14, 2u);
      }

    }
    v11 = *((id *)v19 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to initialize default RTRoutineManager.", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)fetchLocationOfInterestByType:(int64_t)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  intptr_t (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint8_t *v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  defaultRTRoutineManager();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2860;
    v20 = __Block_byref_object_dispose__2861;
    v21 = 0;
    v5 = dispatch_semaphore_create(0);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __50__PPRoutineSupport_fetchLocationOfInterestByType___block_invoke;
    v13 = &unk_1E7E1B6E8;
    v15 = buf;
    v6 = v5;
    v14 = v6;
    objc_msgSend(v4, "fetchLocationsOfInterestOfType:withHandler:", a3, &v10);
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v6, v10, v11, v12, v13);
    v7 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to initialize default RTRoutineManager.", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

intptr_t __50__PPRoutineSupport_fetchLocationOfInterestByType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__PPRoutineSupport_locationsOfInterestVisitedBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v3;
    obj = v3;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
          objc_msgSend(v11, "mapItem");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "location");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "latitude");
          v17 = v16;
          objc_msgSend(v11, "mapItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "location");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "longitude");
          v21 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v17, v20);
          objc_msgSend(v12, "addObject:", v21);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    v3 = v22;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __71__PPRoutineSupport_importCoreRoutineDataWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
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
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void (**v32)(void *, void *, uint64_t);
  void *v33;
  void *v34;
  void *v35;
  PPLocationClusterID *v36;
  PPLocationClusterID *v37;
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
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  uint64_t i;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  long double v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  id v101;
  void *v102;
  char v103;
  id v104;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  char v111;
  id v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  id v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  id obj;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *context;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  id v155;
  _BYTE v156[128];
  uint8_t v157[128];
  _BYTE buf[24];
  void *v159;
  id v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPRoutineSupport fetchLOI query failure: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_82;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport found %tu LOIs", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1C3BD6630]();
  objc_opt_self();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setLimit:", -1);
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = 0;
  objc_msgSend(v11, "locationRecordsWithQuery:error:", v10, &v155);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v155;

  if (v12)
  {
    +[PPLocationClusterID lookupTableWithRecords:](PPLocationClusterID, "lookupTableWithRecords:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "PPRoutineSupport error during unlimited record query: %@", buf, 0xCu);
    }

    v14 = 0;
  }

  objc_autoreleasePoolPop(v9);
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  obj = v5;
  v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v157, 16);
  if (!v119)
    goto LABEL_81;
  v116 = v5;
  v16 = 0;
  v17 = 0;
  v117 = *(_QWORD *)v152;
  v118 = v14;
  while (2)
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v152 != v117)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1C3BD6630]();
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
      {
        pp_default_log_handle();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v115, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: deferring during result iteration.", buf, 2u);
        }

        objc_autoreleasePoolPop(v20);
        goto LABEL_80;
      }
      v135 = v17;
      v136 = v16;
      v137 = v18;
      context = v20;
      v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 9 * objc_msgSend(obj, "count"));
      v142 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
      objc_msgSend(v19, "mapItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "address");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v127 = (void *)MEMORY[0x1E0D70B98];
      v141 = v19;
      objc_msgSend(v19, "mapItem");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "name");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "thoroughfare");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subThoroughfare");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "locality");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subLocality");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "administrativeArea");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subAdministrativeArea");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postalCode");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "countryCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "country");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "inlandWater");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ocean");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "areasOfInterest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "placemarkWithLatitudeDegrees:longitudeDegrees:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", 0, 0, v131, v129, v126, v125, v139, v124, v123, v122, v23, v121, v24, v25, v26);
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = v22;
      v28 = v128;
      v29 = v118;
      objc_opt_self();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 9);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __81__PPRoutineSupport__scoredNamedEntitiesForAddress_placemark_locationLookupTable___block_invoke;
      v159 = &unk_1E7E15F30;
      v31 = v30;
      v160 = v31;
      v32 = (void (**)(void *, void *, uint64_t))_Block_copy(buf);
      objc_msgSend(v28, "postalAddress");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "street");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v140 = v28;
      if (v35)
      {
        objc_msgSend(v28, "name");
        v36 = (PPLocationClusterID *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v36, 3);
      }
      else
      {
        if (!v118)
          goto LABEL_25;
        v130 = v34;
        v132 = v33;
        v134 = v31;
        v37 = [PPLocationClusterID alloc];
        objc_msgSend(v27, "subThoroughfare");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "thoroughfare");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "subLocality");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "locality");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "administrativeArea");
        v42 = v29;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[PPLocationClusterID initWithName:subThoroughfare:thoroughfare:subLocality:locality:administrativeArea:](v37, "initWithName:subThoroughfare:thoroughfare:subLocality:locality:administrativeArea:", 0, v38, v39, v40, v41, v43);

        v29 = v42;
        objc_msgSend(v42, "objectForKeyedSubscript:", v36);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "location");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "placemark");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v44, "location");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "placemark");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "name");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v32[2](v32, v50, 3);

        }
        v28 = v140;
        v33 = v132;
        v31 = v134;
        v34 = v130;
      }

LABEL_25:
      if (objc_msgSend(v34, "length"))
        v32[2](v32, v34, 8);
      objc_msgSend(v27, "subLocality");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "length");

      if (v52)
      {
        objc_msgSend(v27, "subLocality");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v53, 9);

      }
      objc_msgSend(v27, "locality");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "length");

      if (v55)
      {
        objc_msgSend(v27, "locality");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v56, 9);

      }
      objc_msgSend(v27, "administrativeArea");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "length");

      if (v58)
      {
        objc_msgSend(v27, "administrativeArea");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v59, 10);

      }
      objc_msgSend(v27, "administrativeAreaCode");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "length");

      if (v61)
      {
        objc_msgSend(v27, "administrativeAreaCode");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v62, 10);

      }
      objc_msgSend(v27, "country");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "length");

      if (v64)
      {
        objc_msgSend(v27, "country");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v65, 11);

      }
      objc_msgSend(v27, "countryCode");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v66, "length");

      if (v67)
      {
        objc_msgSend(v27, "countryCode");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2](v32, v68, 11);

      }
      objc_msgSend(v27, "locality");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v69, "length");

      if (v70)
      {
        objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v33, 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
          v32[2](v32, v71, 12);

      }
      v72 = v31;

      objc_msgSend(v143, "addObjectsFromArray:", v72);
      v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v28, +[PPLocalLocationStore routineLOITypeToLocationCategory:](PPLocalLocationStore, "routineLOITypeToLocationCategory:", objc_msgSend(v141, "type")), 0);
      v147 = 0u;
      v148 = 0u;
      v149 = 0u;
      v150 = 0u;
      objc_msgSend(v141, "visits");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v147, v156, 16);
      if (v75)
      {
        v76 = v75;
        v77 = *(_QWORD *)v148;
        v78 = 0.0;
        do
        {
          for (i = 0; i != v76; ++i)
          {
            if (*(_QWORD *)v148 != v77)
              objc_enumerationMutation(v74);
            v80 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * i);
            v81 = *(double *)(a1 + 72);
            objc_msgSend(v80, "exitDate");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "entryDate");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "timeIntervalSinceDate:", v83);
            v85 = v81 + log2(v84 + 1.0) * *(double *)(a1 + 80);

            v86 = *(double *)(a1 + 88);
            objc_msgSend(v80, "exitDate");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "timeIntervalSinceNow");
            v78 = v78 + v85 * exp(-fabs(v86 * v88));

          }
          v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v147, v156, 16);
        }
        while (v76);
      }
      else
      {
        v78 = 0.0;
      }

      v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v73, v78 / (v78 + 1.0), 0.0);
      objc_msgSend(v142, "addObject:", v89);
      pp_default_log_handle();
      v90 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = objc_msgSend(v143, "count");
        v92 = objc_msgSend(v142, "count");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v91;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v92;
        _os_log_impl(&dword_1C392E000, v90, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport extracted %tu entities and %tu locations from LOI", buf, 0x16u);
      }

      objc_msgSend(v141, "visits");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "lastObject");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "exitDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v95 = objc_alloc(MEMORY[0x1E0D70C78]);
      v96 = (void *)objc_opt_new();
      objc_msgSend(v96, "UUIDString");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = (void *)objc_opt_new();
      v16 = (void *)objc_msgSend(v95, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", CFSTR("com.apple.CoreRoutine"), 0, v97, v98, v17, 0, 0, 0);

      if (objc_msgSend(v143, "count") && *(_BYTE *)(a1 + 96))
      {
        +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = 0;
        v100 = objc_msgSend(v99, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v143, v16, 3, 0, &v146, 0.0);
        v101 = v146;

        if ((v100 & 1) != 0)
        {
          +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = 0;
          v103 = objc_msgSend(v102, "flushDonationsWithError:", &v145);
          v104 = v145;

          if ((v103 & 1) == 0)
          {
            pp_default_log_handle();
            v105 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v104;
              _os_log_impl(&dword_1C392E000, v105, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport: importCoreRoutineDataWithCompletion: Warning: failed to flush: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          pp_default_log_handle();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v101;
            _os_log_error_impl(&dword_1C392E000, v106, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to store CoreRoutine-derived named entities: %@", buf, 0xCu);
          }

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          v107 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v108 = v101;
          v104 = *(id *)(v107 + 40);
          *(_QWORD *)(v107 + 40) = v108;
        }

      }
      v109 = v142;
      if (objc_msgSend(v142, "count") && *(_BYTE *)(a1 + 97))
      {
        +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = 0;
        v111 = objc_msgSend(v110, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v142, v16, 0, 3, 0, &v144);
        v112 = v144;
        v113 = v144;

        if ((v111 & 1) == 0)
        {
          pp_default_log_handle();
          v114 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v113;
            _os_log_error_impl(&dword_1C392E000, v114, OS_LOG_TYPE_ERROR, "PPRoutineSupport failed to store CoreRoutine-derived locations: %@", buf, 0xCu);
          }

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v112);
        }
        v109 = v142;
      }
      else
      {
        pp_default_log_handle();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = 0;
          _os_log_impl(&dword_1C392E000, v113, OS_LOG_TYPE_DEFAULT, "PPRoutineSupport failed to submit CoreRoutine locations to location store: %@", buf, 0xCu);
        }
      }

      objc_autoreleasePoolPop(context);
      v18 = v137 + 1;
    }
    while (v137 + 1 != v119);
    v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v151, v157, 16);
    if (v119)
      continue;
    break;
  }
LABEL_80:

  v6 = 0;
  v5 = v116;
  v14 = v118;
LABEL_81:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_82:

}

void __81__PPRoutineSupport__scoredNamedEntitiesForAddress_placemark_locationLookupTable___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0D70BC0], "describeCategory:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "PPRoutineSupport adding entity of category %@", (uint8_t *)&v14, 0xCu);

  }
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPRoutineSupport adding entity: %@", (uint8_t *)&v14, 0xCu);
  }

  v8 = objc_alloc(MEMORY[0x1E0D70BC0]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithName:category:language:", v5, a3, v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v11, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

}

@end
