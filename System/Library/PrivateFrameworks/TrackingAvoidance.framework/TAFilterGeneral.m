@implementation TAFilterGeneral

+ (id)filteredInterVisitMetadata:(id)a3 inInterval:(id)a4 withLocRelevanceThreshold:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BOOL v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  TAInterVisitSummary *v80;
  TAInterVisitSummary *v81;
  void *v82;
  void *v84;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  id obj;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *context;
  id v96;
  id v97;
  void *v98;
  uint64_t v99;
  char v100;
  char v101[15];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  char v106;
  char v107[15];
  char v108;
  char v109[15];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  char v114[16];
  char v115[16];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "eventBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAllTAEventsBetween:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v97 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  v85 = v8;
  v86 = v7;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v10, "objectEnumerator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v13;
  +[TAFilterGeneral preprocessLocationAndAdvertisementWithEnumerator:addressToLocationList:addressToAdvertisementList:relevanceThreshold:](TAFilterGeneral, "preprocessLocationAndAdvertisementWithEnumerator:addressToLocationList:addressToAdvertisementList:relevanceThreshold:", v14, v11, v13, a5);

  v84 = v10;
  v15 = v10;
  v16 = v12;
  objc_msgSend(v15, "reverseObjectEnumerator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAFilterGeneral preprocessLocationAndAdvertisementWithEnumerator:addressToLocationList:addressToAdvertisementList:relevanceThreshold:](TAFilterGeneral, "preprocessLocationAndAdvertisementWithEnumerator:addressToLocationList:addressToAdvertisementList:relevanceThreshold:", v17, v12, 0, a5);

  v92 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
  v87 = v12;
  obj = v18;
  if (!v19)
    goto LABEL_38;
  v20 = v19;
  v21 = *(_QWORD *)v111;
  v22 = 0x24BDBC000uLL;
  v88 = *(_QWORD *)v111;
  do
  {
    v23 = 0;
    v89 = v20;
    do
    {
      if (*(_QWORD *)v111 != v21)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v23);
      v25 = MEMORY[0x219A13570]();
      objc_msgSend(v16, "objectForKeyedSubscript:", v24);
      v26 = objc_claimAutoreleasedReturnValue();
      context = (void *)v25;
      if (v26
        && (v27 = (void *)v26,
            objc_msgSend(v91, "objectForKeyedSubscript:", v24),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v28,
            v27,
            v28))
      {
        objc_msgSend(obj, "objectForKeyedSubscript:", v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectForKeyedSubscript:", v24);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "count");
        v98 = v30;
        if (v31 == objc_msgSend(v30, "count")
          && (v32 = v24, v33 = objc_msgSend(v29, "count"), v33 == objc_msgSend(v93, "count")))
        {
          v94 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          if (objc_msgSend(v29, "count"))
          {
            v34 = 0;
            v35 = 1;
            v36 = -1;
            v96 = v32;
            do
            {
              v37 = v36 + objc_msgSend(v98, "count");
              objc_msgSend(v29, "objectAtIndexedSubscript:", v34);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "objectAtIndexedSubscript:", v37);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v22 + 3832), "null");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38 == v40)
              {
                objc_msgSend(*(id *)(v22 + 3832), "null");
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (v39 != v56)
                {
                  v57 = v94;
                  v58 = v39;
                  goto LABEL_27;
                }
              }
              else
              {

              }
              objc_msgSend(*(id *)(v22 + 3832), "null");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39 != v41)
              {

LABEL_17:
                objc_msgSend(*(id *)(v22 + 3832), "null");
                v42 = objc_claimAutoreleasedReturnValue();
                if (v39 == (void *)v42)
                {

                }
                else
                {
                  v43 = (void *)v42;
                  objc_msgSend(*(id *)(v22 + 3832), "null");
                  v44 = v22;
                  v45 = (void *)objc_claimAutoreleasedReturnValue();

                  v72 = v38 == v45;
                  v22 = v44;
                  if (!v72)
                  {
                    objc_msgSend(v93, "objectAtIndexedSubscript:", v34);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "getDate");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "getDate");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "timeIntervalSinceDate:", v48);
                    v50 = fabs(v49);

                    objc_msgSend(v46, "getDate");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "getDate");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "timeIntervalSinceDate:", v52);
                    v54 = fabs(v53);

                    v22 = v44;
                    if (v50 <= v54)
                      v55 = v38;
                    else
                      v55 = v39;
                    objc_msgSend(v94, "addObject:", v55);

                  }
                }
                goto LABEL_29;
              }
              objc_msgSend(*(id *)(v22 + 3832), "null");
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38 == v59)
                goto LABEL_17;
              v57 = v94;
              v58 = v38;
LABEL_27:
              objc_msgSend(v57, "addObject:", v58);
LABEL_29:

              v34 = v35;
              v60 = objc_msgSend(v29, "count") > (unint64_t)v35++;
              --v36;
              v32 = v96;
            }
            while (v60);
          }
          objc_msgSend(v92, "setObject:forKey:", v94, v32);

          v16 = v87;
        }
        else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
        {
          +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.5(&v106, v107);
        }

        v21 = v88;
        v20 = v89;
      }
      else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
      {
        +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.4(&v108, v109);
      }
      objc_autoreleasePoolPop(context);
      ++v23;
    }
    while (v23 != v20);
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
  }
  while (v20);
