@implementation _PSLastCommunicatedFeatures

+ (id)lastCommunicationFromCandidates:(id)a3 direction:(int64_t)a4 mechanisms:(id)a5 caches:(id)a6
{
  id v9;
  id v10;
  void *v11;
  _PSFeatureDictionary *v12;
  id v13;
  id v14;
  void *v15;
  _PSFeatureDictionary *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  int64_t v21;

  v9 = a5;
  v10 = a6;
  objc_msgSend(a3, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [_PSFeatureDictionary alloc];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91___PSLastCommunicatedFeatures_lastCommunicationFromCandidates_direction_mechanisms_caches___block_invoke;
  v18[3] = &unk_1E44017C8;
  v20 = v9;
  v21 = a4;
  v19 = v10;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_PSFeatureDictionary initWithObjects:forKeys:](v12, "initWithObjects:forKeys:", v15, v11);

  return v16;
}

+ (id)lastInteractionFromCandidate:(id)a3 caches:(id)a4 direction:(int64_t)a5 mechanisms:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  _BYTE v73[32];
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  char *v93;
  char *v94;
  int64_t v95;
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
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v95 = a5;
  v126 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v85 = a6;
  _PSShareSheetSuggestionBundleIDMapping(0);
  v74 = (id)objc_claimAutoreleasedReturnValue();
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v10 = v9;
  v80 = v10;
  v93 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
  if (v93)
  {
    v11 = 0;
    v92 = *(id *)v117;
    do
    {
      v12 = 0;
      do
      {
        if (*(id *)v117 != v92)
          objc_enumerationMutation(v80);
        v94 = v12;
        v13 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)v12);
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v14 = v85;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v124, 16, v74);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v113;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v113 != v17)
                objc_enumerationMutation(v14);
              v19 = objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "integerValue");
              objc_msgSend(v8, "candidateIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "mostRecentInteractionForCandidateIdentifier:direction:mechanism:", v20, v95, v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v11 || v21 && _CDStartDateCompare() == -1)
              {
                v22 = v21;

                v11 = v22;
              }

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v124, 16);
          }
          while (v16);
        }

        v12 = v94 + 1;
      }
      while (v94 + 1 != v93);
      v93 = (char *)objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v116, v125, 16);
    }
    while (v93);

    if (v11)
      goto LABEL_85;
  }
  else
  {

  }
  v84 = v8;
  v93 = v73;
  memset(v73, 0, 21);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v23 = v85;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
  v25 = v80;
  if (v24)
  {
    v26 = v24;
    v27 = *(_QWORD *)v109;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v109 != v27)
          objc_enumerationMutation(v23);
        v29 = objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * j), "integerValue");
        if ((v29 & 0x8000000000000000) != 0 || v29 >= 0x15)
          __break(1u);
        v93[v29] = 1;
      }
      v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
    }
    while (v26);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v77 = v25;
  v30 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
  if (v30)
  {
    v31 = v30;
    v11 = 0;
    v32 = *(_QWORD *)v105;
    v8 = v84;
    v75 = *(_QWORD *)v105;
    do
    {
      v33 = 0;
      v76 = v31;
      do
      {
        if (*(_QWORD *)v105 != v32)
          objc_enumerationMutation(v77);
        v34 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v33);
        v88 = (void *)MEMORY[0x1A1AFCA24]();
        objc_msgSend(v8, "candidateIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "mostRecentInteractionForCandidateIdentifier:direction:", v35, v95);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          v82 = v36;
          objc_msgSend(v36, "recipients");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          v39 = (void *)MEMORY[0x1E0C9AA60];
          if (v37)
            v39 = (void *)v37;
          v40 = v39;

          objc_msgSend(v11, "sender");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            objc_msgSend(v11, "sender");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "arrayByAddingObject:", v42);
            v43 = objc_claimAutoreleasedReturnValue();

            v44 = (void *)v43;
          }
          else
          {
            v44 = v40;
          }
          v81 = v44;
          +[_PSLastCommunicatedFeatures recipientDetailsFromContact:](_PSLastCommunicatedFeatures, "recipientDetailsFromContact:");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v79 = v33;
            v46 = v45;
            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("identifierSet"));
            v90 = (id)objc_claimAutoreleasedReturnValue();
            v78 = v46;
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("personIdSet"));
            v83 = (id)objc_claimAutoreleasedReturnValue();
            v47 = (void *)objc_opt_new();
            v48 = (void *)objc_opt_new();
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            objc_msgSend(v34, "interactions");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v101;
              v86 = *(_QWORD *)v101;
              v87 = v49;
              while (2)
              {
                v53 = 0;
                v89 = v51;
                do
                {
                  if (*(_QWORD *)v101 != v52)
                    objc_enumerationMutation(v49);
                  v54 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v53);
                  v94 = (char *)MEMORY[0x1A1AFCA24]();
                  if (v11 && _CDStartDateCompare() != -1)
                    goto LABEL_77;
                  v55 = objc_msgSend(v54, "direction");
                  if (v55 == v95 && (unint64_t)objc_msgSend(v54, "mechanism") <= 0x14)
                  {
                    v56 = objc_msgSend(v54, "mechanism");
                    if (v93[v56])
                    {
                      v91 = v53;
                      objc_msgSend(v47, "removeAllObjects");
                      objc_msgSend(v48, "removeAllObjects");
                      v98 = 0u;
                      v99 = 0u;
                      v96 = 0u;
                      v97 = 0u;
                      v92 = v54;
                      objc_msgSend(v54, "recipients");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
                      if (v58)
                      {
                        v59 = v58;
                        v60 = *(_QWORD *)v97;
                        do
                        {
                          for (k = 0; k != v59; ++k)
                          {
                            if (*(_QWORD *)v97 != v60)
                              objc_enumerationMutation(v57);
                            v62 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * k);
                            objc_msgSend(v62, "identifier");
                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v63)
                              objc_msgSend(v47, "addObject:", v63);
                            objc_msgSend(v62, "personId");
                            v64 = (void *)objc_claimAutoreleasedReturnValue();
                            if (v64)
                              objc_msgSend(v48, "addObject:", v64);

                          }
                          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v120, 16);
                        }
                        while (v59);
                      }

                      v65 = v92;
                      objc_msgSend(v92, "sender");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = v66;
                      v8 = v84;
                      if (v66)
                      {
                        objc_msgSend(v66, "identifier");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v68)
                          objc_msgSend(v47, "addObject:", v68);
                        objc_msgSend(v67, "personId");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v69)
                          objc_msgSend(v48, "addObject:", v69);

                      }
                      if (objc_msgSend(v47, "isEqual:", v90)
                        && (objc_msgSend(v48, "isEqual:", v83) & 1) != 0)
                      {
                        v70 = v65;

                        v11 = v70;
                        v49 = v87;
LABEL_77:
                        objc_autoreleasePoolPop(v94);
                        goto LABEL_78;
                      }

                      v52 = v86;
                      v49 = v87;
                      v51 = v89;
                      v53 = v91;
                    }
                  }
                  objc_autoreleasePoolPop(v94);
                  ++v53;
                }
                while (v53 != v51);
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v100, v121, 16);
                if (v51)
                  continue;
                break;
              }
            }
