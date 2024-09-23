@implementation PLFrequentLocationProcessor

+ (id)processFrequentLocationsWithItems:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, double);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x19AEC174C]();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    +[PLMediaMiningUtilities sortDescriptorsForSortingItemsByTime](PLMediaMiningUtilities, "sortDescriptorsForSortingItemsByTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingDescriptors:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "sortDescriptorsForLocationsOfInterest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "processFrequentLocationsWithSortedMoments:locationsOfInterest:progressBlock:", v14, v16, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (v21 = 0, ((void (**)(_QWORD, char *, double))v11)[2](v11, &v21, 1.0), v21))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v23 = 53;
        _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
      }
      v18 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (id)processFrequentLocationsWithSortedMoments:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, double);
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v60;
  char v61;
  id v62;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v73;
  void (**v74)(_QWORD, _QWORD, double);
  void *v75;
  void *v76;
  id obj;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  void *context;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  id v88;
  void *v89;
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
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
  _QWORD v107[4];
  id v108;
  uint64_t *v109;
  double v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  int buf;
  unint64_t v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  void *v126;
  __int16 v127;
  void *v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v73 = a4;
  v64 = a5;
  v74 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x19AEC174C]();
  v111 = 0;
  v112 = &v111;
  v113 = 0x2020000000;
  v114 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v7, "firstObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "pl_startDate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "pl_endDate");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "dateByAddingTimeInterval:", -604800.0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v7;
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pl_startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "compare:", v89) == 1;

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObject:", v13);
        while (1)
        {

          objc_msgSend(v10, "pl_startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "compare:", v89) == 1;

          if (!v15)
            break;
          v13 = v89;
          objc_msgSend(v89, "dateByAddingTimeInterval:", 15724800.0);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

      v7 = v76;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "addObject:", v16);

  if ((unint64_t)objc_msgSend(v78, "count") <= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addObject:", v17);

  }
  PLMomentsGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    buf = 134218498;
    v120 = v8;
    v121 = 2112;
    v122 = (uint64_t)v68;
    v123 = 2112;
    v124 = (uint64_t)v67;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Processing Frequent Locations for %tu moments from %@ to %@", (uint8_t *)&buf, 0x20u);
  }

  objc_msgSend(v67, "timeIntervalSinceDate:", v68);
  v82 = 0;
  v20 = 1.0 / ceil(v19 / 15724800.0);
  v21 = v20;
  while (v82 < objc_msgSend(v78, "count") - 2)
  {
    v75 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(v78, "objectAtIndexedSubscript:", v82);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v78, "objectAtIndexedSubscript:", v82 + 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");

    objc_msgSend(v76, "subarrayWithRange:", v23, v25 - v23);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    PLMomentsGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v79, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pl_startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pl_endDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 134219010;
      v120 = v82;
      v121 = 2048;
      v122 = v23;
      v123 = 2048;
      v124 = v25;
      v125 = 2112;
      v126 = v28;
      v127 = 2112;
      v128 = v30;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "Frequent Locations: Processing Batch %tu: indices %tu to %tu (from %@ to %@)", (uint8_t *)&buf, 0x34u);

    }
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke;
    v107[3] = &unk_1E3671A18;
    v31 = v74;
    v110 = v21;
    v108 = v31;
    v109 = &v111;
    objc_msgSend(a1, "processFrequentLocationsWithItemSubset:locationsOfInterest:progressBlock:", v79, v73, v107);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
    {
      if (*((_BYTE *)v112 + 24))
      {
        v33 = 1;
        v34 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109120;
          LODWORD(v120) = 114;
          _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
      }
      else
      {
        objc_msgSend(v32, "firstObject");
        v71 = v32;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "momentsSet");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v35, "count");

        v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v105 = 0u;
        v106 = 0u;
        v103 = 0u;
        v104 = 0u;
        v37 = v69;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v104;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v104 != v39)
                objc_enumerationMutation(v37);
              objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * j), "momentsSet");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "unionSet:", v41);

            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v103, v118, 16);
          }
          while (v38);
        }

        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        obj = v71;
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
        if (v42)
        {
          v80 = *(_QWORD *)v100;
LABEL_30:
          v86 = 0;
          v81 = v42;
          while (1)
          {
            if (*(_QWORD *)v100 != v80)
              objc_enumerationMutation(obj);
            v43 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v86);
            context = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v43, "momentsSet");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v44, "count");
            v45 = v85;
            if (v85 <= 7)
              v45 = 7;
            v83 = v45;
            v46 = v87 < v45;

            if (!v46)
            {
              objc_msgSend(v37, "sortUsingComparator:", &__block_literal_global_78610);
              v97 = 0u;
              v98 = 0u;
              v95 = 0u;
              v96 = 0u;
              v88 = v37;
              v47 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
              if (v47)
              {
                v48 = *(_QWORD *)v96;
                while (2)
                {
                  for (k = 0; k != v47; ++k)
                  {
                    if (*(_QWORD *)v96 != v48)
                      objc_enumerationMutation(v88);
                    v50 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * k);
                    objc_msgSend(v43, "momentsSet");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "momentsSet");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v51, "intersectsSet:", v52);

                    if (v53)
                    {
                      v93 = 0u;
                      v94 = 0u;
                      v91 = 0u;
                      v92 = 0u;
                      objc_msgSend(v43, "sortedMoments");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
                      if (v56)
                      {
                        v57 = *(_QWORD *)v92;
                        do
                        {
                          for (m = 0; m != v56; ++m)
                          {
                            if (*(_QWORD *)v92 != v57)
                              objc_enumerationMutation(v55);
                            v59 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * m);
                            if ((objc_msgSend(v36, "containsObject:", v59) & 1) == 0)
                            {
                              objc_msgSend(v50, "addMomentToSortedMoments:", v59);
                              objc_msgSend(v36, "addObject:", v59);
                            }
                          }
                          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
                        }
                        while (v56);
                      }

                      goto LABEL_55;
                    }

                  }
                  v47 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
                  if (v47)
                    continue;
                  break;
                }
              }

              objc_msgSend(v88, "addObject:", v43);
              objc_msgSend(v43, "momentsSet");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "unionSet:", v54);

