@implementation LighthouseShareSheetPFLTraining

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.LighthouseShareSheetPFLPlugin", "Training");
    v3 = (void *)sLog_2;
    sLog_2 = (uint64_t)v2;

  }
}

+ (id)taskResultFromDict:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  size_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  int v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  size_t v25;
  id v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v27 = (void *)objc_msgSend(v26, "mutableCopy");
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("ModelDeltas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v3);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v4);
    v8 = 4 * v5;
  }
  else
  {
    v8 = 0;
  }
  v25 = v8;
  v9 = malloc_type_malloc(v8, 0x100004052888210uLL);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v30;
          do
          {
            for (k = 0; k != v16; ++k)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "floatValue", v25);
              v9[v11 + k] = v19;
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v46, 16);
            v11 += k;
          }
          while (v16);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v9, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  free(v9);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v21 = (void *)getMLRTaskResultClass_softClass;
  v45 = getMLRTaskResultClass_softClass;
  if (!getMLRTaskResultClass_softClass)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __getMLRTaskResultClass_block_invoke;
    v41[3] = &unk_1E43FEA00;
    v41[4] = &v42;
    __getMLRTaskResultClass_block_invoke((uint64_t)v41);
    v21 = (void *)v43[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v42, 8);
  v23 = (void *)objc_msgSend([v22 alloc], "initWithJSONResult:unprivatizedVector:", v27, v20);

  return v23;
}

+ (id)processDataForStore:(id)a3 taskParameters:(id)a4
{
  id v5;
  id v6;
  uint64_t *v7;
  NSObject *v8;
  void *v9;
  double v10;
  float v11;
  float v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  BOOL v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  int v61;
  unint64_t v62;
  unint64_t v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *k;
  void *v77;
  void *v78;
  void *v79;
  float v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  NSObject *v89;
  void *v90;
  NSObject *v91;
  void *v92;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  unint64_t v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t buf[4];
  id v126;
  _QWORD v127[4];

  v127[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
  v8 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "In processData", buf, 2u);
  }
  v97 = (void *)objc_opt_new();
  v113 = (void *)objc_opt_new();
  v111 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v112 = (void *)objc_opt_new();
  LODWORD(v10) = -1.0;
  objc_msgSend(v6, "floatValueForKey:defaultValue:", CFSTR("PositiveSampleWeight"), v10);
  v12 = v11;
  v94 = objc_msgSend(v6, "BOOLValueForKey:defaultValue:", CFSTR("BalanceSamplesByClass"), 0);
  v95 = objc_msgSend(v6, "integerValueForKey:defaultValue:", CFSTR("MaxSamples"), 0);
  v96 = v6;
  v13 = 0;
  v14 = 0;
  v98 = v5;
  v104 = objc_msgSend(v6, "integerValueForKey:defaultValue:", CFSTR("MaxSessions"), 0);
  do
  {
    v101 = (void *)MEMORY[0x1A1AFCA24]();
    v15 = objc_alloc_init((Class)get_DKEventQueryClass());
    objc_msgSend(get_DKEventStreamClass(), "eventStreamWithName:", CFSTR("/sharesheet/behavioralRuleFeatures"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEventStreams:", v17);

    v18 = v15;
    objc_msgSend(v15, "setLimit:", 20);
    v100 = v14;
    objc_msgSend(v15, "setOffset:", v14);
    v122 = 0;
    objc_msgSend(v5, "executeQuery:error:", v15, &v122);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v122;
    v20 = v7[110];
    v102 = v19;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v126 = v102;
        _os_log_error_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_ERROR, "knowledgeStore executeQuery failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      v99 = v15;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = v20;
        objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v103, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v126 = v23;
        _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Fetched %@ number of events from CoreDuet store", buf, 0xCu);

      }
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v24 = v103;
      v109 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
      if (v109)
      {
        v25 = *(_QWORD *)v119;
        v105 = *(_QWORD *)v119;
        v106 = v24;
        while (2)
        {
          for (i = 0; i != v109; ++i)
          {
            if (*(_QWORD *)v119 != v25)
              objc_enumerationMutation(v24);
            v27 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
            if (v27)
            {
              v110 = i;
              objc_msgSend(v27, "metadata");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("_DKBehavioralRuleFeaturesMetadataKey-featureDict"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29 && objc_msgSend(v29, "count"))
              {
                v107 = v13;
                v30 = v7[110];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  v31 = (void *)MEMORY[0x1E0CB37E8];
                  v32 = v30;
                  objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v126 = v33;
                  _os_log_impl(&dword_1A07F4000, v32, OS_LOG_TYPE_INFO, "Number of rows in event: %@", buf, 0xCu);

                }
                if (objc_msgSend(v29, "count"))
                {
                  v34 = 0;
                  do
                  {
                    v35 = v9;
                    v36 = (void *)objc_opt_new();
                    v114 = 0u;
                    v115 = 0u;
                    v116 = 0u;
                    v117 = 0u;
                    v37 = objc_msgSend(&unk_1E442CE20, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
                    if (v37)
                    {
                      v38 = v37;
                      v39 = *(_QWORD *)v115;
                      do
                      {
                        for (j = 0; j != v38; ++j)
                        {
                          if (*(_QWORD *)v115 != v39)
                            objc_enumerationMutation(&unk_1E442CE20);
                          v41 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
                          objc_msgSend(v29, "objectAtIndexedSubscript:", v34);
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v42, "objectForKeyedSubscript:", v41);
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v36, "addObject:", v43);

                        }
                        v38 = objc_msgSend(&unk_1E442CE20, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
                      }
                      while (v38);
                    }
                    objc_msgSend(v29, "objectAtIndexedSubscript:", v34);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("personAndAppMatched"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue();

                    v46 = objc_msgSend(v45, "intValue");
                    v47 = v46 == 1;
                    v9 = v35;
                    if (v46 == 1)
                      v48 = v113;
                    else
                      v48 = v35;
                    if (v47)
                      v49 = v111;
                    else
                      v49 = v112;
                    objc_msgSend(v48, "addObject:", v36);
                    objc_msgSend(v49, "addObject:", v45);

                    ++v34;
                  }
                  while (objc_msgSend(v29, "count") > v34);
                }
                v13 = v107 + 1;
                if (v104 < 1)
                {
                  v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
                  v25 = v105;
                  v24 = v106;
                }
                else
                {
                  v25 = v105;
                  v24 = v106;
                  if (v13 >= v104)
                  {

                    v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
                    goto LABEL_48;
                  }
                  v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
                }
              }
              else
              {
                v50 = v7[110];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A07F4000, v50, OS_LOG_TYPE_INFO, "Received an event with a nil or empty feature dictionary...", buf, 2u);
                }
              }

              i = v110;
            }
            else
            {
              v51 = v7[110];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A07F4000, v51, OS_LOG_TYPE_INFO, "Received a nil event...", buf, 2u);
              }
            }
          }
          v109 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
          if (v109)
            continue;
          break;
        }
      }
