@implementation PLOperator

+ (id)entryKeyForType:(id)a3 andName:(id)a4
{
  return (id)objc_msgSend(a1, "entryKeyForType:andName:isDynamic:", a3, a4, 0);
}

void __23__PLOperator_logEntry___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEntries:", v2);

}

- (void)postEntries:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  PLOperator *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[PLOperator workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __26__PLOperator_postEntries___block_invoke;
    v7[3] = &unk_1E6A521A0;
    v8 = v5;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)+[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
}

+ (id)storageQueueName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (storageQueueName_onceToken != -1)
    dispatch_once(&storageQueueName_onceToken, &__block_literal_global_12);
  v3 = (id)storageQueueName__storageQueueNames;
  objc_sync_enter(v3);
  objc_msgSend((id)storageQueueName__storageQueueNames, "objectForKeyedSubscript:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)storageQueueName__storageQueueNames, "setObject:forKeyedSubscript:", v5, objc_opt_class());

  }
  objc_msgSend((id)storageQueueName__storageQueueNames, "objectForKeyedSubscript:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v6;
}

void __37__PLOperator_logEntries_withGroupID___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEntries:", v2);

}

- (BOOL)postFilteredNotificationForEntry:(id)a3 withFilteredDefition:(id)a4 withNotificationName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  char isKindOfClass;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  _BOOL4 v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  id v123;
  id v124;
  PLOperator *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  NSObject *obj;
  uint64_t v132;
  void *v133;
  _QWORD v134[5];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _QWORD block[4];
  __CFString *v144;
  uint64_t v145;
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v12;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
    {
      v125 = self;
      -[PLOperator filterDeltaLastEntryIDs](self, "filterDeltaLastEntryIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        -[PLOperator filterDeltaLastEntryIDs](v125, "filterDeltaLastEntryIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, v10);

      }
      v126 = v11;
      v141 = 0u;
      v142 = 0u;
      v139 = 0u;
      v140 = 0u;
      obj = v9;
      v129 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v139, v147, 16);
      v130 = v17;
      v19 = 0;
      if (!v129)
      {
        v20 = 1;
        goto LABEL_71;
      }
      v128 = *(_QWORD *)v140;
      v20 = 1;
      while (1)
      {
        v21 = 0;
LABEL_8:
        if (*(_QWORD *)v140 != v128)
          objc_enumerationMutation(obj);
        v132 = v21;
        v22 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * v21);
        -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v23, "mutableCopy");

        v133 = v24;
        objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEDE0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          if (!v17)
            goto LABEL_69;
          objc_msgSend(v17, "entryDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "entryDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timeIntervalSinceDate:", v27);
          v29 = fabs(v28);
          objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEDE0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31;

          v17 = v130;
          if (v29 <= v32)
          {
LABEL_69:

            LOBYTE(v102) = 0;
            goto LABEL_80;
          }
        }
        if ((v19 & 1) != 0)
          goto LABEL_14;
        objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEDF8);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          if (!v17)
            goto LABEL_69;
          objc_msgSend(v17, "entryDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "entryDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "timeIntervalSinceDate:", v35);
          v37 = fabs(v36);
          objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEDF8);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValue");
          v40 = v39;

          if (v37 >= v40)
            goto LABEL_26;
          v20 = 0;
          v17 = v130;
        }
        objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEE10);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          if (!v17)
            goto LABEL_69;
          objc_msgSend(v17, "objectForKeyedSubscript:", v22);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "doubleValue");
          v44 = v43;
          objc_msgSend(v8, "objectForKeyedSubscript:", v22);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "doubleValue");
          v47 = vabdd_f64(v44, v46);
          objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEE10);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "doubleValue");
          v50 = v49;

          if (v47 >= v50)
          {
LABEL_26:
            v19 = 1;
            goto LABEL_27;
          }
          v20 = 0;
          v17 = v130;
        }
        objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1E6ABEE28);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          if (v17)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", v22);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKeyedSubscript:", v22);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v52, "isEqual:", v53) ^ 1;

            v20 &= v19;
            goto LABEL_28;
          }
LABEL_14:
          v19 = 1;
          goto LABEL_28;
        }
        if ((v20 & 1) == 0)
        {
          v20 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        v123 = v10;
        v124 = v9;
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v54 = v24;
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
        if (!v55)
        {
          v20 = 1;
          goto LABEL_59;
        }
        v56 = v55;
        v57 = *(_QWORD *)v136;
        v20 = 1;
LABEL_33:
        v58 = 0;
        while (2)
        {
          if (*(_QWORD *)v136 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * v58);
          switch(objc_msgSend(v59, "shortValue"))
          {
            case 1u:
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "doubleValue");
              v62 = v61;
              objc_msgSend(v54, "objectForKeyedSubscript:", v59);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "doubleValue");
              v65 = v64;

              if (v62 <= v65)
                goto LABEL_50;
              goto LABEL_54;
            case 2u:
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "doubleValue");
              v68 = v67;
              objc_msgSend(v54, "objectForKeyedSubscript:", v59);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "doubleValue");
              v71 = v70;

              if (v68 < v71)
                goto LABEL_50;
              goto LABEL_54;
            case 3u:
              objc_msgSend(v54, "objectForKeyedSubscript:", v59);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v8, "objectForKeyedSubscript:", v22);
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "doubleValue");
                  v77 = v76;
                  objc_msgSend(v72, "doubleValue");
                  v79 = v78;

                  if (v77 != v79)
                    v20 = 0;
                  goto LABEL_53;
                }
              }
              else
              {

              }
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = objc_msgSend(v98, "plCompare:", v72) == 0;

              v20 &= v99;
LABEL_53:

LABEL_54:
              if (v56 != ++v58)
                continue;
              v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
              if (v56)
                goto LABEL_33;
LABEL_59:

              v19 = 0;
              v10 = v123;
              v9 = v124;
LABEL_27:
              v17 = v130;