LABEL_38:

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v97 = (id)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v61 = v91;
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v103;
    do
    {
      v65 = 0;
      v99 = v63;
      do
      {
        if (*(_QWORD *)v103 != v64)
          objc_enumerationMutation(v61);
        v66 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v65);
        objc_msgSend(v92, "objectForKeyedSubscript:", v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          objc_msgSend(v61, "objectForKeyedSubscript:", v66);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "firstObject");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v61, "objectForKeyedSubscript:", v66);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "lastObject");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69)
            v72 = v71 == 0;
          else
            v72 = 1;
          if (v72)
          {
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
              +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.3(&v100, v101);
          }
          else
          {
            v74 = v64;
            v75 = (void *)MEMORY[0x24BDD1508];
            objc_msgSend(v69, "getDate");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "getDate");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "createIntervalSafelyWithStartDate:endDate:", v76, v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v92, "objectForKey:", v66);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = -[TAInterVisitSummary initWithObservationInterval:andLocationHistory:andLastObservation:]([TAInterVisitSummary alloc], "initWithObservationInterval:andLocationHistory:andLastObservation:", v78, v79, v71);
            v81 = v80;
            if (v80)
            {
              objc_msgSend(v97, "setObject:forKey:", v80, v66);
            }
            else
            {
              v82 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
                +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.2((uint64_t)v114, v82);
            }

            v64 = v74;
            v63 = v99;
          }

        }
        else
        {
          v73 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:].cold.1((uint64_t)v115, v73);
        }
        ++v65;
      }
      while (v63 != v65);
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
    }
    while (v63);
  }

  v8 = v85;
  v7 = v86;
  v10 = v84;
LABEL_63:

  return v97;
}

+ (void)preprocessLocationAndAdvertisementWithEnumerator:(id)a3 addressToLocationList:(id)a4 addressToAdvertisementList:(id)a5 relevanceThreshold:(double)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v43 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v12 = 0;
    if (v43)
    {
      v13 = *(_QWORD *)v45;
      v14 = 0x24D814000uLL;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v16;

            v12 = v17;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v16;
            v19 = v18;
            if (v10)
            {
              objc_msgSend(v18, "address");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
              {
                v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v19, "address");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:forKey:", v22, v23);

              }
              objc_msgSend(v19, "address");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v12)
                goto LABEL_16;
              objc_msgSend(v19, "getDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "getDate");
              v42 = v12;
              v27 = v14;
              v28 = v11;
              v29 = v10;
              v30 = v13;
              v31 = v9;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "timeIntervalSinceDate:", v32);
              v34 = fabs(v33);

              v9 = v31;
              v13 = v30;
              v10 = v29;
              v11 = v28;
              v14 = v27;
              v12 = v42;

              if (v34 < a6)
              {
                objc_msgSend(v25, "addObject:", v42);
              }
              else
              {
LABEL_16:
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "addObject:", v35);

              }
            }
            if (v11)
            {
              objc_msgSend(v19, "address");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v37)
              {
                v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v19, "address");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setObject:forKey:", v38, v39);

              }
              objc_msgSend(v19, "address");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v41, "addObject:", v19);
            }

          }
        }
        v43 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v43);
    }

  }
}