LABEL_48:

      v5 = v98;
      v18 = v99;
    }

    objc_autoreleasePoolPop(v101);
    if (v102)
      goto LABEL_78;
    v14 = v100 + 20;
  }
  while (v100 <= 0x4F);
  v52 = objc_msgSend(v113, "count");
  v53 = objc_msgSend(v9, "count");
  v54 = objc_msgSend(v113, "count");
  v55 = objc_msgSend(v9, "count");
  if (v12 == -1.0 || v95 == 1)
    v57 = 1;
  else
    v57 = v94;
  if (v57 == 1)
  {
    if (!v52 || !v53)
    {
      v64 = v7[110];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v64, OS_LOG_TYPE_INFO, "Returning nil from processDataForStore because no positive or negative samples were found, and we need to balance classes, compute weights, or randomly select one of two classes, which will fail.", buf, 2u);
      }
LABEL_78:
      v65 = 0;
      v66 = v111;
      v67 = v112;
      v68 = v9;
      v69 = v113;
      v70 = v97;
      goto LABEL_108;
    }
    if (v95 == 1)
    {
      v108 = v13;
      v58 = (double)arc4random() / 4294967300.0;
      v59 = v58 >= 0.5;
      v60 = v58 < 0.5;
LABEL_73:
      v63 = 0x1E0CB3000;
      goto LABEL_88;
    }
  }
  v108 = v13;
  if (v95 > 0)
    v61 = v94;
  else
    v61 = 0;
  if (v61 == 1)
  {
    if (v53 >= v52)
      v62 = v52;
    else
      v62 = v53;
    if ((unint64_t)v95 >> 1 >= v62)
      v60 = v62;
    else
      v60 = (unint64_t)v95 >> 1;
    v59 = v60;
    goto LABEL_73;
  }
  v63 = 0x1E0CB3000uLL;
  if (v95 < 1)
  {
    if (v52 >= v53)
      v71 = v53;
    else
      v71 = v52;
    if (v94)
      v60 = v71;
    else
      v60 = v55;
    if (v94)
      v59 = v71;
    else
      v59 = v54;
  }
  else
  {
    v59 = (int)(float)((float)((float)v52 / (float)(v53 + v52)) * (float)v95);
    v60 = v95 - v59;
  }