LABEL_28:

              v21 = v132 + 1;
              if (v132 + 1 != v129)
                goto LABEL_8;
              v100 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v139, v147, 16);
              v129 = v100;
              if (!v100)
              {
LABEL_71:

                if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
                {
                  v109 = objc_opt_class();
                  v134[0] = MEMORY[0x1E0C809B0];
                  v134[1] = 3221225472;
                  v134[2] = __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke_102;
                  v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v134[4] = v109;
                  if (postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce_100 != -1)
                    dispatch_once(&postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce_100, v134);
                  if (postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled_101)
                  {
                    v110 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(v8, "entryKey");
                    v111 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromBOOL();
                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromBOOL();
                    v113 = objc_claimAutoreleasedReturnValue();
                    v114 = v10;
                    v115 = (void *)v113;
                    v116 = v114;
                    objc_msgSend(v110, "stringWithFormat:", CFSTR("entryKey=%@ notificationName=%@ shouldPost=%@ Post=%@"), v111, v114, v112, v113);
                    v117 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v118, "lastPathComponent");
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator postFilteredNotificationForEntry:withFilteredDefition:withNotificationName:]");
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v117, v119, v120, 693);

                    PLLogCommon();
                    v121 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
                      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

                    v10 = v116;
                    v17 = v130;
                  }
                }
                if (((v20 | v19) & 1) != 0)
                {
                  -[PLOperator filterDeltaLastEntryIDs](v125, "filterDeltaLastEntryIDs");
                  obj = objc_claimAutoreleasedReturnValue();
                  -[NSObject setObject:forKeyedSubscript:](obj, "setObject:forKeyedSubscript:", v8, v10);
                  LOBYTE(v102) = 1;
LABEL_80:
                  v11 = v126;
LABEL_81:

                }
                else
                {
                  LOBYTE(v102) = 0;
                  v11 = v126;
                }

                goto LABEL_83;
              }
              break;
            case 4u:
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "doubleValue");
              v82 = v81;
              objc_msgSend(v54, "objectForKeyedSubscript:", v59);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "doubleValue");
              v85 = v84;

              if (v82 >= v85)
                goto LABEL_50;
              goto LABEL_54;
            case 5u:
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "doubleValue");
              v88 = v87;
              objc_msgSend(v54, "objectForKeyedSubscript:", v59);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "doubleValue");
              v91 = v90;

              if (v88 > v91)
                goto LABEL_50;
              goto LABEL_54;
            case 6u:
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "doubleValue");
              v94 = v93;
              objc_msgSend(v54, "objectForKeyedSubscript:", v59);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "doubleValue");
              v97 = v96;

              if (v94 == v97)
LABEL_50:
                v20 = 0;
              goto LABEL_54;
            default:
              goto LABEL_54;
          }
          break;
        }
      }
    }
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v101 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v144 = CFSTR("FilteredNotifications");
    v145 = v101;
    if (postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce != -1)
      dispatch_once(&postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__defaultOnce, block);
    v102 = postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled;

    if (v102)
    {
      v103 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "entryKey");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "stringWithFormat:", CFSTR("EntryKey %@ does not match key %@"), v104, v10);
      v105 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "lastPathComponent");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator postFilteredNotificationForEntry:withFilteredDefition:withNotificationName:]");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v105, v107, v108, 579);

      PLLogCommon();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      {
        v17 = (void *)v105;
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        LOBYTE(v102) = 0;
      }
      else
      {
        LOBYTE(v102) = 0;
        v17 = (void *)v105;
      }
      goto LABEL_81;
    }
  }
  else
  {
    LOBYTE(v102) = 0;
  }
LABEL_83:

  objc_autoreleasePoolPop(v11);
  return v102;
}

- (NSMutableDictionary)filterDeltaLastEntryIDs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)logProportionateAggregateEntry:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v8)
      goto LABEL_14;
  }
  else
  {
    -[PLOperator storage](self, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "storageReady");

    if (!v8 || (v12 & 1) == 0)
      goto LABEL_14;
  }
  objc_msgSend(v8, "entryKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[PLUtilities shouldLogForEntryKey:](PLUtilities, "shouldLogForEntryKey:", v13);

  if (v14)
  {
    if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("logEntry")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logProportionateAggregateEntry:withStartDate:withEndDate:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v17, v18, 350);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    objc_msgSend(v8, "entryDefinition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[PLEntryDefinition isAggregateForEntryDefinition:](PLEntryDefinition, "isAggregateForEntryDefinition:", v20);

    if (v21)
    {
      v22 = self->_lastLogDateForEntryKey;
      objc_sync_enter(v22);
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator lastLogDateForEntryKey](self, "lastLogDateForEntryKey");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entryKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

      objc_sync_exit(v22);
      if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
      {
        -[PLOperator storage](self, "storage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "writeProportionateAggregateEntry:withStartDate:withEndDate:", v8, v9, v10);

      }
    }
  }
LABEL_14:

}

- (double)timeIntervalSinceLastLogForEntryKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  v5 = self->_lastLogDateForEntryKey;
  objc_sync_enter(v5);
  -[PLOperator lastLogDateForEntryKey](self, "lastLogDateForEntryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLOperator lastLogDateForEntryKey](self, "lastLogDateForEntryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceMonitonicNow");
    v11 = -v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator lastLogDateForEntryKey](self, "lastLogDateForEntryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v4);
    v11 = INFINITY;
  }

  objc_sync_exit(v5);
  return v11;
}

+ (id)entryKeyForType:(id)a3 andName:(id)a4 isDynamic:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryKey entryKeyForOperatorName:withType:withName:isDynamic:](PLEntryKey, "entryKeyForOperatorName:withType:withName:isDynamic:", v10, v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)className
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  if (className_onceToken != -1)
    dispatch_once(&className_onceToken, &__block_literal_global_51);
  dispatch_semaphore_wait((dispatch_semaphore_t)className__classNamesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)className__classNames, "objectForKeyedSubscript:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)className__classNames, "setObject:forKeyedSubscript:", v4, objc_opt_class());

  }
  objc_msgSend((id)className__classNames, "objectForKeyedSubscript:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal((dispatch_semaphore_t)className__classNamesSemaphore);
  return v5;
}