+ (id)filteredInterVisitMetadataWithVisitAdjustment:(id)a3 inInterval:(id)a4 withLocRelevanceThreshold:(double)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  +[TAFilterGeneral dateIntervalAfterVisitAdjustment:intervalOfInterest:](TAFilterGeneral, "dateIntervalAfterVisitAdjustment:intervalOfInterest:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TAFilterGeneral filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadata:inInterval:withLocRelevanceThreshold:", v7, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)dateIntervalAfterVisitAdjustment:(id)a3 intervalOfInterest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;

  v5 = a4;
  objc_msgSend(a3, "visitState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLatestValidVisitDepartureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  if (v7)
  {
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", v7);

    v8 = v5;
    if (v10 == -1)
    {
      objc_msgSend(v5, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "compare:", v7);

      if (v12 == -1)
      {
        v15 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
          +[TAFilterGeneral dateIntervalAfterVisitAdjustment:intervalOfInterest:].cold.1(v15);
        objc_msgSend(MEMORY[0x24BDD1508], "createIntervalSafelyWithStartDate:endDate:", v7, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = (void *)MEMORY[0x24BDD1508];
        objc_msgSend(v5, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createIntervalSafelyWithStartDate:endDate:", v7, v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v16 = v8;

  return v16;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 andAppendOutgoingRequestsTo:(id)a4
{
  id v5;
  id v6;
  TAFilterGeneralSettings *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[TAFilterGeneralSettings initWithDefaults]([TAFilterGeneralSettings alloc], "initWithDefaults");
  +[TAFilterGeneral filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:](TAFilterGeneral, "filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)getDateIntervalOfInterestForFiltering:(id)a3 settings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "clock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visitState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getLatestValidVisitDepartureDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "eventBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "getEarliestEventDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12 = v9;
  }
  else if (v11)
  {
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v5, "durationOfConsideration");
    objc_msgSend(v13, "dateWithTimeInterval:sinceDate:", v7, -v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v12;
  objc_msgSend(MEMORY[0x24BDD1508], "createIntervalSafelyWithStartDate:endDate:", v12, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)satisfyBeepOnMoveRequirementForAddress:(id)a3 store:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _DWORD v23[2];
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "deviceRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getLatestBeepOnMoveDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToDate:", v12);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v8, "deviceRecord");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "getDeviceType:", v7);

      if (v17 == 1)
      {
        objc_msgSend(v8, "clock");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dateByAddingTimeInterval:", -(double)(unint64_t)objc_msgSend(v9, "beepOnMoveConsiderationTimeInterval"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v11, "compare:", v19) == 1;
        goto LABEL_4;
      }
      v20 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        objc_msgSend(v7, "hexString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = 68289283;
        v23[1] = 0;
        v24 = 2082;
        v25 = "";
        v26 = 2113;
        v27 = v22;
        _os_log_impl(&dword_217877000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAFilterGeneral found BOM on non-durian device\", \"address\":\"%{private}@\"}", (uint8_t *)v23, 0x1Cu);

      }
    }
  }
  v14 = 0;
LABEL_4:

  return v14;
}

+ (BOOL)satisfyNextPLOIHomeWithStore:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "visitState", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextPredictedLOIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "type") == 1)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)filterSuspiciousDeviceWithStore:(id)a3 settings:(id)a4 andAppendOutgoingRequestsTo:(id)a5
{
  TAFilterGeneralSettings *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  TAPrivateVehicleClassificationReason *v42;
  int v43;
  TAPrivateVehicleClassificationReason *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  int v61;
  _BOOL4 v62;
  _BOOL4 v63;
  _BOOL4 v64;
  int v65;
  int v66;
  objc_class *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  _BOOL4 v81;
  NSObject *v82;
  void *v83;
  TAOutgoingRequests *v84;
  void *v85;
  TAOutgoingRequests *v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  void *v90;
  TAInterVisitMetricPerDevice *v91;
  void *v92;
  void *v93;
  TAGeneralDetectionMetrics *v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  void *v98;
  TAPrivateVehicleClassificationReason *v99;
  uint64_t v100;
  TAPrivateVehicleClassificationReason *v101;
  uint64_t v102;
  TAMetricsDetection *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  TASuspiciousDevice *v111;
  int v112;
  TASuspiciousDevice *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  TASuspiciousDevice *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  void *v125;
  TASuspiciousDevice *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  TASuspiciousDevice *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  NSObject *v137;
  void *v138;
  TASuspiciousDevice *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  TASuspiciousDevice *v145;
  void *v147;
  void *v148;
  TASuspiciousDevice *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  char v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  id v158;
  _BOOL4 v159;
  void *v160;
  _BOOL4 v161;
  TAInterVisitMetricPerDevice *v162;
  uint64_t v163;
  void *v164;
  uint64_t v165;
  _BOOL4 v166;
  void *v167;
  _BOOL4 v168;
  int v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  TAMetricsDetection *v173;
  int v174;
  uint64_t v175;
  void *v176;
  int v177;
  uint64_t v178;
  TAFilterGeneralSettings *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  id v183;
  void *v184;
  id obj;
  void *v186;
  char v187;
  char v188[15];
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  char v193;
  char v194[15];
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  uint8_t buf[4];
  _BYTE v200[24];
  __int16 v201;
  int v202;
  __int16 v203;
  _BOOL4 v204;
  __int16 v205;
  _BOOL4 v206;
  __int16 v207;
  int v208;
  __int16 v209;
  int v210;
  __int16 v211;
  int v212;
  __int16 v213;
  _BOOL4 v214;
  __int16 v215;
  _BOOL4 v216;
  __int16 v217;
  _BOOL4 v218;
  __int16 v219;
  _BOOL4 v220;
  __int16 v221;
  _BOOL4 v222;
  _QWORD v223[4];
  _QWORD v224[4];
  _BYTE v225[128];
  _BYTE v226[128];
  uint64_t v227;

  v227 = *MEMORY[0x24BDAC8D0];
  v183 = a3;
  v7 = (TAFilterGeneralSettings *)a4;
  v8 = a5;
  if (!v7)
    v7 = -[TAFilterGeneralSettings initWithDefaults]([TAFilterGeneralSettings alloc], "initWithDefaults");
  v9 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v183, "clock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)v200 = v11;
    _os_log_impl(&dword_217877000, v10, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral Current Clock Time: %{private}@", buf, 0xCu);

  }
  v12 = v183;
  +[TAFilterGeneral getDateIntervalOfInterestForFiltering:settings:](TAFilterGeneral, "getDateIntervalOfInterestForFiltering:settings:", v183, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v13, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)v200 = v16;
    *(_WORD *)&v200[8] = 2113;
    *(_QWORD *)&v200[10] = v17;
    _os_log_impl(&dword_217877000, v15, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral Time Duration of Interest: Start Date - %{private}@ End Date - %{private}@", buf, 0x16u);

    v12 = v183;
  }
  -[TAFilterGeneralSettings thresholdOfLocationRelevance](v7, "thresholdOfLocationRelevance");
  +[TAFilterGeneral filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:](TAFilterGeneral, "filteredInterVisitMetadataWithVisitAdjustment:inInterval:withLocRelevanceThreshold:", v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v158 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_108;
  }
  v147 = v13;
  objc_msgSend(v12, "eventBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "getAllTAEventsOf:", objc_opt_class());
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v158 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  obj = v18;
  v165 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v226, 16);
  if (!v165)
    goto LABEL_106;
  v163 = *(_QWORD *)v196;
  v157 = v8;
  v179 = v7;
  v164 = v18;
  do
  {
    for (i = 0; i != v165; i = v58 + 1)
    {
      if (*(_QWORD *)v196 != v163)
        objc_enumerationMutation(obj);
      v181 = i;
      v21 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * i);
      v180 = MEMORY[0x219A13570]();
      v22 = (void *)TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        objc_msgSend(obj, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "deviceLocationHistory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)v200 = v21;
        *(_WORD *)&v200[8] = 2049;
        *(_QWORD *)&v200[10] = v26;
        _os_log_impl(&dword_217877000, v23, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral Location Tag Count for %{private}@: %{private}ld", buf, 0x16u);

      }
      objc_msgSend(obj, "objectForKeyedSubscript:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deviceLocationHistory");
      v28 = objc_claimAutoreleasedReturnValue();

      v186 = (void *)v28;
      +[TAFilterGeneral distOfTravelAlong:](TAFilterGeneral, "distOfTravelAlong:", v28);
      v30 = v29;
      -[TAFilterGeneralSettings thresholdOfSignificantDistance](v7, "thresholdOfSignificantDistance");
      v32 = v31;
      objc_msgSend(obj, "objectForKey:", v21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "deviceObservationInterval");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v34, "duration");
        v36 = v35;
        -[TAFilterGeneralSettings thresholdOfSignificantDuration](v7, "thresholdOfSignificantDuration");
        v38 = v37;
        objc_msgSend(v34, "startDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = v34;
        objc_msgSend(v34, "endDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[TAVehicleCategoryLogic extractPrivateVehicleHintsFromTAStore:since:to:](TAVehicleCategoryLogic, "extractPrivateVehicleHintsFromTAStore:since:to:", v183, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = -[TAPrivateVehicleClassificationReason initWithReason:]([TAPrivateVehicleClassificationReason alloc], "initWithReason:", 2);
        v43 = objc_msgSend(v41, "containsObject:", v42);

        if (-[TAFilterGeneralSettings allowNavGeoHintAsPrivateVehicleHint](v7, "allowNavGeoHintAsPrivateVehicleHint"))
        {
          v44 = -[TAPrivateVehicleClassificationReason initWithReason:]([TAPrivateVehicleClassificationReason alloc], "initWithReason:", 1);
          v43 |= objc_msgSend(v41, "containsObject:", v44);

        }
        v169 = v43;
        v191 = 0u;
        v192 = 0u;
        v189 = 0u;
        v190 = 0u;
        v45 = v41;
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v189, v225, 16);
        if (v46)
        {
          v47 = v46;
          v48 = *(_QWORD *)v190;
          do
          {
            for (j = 0; j != v47; ++j)
            {
              if (*(_QWORD *)v190 != v48)
                objc_enumerationMutation(v45);
              v50 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
              {
                v51 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * j);
                v52 = v50;
                objc_msgSend(v21, "hexString");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                TAPrivateVehicleClassificationReasonEnumToString(objc_msgSend(v51, "reason"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478083;
                *(_QWORD *)v200 = v53;
                *(_WORD *)&v200[8] = 2113;
                *(_QWORD *)&v200[10] = v54;
                _os_log_impl(&dword_217877000, v52, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral private vehicle reason for %{private}@ : %{private}@", buf, 0x16u);

              }
            }
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v189, v225, 16);
          }
          while (v47);
        }

        +[TAFilterGeneral filteredPeopleDensityResults:within:](TAFilterGeneral, "filteredPeopleDensityResults:within:", v152, v182);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = v55;
        if (objc_msgSend(v55, "count"))
        {
          objc_msgSend(v55, "lastObject");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "peopleDensityState") == 0;

        }
        else
        {
          v57 = 0;
        }
        v60 = +[TADominantUserActivity getDominantUserActivityInfoInDateInterval:store:](TADominantUserActivity, "getDominantUserActivityInfoInDateInterval:store:", v182, v183);
        v161 = v57;
        if (v60 == 3)
          v61 = v169 | v57;
        else
          v61 = 0;
        v62 = +[TAFilterGeneral locationSegmentsUnderPedestrianMaxSpeed:withFilterSettings:](TAFilterGeneral, "locationSegmentsUnderPedestrianMaxSpeed:withFilterSettings:", v186, v179);
        v159 = v62;
        v63 = v60 == 2 && v62;
        v166 = +[TAFilterGeneral satisfyBeepOnMoveRequirementForAddress:store:settings:](TAFilterGeneral, "satisfyBeepOnMoveRequirementForAddress:store:settings:", v21, v183, v179);
        v168 = +[TAFilterGeneral satisfyNextPLOIHomeWithStore:](TAFilterGeneral, "satisfyNextPLOIHomeWithStore:", v183);
        v64 = v30 > v32;
        if (v36 <= v38)
          v64 = 0;
        v172 = v60;
        v177 = v61;
        v174 = v63;
        v65 = v60 == 4 || v63;
        v153 = v65;
        if (!v64 | v61)
          v66 = v64;
        else
          v66 = v65;
        v223[0] = CFSTR("DetectionAlgorithm");
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v224[0] = v68;
        v223[1] = CFSTR("LengthTraveled");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v30);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v224[1] = v69;
        v223[2] = CFSTR("Duration");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v224[2] = v70;
        v223[3] = CFSTR("ObservationCount");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v186, "count"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v224[3] = v71;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v224, v223, 4);
        v184 = (void *)objc_claimAutoreleasedReturnValue();

        v72 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v73 = v72;
          objc_msgSend(v21, "hexString");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68292099;
          *(_DWORD *)v200 = 0;
          *(_WORD *)&v200[4] = 2082;
          *(_QWORD *)&v200[6] = "";
          *(_WORD *)&v200[14] = 2113;
          *(_QWORD *)&v200[16] = v74;
          v201 = 1026;
          v202 = v66;
          v203 = 1026;
          v204 = v30 > v32;
          v205 = 1026;
          v206 = v36 > v38;
          v207 = 1026;
          v208 = v177;
          v209 = 1026;
          v210 = v169;
          v211 = 1026;
          v212 = v174;
          v213 = 1026;
          v214 = v159;
          v215 = 1026;
          v216 = v161;
          v217 = 1026;
          v218 = v172 == 4;
          v219 = 1026;
          v220 = v166;
          v221 = 1026;
          v222 = v168;
          _os_log_impl(&dword_217877000, v73, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral decisions\", \"address\":\"%{private}@\", \"satisfy\":%{public}hhd, \"satisfy-length\":%{public}hhd, \"satisfy-duration\":%{public}hhd, \"satisfy-vehicular-requirement\":%{public}hhd, \"satisfy-private-automotive\":%{public}hhd, \"satisfy-pedestrian-requirement\":%{public}hhd, \"satisfy-pedestrian-speed-check\":%{public}hhd, \"satisfy-people-density\":%{public}hhd, \"satisfy-cycling-requirement\":%{public}hhd, \"satisfy-beepOnMove\":%{public}hhd, \"satisfy-ploi\":%{public}hhd}", buf, 0x5Eu);

        }
        if (v66)
        {
          v75 = (void *)TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
          {
            v76 = v75;
            objc_msgSend(v21, "hexString");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)v200 = v77;
            _os_log_impl(&dword_217877000, v76, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral adding %{private}@ because requirements satisfied", buf, 0xCu);

          }
          if (v177)
          {
            v154 = -[TAFilterGeneralSettings vehicularImmediacyType](v179, "vehicularImmediacyType");
            v170 = 7;
          }
          else
          {
            v87 = 8;
            if (!v174)
              v87 = 9;
            if ((v153 & 1) == 0)
            {
              v88 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
              {
                v89 = v88;
                objc_msgSend(v21, "hexString");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289283;
                *(_DWORD *)v200 = 0;
                *(_WORD *)&v200[4] = 2082;
                *(_QWORD *)&v200[6] = "";
                *(_WORD *)&v200[14] = 2113;
                *(_QWORD *)&v200[16] = v90;
                _os_log_impl(&dword_217877000, v89, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#TAFilterGeneral missing proper detection type classification\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

              }
              v87 = 1;
            }
            v170 = v87;
            v154 = 1;
          }
          v91 = objc_alloc_init(TAInterVisitMetricPerDevice);
          -[TAInterVisitMetricPerDevice accumulateDistance:](v91, "accumulateDistance:", v30);
          -[TAInterVisitMetricPerDevice accumulateDuration:](v91, "accumulateDuration:", v36);
          -[TAInterVisitMetricPerDevice accumulateNumOfAssociatedLocs:](v91, "accumulateNumOfAssociatedLocs:", objc_msgSend(v186, "count"));
          -[TAInterVisitMetricPerDevice accumulateSampledObservedLocations:](v91, "accumulateSampledObservedLocations:", v186);
          objc_msgSend(obj, "objectForKeyedSubscript:", v21);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "latestObservation");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v162 = v91;
          -[TAInterVisitMetricPerDevice accumulateLatestAdvertisement:](v91, "accumulateLatestAdvertisement:", v93);

          v94 = [TAGeneralDetectionMetrics alloc];
          v95 = objc_msgSend(v176, "count");
          if (v95)
          {
            objc_msgSend(v176, "lastObject");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend(v148, "peopleDensityState");
          }
          else
          {
            v96 = -1;
          }
          v99 = -[TAPrivateVehicleClassificationReason initWithReason:]([TAPrivateVehicleClassificationReason alloc], "initWithReason:", 1);
          v100 = objc_msgSend(v45, "containsObject:", v99);
          v101 = -[TAPrivateVehicleClassificationReason initWithReason:]([TAPrivateVehicleClassificationReason alloc], "initWithReason:", 2);
          v102 = -[TAGeneralDetectionMetrics initWithInterVisitMetrics:dominantUserActivity:pdState:geoNavHint:vehicularStateHint:](v94, "initWithInterVisitMetrics:dominantUserActivity:pdState:geoNavHint:vehicularStateHint:", v162, v172, v96, v100, objc_msgSend(v45, "containsObject:", v101));

          if (v95)
          v103 = [TAMetricsDetection alloc];
          objc_msgSend(obj, "objectForKey:", v21);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "latestObservation");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = (void *)v102;
          v173 = -[TAMetricsDetection initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:](v103, "initWithDetectionType:visitDetectionMetrics:generalDetectionMetrics:singleVisitDetectionMetrics:latestAdvertisement:", v170, 0, v102, 0, v105);

          v149 = [TASuspiciousDevice alloc];
          objc_msgSend(obj, "objectForKey:", v21);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "latestObservation");
          v106 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "clock");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "deviceRecord");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "getAccessoryInfo:", v21);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = (void *)v106;
          v111 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v149, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v106, v184, v107, v186, v173, v170, v154, v109, 0);
          objc_msgSend(v158, "addObject:", v111);

          v112 = v174;
          if (v177)
          {
            v113 = [TASuspiciousDevice alloc];
            objc_msgSend(obj, "objectForKey:", v21);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "latestObservation");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "clock");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "deviceRecord");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "getAccessoryInfo:", v21);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v113, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v114, v184, v115, v186, v173, v170, 3, v117, 0);
            objc_msgSend(v158, "addObject:", v118);

            v112 = 1;
          }
          if ((v166 & v112) == 1)
          {
            v119 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              v120 = v119;
              objc_msgSend(v21, "hexString");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68289283;
              *(_DWORD *)v200 = 0;
              *(_WORD *)&v200[4] = 2082;
              *(_QWORD *)&v200[6] = "";
              *(_WORD *)&v200[14] = 2113;
              *(_QWORD *)&v200[16] = v121;
              _os_log_impl(&dword_217877000, v120, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral detected beepOnMove\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

            }
            v171 = v112;
            if (v177)
            {
              v151 = -[TAFilterGeneralSettings beepOnMoveVehicularImmediacyType](v179, "beepOnMoveVehicularImmediacyType");
              v122 = 12;
              goto LABEL_82;
            }
            if (v174)
            {
              v151 = -[TAFilterGeneralSettings beepOnMovePedestrianImmediacyType](v179, "beepOnMovePedestrianImmediacyType");
              v122 = 13;
LABEL_82:
              v156 = v122;
            }
            else
            {
              v123 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
              {
                v124 = v123;
                objc_msgSend(v21, "hexString");
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289283;
                *(_DWORD *)v200 = 0;
                *(_WORD *)&v200[4] = 2082;
                *(_QWORD *)&v200[6] = "";
                *(_WORD *)&v200[14] = 2113;
                *(_QWORD *)&v200[16] = v125;
                _os_log_impl(&dword_217877000, v124, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral unhandled beepOnMove case\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

              }
              v156 = 1;
              v151 = 3;
            }
            v126 = [TASuspiciousDevice alloc];
            objc_msgSend(obj, "objectForKey:", v21);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v167, "latestObservation");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "clock");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "deviceRecord");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "getAccessoryInfo:", v21);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v126, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v127, v184, v128, v186, v173, v156, v151, v130, 0);
            objc_msgSend(v158, "addObject:", v131);

            v112 = v171;
          }
          v34 = v182;
          v78 = v176;
          if ((v168 & v112) == 1)
          {
            v132 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              v133 = v132;
              objc_msgSend(v21, "hexString");
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68289283;
              *(_DWORD *)v200 = 0;
              *(_WORD *)&v200[4] = 2082;
              *(_QWORD *)&v200[6] = "";
              *(_WORD *)&v200[14] = 2113;
              *(_QWORD *)&v200[16] = v134;
              _os_log_impl(&dword_217877000, v133, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral detected PLOI home\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

            }
            if (v177)
            {
              v175 = -[TAFilterGeneralSettings nextPLOIVehicularImmediacyType](v179, "nextPLOIVehicularImmediacyType");
              v135 = 14;
              goto LABEL_96;
            }
            if (v174)
            {
              v175 = -[TAFilterGeneralSettings nextPLOIPedestrianImmediacyType](v179, "nextPLOIPedestrianImmediacyType");
              v135 = 15;
LABEL_96:
              v178 = v135;
            }
            else
            {
              v136 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
              {
                v137 = v136;
                objc_msgSend(v21, "hexString");
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 68289283;
                *(_DWORD *)v200 = 0;
                *(_WORD *)&v200[4] = 2082;
                *(_QWORD *)&v200[6] = "";
                *(_WORD *)&v200[14] = 2113;
                *(_QWORD *)&v200[16] = v138;
                _os_log_impl(&dword_217877000, v137, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral unhandled PLOI case\", \"address\":\"%{private}@\"}", buf, 0x1Cu);

              }
              v178 = 1;
              v175 = 3;
            }
            v139 = [TASuspiciousDevice alloc];
            objc_msgSend(obj, "objectForKey:", v21);
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "latestObservation");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "clock");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v183, "deviceRecord");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "getAccessoryInfo:", v21);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            v145 = -[TASuspiciousDevice initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:](v139, "initWithLatestAdv:detectionSummary:date:locHistory:detectionMetrics:detectionType:immediacyType:accessoryInfo:forceSurfaceReason:", v141, v184, v142, v186, v173, v178, v175, v144, 0);
            objc_msgSend(v158, "addObject:", v145);

            v34 = v182;
            v78 = v176;
          }