LABEL_88:
  v69 = v113;
  if (objc_msgSend(v113, "count") <= v59)
  {
    v66 = v111;
  }
  else
  {
    v69 = (void *)objc_opt_new();
    v66 = (void *)objc_opt_new();
    v72 = (void *)objc_opt_new();
    while (objc_msgSend(v69, "count") < v59)
    {
      objc_msgSend(*(id *)(v63 + 2024), "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v113, "count")));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v72, "containsObject:", v73) & 1) == 0)
      {
        objc_msgSend(v72, "addObject:", v73);
        objc_msgSend(v113, "objectAtIndex:", (int)objc_msgSend(v73, "intValue"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v74);

        objc_msgSend(v111, "objectAtIndex:", (int)objc_msgSend(v73, "intValue"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "addObject:", v75);

      }
    }

  }
  v68 = v9;
  if (objc_msgSend(v9, "count") <= v60)
  {
    v67 = v112;
  }
  else
  {
    v68 = (void *)objc_opt_new();
    v67 = (void *)objc_opt_new();
    for (k = (void *)objc_opt_new(); objc_msgSend(v68, "count") < v60; v63 = 0x1E0CB3000)
    {
      objc_msgSend(*(id *)(v63 + 2024), "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v9, "count")));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(k, "containsObject:", v77) & 1) == 0)
      {
        objc_msgSend(k, "addObject:", v77);
        objc_msgSend(v9, "objectAtIndex:", (int)objc_msgSend(v77, "intValue"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v78);

        objc_msgSend(v112, "objectAtIndex:", (int)objc_msgSend(v77, "intValue"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addObject:", v79);

      }
    }

  }
  if (v12 == -1.0)
  {
    v80 = (float)(unint64_t)objc_msgSend(v68, "count");
    v12 = v80 / (float)(unint64_t)objc_msgSend(v69, "count");
  }
  v81 = (void *)objc_opt_new();
  v82 = (void *)objc_opt_new();
  objc_msgSend(v81, "addObjectsFromArray:", v69);
  objc_msgSend(v81, "addObjectsFromArray:", v68);
  objc_msgSend(v82, "addObjectsFromArray:", v66);
  objc_msgSend(v82, "addObjectsFromArray:", v67);
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v81, CFSTR("inputVectors"));
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v82, CFSTR("targetVector"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v108);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v83, CFSTR("NumberTrainingSessions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v81, "count"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v84, CFSTR("NumberTrainingRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v68, "count"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v85, CFSTR("NumberTrainingRecordsClass0"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v69, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v86, CFSTR("NumberTrainingRecordsClass1"));

  *(float *)&v87 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v88, CFSTR("CalculatedPositiveSampleWeight"));

  v89 = v7[110];
  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
  {
    v90 = (void *)MEMORY[0x1E0CB37E8];
    v91 = v89;
    objc_msgSend(v90, "numberWithInteger:", v108);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v126 = v92;
    _os_log_impl(&dword_1A07F4000, v91, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);

  }
  v70 = v97;
  v65 = v97;

  v5 = v98;
LABEL_108:

  return v65;
}

+ (id)processDataForStore:(id)a3 recipeInfo:(id)a4
{
  id v5;
  id v6;
  uint64_t *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  BOOL v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  unint64_t v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v60;
  double v61;
  unint64_t v62;
  unint64_t v63;
  int v64;
  unint64_t v65;
  NSObject *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *k;
  void *v79;
  void *v80;
  void *v81;
  float v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  int v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  unint64_t v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  _BYTE v129[128];
  uint8_t v130[128];
  uint8_t buf[4];
  id v132;
  _QWORD v133[4];

  v133[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
  v8 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_INFO, "In processData", buf, 2u);
  }
  v9 = (void *)objc_opt_new();
  v119 = (void *)objc_opt_new();
  v116 = (void *)objc_opt_new();
  v10 = objc_opt_new();
  v117 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKey:", CFSTR("PositiveSampleWeight"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("PositiveSampleWeight"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v102 = &unk_1E442D058;
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("BalanceSamplesByClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("BalanceSamplesByClass"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v101 = (void *)MEMORY[0x1E0C9AAA0];
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("MaxSamples"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("MaxSamples"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v100 = &unk_1E442B660;
  }
  v118 = (void *)v10;

  objc_msgSend(v6, "objectForKey:", CFSTR("MaxSessions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v6;
  if (v14)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("MaxSessions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = &unk_1E442B660;
  }

  objc_msgSend(v102, "floatValue");
  v17 = v16;
  v96 = objc_msgSend(v101, "BOOLValue");
  v97 = objc_msgSend(v100, "intValue");
  v98 = v15;
  v18 = 0;
  v19 = 0;
  v103 = v5;
  v109 = objc_msgSend(v15, "intValue");
  v110 = v9;
  do
  {
    v106 = (void *)MEMORY[0x1A1AFCA24]();
    v20 = objc_alloc_init((Class)get_DKEventQueryClass());
    objc_msgSend(get_DKEventStreamClass(), "eventStreamWithName:", CFSTR("/sharesheet/behavioralRuleFeatures"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v133[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEventStreams:", v22);

    objc_msgSend(v20, "setLimit:", 20);
    v105 = v19;
    objc_msgSend(v20, "setOffset:", v19);
    v128 = 0;
    objc_msgSend(v5, "executeQuery:error:", v20, &v128);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v128;
    v24 = v7[110];
    v107 = v23;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v132 = v107;
        _os_log_error_impl(&dword_1A07F4000, v24, OS_LOG_TYPE_ERROR, "knowledgeStore executeQuery failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      v104 = v20;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)MEMORY[0x1E0CB37E8];
        v26 = v24;
        objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v132 = v27;
        _os_log_impl(&dword_1A07F4000, v26, OS_LOG_TYPE_INFO, "Fetched %@ number of events from CoreDuet store", buf, 0xCu);

      }
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v28 = v108;
      v115 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v124, v130, 16);
      if (v115)
      {
        v114 = *(_QWORD *)v125;
        v111 = v28;
        do
        {
          for (i = 0; i != v115; ++i)
          {
            if (*(_QWORD *)v125 != v114)
              objc_enumerationMutation(v28);
            v30 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
            if (v30)
            {
              objc_msgSend(v30, "metadata");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("_DKBehavioralRuleFeaturesMetadataKey-featureDict"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32 && objc_msgSend(v32, "count"))
              {
                v112 = v18;
                v33 = v7[110];
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  v34 = (void *)MEMORY[0x1E0CB37E8];
                  v35 = v33;
                  objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v132 = v36;
                  _os_log_impl(&dword_1A07F4000, v35, OS_LOG_TYPE_INFO, "Number of rows in event: %@", buf, 0xCu);

                }
                if (objc_msgSend(v32, "count"))
                {
                  v37 = 0;
                  do
                  {
                    v38 = (void *)objc_opt_new();
                    v120 = 0u;
                    v121 = 0u;
                    v122 = 0u;
                    v123 = 0u;
                    v39 = objc_msgSend(&unk_1E442CE38, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
                    if (v39)
                    {
                      v40 = v39;
                      v41 = *(_QWORD *)v121;
                      do
                      {
                        for (j = 0; j != v40; ++j)
                        {
                          if (*(_QWORD *)v121 != v41)
                            objc_enumerationMutation(&unk_1E442CE38);
                          v43 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * j);
                          objc_msgSend(v32, "objectAtIndexedSubscript:", v37);
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v44, "objectForKeyedSubscript:", v43);
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "addObject:", v45);

                        }
                        v40 = objc_msgSend(&unk_1E442CE38, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
                      }
                      while (v40);
                    }
                    objc_msgSend(v32, "objectAtIndexedSubscript:", v37);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("personAndAppMatched"));
                    v47 = (void *)objc_claimAutoreleasedReturnValue();

                    v48 = objc_msgSend(v47, "intValue");
                    v49 = v48 == 1;
                    if (v48 == 1)
                      v50 = v119;
                    else
                      v50 = v118;
                    if (v49)
                      v51 = v116;
                    else
                      v51 = v117;
                    objc_msgSend(v50, "addObject:", v38);
                    objc_msgSend(v51, "addObject:", v47);

                    ++v37;
                  }
                  while (objc_msgSend(v32, "count") > v37);
                }
                v18 = v112 + 1;
                if ((int)v109 < 1)
                {
                  v9 = v110;
                  v28 = v111;
                }
                else
                {
                  v9 = v110;
                  v28 = v111;
                  if (v18 >= v109)
                  {

                    v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
                    goto LABEL_59;
                  }
                }
                v7 = &getCNContactPreviousFamilyNameKeySymbolLoc_ptr_1;
              }
              else
              {
                v52 = v7[110];
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A07F4000, v52, OS_LOG_TYPE_INFO, "Received an event with a nil or empty feature dictionary...", buf, 2u);
                }
              }

            }
            else
            {
              v53 = v7[110];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A07F4000, v53, OS_LOG_TYPE_INFO, "Received a nil event...", buf, 2u);
              }
            }
          }
          v115 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v124, v130, 16);
        }
        while (v115);
      }
LABEL_59:

      v5 = v103;
      v20 = v104;
    }

    objc_autoreleasePoolPop(v106);
    if (v107)
      goto LABEL_88;
    v19 = v105 + 20;
  }
  while (v105 <= 0x4F);
  v54 = objc_msgSend(v119, "count");
  v55 = v118;
  v56 = objc_msgSend(v118, "count");
  v57 = objc_msgSend(v119, "count");
  v58 = objc_msgSend(v118, "count");
  if (v17 == -1.0 || v97 == 1)
    v60 = 1;
  else
    v60 = v96;
  if (v60 != 1)
    goto LABEL_73;
  if (!v54 || !v56)
  {
    v66 = v7[110];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v66, OS_LOG_TYPE_INFO, "Returning nil from processDataForStore because no positive or negative samples were found, and we need to balance classes, compute weights, or randomly select one of two classes, which will fail.", buf, 2u);
    }
LABEL_88:
    v67 = 0;
    v69 = v117;
    v68 = v118;
    v70 = v116;
    v71 = v119;
    goto LABEL_118;
  }
  if (v97 == 1)
  {
    v113 = v18;
    v61 = (double)arc4random() / 4294967300.0;
    v62 = v61 < 0.5;
    v63 = v61 >= 0.5;
  }
  else
  {
LABEL_73:
    if (v97 > 0)
      v64 = v96;
    else
      v64 = 0;
    v113 = v18;
    if (v64 == 1)
    {
      if (v56 >= v54)
        v65 = v54;
      else
        v65 = v56;
      if (v65 >= v97 >> 1)
        v63 = v97 >> 1;
      else
        v63 = v65;
      v62 = v63;
    }
    else if (v97 < 1)
    {
      if (v54 >= v56)
        v72 = v56;
      else
        v72 = v54;
      if (v96)
        v63 = v72;
      else
        v63 = v57;
      if (v96)
        v62 = v72;
      else
        v62 = v58;
    }
    else
    {
      v63 = (int)(float)((float)((float)v54 / (float)(v56 + v54)) * (float)v97);
      v62 = v97 - v63;
    }
  }
  v73 = 0x1E0CB3000uLL;
  v71 = v119;
  if (objc_msgSend(v119, "count") <= v63)
  {
    v70 = v116;
  }
  else
  {
    v71 = (void *)objc_opt_new();
    v70 = (void *)objc_opt_new();
    v74 = (void *)objc_opt_new();
    while (objc_msgSend(v71, "count") < v63)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v119, "count")));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v74, "containsObject:", v75) & 1) == 0)
      {
        objc_msgSend(v74, "addObject:", v75);
        objc_msgSend(v119, "objectAtIndex:", (int)objc_msgSend(v75, "intValue"));
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "addObject:", v76);

        objc_msgSend(v116, "objectAtIndex:", (int)objc_msgSend(v75, "intValue"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v77);

      }
    }

    v55 = v118;
  }
  if (objc_msgSend(v55, "count") <= v62)
  {
    v68 = v55;
    v69 = v117;
  }
  else
  {
    v68 = (void *)objc_opt_new();
    v69 = (void *)objc_opt_new();
    for (k = (void *)objc_opt_new(); objc_msgSend(v68, "count") < v62; v73 = 0x1E0CB3000)
    {
      objc_msgSend(*(id *)(v73 + 2024), "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v118, "count")));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(k, "containsObject:", v79) & 1) == 0)
      {
        objc_msgSend(k, "addObject:", v79);
        objc_msgSend(v118, "objectAtIndex:", (int)objc_msgSend(v79, "intValue"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "addObject:", v80);

        objc_msgSend(v117, "objectAtIndex:", (int)objc_msgSend(v79, "intValue"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v81);

      }
    }

  }
  if (v17 == -1.0)
  {
    v82 = (float)(unint64_t)objc_msgSend(v68, "count");
    v17 = v82 / (float)(unint64_t)objc_msgSend(v71, "count");
  }
  v83 = (void *)objc_opt_new();
  v84 = (void *)objc_opt_new();
  objc_msgSend(v83, "addObjectsFromArray:", v71);
  objc_msgSend(v83, "addObjectsFromArray:", v68);
  objc_msgSend(v84, "addObjectsFromArray:", v70);
  objc_msgSend(v84, "addObjectsFromArray:", v69);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v83, CFSTR("inputVectors"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v84, CFSTR("targetVector"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v113);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v85, CFSTR("NumberTrainingSessions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v83, "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v86, CFSTR("NumberTrainingRecords"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v68, "count"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v87, CFSTR("NumberTrainingRecordsClass0"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v71, "count"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v88, CFSTR("NumberTrainingRecordsClass1"));

  *(float *)&v89 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v90, CFSTR("CalculatedPositiveSampleWeight"));

  v91 = (void *)sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    v92 = (void *)MEMORY[0x1E0CB37E8];
    v93 = v91;
    objc_msgSend(v92, "numberWithInteger:", v113);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v132 = v94;
    _os_log_impl(&dword_1A07F4000, v93, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);

  }
  v67 = v9;

LABEL_118:
  return v67;
}

- (id)runWithRecipeInfo:(id)a3 knowledgeStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
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
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
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

  v8 = a3;
  v9 = a4;
  -[LighthouseShareSheetPFLTraining setKnowledgeStore:](self, "setKnowledgeStore:", v9);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Tree"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining setConfigTreeSpecification:](self, "setConfigTreeSpecification:", v10);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Depth"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining setConfigDepthSpecification:](self, "setConfigDepthSpecification:", v11);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BoltTaskID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining setConfigBoltTaskIDSpecification:](self, "setConfigBoltTaskIDSpecification:", v12);

  +[LighthouseShareSheetPFLTraining processDataForStore:recipeInfo:](LighthouseShareSheetPFLTraining, "processDataForStore:recipeInfo:", v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[LighthouseShareSheetPFLTraining setProcessDataReturnDict:](self, "setProcessDataReturnDict:", v13);
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(CFSTR("/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/"), "stringByAppendingString:", CFSTR("com.apple.PeopleSuggester.Config.SelectedFeatures.plist"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShareSheetPFLTraining setSelectedFeaturesConfig:](self, "setSelectedFeaturesConfig:", v16);

    -[LighthouseShareSheetPFLTraining createDataSourceForRecipe:error:](self, "createDataSourceForRecipe:error:", v8, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShareSheetPFLTraining setDataSource:](self, "setDataSource:", v17);

    -[LighthouseShareSheetPFLTraining dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (v19 = *a5, v18, v19))
    {
      v20 = sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.2((uint64_t)a5, v20, v21, v22, v23, v24, v25, v26);
      v27 = 0;
      goto LABEL_25;
    }
    v28 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "objectForKey:", CFSTR("ModelFileName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLWithString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.3();
      v27 = 0;
      goto LABEL_24;
    }
    NSTemporaryDirectory();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingPathComponent:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = objc_msgSend(v35, "fileExistsAtPath:", v34);

    if ((_DWORD)v33
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v36, "removeItemAtPath:error:", v34, a5),
          v36,
          *a5))
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.5();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "absoluteString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "copyItemAtPath:toPath:error:", v38, v34, a5);

      if (!*a5)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[LighthouseShareSheetPFLTraining generateResultsDictionayWithModelURL:error:](self, "generateResultsDictionayWithModelURL:error:", v39, a5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.4();
    }
    v27 = (void *)MEMORY[0x1E0C9AA70];
LABEL_23:

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
    -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.1();
  v27 = 0;
LABEL_26:

  return v27;
}