- (void)logEntry:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
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
  void *v64;
  unsigned int v65;
  unint64_t v66;
  void *v67;
  BOOL v68;
  char isKindOfClass;
  char v70;
  void *v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v4)
      goto LABEL_38;
  }
  else
  {
    -[PLOperator storage](self, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "storageReady");

    if (!v4 || (v6 & 1) == 0)
      goto LABEL_38;
  }
  objc_msgSend(v4, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLUtilities shouldLogForEntryKey:](PLUtilities, "shouldLogForEntryKey:", v7);

  if (!v8)
    goto LABEL_38;
  v9 = -[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("logEntry"));
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logEntry:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 372);

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  objc_msgSend(v4, "entryDefinition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[PLEntryDefinition isAggregateForEntryDefinition:](PLEntryDefinition, "isAggregateForEntryDefinition:", v15);

  if (v16)
  {
    v17 = self->_lastLogDateForEntryKey;
    objc_sync_enter(v17);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator lastLogDateForEntryKey](self, "lastLogDateForEntryKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

    objc_sync_exit(v17);
    if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    {
      -[PLOperator storage](self, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "writeAggregateEntry:", v4);

    }
    goto LABEL_38;
  }
  if (!-[PLOperator shouldWriteEntry:withDebug:](self, "shouldWriteEntry:withDebug:", v4, v9))
    goto LABEL_38;
  v22 = self->_lastLogDateForEntryKey;
  objc_sync_enter(v22);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator lastLogDateForEntryKey](self, "lastLogDateForEntryKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

  objc_sync_exit(v22);
  objc_msgSend(v4, "entryKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("BufferEntries"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = objc_msgSend(v29, "BOOLValue");

  if ((_DWORD)v25)
  {
    objc_msgSend(v4, "entryKey");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v71);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("Configs"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v4, "entryKey");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Configs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("BufferFlushInterval"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v4, "entryKey");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Configs"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("BufferFlushInterval"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "unsignedIntValue");

        v42 = v41;
        goto LABEL_24;
      }
    }
    else
    {

    }
    v42 = 10;
LABEL_24:
    -[PLOperator enableBufferFlushTimer:](self, "enableBufferFlushTimer:", v42);
    -[PLOperator bufferedEntries](self, "bufferedEntries");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObject:", v4);

    if (v9)
    {
      v46 = (void *)MEMORY[0x1E0CB3940];
      -[PLOperator bufferedEntries](self, "bufferedEntries");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("Added entry onto queue, queue size: %lu"), objc_msgSend(v47, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "lastPathComponent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logEntry:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v50, v51, 400);

      PLLogCommon();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    objc_msgSend(v4, "entryKey");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("Configs"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v4, "entryKey");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Configs"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("BufferSize"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v70 = objc_opt_isKindOfClass();

      if ((v70 & 1) != 0)
      {
        objc_msgSend(v4, "entryKey");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("Configs"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("BufferSize"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "unsignedIntValue");

        v66 = v65;
        goto LABEL_33;
      }
    }
    else
    {

    }
    v66 = 10;
LABEL_33:
    -[PLOperator bufferedEntries](self, "bufferedEntries");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "count") < v66;

    if (!v68)
      -[PLOperator flushBuffer](self, "flushBuffer");
    goto LABEL_35;
  }
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v74[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator postEntries:](self, "postEntries:", v43);

  }
  else
  {
    -[PLOperator storage](self, "storage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __23__PLOperator_logEntry___block_invoke;
    v72[3] = &unk_1E6A521A0;
    v72[4] = self;
    v73 = v4;
    objc_msgSend(v44, "writeEntry:withCompletionBlock:", v73, v72);

  }
LABEL_35:
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
    && objc_msgSend(v4, "hasDMAKeys"))
  {
    -[PLOperator logDMAEntry:](self, "logDMAEntry:", v4);
  }
LABEL_38:

}

- (PLCoreStorage)storage
{
  void *v2;
  void *v3;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLCoreStorage *)v3;
}

- (BOOL)isDebugEnabledForKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "isDebugEnabledForKey:", v3);

  return v4;
}

+ (BOOL)isDebugEnabledForKey:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", objc_opt_class(), v3)|| +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", objc_opt_class(), v3);

  return v4;
}

- (NSMutableDictionary)lastLogDateForEntryKey
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldWriteEntry:(id)a3 withDebug:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  _QWORD v30[6];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v4 = a4;
  v6 = a3;
  if ((objc_msgSend(v6, "isErrorEntry") & 1) == 0)
  {
    if (!objc_msgSend(v6, "filterEntryLogging"))
    {
      v7 = 1;
      goto LABEL_22;
    }
    -[PLOperator storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEntryForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastEntry=%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator shouldWriteEntry:withDebug:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 517);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      if (v10)
      {
        v16 = objc_msgSend(v6, "compare:options:", v10, 2);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("result=%ld"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator shouldWriteEntry:withDebug:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 520);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("skipping logging"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator shouldWriteEntry:withDebug:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v24, v25, 522);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          goto LABEL_18;
        }
      }
    }
    else if (v10 && !objc_msgSend(v6, "compare:options:", v10, 2))
    {
LABEL_18:
      objc_msgSend(v6, "entryKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "rangeOfString:", CFSTR("EventBackward"));

      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v33[0] = 0;
        v33[1] = v33;
        v33[2] = 0x3032000000;
        v33[3] = __Block_byref_object_copy__19;
        v33[4] = __Block_byref_object_dispose__19;
        v34 = v6;
        v31[0] = 0;
        v31[1] = v31;
        v31[2] = 0x3032000000;
        v31[3] = __Block_byref_object_copy__19;
        v31[4] = __Block_byref_object_dispose__19;
        v32 = v10;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __41__PLOperator_shouldWriteEntry_withDebug___block_invoke;
        v30[3] = &unk_1E6A52298;
        v30[4] = v31;
        v30[5] = v33;
        -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v32, v30);
        _Block_object_dispose(v31, 8);

        _Block_object_dispose(v33, 8);
      }
      v7 = 0;
      goto LABEL_21;
    }
    v7 = 1;
LABEL_21:

    goto LABEL_22;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (void)logForSubsystem:(id)a3 category:(id)a4 data:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D70A08], "getMetadataByNameForSubsystem:category:", v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;
      +[PLOperator createEntriesForMetrics:withData:withDate:](PLOperator, "createEntriesForMetrics:withData:withDate:", v14, v12, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PPSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v32 = v10;
        v33 = 2112;
        v34 = v11;
        v35 = 2048;
        v36 = objc_msgSend(v17, "count");
        _os_log_debug_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEBUG, "[Log] Number of entries for subsystem/category: %@/%@ : %lu", buf, 0x20u);
      }
      v25 = v10;

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = v17;
      objc_msgSend(v17, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v27 != v22)
              objc_enumerationMutation(v19);
            -[PLOperator logEntry:](self, "logEntry:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v21);
      }

      v10 = v25;
    }
    else
    {
      PPSLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PLOperator logForSubsystem:category:data:date:].cold.2();
    }

  }
  else
  {
    PPSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PLOperator logForSubsystem:category:data:date:].cold.1();
  }

}