LABEL_102:
          v18 = v164;
          v59 = (void *)v180;
          v58 = v181;
        }
        else
        {
          v78 = v176;
          v79 = +[TAFilterGeneral shouldIssuePeopleDensityScan:distTravel:durationOfTravel:settings:resultsInBuffer:](TAFilterGeneral, "shouldIssuePeopleDensityScan:distTravel:durationOfTravel:settings:resultsInBuffer:", v172, v179, v176, v30, v36);
          v80 = (void *)TAStatusLog;
          v81 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT);
          v34 = v182;
          if (!v79)
          {
            if (v81)
            {
              v97 = v80;
              objc_msgSend(v21, "hexString");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138477827;
              *(_QWORD *)v200 = v98;
              _os_log_impl(&dword_217877000, v97, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral not adding %{private}@ because requirements not satisfied", buf, 0xCu);

            }
            goto LABEL_102;
          }
          if (v81)
          {
            v82 = v80;
            objc_msgSend(v21, "hexString");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            *(_QWORD *)v200 = v83;
            _os_log_impl(&dword_217877000, v82, OS_LOG_TYPE_DEFAULT, "#TAFilterGeneral identified suspicious device %{private}@; issue people density scans to gather more information",
              buf,
              0xCu);

          }
          if (v157)
          {
            v84 = [TAOutgoingRequests alloc];
            objc_msgSend(v147, "endDate");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = -[TAOutgoingRequests initWithRequestKey:additionalInformation:date:](v84, "initWithRequestKey:additionalInformation:date:", CFSTR("RequestingPeopleDensity"), v184, v85);
            objc_msgSend(v157, "addObject:", v86);

            goto LABEL_102;
          }
          v18 = v164;
          v59 = (void *)v180;
          v58 = v181;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
            +[TAFilterGeneral filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:].cold.2(&v187, v188);
        }

        v8 = v157;
        v7 = v179;
        goto LABEL_104;
      }
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
        +[TAFilterGeneral filterSuspiciousDeviceWithStore:settings:andAppendOutgoingRequestsTo:].cold.1(&v193, v194);
      v18 = v164;
      v59 = (void *)v180;
      v58 = v181;