LABEL_78:

            v32 = v75;
            v31 = v76;
            v45 = v78;
            v33 = v79;
          }

          v36 = v82;
        }

        objc_autoreleasePoolPop(v88);
        ++v33;
      }
      while (v33 != v31);
      v31 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
    }
    while (v31);
  }
  else
  {
    v11 = 0;
    v8 = v84;
  }

LABEL_85:
  v71 = v11;

  return v71;
}

+ (double)timeIntervalSinceNowForInteraction:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  if (v3)
  {
    objc_msgSend(v3, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceNow");
      v6 = v9;

    }
  }

  return v6;
}

+ (id)featureValueFromTimeInterval:(double)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = +[_PSLastCommunicatedFeatures bucketFromTimeInterval:](_PSLastCommunicatedFeatures, "bucketFromTimeInterval:");
  v5 = objc_alloc(MEMORY[0x1E0D020D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, v6, 0, 0, v4);

  return v7;
}

+ (int)bucketFromTimeInterval:(double)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  int v24;
  double v25;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v5 = objc_alloc(MEMORY[0x1E0C99D48]);
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v7, "setMonth:", -1);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;

  v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v11, "setMonth:", -3);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v11, v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceNow");
  v14 = v13;

  v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v15, "setMonth:", -6);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v15, v4, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceNow");
  v18 = v17;

  v19 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v15, "setYear:", -1);
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v19, v4, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceNow");
  v22 = v21;

  v23 = fabs(a3);
  if (v23 >= 120.0)
  {
    if (v23 >= 300.0)
    {
      if (v23 >= 600.0)
      {
        if (v23 >= 1800.0)
        {
          if (v23 >= 3600.0)
          {
            if (v23 >= 7200.0)
            {
              if (v23 >= 14400.0)
              {
                if (v23 >= 21600.0)
                {
                  if (v23 >= 43200.0)
                  {
                    if (v23 >= 86400.0)
                    {
                      if (v23 >= 172800.0)
                      {
                        if (v23 >= 259200.0)
                        {
                          if (v23 >= 345600.0)
                          {
                            if (v23 >= 432000.0)
                            {
                              if (v23 >= 518400.0)
                              {
                                if (v23 >= 604800.0)
                                {
                                  if (v23 >= fabs(v10))
                                  {
                                    if (v23 >= fabs(v14))
                                    {
                                      if (v23 >= fabs(v18))
                                      {
                                        v25 = fabs(v22);
                                        if (v23 >= v25)
                                        {
                                          if (v23 >= v25 * 5.0)
                                            v24 = 22;
                                          else
                                            v24 = 21;
                                        }
                                        else
                                        {
                                          v24 = 20;
                                        }
                                      }
                                      else
                                      {
                                        v24 = 19;
                                      }
                                    }
                                    else
                                    {
                                      v24 = 18;
                                    }
                                  }
                                  else
                                  {
                                    v24 = 17;
                                  }
                                }
                                else
                                {
                                  v24 = 16;
                                }
                              }
                              else
                              {
                                v24 = 15;
                              }
                            }
                            else
                            {
                              v24 = 14;
                            }
                          }
                          else
                          {
                            v24 = 13;
                          }
                        }
                        else
                        {
                          v24 = 12;
                        }
                      }
                      else
                      {
                        v24 = 11;
                      }
                    }
                    else
                    {
                      v24 = 10;
                    }
                  }
                  else
                  {
                    v24 = 9;
                  }
                }
                else
                {
                  v24 = 8;
                }
              }
              else
              {
                v24 = 7;
              }
            }
            else
            {
              v24 = 6;
            }
          }
          else
          {
            v24 = 5;
          }
        }
        else
        {
          v24 = 4;
        }
      }
      else
      {
        v24 = 3;
      }
    }
    else
    {
      v24 = 2;
    }
  }
  else
  {
    v24 = 1;
  }

  return v24;
}

+ (id)recipientDetailsFromContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "identifier", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v14);

          }
          objc_msgSend(v12, "personId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v12, "personId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("identifierSet"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("personIdSet"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