- (id)runTask:(id)a3 knowledgeStore:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v8 = a3;
  v9 = a4;
  -[LighthouseShareSheetPFLTraining setKnowledgeStore:](self, "setKnowledgeStore:", v9);
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v11, "integerValueForKey:defaultValue:", CFSTR("Tree"), -1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining setConfigTreeSpecification:](self, "setConfigTreeSpecification:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v14, "integerValueForKey:defaultValue:", CFSTR("Depth"), -1));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining setConfigDepthSpecification:](self, "setConfigDepthSpecification:", v15);

  objc_msgSend(v8, "parameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValueForKey:defaultValue:", CFSTR("BoltTaskID"), CFSTR("nil"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining setConfigBoltTaskIDSpecification:](self, "setConfigBoltTaskIDSpecification:", v17);

  objc_msgSend(v8, "parameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[LighthouseShareSheetPFLTraining processDataForStore:taskParameters:](LighthouseShareSheetPFLTraining, "processDataForStore:taskParameters:", v9, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[LighthouseShareSheetPFLTraining setProcessDataReturnDict:](self, "setProcessDataReturnDict:", v19);
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(CFSTR("/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/"), "stringByAppendingString:", CFSTR("com.apple.PeopleSuggester.Config.SelectedFeatures.plist"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShareSheetPFLTraining setSelectedFeaturesConfig:](self, "setSelectedFeaturesConfig:", v22);

    objc_msgSend(v8, "parameters");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShareSheetPFLTraining createDataSourceForDodMLRecipe:error:](self, "createDataSourceForDodMLRecipe:error:", v23, a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShareSheetPFLTraining setDataSource:](self, "setDataSource:", v24);

    -[LighthouseShareSheetPFLTraining dataSource](self, "dataSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && (v26 = *a5, v25, !v26))
    {
      objc_msgSend(v8, "parameters");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringValueForKey:defaultValue:", CFSTR("ModelFileName"), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v8, "attachments");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "attachmentURLsForBasename:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v38, "count") == 1)
        {
          objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[LighthouseShareSheetPFLTraining generateResultsDictionayWithModelURL:error:](self, "generateResultsDictionayWithModelURL:error:", v39, a5);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v40 = (void *)sLog_2;
          if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
            -[LighthouseShareSheetPFLTraining runTask:knowledgeStore:error:].cold.4(v40, v38);
          v34 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
          -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.3();
        v34 = 0;
      }

    }
    else
    {
      v27 = sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.2((uint64_t)a5, v27, v28, v29, v30, v31, v32, v33);
      v34 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
      -[LighthouseShareSheetPFLTraining runTask:knowledgeStore:error:].cold.1();
    v34 = 0;
  }

  return v34;
}

- (id)generateResultsDictionayWithModelURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  -[LighthouseShareSheetPFLTraining dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "evaluateWithModelURL:dataSource:processDataReturnDict:error:", v6, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v11 && !*a4)
  {
    -[LighthouseShareSheetPFLTraining knowledgeStore](self, "knowledgeStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShareSheetPFLTraining processDataForMetricEvaluationForStore:](self, "processDataForMetricEvaluationForStore:", v20);

    -[LighthouseShareSheetPFLTraining evaluateMetricsWithModelURL:](self, "evaluateMetricsWithModelURL:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __78__LighthouseShareSheetPFLTraining_generateResultsDictionayWithModelURL_error___block_invoke;
      v27[3] = &unk_1E4400C50;
      v22 = v11;
      v28 = v22;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v27);
      -[LighthouseShareSheetPFLTraining configTreeSpecification](self, "configTreeSpecification");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v23, CFSTR("Tree"));

      -[LighthouseShareSheetPFLTraining configDepthSpecification](self, "configDepthSpecification");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("Depth"));

      -[LighthouseShareSheetPFLTraining configBoltTaskIDSpecification](self, "configBoltTaskIDSpecification");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("BoltTaskID"));

      v19 = v22;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining generateResultsDictionayWithModelURL:error:].cold.2();
      v19 = 0;
    }

  }
  else
  {
    v12 = sLog_2;
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
      -[LighthouseShareSheetPFLTraining generateResultsDictionayWithModelURL:error:].cold.1((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
    v19 = 0;
  }

  return v19;
}

uint64_t __78__LighthouseShareSheetPFLTraining_generateResultsDictionayWithModelURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3
{
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  float v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  __int128 v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *context;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[128];
  uint8_t v61[128];
  __int128 buf;
  Class (*v63)(uint64_t);
  void *v64;
  uint64_t *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v3;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v37)
  {
    v5 = 0;
    v36 = *(_QWORD *)v53;
    *(_QWORD *)&v4 = 138412290;
    v33 = v4;
    do
    {
      v6 = 0;
      v44 = v5;
      do
      {
        if (*(_QWORD *)v53 != v36)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v38 = v6;
        v8 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1A1AFCA24]();
        v46 = (void *)objc_msgSend(v8, "mutableCopy");
        -[LighthouseShareSheetPFLTraining featureNameDict](self, "featureNameDict");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("personAndAppMatched"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "objectAtIndexedSubscript:", (int)objc_msgSend(v43, "intValue"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v10 = (void *)getMLFeatureValueClass_softClass_1;
        v59 = getMLFeatureValueClass_softClass_1;
        if (!getMLFeatureValueClass_softClass_1)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v63 = __getMLFeatureValueClass_block_invoke_1;
          v64 = &unk_1E43FEA00;
          v65 = &v56;
          __getMLFeatureValueClass_block_invoke_1((uint64_t)&buf);
          v10 = (void *)v57[3];
        }
        v11 = objc_retainAutorelease(v10);
        _Block_object_dispose(&v56, 8);
        objc_msgSend(v42, "floatValue");
        objc_msgSend(v11, "featureValueWithInt64:", (int)v12);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[LighthouseShareSheetPFLTraining featureNameDict](self, "featureNameDict");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("predictedClass"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "setObject:atIndexedSubscript:", v41, (int)objc_msgSend(v40, "intValue"));
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        -[LighthouseShareSheetPFLTraining featureNameDict](self, "featureNameDict");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v49 != v17)
                objc_enumerationMutation(v15);
              v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              -[LighthouseShareSheetPFLTraining featureNameDict](self, "featureNameDict", v33);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v21, "stringValue");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v19, "isEqualToString:", CFSTR("predictedClass"));
              objc_msgSend(v46, "objectAtIndexedSubscript:", (int)objc_msgSend(v21, "intValue"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
                v25 = v19;
              else
                v25 = v22;
              objc_msgSend(v14, "setValue:forKey:", v24, v25);

            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v16);
        }

        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v26 = (void *)getMLDictionaryFeatureProviderClass_softClass_5;
        v59 = getMLDictionaryFeatureProviderClass_softClass_5;
        if (!getMLDictionaryFeatureProviderClass_softClass_5)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v63 = __getMLDictionaryFeatureProviderClass_block_invoke_5;
          v64 = &unk_1E43FEA00;
          v65 = &v56;
          __getMLDictionaryFeatureProviderClass_block_invoke_5((uint64_t)&buf);
          v26 = (void *)v57[3];
        }
        v27 = objc_retainAutorelease(v26);
        _Block_object_dispose(&v56, 8);
        v28 = [v27 alloc];
        v29 = (void *)objc_msgSend(v14, "copy");
        v47 = v44;
        v30 = (void *)objc_msgSend(v28, "initWithDictionary:error:", v29, &v47);
        v5 = v47;

        if (v5)
        {
          v31 = sLog_2;
          if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v33;
            *(_QWORD *)((char *)&buf + 4) = v5;
            _os_log_error_impl(&dword_1A07F4000, v31, OS_LOG_TYPE_ERROR, "Error getting sample point into MLDictionaryFeatureProvider format with error:%@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v34, "addObject:", v30);
        }

        objc_autoreleasePoolPop(context);
        v6 = v38 + 1;
        v44 = v5;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    }
    while (v37);

  }
  return v34;
}

- (id)evaluateMetricsWithModelURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  __int128 v27;
  void *v28;
  objc_class *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  float v41;
  float v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  float v53;
  float v54;
  void *v55;
  void *v56;
  evaluatedRule *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  double v62;
  evaluatedRule *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  __int128 v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *context;
  void *v93;
  uint64_t v94;
  void *v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  void *v100;
  int v101;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  __int128 buf;
  Class (*v112)(uint64_t);
  void *v113;
  uint64_t *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v106 = 0;
  v107 = &v106;
  v108 = 0x2050000000;
  v4 = (void *)getMLModelClass_softClass_7;
  v109 = getMLModelClass_softClass_7;
  if (!getMLModelClass_softClass_7)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v112 = __getMLModelClass_block_invoke_7;
    v113 = &unk_1E43FEA00;
    v114 = &v106;
    __getMLModelClass_block_invoke_7((uint64_t)&buf);
    v4 = (void *)v107[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v106, 8);
  v105 = 0;
  v89 = v3;
  objc_msgSend(v5, "compileModelAtURL:error:", v3, &v105);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v105;
  v7 = v90;
  if (v90)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(v90, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSBehaviorRuleRankingUtilities loadMLModel:modelConfig:](_PSBehaviorRuleRankingUtilities, "loadMLModel:modelConfig:", v19, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)sLog_2;
    if (!v91)
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        -[LighthouseShareSheetPFLTraining evaluateMetricsWithModelURL:].cold.2();
      v17 = 0;
      v18 = 0;
      goto LABEL_61;
    }
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      objc_msgSend(v90, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "Loaded model from %@", (uint8_t *)&buf, 0xCu);

    }
    v23 = sLog_2;
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("predictedValue");
      _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_INFO, "Using prediction label name: %@", (uint8_t *)&buf, 0xCu);
    }
    -[LighthouseShareSheetPFLTraining featureMatricesForAllShareEvents](self, "featureMatricesForAllShareEvents");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)sLog_2;
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
    {
      v25 = v24;
      v26 = objc_msgSend(v93, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_INFO, "Amount of data for evaluation: %ld", (uint8_t *)&buf, 0xCu);

    }
    if (!objc_msgSend(v93, "count"))
    {
      v97 = 0;
      v98 = 0;
      v96 = 0;
      v101 = 0;
      v88 = 0;
LABEL_58:
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v88 / (double)(unint64_t)objc_msgSend(v93, "count"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v74, CFSTR("engagementRate"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v88);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v75, CFSTR("engagementRate_NumPositiveSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v93, "count"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v76, CFSTR("engagementRate_NumSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)SHIDWORD(v98) / (double)v101);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v77, CFSTR("binaryAccuracy"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v98));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v78, CFSTR("binaryAccuracy_NumPositiveSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v101);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v79, CFSTR("binaryAccuracy_NumSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)SHIDWORD(v97) / (double)(int)v97);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v80, CFSTR("binaryAccuracyClass1"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v97));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v81, CFSTR("binaryAccuracyClass1_NumPositiveSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v97);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v82, CFSTR("binaryAccuracyClass1_NumSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v96 / (double)(int)v98);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v83, CFSTR("binaryAccuracyClass0"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v96);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v84, CFSTR("binaryAccuracyClass0_NumPositiveSamples"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v98);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v85, CFSTR("binaryAccuracyClass0_NumSamples"));

      v17 = 0;
      goto LABEL_60;
    }
    v97 = 0;
    v98 = 0;
    v101 = 0;
    v96 = 0;
    v94 = 0;
    v88 = 0;
    *(_QWORD *)&v27 = 138412290;
    v87 = v27;
    while (1)
    {
      context = (void *)MEMORY[0x1A1AFCA24]();
      objc_msgSend(v93, "objectAtIndexedSubscript:", v94);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[LighthouseShareSheetPFLTraining createMLFeatureProviderArrayFromSingleShareEventData:](self, "createMLFeatureProviderArrayFromSingleShareEventData:", v100);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = 0;
      v107 = &v106;
      v108 = 0x2050000000;
      v28 = (void *)getMLArrayBatchProviderClass_softClass_2;
      v109 = getMLArrayBatchProviderClass_softClass_2;
      if (!getMLArrayBatchProviderClass_softClass_2)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v112 = __getMLArrayBatchProviderClass_block_invoke_2;
        v113 = &unk_1E43FEA00;
        v114 = &v106;
        __getMLArrayBatchProviderClass_block_invoke_2((uint64_t)&buf);
        v28 = (void *)v107[3];
      }
      v29 = objc_retainAutorelease(v28);
      _Block_object_dispose(&v106, 8);
      v103 = (void *)objc_msgSend([v29 alloc], "initWithFeatureProviderArray:", v95);
      v104 = 0;
      objc_msgSend(v91, "predictionsFromBatch:error:", v103, &v104);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v104;
      v32 = sLog_2;
      if (v31)
      {
        if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = v87;
          *(_QWORD *)((char *)&buf + 4) = v31;
          _os_log_error_impl(&dword_1A07F4000, v32, OS_LOG_TYPE_ERROR, "ML model load to predict with error：%@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_50;
      }
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
      {
        v33 = v32;
        v34 = objc_msgSend(v30, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_1A07F4000, v33, OS_LOG_TYPE_INFO, "Amount of predictions, %ld", (uint8_t *)&buf, 0xCu);

      }
      if (objc_msgSend(v30, "count", v87) >= 1)
        break;
LABEL_37:
      v99 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v30, "count") >= 1)
      {
        v47 = 0;
        do
        {
          objc_msgSend(v100, "objectAtIndexedSubscript:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "featuresAtIndex:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "featureValueForName:", CFSTR("classProbability"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "dictionaryValue");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "objectForKeyedSubscript:", &unk_1E442B678);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "floatValue");
          v54 = v53;

          -[LighthouseShareSheetPFLTraining featureNameDict](self, "featureNameDict");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("recipientAndBundleIDAsInteger"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = [evaluatedRule alloc];
          objc_msgSend(v103, "featuresAtIndex:", v47);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "featureValueForName:", CFSTR("predictedClass"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "int64Value");
          objc_msgSend(v48, "objectAtIndexedSubscript:", (int)objc_msgSend(v56, "intValue"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v62 = v54 * 100.0;
          v63 = -[evaluatedRule initWithLabel:score:recipientUniqueID:](v57, "initWithLabel:score:recipientUniqueID:", v60, v61, v62);

          objc_msgSend(v99, "addObject:", v63);
          ++v47;
        }
        while (v47 < objc_msgSend(v30, "count"));
      }
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 0, sel_compare_);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "sortedArrayUsingDescriptors:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      if (objc_msgSend(v66, "count"))
      {
        v68 = 0;
        v69 = 1;
        while (1)
        {
          objc_msgSend(v66, "objectAtIndexedSubscript:", v69 - 1);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v70, "ruleLabel") == 1)
            break;
          objc_msgSend(v70, "recipientUniqueID");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v67, "containsObject:", v71);

          if ((v72 & 1) == 0)
          {
            objc_msgSend(v70, "recipientUniqueID");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "addObject:", v73);

            ++v68;
          }

          if (v69 < objc_msgSend(v66, "count"))
          {
            ++v69;
            if (v68 < 5)
              continue;
          }
          goto LABEL_49;
        }

        ++v88;
      }