LABEL_104:

      objc_autoreleasePoolPop(v59);
    }
    v165 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v226, 16);
  }
  while (v165);
LABEL_106:

  v13 = v147;
LABEL_108:

  return v158;
}

+ (BOOL)locationA:(id)a3 isSignificantlyDifferentFromLocationB:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  NSObject *v13;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "horizontalAccuracy");
  v8 = v7;
  objc_msgSend(v6, "horizontalAccuracy");
  if (v8 < 0.0 || (v10 = v9, v8 > 70.0) || v9 < 0.0 || v9 > 70.0)
  {
    v13 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT))
    {
      v15[0] = 68289026;
      v15[1] = 0;
      v16 = 2082;
      v17 = "";
      _os_log_impl(&dword_217877000, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TAFilterGeneral checking if locations are different with invalid uncertainty\"}", (uint8_t *)v15, 0x12u);
    }
    v12 = 1;
  }
  else
  {
    objc_msgSend(v5, "distanceFromLocation:", v6);
    v12 = v11 * v11 > v10 * v10 + v8 * v8;
  }

  return v12;
}

+ (double)distOfTravelAlong:(id)a3
{
  id v3;
  double v4;
  int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;

  v3 = a3;
  v4 = 0.0;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2 && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[TAFilterGeneral locationA:isSignificantlyDifferentFromLocationB:](TAFilterGeneral, "locationA:isSignificantlyDifferentFromLocationB:", v7, v8);

      if (v9)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "distanceFromLocation:", v11);
        v4 = v4 + v12;

        v5 = v6;
      }
      ++v6;
    }
    while (objc_msgSend(v3, "count") > v6);
  }

  return v4;
}