+ (id)createEntriesForMetrics:(id)a3 withData:(id)a4 withDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PLEntry *v15;
  PLEntry *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v31 = 0;
  v32[0] = &v31;
  v32[1] = 0x3032000000;
  v32[2] = __Block_byref_object_copy__19;
  v32[3] = __Block_byref_object_dispose__19;
  v33 = 0;
  v10 = (void *)objc_opt_new();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke;
  v26 = &unk_1E6A56158;
  v11 = v7;
  v27 = v11;
  v30 = &v31;
  v12 = v10;
  v28 = v12;
  v13 = v9;
  v29 = v13;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v23);
  if (*(_QWORD *)(v32[0] + 40))
  {
    objc_msgSend(v12, "objectForKey:", v23, v24, v25, v26, v27, v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = [PLEntry alloc];
      v16 = -[PLEntry initWithEntryKey:withDate:](v15, "initWithEntryKey:withDate:", *(_QWORD *)(v32[0] + 40), v13);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(v32[0] + 40));

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("__PPSKVPairs__"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(v32[0] + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("__PPSKVPairs__"));

    PPSLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[PLOperator createEntriesForMetrics:withData:withDate:].cold.1((uint64_t)v32, (uint64_t)v12, v19);

  }
  v20 = v29;
  v21 = v12;

  _Block_object_dispose(&v31, 8);
  return v21;
}

- (void)logForSubsystem:(id)a3 category:(id)a4 data:(id)a5
{
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", a3, a4, a5, 0);
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  PLEntry *v17;
  NSObject *v18;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("__PPSKVPairs__")))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v7, "allKeys");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject firstObject](v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPSEntryKey entryKeyForMetric:](PPSEntryKey, "entryKeyForMetric:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        if (+[PLUtilities OverrideAllowlistEnabled](PLUtilities, "OverrideAllowlistEnabled"))
        {
          if (!+[PPSCoreUtilities shouldLogMetric:](PPSCoreUtilities, "shouldLogMetric:", v8))
            goto LABEL_24;
        }
        else if (!+[PPSCoreUtilities isValidModeForMetric:](PPSCoreUtilities, "isValidModeForMetric:", v8)|| !+[PPSCoreUtilities isAllowedMetric:](PPSCoreUtilities, "isAllowedMetric:", v8))
        {
          goto LABEL_24;
        }
        +[PPSEntryKey entryKeyForMetric:](PPSEntryKey, "entryKeyForMetric:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = -[PLEntry initWithEntryKey:withDate:]([PLEntry alloc], "initWithEntryKey:withDate:", v9, *(_QWORD *)(a1 + 48));
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, v9);

          }
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
          v18 = objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v6, v5);
        }
        else
        {
          PPSLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_2();
        }

      }
      else
      {
        PPSLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_1();
      }
    }

    goto LABEL_24;
  }
  PPSLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_3((uint64_t)v5, v15);

LABEL_25:
}

void __38__PLOperator_postEntries_withGroupID___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GroupID_%@"), a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  v3 = a1[6];
  v6 = CFSTR("group");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", v2, v4, v5);

}

void __26__PLOperator_postEntries___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  _QWORD v25[6];
  id v26;
  _QWORD block[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  const __CFString *v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v2)
  {
    v3 = v2;
    v4 = CFSTR("entry");
    v5 = 0x1E0C99000uLL;
    v6 = &off_1E6A51000;
    v24 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      v22 = v3;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v7);
        v34 = v4;
        v35 = v8;
        objc_msgSend(*(id *)(v5 + 3456), "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6[28], "debugEnabled"))
        {
          v10 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __26__PLOperator_postEntries___block_invoke_2;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v10;
          if (ArrayReserved_block_invoke_3_defaultOnce_0 != -1)
            dispatch_once(&ArrayReserved_block_invoke_3_defaultOnce_0, block);
          if (ArrayReserved_block_invoke_3_classDebugEnabled_0)
          {
            v11 = v4;
            v12 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "entryKey");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringWithFormat:", CFSTR("posting %@"), v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "lastPathComponent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator postEntries:]_block_invoke");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 544);

            PLLogCommon();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v33 = v14;
              _os_log_debug_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v4 = v11;
            v5 = 0x1E0C99000;
            v3 = v22;
            v6 = &off_1E6A51000;
          }
        }
        objc_msgSend(v8, "entryKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", v19, *(_QWORD *)(a1 + 40), v9);

        objc_msgSend(*(id *)(a1 + 40), "filterDefinitions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __26__PLOperator_postEntries___block_invoke_76;
        v25[3] = &unk_1E6A52458;
        v25[4] = *(_QWORD *)(a1 + 40);
        v25[5] = v8;
        v26 = v9;
        v21 = v9;
        objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);

        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v3);
  }

}

- (NSMutableDictionary)filterDefinitions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)logEntries:(id)a3 withGroupID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _UNKNOWN **v19;
  _UNKNOWN **v20;
  uint64_t i;
  uint64_t v22;
  int v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  _QWORD v38[5];
  id v39;
  uint64_t v40;
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
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (-[PLOperator storage](self, "storage"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "storageReady"),
        v8,
        v9))
  {
    v35 = v7;
    v36 = v6;
    if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("logEntry"))
      || -[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("logEntries")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logEntries:withGroupID:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 453);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v6 = v36;
    }
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
    v45 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v46;
      v19 = &off_1E6A51000;
      v20 = &off_1E6A51000;
      v37 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v18)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          v23 = objc_msgSend(v19[32], "isAggregateForEntryKey:", v22);
          v24 = objc_msgSend(v20[72], "isPowerlogHelperd");
          if (v23)
          {
            if ((v24 & 1) == 0)
            {
              v43 = 0u;
              v44 = 0u;
              v41 = 0u;
              v42 = 0u;
              objc_msgSend(v15, "objectForKeyedSubscript:", v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v42;
                do
                {
                  for (j = 0; j != v27; ++j)
                  {
                    if (*(_QWORD *)v42 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
                    -[PLOperator storage](self, "storage");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "writeAggregateEntry:", v30);

                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                }
                while (v27);
              }

              v18 = v37;
              v19 = &off_1E6A51000;
              v20 = &off_1E6A51000;
            }
          }
          else if ((v24 & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", v22);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLOperator postEntries:](self, "postEntries:", v32);

          }
          else
          {
            -[PLOperator storage](self, "storage");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v22);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __37__PLOperator_logEntries_withGroupID___block_invoke;
            v38[3] = &unk_1E6A53760;
            v38[4] = self;
            v39 = v15;
            v40 = v22;
            objc_msgSend(v33, "writeEntries:withCompletionBlock:", v34, v38);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v17);
    }

    v7 = v35;
    -[PLOperator postEntries:withGroupID:](self, "postEntries:withGroupID:", v15, v35);
    v6 = v36;
  }

}