LABEL_55:
              v85 = (unint64_t)((double)v85 * 0.5);
            }
            objc_autoreleasePoolPop(context);
            if (v87 < v83)
              break;
            if (++v86 == v81)
            {
              v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v117, 16);
              if (v42)
                goto LABEL_30;
              break;
            }
          }
        }

        v33 = 0;
        v21 = v20 + v21;
        v32 = v71;
      }
    }
    else
    {
      v21 = v20 + v21;
      v33 = 9;
    }

    objc_autoreleasePoolPop(v75);
    if (v33 != 9 && v33)
    {
      v62 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_71;
    }
    ++v82;
  }
  objc_msgSend(v69, "indexesOfObjectsPassingTest:", &__block_literal_global_8_78611);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "removeObjectsAtIndexes:", v60);
  if (v74
    && (v90 = 0,
        ((void (**)(_QWORD, char *, double))v74)[2](v74, &v90, 1.0),
        v61 = *((_BYTE *)v112 + 24) | v90,
        (*((_BYTE *)v112 + 24) = v61) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 67109120;
      LODWORD(v120) = 169;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    v62 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v62 = v69;
  }

LABEL_71:
  _Block_object_dispose(&v111, 8);

  return v62;
}

+ (id)processFrequentLocationsWithItemSubset:(id)a3 locationsOfInterest:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  char v20;
  void *v22;
  id v23;
  void *v24;
  char v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  int buf;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x19AEC174C]();
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v35 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke;
  v32[3] = &unk_1E3671AA0;
  v13 = v11;
  v33 = v13;
  v34 = &v36;
  objc_msgSend(a1, "_clustersFromLocationsOfInterest:forItems:remainingItemsToCluster:progressBlock:", v9, v8, &v35, v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v35;
  if (!*((_BYTE *)v37 + 24))
  {
    v23 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_9;
      v29[3] = &unk_1E3671AA0;
      v17 = v13;
      v30 = v17;
      v31 = &v36;
      objc_msgSend(a1, "_coarseClustersForItems:progressBlock:", v15, v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (*((_BYTE *)v37 + 24))
      {
        v8 = v23;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109120;
          v41 = 195;
          _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }

LABEL_10:
        v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_22:

        goto LABEL_23;
      }
      v26[0] = v12;
      v26[1] = 3221225472;
      v26[2] = __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_10;
      v26[3] = &unk_1E3671AA0;
      v27 = v17;
      v28 = &v36;
      objc_msgSend(a1, "_finalClustersFromCoarseClusters:progressBlock:", v22, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *((unsigned __int8 *)v37 + 24);
      if (*((_BYTE *)v37 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109120;
          v41 = 200;
          _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
        }
      }
      else
      {
        objc_msgSend(v24, "addObjectsFromArray:", v18);
      }

      if (v19)
      {
        v16 = (id)MEMORY[0x1E0C9AA60];
        v8 = v23;
        goto LABEL_22;
      }
    }
    objc_msgSend(v24, "sortUsingComparator:", &__block_literal_global_12_78602);
    v8 = v23;
    if (!v13
      || (v25 = 0,
          (*((void (**)(id, char *, double))v13 + 2))(v13, &v25, 1.0),
          v20 = *((_BYTE *)v37 + 24) | v25,
          (*((_BYTE *)v37 + 24) = v20) == 0))
    {
      v16 = v24;
      goto LABEL_22;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 67109120;
      v41 = 218;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109120;
    v41 = 184;
    _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v16 = (id)MEMORY[0x1E0C9AA60];
LABEL_23:

  _Block_object_dispose(&v36, 8);
  return v16;
}

+ (double)_computeWeekendFrequencyForMoments:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "pl_startDate", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isDateInWeekend:", v12))
        {

        }
        else
        {
          objc_msgSend(v11, "pl_endDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v4, "isDateInWeekend:", v13);

          if (!v14)
            continue;
        }
        ++v8;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v7)
        goto LABEL_14;
    }
  }
  v8 = 0;