LABEL_49:

      v31 = 0;
LABEL_50:
      v17 = v31;

      objc_autoreleasePoolPop(context);
      if (v31)
      {
        v18 = 0;
LABEL_60:

LABEL_61:
        goto LABEL_62;
      }
      if (++v94 >= (unint64_t)objc_msgSend(v93, "count"))
        goto LABEL_58;
    }
    v35 = 0;
    while (1)
    {
      objc_msgSend(v30, "featuresAtIndex:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "featureValueForName:", CFSTR("predictedValue"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;

      *(float *)&v40 = v39;
      -[LighthouseShareSheetPFLTraining sigmoid:](self, "sigmoid:", v40);
      v42 = v41;
      v43 = v41 > 0.5;
      objc_msgSend(v103, "featuresAtIndex:", v35);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "featureValueForName:", CFSTR("predictedClass"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "int64Value");

      if (v46 == v43)
      {
        ++HIDWORD(v98);
        if (v42 <= 0.5)
        {
          ++v96;
          ++v101;
          goto LABEL_34;
        }
        ++HIDWORD(v97);
      }
      ++v101;
      if (v46 == 1)
      {
        LODWORD(v97) = v97 + 1;
        goto LABEL_36;
      }
      if (v46)
        goto LABEL_36;
LABEL_34:
      LODWORD(v98) = v98 + 1;
LABEL_36:
      if (++v35 >= objc_msgSend(v30, "count"))
        goto LABEL_37;
    }
  }
  v9 = (uint64_t)v6;
  v10 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)v9;
    -[LighthouseShareSheetPFLTraining evaluateMetricsWithModelURL:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v18 = 0;
LABEL_62:
    v7 = v90;
    goto LABEL_63;
  }
  v17 = (void *)v9;
  v18 = 0;
LABEL_63:

  return v18;
}