- (void)postEntries:(id)a3 withGroupID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PLOperator storageQueue](self, "storageQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PLOperator_postEntries_withGroupID___block_invoke;
  block[3] = &unk_1E6A53760;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)storageQueue
{
  void *v2;
  void *v3;

  -[PLOperator storageQueueName](self, "storageQueueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (NSString)storageQueueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "storageQueueName");
}

id __26__PLOperator_logDMAEntry___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "DMAKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithValuesForKeys:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities sanitizeCAPayload:](PLUtilities, "sanitizeCAPayload:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDebugEnabled
{
  return objc_msgSend((id)objc_opt_class(), "isDebugEnabled");
}

+ (BOOL)isDebugEnabled
{
  return +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", objc_opt_class())
      || +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", objc_opt_class());
}

- (void)logDMAEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v3 = a3;
  objc_msgSend(v3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("com.apple.perfpowerservices.dma.%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLOperator logDMAEntry:].cold.2();

  objc_msgSend(v3, "entryDefinition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition keyConfigsForEntryDefinition:](PLEntryDefinition, "keyConfigsForEntryDefinition:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __26__PLOperator_logDMAEntry___block_invoke;
  v24[3] = &unk_1E6A55500;
  v13 = v5;
  v25 = v13;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v24);

  if (objc_msgSend(v3, "hasDynamicKeys"))
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLOperator logDMAEntry:].cold.1();

    objc_msgSend(v3, "DMAKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryWithValuesForKeys:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __26__PLOperator_logDMAEntry___block_invoke_164;
    v21[3] = &unk_1E6A53450;
    v22 = v17;
    v23 = v8;
    v18 = v17;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v21);

  }
  else
  {
    v19 = v13;
    v20 = v3;
    AnalyticsSendEventLazy();

    v18 = v19;
  }

}

void __38__PLOperator_postEntries_withGroupID___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PLOperator_postEntries_withGroupID___block_invoke_2;
  block[3] = &unk_1E6A53760;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, block);

}

- (NSString)className
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "className");
}

void __36__PLOperator_updateEntry_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v7 = CFSTR("entry");
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_update"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", v6, *(_QWORD *)(a1 + 40), v3);

}

void __36__PLOperator_updateEntry_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PLOperator_updateEntry_withBlock___block_invoke_2;
  v6[3] = &unk_1E6A521A0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  dispatch_async(v3, v6);

}

- (void)updateEntry:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  NSObject *v10;
  id *v11;
  void *v12;
  _QWORD block[4];
  _QWORD v14[2];
  _QWORD v15[5];
  NSObject *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    -[PLOperator storage](self, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "storageReady") ^ 1;

    if (!v6)
      goto LABEL_10;
  }
  if ((v8 & 1) == 0)
  {
    if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    {
      -[PLOperator workQueue](self, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLOperator_updateEntry_withBlock___block_invoke_3;
      block[3] = &unk_1E6A521A0;
      v11 = (id *)v14;
      v14[0] = v6;
      v14[1] = self;
      dispatch_async(v10, block);
    }
    else
    {
      -[PLOperator storage](self, "storage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __36__PLOperator_updateEntry_withBlock___block_invoke;
      v15[3] = &unk_1E6A56130;
      v11 = &v17;
      v17 = v7;
      v15[4] = self;
      v16 = v6;
      objc_msgSend(v12, "updateEntry:withBlock:", v16, v15);

      v10 = v16;
    }

  }
LABEL_10:

}

+ (void)load
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    +[PLCoreOperator registerOperator:](PLCoreOperator, "registerOperator:", objc_opt_class());
}

void __23__PLOperator_className__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_semaphore_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)className__classNames;
  className__classNames = v0;

  v2 = dispatch_semaphore_create(1);
  v3 = (void *)className__classNamesSemaphore;
  className__classNamesSemaphore = (uint64_t)v2;

}

void __30__PLOperator_storageQueueName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)storageQueueName__storageQueueNames;
  storageQueueName__storageQueueNames = v0;

}

+ (id)operator
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)isEnabled
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v3, CFSTR("_Enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", v4, 1);
  return (char)v3;
}

+ (void)setEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v5, CFSTR("_Enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v7, v6);

}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (BOOL)fullMode
{
  return +[PLDefaults fullModeForClass:](PLDefaults, "fullModeForClass:", objc_opt_class());
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryDefinitions
{
  return +[PLEntryDefinition entryDefinitionsForOperatorClass:](PLEntryDefinition, "entryDefinitionsForOperatorClass:", objc_opt_class());
}

+ (id)entryKeys
{
  return +[PLEntryKey entryKeysForOperatorClass:](PLEntryKey, "entryKeysForOperatorClass:", objc_opt_class());
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLOperator)init
{
  PLOperator *v2;
  uint64_t v3;
  NSMutableDictionary *lastLogDateForEntryKey;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  BOOL (*v32)(uint64_t);
  void *v33;
  __CFString *v34;
  uint64_t v35;
  _QWORD block[5];
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PLOperator;
  v2 = -[PLOperator init](&v37, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    lastLogDateForEntryKey = v2->_lastLogDateForEntryKey;
    v2->_lastLogDateForEntryKey = (NSMutableDictionary *)v3;

    v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __18__PLOperator_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (init_defaultOnce_2 != -1)
        dispatch_once(&init_defaultOnce_2, block);
      if (init_classDebugEnabled_2)
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        -[PLOperator className](v2, "className");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("*** Debug enabled for %@ ***"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator init]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 183);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v30 = v6;
      v31 = 3221225472;
      v32 = __18__PLOperator_init__block_invoke_30;
      v33 = &unk_1E6A52828;
      v34 = CFSTR("entryDefinitions");
      v35 = objc_opt_class();
      if (init_defaultOnce_28 != -1)
        dispatch_once(&init_defaultOnce_28, &v30);
      v14 = init_classDebugEnabled_29;

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)objc_opt_class(), "entryDefinitions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@"), v16, v30, v31, v32, v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator init]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 184);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (-[PLOperator isDebugEnabled](v2, "isDebugEnabled"))
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[PLOperator className](v2, "className");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("com.apple.powerlogd.%@.log"), v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)didReceiveLogNotification, v24, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    }
    v26 = (void *)objc_opt_new();
    -[PLOperator setFilterDefinitions:](v2, "setFilterDefinitions:", v26);

    v27 = (void *)objc_opt_new();
    -[PLOperator setFilterDeltaLastEntryIDs:](v2, "setFilterDeltaLastEntryIDs:", v27);

    v28 = (void *)objc_opt_new();
    -[PLOperator setBufferedEntries:](v2, "setBufferedEntries:", v28);

    -[PLOperator setTriggerBufferFlush:](v2, "setTriggerBufferFlush:", 0);
    -[PLOperator subscribeNotificationsForEntries](v2, "subscribeNotificationsForEntries");
  }
  return v2;
}