LABEL_14:

  v15 = objc_msgSend(v5, "count");
  return (double)v8 / (double)v15;
}

+ (id)_clustersFromLocationsOfInterest:(id)a3 forItems:(id)a4 remainingItemsToCluster:(id *)a5 progressBlock:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void (**v19)(_QWORD, _QWORD, double);
  double v20;
  double v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  PLFrequentLocation *v41;
  void *v42;
  void *v43;
  id v46;
  id v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  char v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  int v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v46 = a6;
  v49 = MEMORY[0x19AEC174C]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v68 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v13);
  }

  v18 = objc_msgSend(v9, "count");
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v9;
  v19 = (void (**)(_QWORD, _QWORD, double))v49;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
  if (v51)
  {
    v20 = 1.0 / (double)v18;
    v50 = *(_QWORD *)v64;
    v21 = 0.0;
    while (2)
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v64 != v50)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
        v24 = (void *)MEMORY[0x19AEC1554]();
        if (v19)
        {
          v62 = 0;
          ((void (**)(_QWORD, char *, double))v19)[2](v19, &v62, v21);
          if (v62)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109120;
              v74 = 253;
              _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
            }
            objc_autoreleasePoolPop(v24);
            v43 = obj;

            v34 = (void *)MEMORY[0x1E0C9AA60];
            v42 = v46;
            goto LABEL_44;
          }
        }
        objc_msgSend(v23, "pl_location");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v52 = v23;
          v53 = v24;
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v26 = v11;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v59;
            while (2)
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v59 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
                objc_msgSend(v31, "distanceFromLocation:", v25);
                if (v32 <= 500.0)
                {
                  objc_msgSend(v10, "objectForKey:", v31);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "addObject:", v52);

                  goto LABEL_26;
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
              if (v28)
                continue;
              break;
            }
          }

          objc_msgSend(v47, "addObject:", v52);
LABEL_26:
          v19 = (void (**)(_QWORD, _QWORD, double))v49;
          v24 = v53;
        }
        v21 = v20 + v21;

        objc_autoreleasePoolPop(v24);
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
      if (v51)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v35 = v11;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v55;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v55 != v38)
          objc_enumerationMutation(v35);
        objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * m));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "count"))
        {
          v41 = -[PLFrequentLocation initWithSortedMoments:]([PLFrequentLocation alloc], "initWithSortedMoments:", v40);
          objc_msgSend(v34, "addObject:", v41);

        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
    }
    while (v37);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v47);
  v42 = v46;
  v43 = obj;
  v19 = (void (**)(_QWORD, _QWORD, double))v49;
LABEL_44:

  return v34;
}