+ (BOOL)locationSegments:(id)a3 underMaxSpeed:(double)a4
{
  id v5;
  void *v6;
  BOOL v7;
  __int128 v8;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  __int128 v20;
  char v21;
  char v22[15];
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a4 >= 0.0)
  {
    if (v5 && (unint64_t)objc_msgSend(v5, "count") >= 2 && (unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v10 = 1;
      *(_QWORD *)&v8 = 134218496;
      v20 = v8;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10 - 1, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[TALocationLite estimateSpeedFrom:to:](TALocationLite, "estimateSpeedFrom:to:", v11, v12);
        v15 = v13;
        v17 = v16;
        v18 = v14;
        if (v13 < 0.0 || v14 < 0.0)
        {
          v19 = TAStatusLog;
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v24 = v15;
            v25 = 2048;
            v26 = v18;
            v27 = 2048;
            v28 = v17;
            _os_log_error_impl(&dword_217877000, v19, OS_LOG_TYPE_ERROR, "#TAFilterGeneral error calculating segment speed min=%f avg=%f max=%f", buf, 0x20u);
          }
        }
        else if (v13 <= 0.0)
        {
          if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            +[TAFilterGeneral locationSegments:underMaxSpeed:].cold.1(&v21, v22);
        }
        else if (v14 > a4)
        {

          goto LABEL_2;
        }

        ++v10;
      }
      while (objc_msgSend(v6, "count") > v10);
    }
    v7 = 1;
  }
  else
  {
LABEL_2:
    v7 = 0;
  }

  return v7;
}