BOOL __18__PLOperator_init__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_2 = result;
  return result;
}

BOOL __18__PLOperator_init__block_invoke_30(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_29 = result;
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PLOperator;
  -[PLOperator dealloc](&v5, sel_dealloc);
}

- (id)defaultObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PLOperator className](self, "className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)defaultBoolForKey:(id)a3
{
  void *v3;
  char v4;

  -[PLOperator defaultObjectForKey:](self, "defaultObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (double)defaultDoubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[PLOperator defaultObjectForKey:](self, "defaultObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int64_t)defaultLongForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[PLOperator defaultObjectForKey:](self, "defaultObjectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

- (id)initForTest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLOperator;
  return -[PLOperator init](&v3, sel_init);
}

- (void)logFromCFCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__PLOperator_logFromCFCallback___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __32__PLOperator_logFromCFCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PLOperator_logFromCFCallback___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (ArrayReserved_block_invoke_defaultOnce_0 != -1)
      dispatch_once(&ArrayReserved_block_invoke_defaultOnce_0, block);
    if (ArrayReserved_block_invoke_classDebugEnabled_0)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "className");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ got CFCallback %@"), v5, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logFromCFCallback:]_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 306);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "log");
  objc_autoreleasePoolPop(v2);
}

BOOL __32__PLOperator_logFromCFCallback___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_classDebugEnabled_0 = result;
  return result;
}

- (void)flushBuffer
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  BOOL (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __25__PLOperator_flushBuffer__block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v3;
    if (flushBuffer_defaultOnce != -1)
      dispatch_once(&flushBuffer_defaultOnce, &block);
    if (flushBuffer_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PLOperator bufferedEntries](self, "bufferedEntries");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Flushing buffer, queue size %lu"), v6, block, v18, v19, v20, v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator flushBuffer]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 315);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLOperator bufferedEntries](self, "bufferedEntries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    -[PLOperator bufferedEntries](self, "bufferedEntries");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    -[PLOperator setBufferedEntries:](self, "setBufferedEntries:", v15);

    -[PLOperator storage](self, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeEntries:withCompletionBlock:", v14, &__block_literal_global_50);

  }
}

BOOL __25__PLOperator_flushBuffer__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  flushBuffer_classDebugEnabled = result;
  return result;
}

- (void)enableBufferFlushTimer:(unint64_t)a3
{
  void *v5;
  PLTimer *v6;
  void *v7;
  double v8;
  void *v9;
  PLTimer *v10;
  _QWORD v11[5];

  -[PLOperator triggerBufferFlush](self, "triggerBufferFlush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [PLTimer alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double)a3;
    -[PLOperator workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__PLOperator_enableBufferFlushTimer___block_invoke;
    v11[3] = &unk_1E6A535C0;
    v11[4] = self;
    v10 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v6, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v7, 1, 0, v9, v11, v8, 0.0);
    -[PLOperator setTriggerBufferFlush:](self, "setTriggerBufferFlush:", v10);

  }
}

void __37__PLOperator_enableBufferFlushTimer___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "flushBuffer");
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v1 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLOperator_enableBufferFlushTimer___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v1;
    if (ArrayReserved_block_invoke_2_defaultOnce_0 != -1)
      dispatch_once(&ArrayReserved_block_invoke_2_defaultOnce_0, block);
    if (ArrayReserved_block_invoke_2_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timer triggered flush buffer"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator enableBufferFlushTimer:]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v4, v5, 334);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __37__PLOperator_enableBufferFlushTimer___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_2_classDebugEnabled_0 = result;
  return result;
}

void __36__PLOperator_updateEntry_withBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v7 = CFSTR("entry");
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_update"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", v6, *(_QWORD *)(a1 + 40), v3);

}

void __41__PLOperator_shouldWriteEntry_withDebug___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "entryDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setEntryDate:", v2);

}

BOOL __26__PLOperator_postEntries___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_3_classDebugEnabled_0 = result;
  return result;
}

void __26__PLOperator_postEntries___block_invoke_76(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  _QWORD block[5];

  v5 = a2;
  LODWORD(a3) = objc_msgSend(*(id *)(a1 + 32), "postFilteredNotificationForEntry:withFilteredDefition:withNotificationName:", *(_QWORD *)(a1 + 40), a3, v5);
  v6 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if ((_DWORD)a3)
  {
    if (v6)
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __26__PLOperator_postEntries___block_invoke_2_77;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (ArrayReserved_block_invoke_4_defaultOnce_0 != -1)
        dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_0, block);
      if (ArrayReserved_block_invoke_4_classDebugEnabled_0)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "entryKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("posting %@ with NotificationName %@"), v9, v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator postEntries:]_block_invoke");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 551);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (v6)
  {
    v15 = objc_opt_class();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __26__PLOperator_postEntries___block_invoke_82;
    v26 = &__block_descriptor_40_e5_v8__0lu32l8;
    v27 = v15;
    if (ArrayReserved_block_invoke_4_defaultOnce_80 != -1)
      dispatch_once(&ArrayReserved_block_invoke_4_defaultOnce_80, &v23);
    if (ArrayReserved_block_invoke_4_classDebugEnabled_81)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "entryKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("NOT posting %@ with NotificationName %@"), v17, v5, v23, v24, v25, v26, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator postEntries:]_block_invoke_2");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 554);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __26__PLOperator_postEntries___block_invoke_2_77(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_0 = result;
  return result;
}

BOOL __26__PLOperator_postEntries___block_invoke_82(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_4_classDebugEnabled_81 = result;
  return result;
}

BOOL __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled = result;
  return result;
}

BOOL __89__PLOperator_postFilteredNotificationForEntry_withFilteredDefition_withNotificationName___block_invoke_102(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  postFilteredNotificationForEntry_withFilteredDefition_withNotificationName__classDebugEnabled_101 = result;
  return result;
}