+ (id)_finalClustersFromCoarseClusters:(id)a3 progressBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PLDBSCANClustering *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
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
  void *v28;
  PLFrequentLocation *v29;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *context;
  uint64_t v36;
  void *v37;
  PLDBSCANClustering *v38;
  id v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLDataClustering initWithDistanceBlock:]([PLDBSCANClustering alloc], "initWithDistanceBlock:", &__block_literal_global_17_78593);
  -[PLDataDensityClustering setMaximumDistance:](v8, "setMaximumDistance:", 250.0);
  -[PLDataDensityClustering setMinimumNumberOfObjects:](v8, "setMinimumNumberOfObjects:", 7);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v5;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v46;
    v38 = v8;
    v39 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(obj);
        v36 = v9;
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v9);
        context = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v10, "sortedMoments");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v11, "count");
        v34 = v11;
        if (v40 < 0x801)
        {
          -[PLDBSCANClustering performWithDataset:progressBlock:](v8, "performWithDataset:progressBlock:", v11, v6);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v13 = vcvtpd_u64_f64((double)v40 / ceil((double)v40 * 0.00048828125));
          v14 = v40;
          do
          {
            v15 = (void *)MEMORY[0x19AEC1554]();
            v16 = v14 - v13;
            if (v14 >= v13)
              v17 = v13;
            else
              v17 = v14;
            objc_msgSend(v11, "subarrayWithRange:", v12, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLDBSCANClustering performWithDataset:progressBlock:](v8, "performWithDataset:progressBlock:", v18, v39);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObjectsFromArray:", v19);

            v8 = v38;
            objc_autoreleasePoolPop(v15);
            v12 += v13;
            v14 = v16;
          }
          while (v12 < v40);
          v20 = v37;
        }
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v42 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "objects");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLMediaMiningUtilities sortDescriptorsForSortingItemsByTime](PLMediaMiningUtilities, "sortDescriptorsForSortingItemsByTime");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "sortedArrayUsingDescriptors:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = -[PLFrequentLocation initWithSortedMoments:]([PLFrequentLocation alloc], "initWithSortedMoments:", v28);
              objc_msgSend(v7, "addObject:", v29);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v23);
        }

        objc_autoreleasePoolPop(context);
        v9 = v36 + 1;
        v8 = v38;
        v6 = v39;
      }
      while (v36 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v33);
  }

  return v7;
}

+ (id)_coarseClustersForItems:(id)a3 progressBlock:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  unint64_t v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v46;
  id v47;
  uint64_t v48;
  void (**v49)(_QWORD);
  id v50;
  uint64_t v51;
  id obj;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  char v57;
  id v58;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v47 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __69__PLFrequentLocationProcessor__coarseClustersForItems_progressBlock___block_invoke;
  v71[3] = &unk_1E3671B28;
  v9 = v8;
  v72 = v9;
  v60 = v7;
  v73 = v60;
  v46 = v6;
  v74 = v46;
  v10 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v71);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v5;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v68;
    v14 = &off_1E3659000;
    v49 = v10;
    v50 = v9;
    v48 = *(_QWORD *)v68;
    do
    {
      v15 = 0;
      v51 = v12;
      do
      {
        if (*(_QWORD *)v68 != v13)
          objc_enumerationMutation(obj);
        v56 = v15;
        v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v15);
        objc_msgSend(v16, "pl_startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pl_endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v17;
        objc_msgSend(v17, "dateByAddingTimeInterval:", -7776000.0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10);
        if (!objc_msgSend(v60, "count"))
          goto LABEL_25;
        v65 = 0;
        v66 = 0;
        v53 = v16;
        objc_msgSend(v16, "pl_coordinate");
        v65 = v19;
        v66 = v20;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v21 = v9;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
        if (!v22)
        {

LABEL_25:
          v38 = objc_alloc((Class)v14[374]);
          v39 = v16;
          v40 = v38;
          v75 = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v40, "initWithSortedMoments:", v41);

          objc_msgSend(v60, "setObject:forKeyedSubscript:", v42, v18);
          objc_msgSend(v9, "addObject:", v18);

          goto LABEL_26;
        }
        v23 = v22;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v58 = v21;
        v59 = *(_QWORD *)v62;
        v57 = 1;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            v28 = v18;
            if (*(_QWORD *)v62 != v59)
              objc_enumerationMutation(v58);
            v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            objc_msgSend(v60, "objectForKeyedSubscript:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "coordinate");
            CLLocationCoordinate2DGetDistanceFrom();
            v32 = v31;
            objc_msgSend(v30, "sortedMoments");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "count");

            if (v32 < 5000.0 && v34 > v24)
            {
              v36 = v30;

              v37 = v29;
              v57 = 0;
              v24 = v34;
              v25 = v36;
              v26 = v37;
            }
            v18 = v28;

          }
          v23 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
        }
        while (v23);

        v13 = v48;
        v10 = v49;
        v16 = v53;
        if (v25)
        {
          objc_msgSend(v25, "addMomentToSortedMoments:", v53);
          objc_msgSend(v60, "removeObjectForKey:", v26);
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v25, v28);
          objc_msgSend(v58, "removeObject:", v26);
          objc_msgSend(v58, "addObject:", v28);
        }

        v9 = v50;
        v12 = v51;
        v14 = &off_1E3659000;
        if ((v57 & 1) != 0)
          goto LABEL_25;