+ (BOOL)locationSegmentsUnderPedestrianMaxSpeed:(id)a3 withFilterSettings:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(a4, "capOfReasonableWalkingSpeed");
  LOBYTE(a4) = +[TAFilterGeneral locationSegments:underMaxSpeed:](TAFilterGeneral, "locationSegments:underMaxSpeed:", v5);

  return (char)a4;
}

+ (id)filteredPeopleDensityResults:(id)a3 within:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = (void *)MEMORY[0x24BDD1758];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__TAFilterGeneral_filteredPeopleDensityResults_within___block_invoke;
    v12[3] = &unk_24D815038;
    v13 = v6;
    objc_msgSend(v8, "predicateWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __55__TAFilterGeneral_filteredPeopleDensityResults_within___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "observationInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "intersectsDateInterval:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldIssuePeopleDensityScan:(unint64_t)a3 distTravel:(double)a4 durationOfTravel:(double)a5 settings:(id)a6 resultsInBuffer:(id)a7
{
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;

  v11 = a7;
  v12 = a6;
  objc_msgSend(v12, "thresholdOfSignificantDistance");
  v14 = v13;
  objc_msgSend(v12, "thresholdOfSignificantDuration");
  v16 = v15;

  v17 = 0;
  if (a3 == 3 && v14 < a4 && v16 < a5)
    v17 = objc_msgSend(v11, "count") == 0;

  return v17;
}

+ (void)filterSuspiciousDeviceWithStore:(_BYTE *)a1 settings:(_BYTE *)a2 andAppendOutgoingRequestsTo:.cold.1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_217877000, v2, v3, "address does not exist in observation interval dictionary", v4);
}