- (void)processDataForMetricEvaluationForStore:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  unint64_t v81;
  BOOL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  id v92;
  unint64_t v93;
  uint64_t v94;
  void *v95;
  void *context;
  id v97;
  void *v98;
  uint64_t v99;
  id v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  void *v106;
  LighthouseShareSheetPFLTraining *v107;
  uint64_t v108;
  id obj;
  void *v110;
  int v111;
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
  __int128 v125;
  __int128 v126;
  __int128 v127;
  id v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint8_t v132[128];
  uint8_t buf[4];
  id v134;
  _QWORD v135[4];

  v135[1] = *MEMORY[0x1E0C80C00];
  v92 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v107 = self;
  -[LighthouseShareSheetPFLTraining setFeatureMatricesForAllShareEvents:](self, "setFeatureMatricesForAllShareEvents:", v4);

  v5 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "In processData", buf, 2u);
  }
  v6 = 0;
  v101 = 0;
  v7 = 20;
  v8 = CFSTR("predictedClass");
  while (1)
  {
    v93 = v7;
    context = (void *)MEMORY[0x1A1AFCA24]();
    v9 = objc_alloc_init(MEMORY[0x1E0D15A08]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "LighthouseShareSheetPFLTraining.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(":%d"), 850);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientName:", v11);

    objc_msgSend(v9, "setTracker:", &__block_literal_global_44);
    objc_msgSend(MEMORY[0x1E0D15AF8], "behavioralRuleFeaturesStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEventStreams:", v13);

    objc_msgSend(v9, "setLimit:", 20);
    v94 = v6;
    objc_msgSend(v9, "setOffset:", v6);
    v128 = 0;
    v95 = v9;
    objc_msgSend(v92, "executeQuery:error:", v9, &v128);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v128;
    v15 = sLog_2;
    v97 = v14;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v97;
        _os_log_error_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_ERROR, "knowledgeStore executeQuery failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
      {
        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = v15;
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v98, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v134 = v18;
        _os_log_impl(&dword_1A07F4000, v17, OS_LOG_TYPE_INFO, "knowledgeEvents parsing, number of events: %@", buf, 0xCu);

      }
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v19 = v98;
      v102 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v124, v132, 16);
      if (v102)
      {
        v20 = *(_QWORD *)v125;
        v99 = *(_QWORD *)v125;
        v100 = v19;
        do
        {
          for (i = 0; i != v102; ++i)
          {
            if (*(_QWORD *)v125 != v20)
              objc_enumerationMutation(v19);
            v22 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
            if (v22)
            {
              v103 = i;
              objc_msgSend(v22, "metadata");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D159B0], "featureDict");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25 && objc_msgSend(v25, "count"))
              {
                v26 = (void *)sLog_2;
                if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                {
                  v27 = (void *)MEMORY[0x1E0CB37E8];
                  v28 = v26;
                  objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v134 = v29;
                  _os_log_impl(&dword_1A07F4000, v28, OS_LOG_TYPE_INFO, "number of data points: %@", buf, 0xCu);

                }
                if (objc_msgSend(v25, "count"))
                {
                  ++v101;
                  v30 = (void *)sLog_2;
                  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                  {
                    v31 = (void *)MEMORY[0x1E0CB37E8];
                    v32 = v30;
                    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v134 = v34;
                    _os_log_impl(&dword_1A07F4000, v32, OS_LOG_TYPE_INFO, "data point dimension: %@", buf, 0xCu);

                  }
                }
                v35 = (void *)sLog_2;
                if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                {
                  v36 = (void *)MEMORY[0x1E0CB37E8];
                  v37 = v35;
                  objc_msgSend(v36, "numberWithInt:", v101);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v134 = v38;
                  _os_log_impl(&dword_1A07F4000, v37, OS_LOG_TYPE_INFO, "countEvents: %@", buf, 0xCu);

                }
                if (v101 == 1 && objc_msgSend(v25, "count"))
                {
                  -[LighthouseShareSheetPFLTraining selectedFeaturesConfig](v107, "selectedFeaturesConfig");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("_PSRuleMiningModelFeatureSet"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  -[LighthouseShareSheetPFLTraining setFeatureNameDict:](v107, "setFeatureNameDict:", v41);

                  v122 = 0u;
                  v123 = 0u;
                  v120 = 0u;
                  v121 = 0u;
                  v42 = v40;
                  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
                  if (v43)
                  {
                    v110 = v25;
                    v44 = 0;
                    v45 = *(_QWORD *)v121;
                    do
                    {
                      v46 = 0;
                      v47 = v44;
                      do
                      {
                        if (*(_QWORD *)v121 != v45)
                          objc_enumerationMutation(v42);
                        v48 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v46);
                        -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v47 + v46);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "setValue:forKey:", v50, v48);

                        ++v46;
                      }
                      while (v43 != v46);
                      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v120, v131, 16);
                      v44 = (v47 + v46);
                    }
                    while (v43);
                    v43 = (v47 + v46);
                    v25 = v110;
                  }

                  -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setValue:forKey:", v52, CFSTR("personAndAppMatched"));

                  -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v43 + 1));
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "setValue:forKey:", v54, CFSTR("recipientAndBundleIDAsInteger"));

                  -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v43 + 2));
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "setValue:forKey:", v56, v8);

                  v57 = (void *)sLog_2;
                  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                  {
                    v58 = v57;
                    -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v134 = v59;
                    _os_log_impl(&dword_1A07F4000, v58, OS_LOG_TYPE_INFO, "featureNameDict: %@", buf, 0xCu);

                  }
                }
                v104 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                if (objc_msgSend(v25, "count"))
                {
                  v60 = 0;
                  while (1)
                  {
                    v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v116 = 0u;
                    v117 = 0u;
                    v118 = 0u;
                    v119 = 0u;
                    -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
                    if (v63)
                    {
                      v64 = v63;
                      v65 = *(_QWORD *)v117;
                      do
                      {
                        for (j = 0; j != v64; ++j)
                        {
                          if (*(_QWORD *)v117 != v65)
                            objc_enumerationMutation(v62);
                          if ((objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * j), "isEqualToString:", v8) & 1) == 0)
                          {
                            v67 = (void *)objc_opt_new();
                            objc_msgSend(v61, "addObject:", v67);

                          }
                        }
                        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
                      }
                      while (v64);
                    }
                    v106 = v61;

                    v114 = 0u;
                    v115 = 0u;
                    v112 = 0u;
                    v113 = 0u;
                    -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                    obj = (id)objc_claimAutoreleasedReturnValue();
                    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
                    if (v68)
                      break;