- (id)entryDefinitions
{
  return (id)objc_msgSend((id)objc_opt_class(), "entryDefinitions");
}

- (id)entryKeys
{
  return (id)objc_msgSend((id)objc_opt_class(), "entryKeys");
}

- (void)subscribeNotificationsForEntries
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *context;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[4];
  __CFString *v34;
  uint64_t v35;
  _QWORD v36[4];
  __CFString *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCC9E9B4](self, a2);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[PLOperator entryKeys](self, "entryKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v5)
  {
    v6 = v5;
    v7 = &off_1E6A51000;
    v8 = *(_QWORD *)v40;
    v30 = v4;
    v31 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v9);
        if (objc_msgSend(v7[32], "isOnDemandQueryableForEntryKey:", v10))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requesting.%@"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
          {
            v12 = objc_opt_class();
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __46__PLOperator_subscribeNotificationsForEntries__block_invoke;
            v36[3] = &unk_1E6A52828;
            v37 = CFSTR("notifications");
            v38 = v12;
            if (subscribeNotificationsForEntries_defaultOnce != -1)
              dispatch_once(&subscribeNotificationsForEntries_defaultOnce, v36);
            v13 = subscribeNotificationsForEntries_classDebugEnabled;

            if (v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("signing up for notification %@"), v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "lastPathComponent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator subscribeNotificationsForEntries]");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v16, v17, 718);

              PLLogCommon();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v14;
                _os_log_debug_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v4 = v30;
              v8 = v31;
              v6 = v32;
              v7 = &off_1E6A51000;
            }
          }
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_logRequestNotification_, v11, 0);

        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requestingFilter.%@"), v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v21 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __46__PLOperator_subscribeNotificationsForEntries__block_invoke_117;
          block[3] = &unk_1E6A52828;
          v34 = CFSTR("notifications");
          v35 = v21;
          if (subscribeNotificationsForEntries_defaultOnce_115 != -1)
            dispatch_once(&subscribeNotificationsForEntries_defaultOnce_115, block);
          v22 = subscribeNotificationsForEntries_classDebugEnabled_116;

          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("signing up for notification %@"), v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastPathComponent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator subscribeNotificationsForEntries]");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v25, v26, 723);

            PLLogCommon();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v23;
              _os_log_debug_impl(&dword_1B6AB6000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v8 = v31;
            v6 = v32;
            v7 = &off_1E6A51000;
          }
        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObserver:selector:name:object:", self, sel_setupFilterRequest_, v20, 0);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
}

BOOL __46__PLOperator_subscribeNotificationsForEntries__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  subscribeNotificationsForEntries_classDebugEnabled = result;
  return result;
}

BOOL __46__PLOperator_subscribeNotificationsForEntries__block_invoke_117(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  subscribeNotificationsForEntries_classDebugEnabled_116 = result;
  return result;
}

- (void)logRequestNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PLOperator_logRequestNotification___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__PLOperator_logRequestNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSString *v14;
  SEL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  __CFString *v22;
  uint64_t v23;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __37__PLOperator_logRequestNotification___block_invoke_2;
    block[3] = &unk_1E6A52828;
    block[1] = 3221225472;
    v22 = CFSTR("notifications");
    v23 = v3;
    if (ArrayReserved_block_invoke_5_defaultOnce_0 != -1)
      dispatch_once(&ArrayReserved_block_invoke_5_defaultOnce_0, block);
    v4 = ArrayReserved_block_invoke_5_classDebugEnabled_0;

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("notification=%@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logRequestNotification:]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 732);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("requesting."), &stru_1E6A56538);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLEntryDefinition logSelectorStringForEnteryKey:](PLEntryDefinition, "logSelectorStringForEnteryKey:", v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSSelectorFromString(v14);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "performSelector:", v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Does not respond to entryKey=%@"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator logRequestNotification:]_block_invoke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 741);

    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  objc_autoreleasePoolPop(v2);
}

BOOL __37__PLOperator_logRequestNotification___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_5_classDebugEnabled_0 = result;
  return result;
}

- (void)setupFilterRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLOperator *v9;

  v4 = a3;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__PLOperator_setupFilterRequest___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __33__PLOperator_setupFilterRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  __CFString *v19;
  uint64_t v20;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("requestingFilter."), &stru_1E6A56538);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition notificationNameForEntryKey:withFilterDefintion:](PLEntryDefinition, "notificationNameForEntryKey:withFilterDefintion:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "filterDefinitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "filterDefinitions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v11 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __33__PLOperator_setupFilterRequest___block_invoke_2;
      block[3] = &unk_1E6A52828;
      block[1] = 3221225472;
      v19 = CFSTR("notifications");
      v20 = v11;
      if (ArrayReserved_block_invoke_6_defaultOnce_0 != -1)
        dispatch_once(&ArrayReserved_block_invoke_6_defaultOnce_0, block);
      v12 = ArrayReserved_block_invoke_6_classDebugEnabled_0;

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("added requestingFilter %@"), v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator setupFilterRequest:]_block_invoke");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 755);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }

  objc_autoreleasePoolPop(v2);
}

BOOL __33__PLOperator_setupFilterRequest___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  ArrayReserved_block_invoke_6_classDebugEnabled_0 = result;
  return result;
}