+ (void)filterSuspiciousDeviceWithStore:(_BYTE *)a1 settings:(_BYTE *)a2 andAppendOutgoingRequestsTo:.cold.2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_217877000, v2, v3, "#TAFilterGeneral filterSuspiciousDeviceWithStore called with nil requests parameter", v4);
}

+ (void)dateIntervalAfterVisitAdjustment:(os_log_t)log intervalOfInterest:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217877000, log, OS_LOG_TYPE_ERROR, "#TAFilterGeneral got visit departure date after clock", v1, 2u);
}

+ (void)filteredInterVisitMetadata:(uint64_t)a1 inInterval:(void *)a2 withLocRelevanceThreshold:.cold.1(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  uint8_t *v4;
  NSObject *v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v2 = v6;
  _os_log_fault_impl(&dword_217877000, v5, OS_LOG_TYPE_FAULT, "#TAFilterGeneral no location list for address %@", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

+ (void)filteredInterVisitMetadata:(uint64_t)a1 inInterval:(void *)a2 withLocRelevanceThreshold:.cold.2(uint64_t a1, void *a2)
{
  _QWORD *v2;
  void *v3;
  uint8_t *v4;
  NSObject *v5;
  void *v6;

  v5 = OUTLINED_FUNCTION_1(a1, a2);
  objc_msgSend(v3, "hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v2 = v6;
  _os_log_error_impl(&dword_217877000, v5, OS_LOG_TYPE_ERROR, "#TAFilterGeneral attempted to create empty summary for address %@", v4, 0xCu);

  OUTLINED_FUNCTION_2();
}

+ (void)filteredInterVisitMetadata:(_BYTE *)a1 inInterval:(_BYTE *)a2 withLocRelevanceThreshold:.cold.3(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_217877000, v2, v3, "#TAFilterGeneral no first or last advertisement", v4);
}

+ (void)filteredInterVisitMetadata:(_BYTE *)a1 inInterval:(_BYTE *)a2 withLocRelevanceThreshold:.cold.4(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_217877000, v2, v3, "#TAFilterGeneral no corresponding backward entry or advertisement entry", v4);
}

+ (void)filteredInterVisitMetadata:(_BYTE *)a1 inInterval:(_BYTE *)a2 withLocRelevanceThreshold:.cold.5(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_217877000, v2, v3, "#TAFilterGeneral forward backward location count or advertisement count not equal!", v4);
}

+ (void)locationSegments:(_BYTE *)a1 underMaxSpeed:(_BYTE *)a2 .cold.1(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1_1(a1, a2);
  _os_log_debug_impl(&dword_217877000, v2, OS_LOG_TYPE_DEBUG, "#TAFilterGeneral segment min speed not valid, skipping...", v3, 2u);
}

@end
