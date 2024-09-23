@implementation OSIUtilities

+ (id)loIAtBeginningAndEndOfIntervals:(id)a3
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t k;
  void *v23;
  void *v24;
  unsigned int v25;
  unsigned int m;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v48;
  void *v49;
  NSObject *oslog;
  void *v51;
  void *v52;
  id obj;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  int v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  NSObject *v69;
  uint64_t *v70;
  _QWORD *v71;
  _QWORD v72[5];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  int v91;
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[3];
  _QWORD v95[3];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  oslog = os_log_create("com.apple.osintelligence", "osiutilities.loi");
  objc_msgSend(MEMORY[0x1E0D18460], "defaultManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__0;
  v78 = __Block_byref_object_dispose__0;
  v79 = 0;
  v3 = dispatch_semaphore_create(0);
  objc_msgSend(v54, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v54, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", 86400.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v81 = (uint64_t)v52;
    v82 = 2112;
    v83 = v51;
    _os_log_impl(&dword_1C34CE000, oslog, OS_LOG_TYPE_INFO, "Querying for LoIs and visits between start %@ and end %@", buf, 0x16u);
  }
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__0;
  v72[4] = __Block_byref_object_dispose__0;
  v73 = 0;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __48__OSIUtilities_loIAtBeginningAndEndOfIntervals___block_invoke;
  v68[3] = &unk_1E7D7B940;
  v70 = &v74;
  v71 = v72;
  v8 = v3;
  v69 = v8;
  objc_msgSend(v49, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v52, v51, v68);
  v9 = dispatch_time(0, 30000000000);
  dispatch_semaphore_wait(v8, v9);
  v59 = (void *)objc_opt_new();
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = (id)v75[5];
  v48 = v8;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v97, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v65 != v55)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        objc_msgSend(v10, "visits");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v96, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v61 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              v94[0] = CFSTR("visitEntryDate");
              objc_msgSend(v15, "entryDate");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v95[0] = v16;
              v94[1] = CFSTR("visitExitDate");
              objc_msgSend(v15, "exitDate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v95[1] = v17;
              v94[2] = CFSTR("loi");
              objc_msgSend(v10, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "UUIDString");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v95[2] = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 3);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v59, "addObject:", v20);
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v96, 16);
          }
          while (v12);
        }

      }
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v97, 16);
    }
    while (v56);
  }

  objc_msgSend(v59, "sortUsingComparator:", &__block_literal_global);
  v21 = (void *)objc_opt_new();
  for (k = 0; objc_msgSend(v54, "count") > k; ++k)
  {
    v92[0] = CFSTR("interval");
    objc_msgSend(v54, "objectAtIndexedSubscript:", k);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = CFSTR("loi");
    v93[0] = v23;
    v93[1] = &stru_1E7D7C160;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v24);

  }
  v25 = 0;
  v58 = 0;
  for (m = 0; ; m = v27 + (v42 ^ 1))
  {
    v27 = m;
    if (objc_msgSend(v54, "count") <= (unint64_t)m || objc_msgSend(v59, "count") <= (unint64_t)v25)
      break;
    objc_msgSend(v59, "objectAtIndexedSubscript:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", m);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("visitEntryDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceDate:", v31);
    if (v32 <= 0.0)
    {
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("visitExitDate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceDate:", v34);
      v36 = v35 < 0.0;

      if (v36)
        goto LABEL_28;
      objc_msgSend(v21, "objectAtIndexedSubscript:", v27);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v37, "mutableCopy");

      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("loi"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, CFSTR("loi"));

      objc_msgSend(v21, "setObject:atIndexedSubscript:", v30, v27);
      ++v58;
    }
    else
    {

    }
LABEL_28:
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("visitExitDate"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "endDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "timeIntervalSinceDate:", v40);
    v42 = v41 <= 0.0;

    v25 += v42;
  }
  v43 = oslog;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v54, "count");
    v45 = objc_msgSend((id)v75[5], "count");
    v46 = objc_msgSend(v59, "count");
    *(_DWORD *)buf = 134219266;
    v81 = v44;
    v82 = 2112;
    v83 = v52;
    v84 = 2112;
    v85 = v51;
    v86 = 2048;
    v87 = v45;
    v88 = 2048;
    v89 = v46;
    v90 = 1024;
    v91 = v58;
    _os_log_impl(&dword_1C34CE000, v43, OS_LOG_TYPE_DEFAULT, "For %lu intervals spanning from %@ to %@: \n found %lu lois and %lu visits \n assosciated %d intervals with lois", buf, 0x3Au);
  }

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(&v74, 8);

  return v21;
}

void __48__OSIUtilities_loIAtBeginningAndEndOfIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __48__OSIUtilities_loIAtBeginningAndEndOfIntervals___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("visitEntryDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("visitEntryDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