+ (id)trimConditionsWithEntryKey:(id)a3 withTrimDate:(id)a4 withDuration:(id)a5 withStartDateKey:(id)a6
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  v8 = a4;
  v9 = a6;
  if (a5)
  {
    objc_msgSend(a5, "doubleValue");
    v11 = v10;
  }
  else
  {
    v11 = 1209600.0;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "timeIntervalSince1970");
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", -v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  v18 = v17;

  if (v14 >= v18)
    v19 = v18;
  else
    v19 = v14;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@ is NULL OR %@<%f)"), v9, v9, *(_QWORD *)&v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)trimConditionsWithEntryKey:(id)a3 withTrimDate:(id)a4 withCount:(id)a5 withStartDateKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (a5)
    v12 = objc_msgSend(a5, "integerValue");
  else
    v12 = 200;
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@ is NULL OR %@<%f) AND ID<=(SELECT (max(ID)-%i) from %@)"), v11, v11, v14, v12, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)tablesToTrimConditionsForTrimDate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int16 v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  uint64_t v40;
  PLOperator *v42;
  id v43;
  id obj;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v45 = v4;
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v42 = self;
  +[PLEntryKey entryKeysForOperator:](PLEntryKey, "entryKeysForOperator:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  obj = v8;
  v47 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v49;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v9);
        +[PLEntryKey PLEntryKeyForEntryKey:](PLEntryKey, "PLEntryKeyForEntryKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Configs"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TrimConditionsTemplate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Configs"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("TrimConditionsTemplate"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Keys"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = CFSTR("StartDate");
        if ((objc_msgSend(v19, "containsObject:", CFSTR("StartDate")) & 1) == 0)
        {
          if (objc_msgSend(v19, "containsObject:", CFSTR("StartOffset")))
            v20 = CFSTR("(timestamp + StartOffset/1000.0)");
          else
            v20 = CFSTR("timestamp");
        }
        v21 = CFSTR("EndDate");
        if ((objc_msgSend(v19, "containsObject:", CFSTR("EndDate")) & 1) == 0)
        {
          if (objc_msgSend(v19, "containsObject:", CFSTR("EndOffset")))
            v21 = CFSTR("(timestamp + EndOffset/1000.0)");
          else
            v21 = CFSTR("timestampEnd");
        }
        if (v17 > 1)
        {
          if (v17 != 2)
          {
            if (v17 != 0x7FFF)
              goto LABEL_35;
            -[PLOperator trimConditionsForEntryKey:forTrimDate:](v42, "trimConditionsForEntryKey:forTrimDate:", v10, v45);
            v25 = objc_claimAutoreleasedReturnValue();
LABEL_24:
            v26 = (void *)v25;
            if (v25)
              goto LABEL_34;
            goto LABEL_35;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Configs"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("TrimConditionsTemplateArg"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLOperator trimConditionsWithEntryKey:withTrimDate:withCount:withStartDateKey:](PLOperator, "trimConditionsWithEntryKey:withTrimDate:withCount:withStartDateKey:", v10, v45, v23, v20);
          v24 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        if (v17)
        {
          if (v17 != 1)
            goto LABEL_35;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Configs"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("TrimConditionsTemplateArg"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLOperator trimConditionsWithEntryKey:withTrimDate:withDuration:withStartDateKey:](PLOperator, "trimConditionsWithEntryKey:withTrimDate:withDuration:withStartDateKey:", v10, v45, v23, v20);
          v24 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v26 = (void *)v24;

          if (v26)
            goto LABEL_34;
          goto LABEL_35;
        }
        objc_msgSend(v11, "entryType");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("EventInterval"));

        if (v28)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "dateByAddingTimeInterval:", 1209600.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "timeIntervalSince1970");
          v32 = v31;
          v33 = (void *)MEMORY[0x1E0CB3940];
          +[PLUtilities deviceBootTime](PLUtilities, "deviceBootTime");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "timeIntervalSince1970");
          objc_msgSend(v33, "stringWithFormat:", CFSTR("(%@<%f) OR ((%@ is NULL OR %@<%f OR %@<%f) AND (%@ is NULL OR %@<%f))"), v21, v6, v20, v20, v35, v20, v32, v21, v21, v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_33;
        }
        objc_msgSend(v11, "entryType");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("EventForward"));

        if (v37)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is NULL OR %@<(SELECT max(%@) FROM '%@' WHERE %@<%f)"), v20, v20, v20, v11, v20, v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
          if (!v26)
            goto LABEL_35;
LABEL_34:
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v26, v10);

          goto LABEL_35;
        }
        objc_msgSend(v11, "entryType");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("Aggregate"));

        if (v39)
        {
          +[PLOperator trimConditionsWithEntryKey:withTrimDate:withDuration:withStartDateKey:](PLOperator, "trimConditionsWithEntryKey:withTrimDate:withDuration:withStartDateKey:", v10, v45, &unk_1E6ABFD50, v20);
          v25 = objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
LABEL_35:

        ++v9;
      }
      while (v47 != v9);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      v47 = v40;
    }
    while (v40);
  }

  return v43;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled", a3, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLOperator::trimConditionsForEntryKey:trimDate: WARNING: derived class must implement if they specify PLEDTrimConditionsTemplateCustom in an entryDefinition"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLOperator.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLOperator trimConditionsForEntryKey:forTrimDate:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 872);

    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  return 0;
}

void __26__PLOperator_logDMAEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  const __CFString *v12;
  NSObject *v13;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ProcessName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    v7 = (id *)(a1 + 32);
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities bundleIDFromProcessName:](PLUtilities, "bundleIDFromProcessName:", v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *v7;
      v12 = v10;
    }
    else
    {
      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __26__PLOperator_logDMAEntry___block_invoke_cold_1(v7, (uint64_t)v5, v13);

      v11 = *v7;
      v12 = CFSTR("unknown");
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v5);

  }
}

void __26__PLOperator_logDMAEntry___block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setValuesForKeysWithDictionary:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, CFSTR("value"));
    v7 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();

  }
}

id __26__PLOperator_logDMAEntry___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  +[PLUtilities sanitizeCAPayload:](PLUtilities, "sanitizeCAPayload:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setFilterDefinitions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setFilterDeltaLastEntryIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)bufferedEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBufferedEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PLTimer)triggerBufferFlush
{
  return (PLTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTriggerBufferFlush:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setLastLogDateForEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLogDateForEntryKey, 0);
  objc_storeStrong((id *)&self->_triggerBufferFlush, 0);
  objc_storeStrong((id *)&self->_bufferedEntries, 0);
  objc_storeStrong((id *)&self->_filterDeltaLastEntryIDs, 0);
  objc_storeStrong((id *)&self->_filterDefinitions, 0);
}

- (void)logForSubsystem:category:data:date:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "[Log] Nil payload for subsystem/category: %@/%@");
  OUTLINED_FUNCTION_1_0();
}

- (void)logForSubsystem:category:data:date:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "[Log] Metadata not found for subsystem/category: %@/%@");
  OUTLINED_FUNCTION_1_0();
}

- (void)logDMAEntry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "DMA data '%@' has dynamic keys", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)logDMAEntry:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Processing DMA data: '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __26__PLOperator_logDMAEntry___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, a3, v5, "Failed to translate process name '%@' to bundle ID for DMA!", v6);

  OUTLINED_FUNCTION_2_1();
}

+ (void)createEntriesForMetrics:(uint64_t)a1 withData:(uint64_t)a2 withDate:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "Adding to %@ entries array %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "No metadata for metric: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, v0, v1, "No entryKey for metric: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__PLOperator_createEntriesForMetrics_withData_withDate___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = (id)objc_opt_class();
  v3 = v7;
  _os_log_fault_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_FAULT, "Metric name: %@ is not String class %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2_1();
}

@end