LABEL_26:

        v15 = v56 + 1;
      }
      while (v56 + 1 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(_QWORD), void *))v10[2])(v10, v43);

  v44 = v46;
  return v44;
}

+ (id)sortDescriptorsForLocationsOfInterest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("type"), 1, &__block_literal_global_25);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("self"), 1, &__block_literal_global_27_78577, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("identifier"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __68__PLFrequentLocationProcessor_sortDescriptorsForLocationsOfInterest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "mapItemLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "routineLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "location");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "mapItemLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v5, "routineLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "location");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "coordinate");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "coordinate");
  objc_msgSend(v19, "numberWithDouble:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash") ^ v18;

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "coordinate");
  objc_msgSend(v23, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "coordinate");
  objc_msgSend(v26, "numberWithDouble:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hash") ^ v25;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "compare:", v31);

  return v32;
}

uint64_t __68__PLFrequentLocationProcessor_sortDescriptorsForLocationsOfInterest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = (int)objc_msgSend(a2, "intValue");
  v6 = objc_msgSend(v4, "intValue");

  switch(v5)
  {
    case -1:
      v7 = v6 + 1;
      if (v7 < 3)
      {
        v8 = &unk_199B9F840;
        return v8[v7];
      }
      break;
    case 1:
      v7 = v6 + 1;
      if (v7 < 3)
      {
        v8 = &unk_199B9F828;
        return v8[v7];
      }
      break;
    case 0:
      v7 = v6 + 1;
      if (v7 < 3)
      {
        v8 = &unk_199B9F810;
        return v8[v7];
      }
      break;
  }
  return 0;
}

void __69__PLFrequentLocationProcessor__coarseClustersForItems_progressBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(a1[4], "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = a1[4];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if (objc_msgSend(v10, "compare:", v3, (_QWORD)v14) == 1)
          break;
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sortedMoments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13 >= 7)
          objc_msgSend(a1[6], "addObject:", v11);

        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(a1[4], "removeObjectsInArray:", v4);
      objc_msgSend(a1[5], "removeObjectsForKeys:", v4);
    }

  }
}

uint64_t __78__PLFrequentLocationProcessor__finalClustersFromCoarseClusters_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(a2, "pl_coordinate");
  objc_msgSend(v4, "pl_coordinate");

  return CLLocationCoordinate2DGetDistanceFrom();
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.25);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_9(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.25 + 0.25);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_10(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, a3 * 0.25 + 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

uint64_t __104__PLFrequentLocationProcessor_processFrequentLocationsWithItemSubset_locationsOfInterest_progressBlock___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "sortedMoments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "sortedMoments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "compare:", v8);
  if (!v12)
  {
    objc_msgSend(v5, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "compare:", v14);

  }
  return v12;
}

uint64_t __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, *(double *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

BOOL __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a2, "dateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3 < 3888000.0;

  return v4;
}

BOOL __107__PLFrequentLocationProcessor_processFrequentLocationsWithSortedMoments_locationsOfInterest_progressBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "momentsSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v4, "momentsSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    objc_msgSend(v5, "sortedMoments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pl_startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedMoments");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pl_startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12 < v15;

  }
  else
  {
    objc_msgSend(v5, "momentsSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v10, "count");
    objc_msgSend(v4, "momentsSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17 > objc_msgSend(v11, "count");
  }

  return v16;
}

@end