LABEL_61:

                    v86 = (void *)objc_msgSend(v106, "copy");
                    objc_msgSend(v104, "addObject:", v86);

                    if (objc_msgSend(v25, "count") <= (unint64_t)++v60)
                      goto LABEL_62;
                  }
                  v69 = v68;
                  v70 = *(_QWORD *)v113;
                  v105 = v60;
                  while (2)
                  {
                    v71 = 0;
                    v108 = v69;
LABEL_51:
                    if (*(_QWORD *)v113 != v70)
                      objc_enumerationMutation(obj);
                    v72 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v71);
                    if ((objc_msgSend(v72, "isEqualToString:", v8) & 1) == 0)
                    {
                      objc_msgSend(v25, "objectAtIndexedSubscript:", v60);
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "objectForKey:", v72);
                      v74 = objc_claimAutoreleasedReturnValue();
                      if (v74)
                      {
                        v75 = (void *)v74;
                        -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v76, "objectForKeyedSubscript:", v72);
                        v77 = v70;
                        v78 = v25;
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        v111 = objc_msgSend(v79, "intValue");
                        v80 = v8;
                        v81 = objc_msgSend(v106, "count");

                        v25 = v78;
                        v70 = v77;
                        v69 = v108;

                        v82 = v81 > v111;
                        v8 = v80;
                        v60 = v105;
                        if (!v82)
                          goto LABEL_59;
                        objc_msgSend(v25, "objectAtIndexedSubscript:", v105);
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v73, "objectForKeyedSubscript:", v72);
                        v83 = (void *)objc_claimAutoreleasedReturnValue();
                        -[LighthouseShareSheetPFLTraining featureNameDict](v107, "featureNameDict");
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v84, "objectForKeyedSubscript:", v72);
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setObject:atIndexedSubscript:", v83, (int)objc_msgSend(v85, "intValue"));

                        v69 = v108;
                      }

                    }
LABEL_59:
                    if (v69 == ++v71)
                    {
                      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v129, 16);
                      if (!v69)
                        goto LABEL_61;
                      continue;
                    }
                    goto LABEL_51;
                  }
                }
LABEL_62:
                -[LighthouseShareSheetPFLTraining featureMatricesForAllShareEvents](v107, "featureMatricesForAllShareEvents");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "addObject:", v104);

                v20 = v99;
                v19 = v100;
              }

              i = v103;
            }
          }
          v102 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v124, v132, 16);
        }
        while (v102);
      }

    }
    objc_autoreleasePoolPop(context);
    if (v97)
      break;
    v6 = v94 + 20;
    v7 = v93 + 20;
    if (v93 >= 0x51)
    {
      v88 = (void *)sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
      {
        v89 = (void *)MEMORY[0x1E0CB37E8];
        v90 = v88;
        objc_msgSend(v89, "numberWithInt:", v101);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v134 = v91;
        _os_log_impl(&dword_1A07F4000, v90, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);

      }
      break;
    }
  }

}

uint64_t __74__LighthouseShareSheetPFLTraining_processDataForMetricEvaluationForStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)createDataSourceForRecipe:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  FidesPHSEvaluatorDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FidesPHSEvaluatorDataSource *v16;
  FidesPHSEvaluatorDataSource *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  +[FidesPHSEvaluatorDataSource defaultRecipeParams](FidesPHSEvaluatorDataSource, "defaultRecipeParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __67__LighthouseShareSheetPFLTraining_createDataSourceForRecipe_error___block_invoke;
  v22 = &unk_1E4401FA0;
  v9 = v6;
  v23 = v9;
  v10 = v7;
  v24 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v19);

  v11 = [FidesPHSEvaluatorDataSource alloc];
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict", v19, v20, v21, v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputVectors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("targetVector"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FidesPHSEvaluatorDataSource initWithRecipe:inputVectors:targetVector:error:](v11, "initWithRecipe:inputVectors:targetVector:error:", v10, v13, v15, a4);

  if (v16 && !*a4)
    v17 = v16;
  else
    v17 = 0;

  return v17;
}

void __67__LighthouseShareSheetPFLTraining_createDataSourceForRecipe_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v8;
  if (v8)
    v9 = (id)v8;
  else
    v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);

}

- (id)createDataSourceForDodMLRecipe:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  FidesPHSEvaluatorDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FidesPHSEvaluatorDataSource *v16;
  FidesPHSEvaluatorDataSource *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  +[FidesPHSEvaluatorDataSource defaultRecipeParams](FidesPHSEvaluatorDataSource, "defaultRecipeParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __72__LighthouseShareSheetPFLTraining_createDataSourceForDodMLRecipe_error___block_invoke;
  v22 = &unk_1E4401FA0;
  v9 = v6;
  v23 = v9;
  v10 = v7;
  v24 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v19);

  v11 = [FidesPHSEvaluatorDataSource alloc];
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict", v19, v20, v21, v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputVectors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShareSheetPFLTraining processDataReturnDict](self, "processDataReturnDict");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("targetVector"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FidesPHSEvaluatorDataSource initWithRecipe:inputVectors:targetVector:error:](v11, "initWithRecipe:inputVectors:targetVector:error:", v10, v13, v15, a4);

  if (v16 && !*a4)
    v17 = v16;
  else
    v17 = 0;

  return v17;
}

void __72__LighthouseShareSheetPFLTraining_createDataSourceForDodMLRecipe_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v8;
  if (v8)
    v9 = (id)v8;
  else
    v9 = v6;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);

}

- (float)sigmoid:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (FidesPHSEvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDictionary)processDataReturnDict
{
  return self->_processDataReturnDict;
}

- (void)setProcessDataReturnDict:(id)a3
{
  objc_storeStrong((id *)&self->_processDataReturnDict, a3);
}

- (NSMutableArray)featureMatricesForAllShareEvents
{
  return self->_featureMatricesForAllShareEvents;
}

- (void)setFeatureMatricesForAllShareEvents:(id)a3
{
  objc_storeStrong((id *)&self->_featureMatricesForAllShareEvents, a3);
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureNameDict:(id)a3
{
  objc_storeStrong((id *)&self->_featureNameDict, a3);
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, a3);
}

- (NSString)configTreeSpecification
{
  return self->_configTreeSpecification;
}

- (void)setConfigTreeSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_configTreeSpecification, a3);
}

- (NSString)configDepthSpecification
{
  return self->_configDepthSpecification;
}

- (void)setConfigDepthSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_configDepthSpecification, a3);
}

- (NSString)configBoltTaskIDSpecification
{
  return self->_configBoltTaskIDSpecification;
}

- (void)setConfigBoltTaskIDSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_configBoltTaskIDSpecification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configBoltTaskIDSpecification, 0);
  objc_storeStrong((id *)&self->_configDepthSpecification, 0);
  objc_storeStrong((id *)&self->_configTreeSpecification, 0);
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, 0);
  objc_storeStrong((id *)&self->_featureNameDict, 0);
  objc_storeStrong((id *)&self->_featureMatricesForAllShareEvents, 0);
  objc_storeStrong((id *)&self->_processDataReturnDict, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Got nil return from processDataForStore:recipeInfo:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)runWithRecipeInfo:(uint64_t)a3 knowledgeStore:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Failed to get data source with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "No model file specified for key 'ModelFileName' in Trial attachment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Failed to copy model file to temporary directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Failed to remove old model file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)runTask:knowledgeStore:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Got nil return from processDataForStore:taskParameters:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)runTask:(void *)a1 knowledgeStore:(void *)a2 error:.cold.4(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 134217984;
  v5 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_ERROR, "modelURLs had a length not equal to 1: %lu", (uint8_t *)&v4, 0xCu);

}

- (void)generateResultsDictionayWithModelURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Failed to run evaluateWithModelURL with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)generateResultsDictionayWithModelURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Failed to run evaluateMetricsWithModelURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)evaluateMetricsWithModelURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Failed to compile model with error：%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)evaluateMetricsWithModelURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Failed to load model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
