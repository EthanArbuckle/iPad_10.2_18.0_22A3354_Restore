@implementation PLCoalitionAgent

- (void)getCoalitionInfoWithHFLFlag:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  PLCoalitionAgent *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const char *string;
  const char *v41;
  const char *v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  char *v48;
  char *key;
  void *v50;
  PLCoalitionAgent *v51;
  void *v52;
  void *v53;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PLCoalitionAgent setCurrentDate:](self, "setCurrentDate:", v5);

  LODWORD(v5) = proc_listcoalitions();
  v6 = (2 * v5);
  v7 = malloc_type_malloc((int)v6, 0xC21FF997uLL);
  v8 = proc_listcoalitions();
  v9 = v8;
  if ((int)v8 > 2 * (int)v5)
  {
    v10 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("CoalitionDrops"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoalitionAgent currentDate](self, "currentDate");
    v12 = v7;
    v13 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithEntryKey:withDate:", v11, v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("finalSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("bufferSize"));

    -[PLOperator logEntry:](v13, "logEntry:", v15);
    -[PLCoalitionAgent logToAggd:](v13, "logToAggd:", v15);
    if (v12)
      free(v12);

    goto LABEL_41;
  }
  v52 = v4;
  v50 = v7;
  if ((int)v8 >= 16)
  {
    v18 = v8 >> 4;
    v48 = (char *)*MEMORY[0x1E0C80918];
    key = (char *)*MEMORY[0x1E0C80910];
    v51 = self;
    while (1)
    {
      v19 = (void *)MEMORY[0x1D179C2E0]();
      v20 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
      v21 = coalition_info_resource_usage();
      if (!(_DWORD)v21)
        break;
      v22 = v21;
      if (v20)
        free(v20);
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_26;
      v23 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PLCoalitionAgent_getCoalitionInfoWithHFLFlag___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v23;
      if (qword_1ED8837D8 != -1)
        dispatch_once(&qword_1ED8837D8, block);
      if (!byte_1ED8837A4)
        goto LABEL_26;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot retrieve coalition information; returnVal=%d"),
        v22);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLCoalitionAgent.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoalitionAgent getCoalitionInfoWithHFLFlag:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1530);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_25:

LABEL_26:
      objc_autoreleasePoolPop(v19);
      v7 += 2;
      if (!--v18)
        goto LABEL_39;
    }
    -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v7);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v19;
    if (v32)
    {
      objc_msgSend(v32, "bundleID");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "launchdName");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isUIKitApp");
      v34 = v52;
LABEL_24:
      -[PLCoalitionAgent currentDate](v51, "currentDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCoalitionAgent buildPLCoalitionDataObject:withBundleId:withLaunchdName:withDate:withCoalitionId:isApp:](v51, "buildPLCoalitionDataObject:withBundleId:withLaunchdName:withDate:withCoalitionId:isApp:", v20, v29, v24, v37, *v7, v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v7);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v38, v39);

      self = v51;
      v19 = v53;
      goto LABEL_25;
    }
    v34 = v52;
    v35 = xpc_coalition_copy_info();
    v36 = (void *)v35;
    if (!v35 || MEMORY[0x1D179CB2C](v35) != MEMORY[0x1E0C812F8])
    {
      v33 = 0;
      v29 = &stru_1E8587D00;
      if (*v7 == 1)
        v24 = CFSTR("com.apple.kernel_task");
      else
        v24 = &stru_1E8587D00;
      goto LABEL_23;
    }
    string = xpc_dictionary_get_string(v36, key);
    v41 = string;
    if (*v7 == 1)
    {
      v33 = 0;
      v24 = CFSTR("com.apple.kernel_task");
      if (string)
      {
LABEL_30:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v41);
        v29 = objc_claimAutoreleasedReturnValue();
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      v47 = string;
      v42 = xpc_dictionary_get_string(v36, v48);
      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v42);
        v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v43 = CFSTR("Unnamed_launchdName");
      }
      v33 = -[__CFString hasPrefix:](v43, "hasPrefix:", CFSTR("UIKitApplication:"));
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v43, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UIKitApplication:"), &stru_1E8587D00);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v44 = -[__CFString rangeOfString:](v24, "rangeOfString:", CFSTR("["));
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[__CFString substringToIndex:](v24, "substringToIndex:", v44);
        v45 = objc_claimAutoreleasedReturnValue();

        v24 = (__CFString *)v45;
      }
      v41 = v47;
      if (v47)
        goto LABEL_30;
    }
    v29 = &stru_1E8587D00;
    goto LABEL_23;
  }
  if (v7)
LABEL_39:
    free(v50);
  v4 = v52;
  -[PLCoalitionAgent logCoalitionObjectDifference:](self, "logCoalitionObjectDifference:", v52);
  -[PLCoalitionAgent setLastCoalitionObjectDictionary:](self, "setLastCoalitionObjectDictionary:", v52);
  -[PLCoalitionAgent currentDate](self, "currentDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoalitionAgent setLastDate:](self, "setLastDate:", v46);

LABEL_41:
}

- (NSDate)currentDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (id)buildPLCoalitionDataObject:(coalition_resource_usage *)a3 withBundleId:(id)a4 withLaunchdName:(id)a5 withDate:(id)a6 withCoalitionId:(unint64_t)a7 isApp:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a8;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCoalStruct:", v15);

  objc_msgSend(v14, "setBundleID:", v13);
  objc_msgSend(v14, "setLaunchdName:", v12);

  objc_msgSend(v14, "setCoalitionID:", a7);
  objc_msgSend(v14, "setIsUIKitApp:", v8);
  return v14;
}

- (void)logCoalitionObjectDifference:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PLCoalitionAgent *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  id v48;
  void *v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD block[5];
  void *v56;
  void *v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v10 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v10;
        if (qword_1ED8837B8 != -1)
          dispatch_once(&qword_1ED8837B8, block);
        if (_MergedGlobals_1_40)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("newCoalitionObjectDictionary=%@\nself.lastCoalitionObjectDictionary=%@"), v4, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLCoalitionAgent.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoalitionAgent logCoalitionObjectDifference:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 1332);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v13;
            _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v49 = (void *)v9;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v47 = v4;
      v19 = v4;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v52;
        v48 = v19;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v52 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[PLCoalitionAgent shouldLogCoalitionObject:withEndObject:](self, "shouldLogCoalitionObject:withEndObject:", v26, v27);

            if (v28)
            {
              -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", v24);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v24);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCoalitionAgent lastDate](self, "lastDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCoalitionAgent currentDate](self, "currentDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCoalitionAgent buildPLEntryDiffWithStartObject:withEndObject:withStartDate:withEndDate:](self, "buildPLEntryDiffWithStartObject:withEndObject:withStartDate:withEndDate:", v30, v31, v32, v33);
              v34 = self;
              v35 = v21;
              v36 = v22;
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v49, "addObject:", v37);
              v22 = v36;
              v21 = v35;
              self = v34;
              v19 = v48;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        }
        while (v21);
      }

      if (objc_msgSend(v49, "count"))
      {
        +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("CoalitionInterval"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v38;
        v57 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v39, v38);

      }
      -[PLCoalitionAgent addAccountingEventsFromCoalitions:](self, "addAccountingEventsFromCoalitions:", v49);
      v4 = v47;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v40 = objc_opt_class();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke_567;
        v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v50[4] = v40;
        if (qword_1ED8837C0 != -1)
          dispatch_once(&qword_1ED8837C0, v50);
        if (byte_1ED8837A1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New way %@"), v49);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLCoalitionAgent.m");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "lastPathComponent");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCoalitionAgent logCoalitionObjectDifference:]");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 1349);

          PLLogCommon();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v41;
            _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }

    }
  }

}

- (NSDictionary)lastCoalitionObjectDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)shouldLogCoalitionObject:(id)a3 withEndObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v6, "coalStruct");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend(v8, "pointerValue");

  objc_msgSend(v5, "coalStruct");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)objc_msgSend(v10, "pointerValue");

  objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v9[3] - v11[3]);
  if (v12 > 1.0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v9[9] - v11[9]);
  if (v13 <= 1.0
    && (objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v9[10] - v11[10]), v14 <= 1.0)
    && (objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v9[8] - v11[8]), v15 <= 1.0))
  {
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v9[38] - v11[38]);
    v16 = v18 > 1.0;
  }
  else
  {
LABEL_6:
    v16 = 1;
  }

  return v16;
}

- (NSDate)lastDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (id)buildPLEntryDiffWithStartObject:(id)a3 withEndObject:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t i;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
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
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t j;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v125;
  void *v126;
  void *v128;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("CoalitionInterval"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithEntryKey:withDate:", v14, v11);

  v126 = v12;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));
  objc_msgSend(v10, "launchdName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("LaunchdName"));

  objc_msgSend(v10, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("BundleId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "coalitionID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("LaunchdCoalitionId"));

  v128 = v10;
  objc_msgSend(v10, "coalStruct");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (_QWORD *)objc_msgSend(v19, "pointerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("tasks_started"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[1]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("tasks_exited"));

  if (v9)
  {
    v125 = v9;
    objc_msgSend(v9, "coalStruct");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (_QWORD *)objc_msgSend(v23, "pointerValue");

    v25 = (void *)MEMORY[0x1E0CB37E8];
    v26 = v20[2];
    v27 = v24[2];
    if (v26 < v27)
      v27 = 0;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v26 - v27);
    objc_msgSend(v25, "numberWithDouble:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v28, CFSTR("time_nonempty"));

    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = v20[3];
    v31 = v24[3];
    if (v30 < v31)
      v31 = 0;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v30 - v31);
    objc_msgSend(v29, "numberWithDouble:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v32, CFSTR("cpu_time"));

    v33 = v20[31];
    v34 = v24[31];
    if (v33 < v34)
      v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33 - v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v35, CFSTR("cpu_instructions"));

    v36 = v20[32];
    v37 = v24[32];
    if (v36 < v37)
      v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v36 - v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v38, CFSTR("cpu_cycles"));

    v39 = (void *)MEMORY[0x1E0CB37E8];
    v40 = v20[8];
    v41 = v24[8];
    if (v40 < v41)
      v41 = 0;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v40 - v41);
    objc_msgSend(v39, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v42, CFSTR("gpu_time"));

    v43 = v20[41];
    v44 = v24[41];
    if (v43 < v44)
      v44 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43 - v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v45, CFSTR("gpu_energy_nj"));

    v46 = v20[42];
    v47 = v24[42];
    if (v46 < v47)
      v47 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v46 - v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v48, CFSTR("gpu_energy_nj_billed_to_me"));

    v49 = v20[43];
    v50 = v24[43];
    if (v49 < v50)
      v50 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v49 - v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v51, CFSTR("gpu_energy_nj_billed_to_others"));

    v52 = (void *)MEMORY[0x1E0CB37E8];
    v53 = v20[9];
    v54 = v24[9];
    if (v53 < v54)
      v54 = 0;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v53 - v54);
    objc_msgSend(v52, "numberWithDouble:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v55, CFSTR("cpu_time_billed_to_me"));

    v56 = (void *)MEMORY[0x1E0CB37E8];
    v57 = v20[10];
    v58 = v24[10];
    if (v57 < v58)
      v58 = 0;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v57 - v58);
    objc_msgSend(v56, "numberWithDouble:");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v59, CFSTR("cpu_time_billed_to_others"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[39] - v24[39]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v60, CFSTR("ane_energy_nj"));

    v61 = (void *)MEMORY[0x1E0CB37E8];
    v62 = v20[38];
    v63 = v24[38];
    if (v62 < v63)
      v63 = 0;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v62 - v63);
    objc_msgSend(v61, "numberWithDouble:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v64, CFSTR("ane_time"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[4] - v24[4]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v65, CFSTR("interrupt_wakeups"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[5] - v24[5]);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v66, CFSTR("platform_idle_wakeups"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[6] - v24[6]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v67, CFSTR("bytesread"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[7] - v24[7]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v68, CFSTR("byteswritten"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[12] - v24[12]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v69, CFSTR("logical_immediate_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[13] - v24[13]);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v70, CFSTR("logical_deferred_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[14] - v24[14]);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v71, CFSTR("logical_invalidated_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[15] - v24[15]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v72, CFSTR("logical_metadata_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[33] - v24[33]);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v73, CFSTR("fs_metadata_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[34] - v24[34]);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v74, CFSTR("pm_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[11] - v24[11]);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v75, CFSTR("energy"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[20] - v24[20]);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v76, CFSTR("energy_billed_to_me"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[21] - v24[21]);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v77, CFSTR("energy_billed_to_others"));

    for (i = 0; i != 7; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cpu_time_eqos_%d"), i);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[i + 24] - v24[i + 24]);
      objc_msgSend(v80, "numberWithDouble:");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v81, v79);

    }
    v82 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[22] - v24[22]);
    objc_msgSend(v82, "numberWithDouble:");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v83, CFSTR("cpu_ptime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[36] - v24[36]);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v84, CFSTR("cpu_pcycles"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[35] - v24[35]);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v125;
  }
  else
  {
    v86 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[2]);
    objc_msgSend(v86, "numberWithDouble:");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v87, CFSTR("time_nonempty"));

    v88 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[3]);
    objc_msgSend(v88, "numberWithDouble:");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v89, CFSTR("cpu_time"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[31]);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v90, CFSTR("cpu_instructions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[32]);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v91, CFSTR("cpu_cycles"));

    v92 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[8]);
    objc_msgSend(v92, "numberWithDouble:");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v93, CFSTR("gpu_time"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[41]);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v94, CFSTR("gpu_energy_nj"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[42]);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v95, CFSTR("gpu_energy_nj_billed_to_me"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[43]);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v96, CFSTR("gpu_energy_nj_billed_to_others"));

    v97 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[9]);
    objc_msgSend(v97, "numberWithDouble:");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v98, CFSTR("cpu_time_billed_to_me"));

    v99 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[10]);
    objc_msgSend(v99, "numberWithDouble:");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v100, CFSTR("cpu_time_billed_to_others"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[39]);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v101, CFSTR("ane_energy_nj"));

    v102 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[38]);
    objc_msgSend(v102, "numberWithDouble:");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v103, CFSTR("ane_time"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[4]);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v104, CFSTR("interrupt_wakeups"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[5]);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v105, CFSTR("platform_idle_wakeups"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[6]);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v106, CFSTR("bytesread"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[7]);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v107, CFSTR("byteswritten"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[12]);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v108, CFSTR("logical_immediate_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[13]);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v109, CFSTR("logical_deferred_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[14]);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v110, CFSTR("logical_invalidated_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[15]);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v111, CFSTR("logical_metadata_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[33]);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v112, CFSTR("fs_metadata_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[34]);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v113, CFSTR("pm_writes"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[11]);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v114, CFSTR("energy"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[20]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v115, CFSTR("energy_billed_to_me"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[21]);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v116, CFSTR("energy_billed_to_others"));

    for (j = 0; j != 7; ++j)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cpu_time_eqos_%d"), j);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[j + 24]);
      objc_msgSend(v119, "numberWithDouble:");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v120, v118);

    }
    v121 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v20[22]);
    objc_msgSend(v121, "numberWithDouble:");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v122, CFSTR("cpu_ptime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[36]);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v123, CFSTR("cpu_pcycles"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20[35]);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v85, CFSTR("cpu_pinstructions"));

  -[PLCoalitionAgent logToAggd:](self, "logToAggd:", v15);
  if (objc_msgSend(v128, "isUIKitApp"))
    -[PLCoalitionAgent logAggregateNANDStatsWithInfo:](self, "logAggregateNANDStatsWithInfo:", v15);

  return v15;
}

- (void)logToAggd:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  id v39;
  id v40;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", &stru_1E8587D00))
  {
    +[PLApplicationAgent appVersionForBundle:](PLApplicationAgent, "appVersionForBundle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("process_name"));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("version"));
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".ver.%@"), v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LaunchdName"));
    v8 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("process_name"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("version"));
  }
  -[PLCoalitionAgent driveCapacity](self, "driveCapacity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("capacity"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesread"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v11, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("byteswritten"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fs_metadata_writes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pm_writes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_deferred_writes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_immediate_writes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedLongLongValue") + v19;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_metadata_writes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 + objc_msgSend(v22, "unsignedLongLongValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_invalidated_writes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23 - objc_msgSend(v24, "unsignedLongLongValue");

  MEMORY[0x1D179B7DC](objc_msgSend(CFSTR("com.apple.power.coalition.logical_bytes_written"), "stringByAppendingFormat:", CFSTR(".%@"), v7), v25);
  MEMORY[0x1D179B7DC](objc_msgSend(CFSTR("com.apple.power.coalition.bytesread"), "stringByAppendingFormat:", CFSTR(".%@"), v7), v37);
  MEMORY[0x1D179B7DC](objc_msgSend(CFSTR("com.apple.power.coalition.byteswritten"), "stringByAppendingFormat:", CFSTR(".%@"), v7), v13);
  if (v25 > 0x4C4B40 || v13 > 0x4C4B40 || v15 > 0x4C4B40 || v17 > 0x4C4B40 || v37 >= 0x1312D01)
  {
    v40 = v38;
    AnalyticsSendEventLazy();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpu_time"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform_idle_wakeups"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interrupt_wakeups"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bytesread"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_immediate_writes"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_deferred_writes"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_metadata_writes"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("logical_invalidated_writes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "unsignedLongLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gpu_time"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "unsignedLongLongValue");

  if (v25 > 0x4C4B40 || v27 > 5 || v36)
  {
    v39 = v7;
    AnalyticsSendEventLazy();

  }
}

- (NSString)driveCapacity
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)addAccountingEventsFromCoalitions:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v39 = (void *)objc_opt_new();
    v38 = (void *)objc_opt_new();
    v36 = v4;
    v37 = (void *)objc_opt_new();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v45;
      v9 = 0.0;
      v10 = 0.0;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v5);
          v13 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          -[PLCoalitionAgent getCPUWeightFromEntry:](self, "getCPUWeightFromEntry:", v13, v36);
          v11 = v11 + v14;
          -[PLCoalitionAgent getGPUWeightFromEntry:](self, "getGPUWeightFromEntry:", v13);
          v10 = v10 + v15;
          -[PLCoalitionAgent getANEEnergyFromEntry:](self, "getANEEnergyFromEntry:", v13);
          v9 = v9 + v16;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
      v10 = 0.0;
      v11 = 0.0;
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D80078], "getIdentifierFromEntry:", v22, v36);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11 > 0.0)
          {
            -[PLCoalitionAgent getCPUWeightFromEntry:](self, "getCPUWeightFromEntry:", v22);
            if (v24 > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 / v11);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setObject:forKeyedSubscript:", v25, v23);

            }
          }
          if (v10 > 0.0)
          {
            -[PLCoalitionAgent getGPUWeightFromEntry:](self, "getGPUWeightFromEntry:", v22);
            if (v26 > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26 / v10);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKeyedSubscript:", v27, v23);

            }
          }
          if (v9 > 0.0)
          {
            -[PLCoalitionAgent getANEEnergyFromEntry:](self, "getANEEnergyFromEntry:", v22);
            if (v28 > 0.0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28 / v9);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v29, v23);

            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v19);
    }

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoalitionAgent currentDate](self, "currentDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, v39, v31);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoalitionAgent currentDate](self, "currentDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 34, v38, v33);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCoalitionAgent currentDate](self, "currentDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 52, v37, v35);

    v4 = v36;
  }

}

- (double)getGPUTimeFromEntry:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("gpu_time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)getCPUWeightFromEntry:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (qword_1ED8837C8 != -1)
    dispatch_once(&qword_1ED8837C8, &__block_literal_global_571);
  if ((byte_1ED8837A2 & 1) != 0)
    -[PLCoalitionAgent getCPUVoucherTimeFromEntry:](self, "getCPUVoucherTimeFromEntry:", v4);
  else
    -[PLCoalitionAgent getCPUEnergyFromEntry:](self, "getCPUEnergyFromEntry:", v4);
  v6 = v5;

  return v6;
}

- (double)getCPUEnergyFromEntry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double result;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("energy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("energy_billed_to_me"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v6 + v8;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("energy_billed_to_others"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v9 - v11;

  result = 0.0;
  if (v12 >= 0.0)
    return v12;
  return result;
}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogCoalition();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", &unk_1E86338D0);

    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "logEventIntervalCoalitionIntervalWithHFLFlag:", 0);
  }

}

- (void)setLastDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setLastCoalitionObjectDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setCurrentDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCoalitionAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("NANDStats");
  +[PLCoalitionAgent entryAggregateDefinitionNANDStats](PLCoalitionAgent, "entryAggregateDefinitionNANDStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionNANDStats
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80240];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8653270;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = *MEMORY[0x1E0D80250];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("LogicalWrites");
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  v21[2] = *MEMORY[0x1E0D80228];
  v15 = &unk_1E8653280;
  v13 = *MEMORY[0x1E0D80220];
  v14 = &unk_1E8653290;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = *MEMORY[0x1E0D80238];
  v22[2] = v10;
  v22[3] = &unk_1E8650918;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CoalitionDrops");
  +[PLCoalitionAgent entryEventPointDefinitionCoalitionDrop](PLCoalitionAgent, "entryEventPointDefinitionCoalitionDrop");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("CoalitionMemory");
  v7[0] = v2;
  +[PLCoalitionAgent entryEventPointDefinitionCoalitionMemory](PLCoalitionAgent, "entryEventPointDefinitionCoalitionMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventPointDefinitionCoalitionDrop
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8653270;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("bufferSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("finalSize");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionCoalitionMemory
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v25[9];
  _QWORD v26[9];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1E86532A0;
  v28[1] = MEMORY[0x1E0C9AAB0];
  v27[2] = *MEMORY[0x1E0D80250];
  v28[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("LaunchdCoalitionId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v25[1] = CFSTR("LaunchdName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("memory_wired_size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = CFSTR("memory_purgeable_size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  v25[4] = CFSTR("memory_anonmem_size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  v25[5] = CFSTR("memory_compressed_size");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v4;
  v25[6] = CFSTR("process_count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  v25[7] = CFSTR("CompressedLifetime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v8;
  v25[8] = CFSTR("Swapins");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("CoalitionInterval");
  +[PLCoalitionAgent entryEventIntervalDefinitionCoalitionUsage](PLCoalitionAgent, "entryEventIntervalDefinitionCoalitionUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventIntervalDefinitionCoalitionUsage
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v52;
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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
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
  _QWORD v86[39];
  _QWORD v87[39];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[2];
  _QWORD v91[4];

  v91[2] = *MEMORY[0x1E0C80C00];
  v90[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v88[0] = *MEMORY[0x1E0D80318];
  v88[1] = v2;
  v89[0] = &unk_1E86532B0;
  v89[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D802F8];
  v88[2] = *MEMORY[0x1E0D80250];
  v88[3] = v3;
  v89[2] = MEMORY[0x1E0C9AAB0];
  v89[3] = CFSTR("logEventIntervalCoalitionIntervalWithoutHighFreqLogging");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 4);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v85;
  v90[1] = *MEMORY[0x1E0D802F0];
  v86[0] = CFSTR("LaunchdCoalitionId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "commonTypeDict_IntegerFormat");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v83;
  v86[1] = CFSTR("LaunchdName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "commonTypeDict_StringFormat_withBundleID");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v81;
  v86[2] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "commonTypeDict_StringFormat_withBundleID");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v79;
  v86[3] = CFSTR("tasks_started");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "commonTypeDict_RealFormat");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v77;
  v86[4] = CFSTR("tasks_exited");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "commonTypeDict_RealFormat");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v75;
  v86[5] = CFSTR("time_nonempty");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_RealFormat");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v73;
  v86[6] = CFSTR("cpu_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "commonTypeDict_RealFormat");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v71;
  v86[7] = CFSTR("cpu_instructions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "commonTypeDict_IntegerFormat");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v87[7] = v69;
  v86[8] = CFSTR("interrupt_wakeups");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_RealFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v87[8] = v67;
  v86[9] = CFSTR("platform_idle_wakeups");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "commonTypeDict_RealFormat");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v87[9] = v65;
  v86[10] = CFSTR("bytesread");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "commonTypeDict_RealFormat");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v87[10] = v63;
  v86[11] = CFSTR("byteswritten");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_RealFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v87[11] = v61;
  v86[12] = CFSTR("logical_immediate_writes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "commonTypeDict_RealFormat");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v87[12] = v59;
  v86[13] = CFSTR("logical_deferred_writes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "commonTypeDict_RealFormat");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v87[13] = v57;
  v86[14] = CFSTR("logical_invalidated_writes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_RealFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v87[14] = v55;
  v86[15] = CFSTR("logical_metadata_writes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "commonTypeDict_RealFormat");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v87[15] = v53;
  v86[16] = CFSTR("gpu_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_RealFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v87[16] = v51;
  v86[17] = CFSTR("gpu_energy_nj");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v87[17] = v49;
  v86[18] = CFSTR("gpu_energy_nj_billed_to_me");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v87[18] = v47;
  v86[19] = CFSTR("gpu_energy_nj_billed_to_others");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v87[19] = v45;
  v86[20] = CFSTR("cpu_time_billed_to_me");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_RealFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v87[20] = v43;
  v86[21] = CFSTR("cpu_time_billed_to_others");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_RealFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v87[21] = v41;
  v86[22] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_DateFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v87[22] = v39;
  v86[23] = CFSTR("energy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v87[23] = v37;
  v86[24] = CFSTR("energy_billed_to_me");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v87[24] = v35;
  v86[25] = CFSTR("energy_billed_to_others");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v87[25] = v33;
  v86[26] = CFSTR("cpu_time_eqos_0");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_RealFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v87[26] = v31;
  v86[27] = CFSTR("cpu_time_eqos_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_RealFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v87[27] = v29;
  v86[28] = CFSTR("cpu_time_eqos_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_RealFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87[28] = v27;
  v86[29] = CFSTR("cpu_time_eqos_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_RealFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v87[29] = v25;
  v86[30] = CFSTR("cpu_time_eqos_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_RealFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v87[30] = v23;
  v86[31] = CFSTR("cpu_time_eqos_5");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_RealFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v87[31] = v21;
  v86[32] = CFSTR("cpu_time_eqos_6");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_RealFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v87[32] = v19;
  v86[33] = CFSTR("ane_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_RealFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v87[33] = v17;
  v86[34] = CFSTR("ane_energy_nj");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v87[34] = v15;
  v86[35] = CFSTR("cpu_ptime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v87[35] = v5;
  v86[36] = CFSTR("cpu_pinstructions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[36] = v7;
  v86[37] = CFSTR("cpu_pcycles");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[37] = v9;
  v86[38] = CFSTR("cpu_cycles");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v87[38] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PLCoalitionAgent)init
{
  PLCoalitionAgent *v2;
  PLCoalitionAgent *v3;
  NSString *driveCapacity;
  void *v5;
  uint64_t v6;
  NSDate *reportMemoryStatsAfterTime;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSDate *reportHighFrequencyMemoryStatsAfterTime;
  NSObject *v12;
  NSDate *v14;
  NSDate *v15;
  objc_super v16;
  uint8_t buf[4];
  NSDate *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PLCoalitionAgent;
  v2 = -[PLAgent init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    driveCapacity = v2->_driveCapacity;
    v2->_driveCapacity = (NSString *)CFSTR("Unknown");

    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", (double)arc4random_uniform(0x15180u));
    v6 = objc_claimAutoreleasedReturnValue();
    reportMemoryStatsAfterTime = v3->_reportMemoryStatsAfterTime;
    v3->_reportMemoryStatsAfterTime = (NSDate *)v6;

    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = v3->_reportMemoryStatsAfterTime;
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Picked random time in next 24 hours for sending stats to CA: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", (double)arc4random_uniform(0xE10u));
    v10 = objc_claimAutoreleasedReturnValue();
    reportHighFrequencyMemoryStatsAfterTime = v3->_reportHighFrequencyMemoryStatsAfterTime;
    v3->_reportHighFrequencyMemoryStatsAfterTime = (NSDate *)v10;

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = v3->_reportHighFrequencyMemoryStatsAfterTime;
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "Picked random time in next hour for sending high frequency stats to CA: %@", buf, 0xCu);
    }

  }
  return v3;
}

- (void)initOperatorDependancies
{
  uint64_t v3;
  PLEntryNotificationOperatorComposition *v4;
  PLEntryNotificationOperatorComposition *batteryLevelChanged;
  void *v6;
  void *v7;
  PLNSNotificationOperatorComposition *v8;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[5];

  v3 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke;
  v18[3] = &unk_1E8577F48;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v18);
  v4 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v4;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D80038], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoalitionAgent setStateTracker:](self, "setStateTracker:", v6);

  -[PLCoalitionAgent stateTracker](self, "stateTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_345;
  v15[3] = &unk_1E8579578;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v7, "registerForStates:withOperator:withBlock:", 1, self, v15);

  -[PLCoalitionAgent getStorageCapacity](self, "getStorageCapacity");
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_2;
  v14[3] = &unk_1E8577F48;
  v14[4] = self;
  v8 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), v14);
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v8;

  v10 = objc_alloc(MEMORY[0x1E0D80098]);
  -[PLOperator workQueue](self, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_363;
  v13[3] = &unk_1E8577F70;
  v13[4] = self;
  v12 = (void *)objc_msgSend(v10, "initWithWorkQueue:withRegistration:withBlock:", v11, &unk_1E864CC10, v13);
  -[PLCoalitionAgent setLogicalWritesResponder:](self, "setLogicalWritesResponder:", v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  PLLogCoalition();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "Coalitions: Received SBC notification!", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalCoalitionIntervalWithHFLFlag:", 0);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "lastCoalitionObjectDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logCoalitionObjectMemory:", v4);

}

void __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_345(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleStateChangeForCoalitions");

}

id __44__PLCoalitionAgent_initOperatorDependancies__block_invoke_363(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_INFO, "LogicalWritesPerApp query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "processPerAppLogicalWritesWithInfo:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:", CFSTR("LastUpgradeSystemTimestamp"));
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("lastUpgradeTimestamp"));

  return v9;
}

- (void)handleStateChangeForCoalitions
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  uint8_t v8[16];

  -[PLCoalitionAgent lastDate](self, "lastDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = fabs(v5);

  if (v6 <= 300.0)
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_INFO, "Frequent Plugged / Unplugged events, not logging to Coalitions", v8, 2u);
    }

  }
  else
  {
    -[PLCoalitionAgent logEventIntervalCoalitionIntervalWithHFLFlag:](self, "logEventIntervalCoalitionIntervalWithHFLFlag:", 0);
  }
}

- (void)getStorageCapacity
{
  unint64_t v3;
  id v4;

  v3 = -[PLCoalitionAgent readPropertyFromRegistry:](self, "readPropertyFromRegistry:", CFSTR("Device Characteristics"));
  if (v3
    || (v3 = -[PLCoalitionAgent readPropertyFromRegistry:](self, "readPropertyFromRegistry:", CFSTR("Controller Characteristics"))) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), (unint64_t)((double)v3 / 1000000000.0));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PLCoalitionAgent setDriveCapacity:](self, "setDriveCapacity:", v4);

  }
  else
  {
    -[PLCoalitionAgent setDriveCapacity:](self, "setDriveCapacity:", CFSTR("Unknown"));
  }
}

- (unint64_t)readPropertyFromRegistry:(__CFString *)a3
{
  mach_port_t v4;
  const __CFDictionary *v5;
  kern_return_t MatchingServices;
  kern_return_t v7;
  NSObject *v8;
  io_object_t v10;
  io_registry_entry_t v11;
  const __CFAllocator *v12;
  CFTypeRef v13;
  CFTypeID v14;
  CFTypeID TypeID;
  const __CFDictionary *ValueAtIndex;
  CFTypeID v17;
  const __CFNumber *Value;
  const __CFNumber *v19;
  CFTypeID v20;
  NSObject *v21;
  unint64_t valuePtr;
  io_iterator_t existing;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  CFTypeRef v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  existing = 0;
  valuePtr = 0;
  v4 = *MEMORY[0x1E0CBBAB8];
  v5 = IOServiceMatching("IOMedia");
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  if (MatchingServices)
  {
    v7 = MatchingServices;
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v7;
      _os_log_error_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_ERROR, "IOServiceGetMatchingServices kernResult %x\n", buf, 8u);
    }

    return 0;
  }
  v10 = IOIteratorNext(existing);
  if (v10)
  {
    v11 = v10;
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      v13 = IORegistryEntrySearchCFProperty(v11, "IOService", a3, v12, 3u);
      IOObjectRelease(v11);
      if (!v13)
        break;
      v14 = CFGetTypeID(v13);
      TypeID = CFDictionaryGetTypeID();
      ValueAtIndex = (const __CFDictionary *)v13;
      if (v14 != TypeID)
      {
        v17 = CFGetTypeID(v13);
        if (v17 != CFArrayGetTypeID())
        {
          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v25 = a3;
            v26 = 2112;
            v27 = v13;
            _os_log_error_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_ERROR, "Unknown datatype for property: %@ data : %@", buf, 0x16u);
          }

          goto LABEL_17;
        }
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v13, 0);
      }
      Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("capacity"));
      if (Value)
      {
        v19 = Value;
        v20 = CFGetTypeID(Value);
        if (v20 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v19, kCFNumberSInt64Type, &valuePtr);
          CFRelease(v13);
          break;
        }
      }
      CFRelease(v13);
LABEL_17:
      v11 = IOIteratorNext(existing);
    }
    while (v11);
  }
  if (existing)
    IOObjectRelease(existing);
  return valuePtr;
}

- (void)logToCAProcessMemory:(id)a3 andAccumulatedMemory:(id)a4 dailyReport:(BOOL)a5 systemUptime:(unint64_t)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  double v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  signed int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  double v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  id v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  id (*v67)(uint64_t);
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  id (*v72)(uint64_t);
  void *v73;
  id v74;
  uint64_t v75;
  int v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  id (*v83)(uint64_t);
  void *v84;
  id v85;
  uint64_t v86;
  int v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  id (*v94)(uint64_t);
  void *v95;
  NSObject *v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  id (*v101)(uint64_t);
  void *v102;
  NSObject *v103;
  uint64_t v104;
  int v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;
  id (*v112)(uint64_t);
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id (*v117)(uint64_t);
  void *v118;
  id v119;
  BOOL v120;
  uint64_t v121;
  uint64_t v122;
  id (*v123)(uint64_t);
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  id (*v128)(uint64_t);
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  id (*v133)(uint64_t);
  void *v134;
  id v135;
  BOOL v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint8_t v140[128];
  uint8_t buf[4];
  uint64_t v142;
  __int16 v143;
  unint64_t v144;
  uint64_t v145;

  v7 = a5;
  v145 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v58 = a4;
  if (!v7)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = (unint64_t)(v11 / 86400.0);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "objectExistsForKey:", CFSTR("MemoryCoreAnalyticsLastReportedDayNumber")))
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:synchronize:", CFSTR("MemoryCoreAnalyticsLastReportedDayNumber"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedLongLongValue");

  }
  else
  {
    v14 = 0;
  }
  if (v14 < v12)
  {
    v15 = (void *)MEMORY[0x1E0D7FFA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:saveToDisk:", v16, CFSTR("MemoryCoreAnalyticsLastReportedDayNumber"), 1);

    AnalyticsSendEventLazy();
LABEL_7:
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v142 = objc_msgSend(v9, "count");
      _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "Log Process Memory Stats to CA  count %lu", buf, 0xCu);
    }

    v18 = arc4random_uniform(objc_msgSend(v9, "count"));
    v59 = v9;
    if (objc_msgSend(v9, "count"))
    {
      v19 = v18;
      v20 = 1;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", (int)((v19 + v20 - 1) % (unint64_t)objc_msgSend(v9, "count")));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "phys_footprint_size");
        v23 = v22 > (int)(objc_msgSend(v21, "memoryLimitMB") << 20);
        if (v7)
        {
          v131 = MEMORY[0x1E0C809B0];
          v24 = MEMORY[0x1E0C809B0];
          v132 = 3221225472;
          v133 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_390;
          v134 = &unk_1E857D4B8;
          v135 = v21;
          v136 = v23;
          AnalyticsSendEventLazy();
          v126 = v24;
          v127 = 3221225472;
          v128 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_2;
          v129 = &unk_1E8578178;
          v130 = v135;
          AnalyticsSendEventLazy();
          v121 = MEMORY[0x1E0C809B0];
          v122 = 3221225472;
          v123 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_3;
          v124 = &unk_1E8578178;
          v125 = v130;
          AnalyticsSendEventLazy();

        }
        v115 = MEMORY[0x1E0C809B0];
        v116 = 3221225472;
        v117 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_4;
        v118 = &unk_1E857D4B8;
        v25 = v21;
        v119 = v25;
        v120 = v23;
        AnalyticsSendEventLazy();
        if ((unint64_t)objc_msgSend(v25, "neural_footprint") >= 0x401)
        {
          v110 = MEMORY[0x1E0C809B0];
          v111 = 3221225472;
          v112 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_5;
          v113 = &unk_1E8578178;
          v114 = v25;
          AnalyticsSendEventLazy();

        }
        v9 = v59;
      }
      while (objc_msgSend(v59, "count") > (unint64_t)v20++);
    }
    objc_msgSend(MEMORY[0x1E0D80078], "roundToSigFigDouble:withSigFig:", 2, (double)a6 / 3.6e12);
    v28 = (int)v27;
    objc_msgSend(v58, "memoryUsageAtEachPriority");
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v106, v140, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v107;
      v32 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v107 != v31)
            objc_enumerationMutation(obj);
          v34 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
          v99 = v32;
          v100 = 3221225472;
          v101 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_6;
          v102 = &unk_1E857B3A0;
          v103 = obj;
          v104 = v34;
          v105 = v28;
          AnalyticsSendEventLazy();
          v92 = v32;
          v93 = 3221225472;
          v94 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_7;
          v95 = &unk_1E857B3A0;
          v35 = v103;
          v96 = v35;
          v97 = v34;
          v98 = v28;
          AnalyticsSendEventLazy();

        }
        v30 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v106, v140, 16);
      }
      while (v30);
    }

    objc_msgSend(v58, "memoryUsedAtOrAboveEachPriority");
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v88, v139, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v89 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * j);
          v81 = MEMORY[0x1E0C809B0];
          v82 = 3221225472;
          v83 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_8;
          v84 = &unk_1E857B3A0;
          v42 = v36;
          v85 = v42;
          v86 = v41;
          v87 = v28;
          AnalyticsSendEventLazy();

        }
        v38 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v88, v139, 16);
      }
      while (v38);
    }
    v57 = v36;

    objc_msgSend(v58, "memoryAvailableAtOrBelowEachPriority");
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v77, v138, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v78 != v46)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
          v70 = MEMORY[0x1E0C809B0];
          v71 = 3221225472;
          v72 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_9;
          v73 = &unk_1E857B3A0;
          v49 = v43;
          v74 = v49;
          v75 = v48;
          v76 = v28;
          AnalyticsSendEventLazy();

        }
        v45 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v77, v138, 16);
      }
      while (v45);
    }

    objc_msgSend(v58, "systemMemoryStatsDictionary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = MEMORY[0x1E0C809B0];
    v66 = 3221225472;
    v67 = __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_10;
    v68 = &unk_1E8578178;
    v69 = v50;
    AnalyticsSendEventLazy();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v51 = v69;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v137, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v62;
      do
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v62 != v54)
            objc_enumerationMutation(v51);
          v56 = v51;
          AnalyticsSendEventLazy();

        }
        v53 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v61, v137, 16);
      }
      while (v53);
    }

    v9 = v59;
    goto LABEL_47;
  }
  PLLogCommon();
  obj = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v142 = v12;
    v143 = 2048;
    v144 = v14;
    _os_log_debug_impl(&dword_1CAF47000, obj, OS_LOG_TYPE_DEBUG, "Don't Log Coalition Memory Stats to CA, since same day as most recent logging (current_day=%llu is less then or equal to most_recent_day=%llu)", buf, 0x16u);
  }
LABEL_47:

}

void *__87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke()
{
  return &unk_1E864CC38;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_390(uint64_t a1)
{
  id v2;
  int v3;
  void *v4;
  void *v5;
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
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
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

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isDaemonXPCService");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("daemon_procname"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("daemon_procname"));
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("daemon_jetsam_priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "process_active"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("daemon_active"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("daemon_footprint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "peak_phys_footprint") >> 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("daemon_peak_footprint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_phys_footprint") >> 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("daemon_interval_peak_footprint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("daemon_neural_footprint_kb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_neural_footprint") >> 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("daemon_interval_peak_neural_footprint_kb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "memoryLimitMB"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("daemon_memory_limit_mb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitHard"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("daemon_memory_limit_hard"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isActiveLimit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("daemon_memory_limit_active"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitIncreased"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("daemon_memory_limit_increased"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("daemon_footprint_over_limit");
  }
  else
  {
    objc_msgSend(v4, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("app_bundleid"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("app_bundleid"));
    }

    objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("app_bundleversion"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("app_bundleversion"));
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("app_jetsam_priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("app_footprint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "peak_phys_footprint") >> 10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("app_peak_footprint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_phys_footprint") >> 10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("app_interval_peak_footprint"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("app_neural_footprint_kb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_neural_footprint") >> 10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v29, CFSTR("app_interval_peak_neural_footprint_kb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "memoryLimitMB"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v30, CFSTR("app_memory_limit_mb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitHard"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v31, CFSTR("app_memory_limit_hard"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isActiveLimit"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v32, CFSTR("app_memory_limit_active"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isLimitIncreased"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v33, CFSTR("app_memory_limit_increased"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("app_footprint_over_limit");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, v21);

  return v2;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D80078];
  objc_msgSend(*(id *)(a1 + 32), "processLaunchdName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intervalPeakCADictionaryForLaunchdName:intervalMaxKB:", v3, (unint64_t)objc_msgSend(*(id *)(a1 + 32), "interval_peak_phys_footprint") >> 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("launchd_name");
  objc_msgSend(*(id *)(a1 + 32), "processLaunchdName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = CFSTR("UNKNOWN");
  v15[0] = v4;
  v14[1] = CFSTR("procname");
  objc_msgSend(*(id *)(a1 + 32), "processName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("UNKNOWN");
  v15[1] = v7;
  v14[2] = CFSTR("bundleid");
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("UNKNOWN");
  v15[2] = v10;
  v14[3] = CFSTR("is_daemon_or_xpc_service");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isDaemonXPCService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_4(uint64_t a1)
{
  id v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isDaemonXPCService");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("daemon_procname"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("daemon_procname"));
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("daemon_jetsam_priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "process_active"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("daemon_active"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("daemon_footprint_kb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("daemon_footprint_over_limit");
  }
  else
  {
    objc_msgSend(v4, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("app_bundleid"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("app_bundleid"));
    }

    objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("app_bundleversion"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("app_bundleversion"));
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("app_jetsam_priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "phys_footprint_size") >> 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("app_footprint_kb"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("app_footprint_over_limit");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v13);

  return v2;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_5(uint64_t a1)
{
  id v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isDaemonXPCService");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("daemon_procname"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("daemon_procname"));
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("daemon_jetsam_priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "process_active"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("daemon_active"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("daemon_neural_footprint_kb");
  }
  else
  {
    objc_msgSend(v4, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("app_bundleid"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("app_bundleid"));
    }

    objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("app_bundleversion"));

    }
    else
    {
      objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UNKNOWN"), CFSTR("app_bundleversion"));
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "jetsam_priority"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("app_jetsam_priority"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "neural_footprint") >> 10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("app_neural_footprint_kb");
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v12);

  return v2;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_6(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  v9[0] = *(_QWORD *)(a1 + 40);
  v8[0] = CFSTR("at_priority");
  v8[1] = CFSTR("footprint_sum_kb");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3 >> 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("system_uptime_hours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_7(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("priority%@"), *(_QWORD *)(a1 + 40), CFSTR("memory_type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("memory_kb");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3 >> 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("system_uptime_hours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_8(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  v9[0] = *(_QWORD *)(a1 + 40);
  v8[0] = CFSTR("at_or_above_priority");
  v8[1] = CFSTR("footprint_sum_kb");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3 >> 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("system_uptime_hours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_9(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongValue");

  v9[0] = *(_QWORD *)(a1 + 40);
  v8[0] = CFSTR("at_or_below_priority");
  v8[1] = CFSTR("footprint_sum_kb");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3 >> 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("system_uptime_hours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_10(uint64_t a1)
{
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("footprints_report"));
  return v1;
}

id __87__PLCoalitionAgent_logToCAProcessMemory_andAccumulatedMemory_dailyReport_systemUptime___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v9[0] = v3;
  v8[0] = CFSTR("memory_type");
  v8[1] = CFSTR("memory_kb");
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("system_uptime_hours");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)processMemoryUsageWithPid:(int)a3 withLaunchdName:(id)a4 withRusage:(void *)a5 withJetsamInfo:(void *)a6 withLimitInfo:(process_memory_limit_info *)a7
{
  uint64_t v10;
  id v11;
  ProcessMemoryUsage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = objc_alloc_init(ProcessMemoryUsage);
  -[ProcessMemoryUsage setPhys_footprint_size:](v12, "setPhys_footprint_size:", *((_QWORD *)a5 + 9));
  -[ProcessMemoryUsage setPeak_phys_footprint:](v12, "setPeak_phys_footprint:", *((_QWORD *)a5 + 30));
  -[ProcessMemoryUsage setInterval_peak_phys_footprint:](v12, "setInterval_peak_phys_footprint:", *((_QWORD *)a5 + 35));
  -[ProcessMemoryUsage setNeural_footprint:](v12, "setNeural_footprint:", *((_QWORD *)a5 + 46));
  -[ProcessMemoryUsage setInterval_peak_neural_footprint:](v12, "setInterval_peak_neural_footprint:", *((_QWORD *)a5 + 48));
  -[ProcessMemoryUsage setJetsam_priority:](v12, "setJetsam_priority:", *(unsigned int *)a6);
  -[ProcessMemoryUsage setProcess_active:](v12, "setProcess_active:", *((unsigned __int8 *)a6 + 4));
  -[ProcessMemoryUsage setMemoryLimitMB:](v12, "setMemoryLimitMB:", a7->var0);
  -[ProcessMemoryUsage setIsLimitHard:](v12, "setIsLimitHard:", a7->var1);
  -[ProcessMemoryUsage setIsActiveLimit:](v12, "setIsActiveLimit:", a7->var2);
  -[ProcessMemoryUsage setIsLimitIncreased:](v12, "setIsLimitIncreased:", a7->var3);
  -[ProcessMemoryUsage setIsDaemonXPCService:](v12, "setIsDaemonXPCService:", objc_msgSend(MEMORY[0x1E0D80078], "isDaemonOrAppleXPCService:", v10));
  if (-[ProcessMemoryUsage isDaemonXPCService](v12, "isDaemonXPCService"))
  {
    objc_msgSend(MEMORY[0x1E0D80078], "binaryPathForPid:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProcessMemoryUsage setProcessName:](v12, "setProcessName:", v14);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D80078], "bundleIDFromPid:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProcessMemoryUsage setBundleId:](v12, "setBundleId:", v15);

  -[ProcessMemoryUsage bundleId](v12, "bundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "binaryPathForPid:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProcessMemoryUsage setBundleId:](v12, "setBundleId:", v14);
    goto LABEL_7;
  }
  -[ProcessMemoryUsage setBundleVersion:](v12, "setBundleVersion:", 0);
  -[ProcessMemoryUsage bundleId](v12, "bundleId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLApplicationAgent appVersionForBundle:](PLApplicationAgent, "appVersionForBundle:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProcessMemoryUsage setBundleVersion:](v12, "setBundleVersion:", v18);

  -[ProcessMemoryUsage bundleVersion](v12, "bundleVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(MEMORY[0x1E0D80078], "binaryPathForPid:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleVersionFromURL:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProcessMemoryUsage setBundleVersion:](v12, "setBundleVersion:", v14);
    goto LABEL_7;
  }
LABEL_8:
  -[ProcessMemoryUsage setProcessLaunchdName:](v12, "setProcessLaunchdName:", v11);

  return v12;
}

- (void)logCoalitionObjectMemory:(id)a3
{
  void *v4;
  NSComparisonResult v5;
  NSComparisonResult v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  unsigned int v10;
  int v11;
  size_t v12;
  int *v13;
  int *v14;
  id v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSDate *v47;
  void *v48;
  void *v49;
  _BOOL4 v51;
  unint64_t v52;
  int *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  void *v57;
  CoalitionMemoryUsage *v58;
  void *v59;
  int v60;
  int v61;
  NSObject *v62;
  uint64_t service_name_from_pid;
  void *v64;
  int v65;
  int v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  kern_return_t v70;
  kern_return_t v71;
  NSObject *v72;
  kern_return_t v73;
  kern_return_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  NSDate *reportMemoryStatsAfterTime;
  const __CFString *v83;
  NSDate *reportHighFrequencyMemoryStatsAfterTime;
  uint64_t v85;
  __uint64_t v86;
  NSComparisonResult v87;
  void *v88;
  NSComparisonResult v89;
  OverallMemoryUsage *v90;
  id v91;
  int *v92;
  uint64_t v93;
  void *v94;
  PLCoalitionAgent *v95;
  id v96;
  uint64_t v97;
  void *obj;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  mach_port_name_t tn[2];
  uint64_t v104;
  _OWORD v105[2];
  uint64_t v106;
  void *v107;
  void *v108;
  uint8_t v109[128];
  uint8_t v110[8];
  __int16 v111;
  int v112;
  uint8_t buf[16];
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
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _OWORD v134[2];
  int v135;
  rusage_info_t v136[4];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _OWORD buffer[12];
  uint64_t v165;

  v165 = *MEMORY[0x1E0C80C00];
  v96 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDate compare:](self->_reportMemoryStatsAfterTime, "compare:", v4);
  v95 = self;
  v6 = -[NSDate compare:](self->_reportHighFrequencyMemoryStatsAfterTime, "compare:", v4);
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v81 = CFSTR("Not");
    reportMemoryStatsAfterTime = v95->_reportMemoryStatsAfterTime;
    LODWORD(v136[0]) = 138412802;
    if (v5 == NSOrderedAscending)
      v81 = &stru_1E8587D00;
    *(rusage_info_t *)((char *)v136 + 4) = (rusage_info_t)v81;
    WORD2(v136[1]) = 2112;
    *(rusage_info_t *)((char *)&v136[1] + 6) = v4;
    HIWORD(v136[2]) = 2112;
    v136[3] = reportMemoryStatsAfterTime;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Should %@ Log to CoreAnalytics (current_time=%@ is greater than report_stats_time=%@)", (uint8_t *)v136, 0x20u);
  }

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v83 = CFSTR("Not");
    reportHighFrequencyMemoryStatsAfterTime = v95->_reportHighFrequencyMemoryStatsAfterTime;
    LODWORD(v136[0]) = 138412802;
    if (v6 == NSOrderedAscending)
      v83 = &stru_1E8587D00;
    *(rusage_info_t *)((char *)v136 + 4) = (rusage_info_t)v83;
    WORD2(v136[1]) = 2112;
    *(rusage_info_t *)((char *)&v136[1] + 6) = v4;
    HIWORD(v136[2]) = 2112;
    v136[3] = reportHighFrequencyMemoryStatsAfterTime;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Should %@ Log to High Frequency CoreAnalytics (current_time=%@ is greater than high_freq_report_stats_time=%@)", (uint8_t *)v136, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "isTaskFullEPLMode") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "hasGenerativeModelSystems") & 1) != 0
    || (v5 != NSOrderedAscending ? (v9 = v6 == NSOrderedAscending) : (v9 = 1), v9))
  {
    v10 = proc_listpids(1u, 0, 0, 0);
    if ((v10 & 0x80000000) == 0)
    {
      v11 = v10;
      v12 = v10;
      v13 = (int *)malloc_type_malloc(v10, 0x658624CBuLL);
      if (v13)
      {
        v14 = v13;
        v88 = v4;
        v89 = v6;
        v85 = 104;
        memset(v13, 255, v12);
        v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v86 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
        v90 = objc_alloc_init(OverallMemoryUsage);
        v92 = v14;
        v16 = proc_listpids(1u, 0, v14, v11);
        v94 = v15;
        if (v16 >= 4)
        {
          v51 = v5 == NSOrderedAscending || v6 == NSOrderedAscending;
          if ((unint64_t)v16 >> 2 <= 1)
            v52 = 1;
          else
            v52 = (unint64_t)v16 >> 2;
          v53 = v92;
          do
          {
            v55 = *v53++;
            v54 = v55;
            if (v55 >= 1)
            {
              memset(buffer, 0, sizeof(buffer));
              if (proc_pidinfo(v54, 18, 0, buffer, 192) == 192 && DWORD1(buffer[0]) != 5)
              {
                v106 = 0;
                memset(v105, 0, sizeof(v105));
                if (proc_pidinfo(v54, 20, 1uLL, v105, 40) == 40)
                {
                  v56 = *(_QWORD *)&v105[0];
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v105[0]);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v57);
                  v58 = (CoalitionMemoryUsage *)objc_claimAutoreleasedReturnValue();

                  if (!v58)
                  {
                    v58 = objc_alloc_init(CoalitionMemoryUsage);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "setObject:forKeyedSubscript:", v58, v59);

                  }
                  v104 = 0;
                  if (v51)
                    v104 = objc_msgSend(MEMORY[0x1E0D80078], "getProcessMemoryLimit:", v54);
                  v163 = 0u;
                  v162 = 0u;
                  v161 = 0u;
                  v160 = 0u;
                  v159 = 0u;
                  v158 = 0u;
                  v157 = 0u;
                  v156 = 0u;
                  v155 = 0u;
                  v154 = 0u;
                  v153 = 0u;
                  v152 = 0u;
                  v151 = 0u;
                  v150 = 0u;
                  v148 = 0u;
                  v149 = 0u;
                  v146 = 0u;
                  v147 = 0u;
                  v144 = 0u;
                  v145 = 0u;
                  v142 = 0u;
                  v143 = 0u;
                  v140 = 0u;
                  v141 = 0u;
                  v138 = 0u;
                  v139 = 0u;
                  v137 = 0u;
                  memset(v136, 0, sizeof(v136));
                  v60 = proc_pid_rusage(v54, 6, v136);
                  if (v60)
                  {
                    v61 = v60;
                    PLLogCommon();
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)&buf[4] = v61;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v54;
                      _os_log_error_impl(&dword_1CAF47000, v62, OS_LOG_TYPE_ERROR, "rusage failed with %d for pid %d", buf, 0xEu);
                    }
                  }
                  else
                  {
                    if (v5 == NSOrderedAscending)
                    {
                      service_name_from_pid = xpc_get_service_name_from_pid();
                      if (service_name_from_pid)
                      {
                        v64 = (void *)service_name_from_pid;
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", service_name_from_pid);
                        v62 = objc_claimAutoreleasedReturnValue();
                        free(v64);
                      }
                      else
                      {
                        v62 = 0;
                      }
                      v65 = proc_reset_footprint_interval();
                      if (v65)
                      {
                        v66 = v65;
                        PLLogCommon();
                        v67 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 67109376;
                          *(_DWORD *)&buf[4] = v66;
                          *(_WORD *)&buf[8] = 1024;
                          *(_DWORD *)&buf[10] = v54;
                          _os_log_debug_impl(&dword_1CAF47000, v67, OS_LOG_TYPE_DEBUG, "proc_reset_footprint_interval failed with %d for pid %d", buf, 0xEu);
                        }

                      }
                    }
                    else
                    {
                      v62 = 0;
                    }
                    v68 = -[CoalitionMemoryUsage wired_size](v58, "wired_size", v85);
                    -[CoalitionMemoryUsage setWired_size:](v58, "setWired_size:", *((_QWORD *)&v138 + 1) + v68);
                    v69 = -[CoalitionMemoryUsage phys_footprint_size](v58, "phys_footprint_size");
                    -[CoalitionMemoryUsage setPhys_footprint_size:](v58, "setPhys_footprint_size:", *((_QWORD *)&v139 + 1) + v69);
                    -[CoalitionMemoryUsage setProcess_phys_footprint_size:](v58, "setProcess_phys_footprint_size:", *((_QWORD *)&v139 + 1));
                    -[CoalitionMemoryUsage setProcess_peak_phys_footprint:](v58, "setProcess_peak_phys_footprint:", (_QWORD)v150);
                    -[CoalitionMemoryUsage setProcess_count:](v58, "setProcess_count:", -[CoalitionMemoryUsage process_count](v58, "process_count") + 1);
                    *(_QWORD *)tn = 0;
                    v135 = 0;
                    memset(v134, 0, sizeof(v134));
                    v132 = 0u;
                    v133 = 0u;
                    v130 = 0u;
                    v131 = 0u;
                    v128 = 0u;
                    v129 = 0u;
                    v126 = 0u;
                    v127 = 0u;
                    v124 = 0u;
                    v125 = 0u;
                    v122 = 0u;
                    v123 = 0u;
                    v120 = 0u;
                    v121 = 0u;
                    v118 = 0u;
                    v119 = 0u;
                    v116 = 0u;
                    v117 = 0u;
                    v114 = 0u;
                    v115 = 0u;
                    *(_OWORD *)buf = 0u;
                    v70 = task_name_for_pid(*MEMORY[0x1E0C83DA0], v54, &tn[1]);
                    if (v70)
                    {
                      v71 = v70;
                      PLLogCommon();
                      v72 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v110 = 67109376;
                        *(_DWORD *)&v110[4] = v71;
                        v111 = 1024;
                        v112 = v54;
                        _os_log_error_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_ERROR, "task_name_for_pid failed with %d for pid %d", v110, 0xEu);
                      }

                    }
                    else
                    {
                      tn[0] = 93;
                      v73 = task_info(tn[1], 0x17u, (task_info_t)buf, tn);
                      if (v73)
                      {
                        v74 = v73;
                        PLLogCommon();
                        v75 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v110 = 67109376;
                          *(_DWORD *)&v110[4] = v74;
                          v111 = 1024;
                          v112 = v54;
                          _os_log_error_impl(&dword_1CAF47000, v75, OS_LOG_TYPE_ERROR, "task_info failed with %d for pid %d", v110, 0xEu);
                        }

                      }
                      else
                      {
                        v76 = -[CoalitionMemoryUsage purgeable_size](v58, "purgeable_size");
                        -[CoalitionMemoryUsage setPurgeable_size:](v58, "setPurgeable_size:", *((_QWORD *)&v119 + 1) + v76);
                        v77 = -[CoalitionMemoryUsage compressed_size](v58, "compressed_size");
                        -[CoalitionMemoryUsage setCompressed_size:](v58, "setCompressed_size:", *((_QWORD *)&v120 + 1) + v77);
                        v78 = -[CoalitionMemoryUsage compressed_lifetime](v58, "compressed_lifetime");
                        -[CoalitionMemoryUsage setCompressed_lifetime:](v58, "setCompressed_lifetime:", *((_QWORD *)&v121 + 1) + v78);
                        -[CoalitionMemoryUsage setLedger_swapins:](v58, "setLedger_swapins:", *(_QWORD *)((char *)v134 + 12) + -[CoalitionMemoryUsage ledger_swapins](v58, "ledger_swapins"));
                      }
                      mach_port_deallocate(*MEMORY[0x1E0C83DA0], tn[1]);
                    }
                    v15 = v94;
                    *(_QWORD *)v110 = 0;
                    *(_QWORD *)v110 = objc_msgSend(MEMORY[0x1E0D80078], "getJetamPriority:", v54);
                    -[CoalitionMemoryUsage setProcess_jetsam_priority:](v58, "setProcess_jetsam_priority:", *(_QWORD *)v110);
                    if (v51)
                    {
                      objc_msgSend(MEMORY[0x1E0D80078], "cleanLaunchdName:", v62);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PLCoalitionAgent processMemoryUsageWithPid:withLaunchdName:withRusage:withJetsamInfo:withLimitInfo:](v95, "processMemoryUsageWithPid:withLaunchdName:withRusage:withJetsamInfo:withLimitInfo:", v54, v79, v136, v110, &v104);
                      v80 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v91, "addObject:", v80);
                      -[OverallMemoryUsage addProcessFootprint:withPriority:](v90, "addProcessFootprint:withPriority:", objc_msgSend(v80, "phys_footprint_size"), objc_msgSend(v80, "jetsam_priority"));

                      v15 = v94;
                    }
                  }

                }
              }
            }
            --v52;
          }
          while (v52);
        }
        v87 = v5;
        v17 = (void *)objc_opt_new();
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        objc_msgSend(v15, "allKeys");
        obj = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v100;
          v93 = *MEMORY[0x1E0D80390];
          do
          {
            v21 = 0;
            v97 = v19;
            do
            {
              if (*(_QWORD *)v100 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v21);
              objc_msgSend(v15, "objectForKeyedSubscript:", v22, v85);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v23, "phys_footprint_size") >= 0xE4E1C0)
              {
                v24 = v17;
                objc_msgSend(v96, "objectForKeyedSubscript:", v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_alloc(MEMORY[0x1E0D7FFB0]);
                +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", v93, CFSTR("CoalitionMemory"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLCoalitionAgent currentDate](v95, "currentDate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = (void *)objc_msgSend(v26, "initWithEntryKey:withDate:", v27, v28);

                objc_msgSend(v25, "bundleID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v27) = objc_msgSend(v30, "isEqualToString:", &stru_1E8587D00);

                if ((_DWORD)v27)
                {
                  objc_msgSend(v25, "launchdName");
                  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (v31)
                  {
                    objc_msgSend(v25, "launchdName");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("LaunchdName"));

LABEL_25:
                    v17 = v24;

                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v22, CFSTR("LaunchdCoalitionId"));
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "wired_size"));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("memory_wired_size"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "purgeable_size"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, CFSTR("memory_purgeable_size"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "phys_footprint_size"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, CFSTR("memory_anonmem_size"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "compressed_size"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v38, CFSTR("memory_compressed_size"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "process_count"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v39, CFSTR("process_count"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "process_phys_footprint_size"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v40, CFSTR("process_phys_footprint"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "process_peak_phys_footprint"));
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v41, CFSTR("peak_phys_footprint"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "compressed_lifetime"));
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v42, CFSTR("CompressedLifetime"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v23, "ledger_swapins"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "setObject:forKeyedSubscript:", v43, CFSTR("Swapins"));

                    objc_msgSend(v24, "addObject:", v29);
                    v15 = v94;
                    v19 = v97;
                    goto LABEL_26;
                  }
                  v33 = v29;
                  v34 = CFSTR("Unnamed_launchdName");
                }
                else
                {
                  objc_msgSend(v25, "bundleID");
                  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v33 = v29;
                  v34 = v31;
                }
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, CFSTR("LaunchdName"));
                goto LABEL_25;
              }
LABEL_26:

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v109, 16);
          }
          while (v19);
        }

        v4 = v88;
        if (v87 == NSOrderedAscending || v89 == NSOrderedAscending)
        {
          if (v87 == NSOrderedAscending)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
            v44 = objc_claimAutoreleasedReturnValue();
            v45 = *(Class *)((char *)&v95->super.super.super.isa + v85);
            *(Class *)((char *)&v95->super.super.super.isa + v85) = (Class)v44;

          }
          objc_msgSend(v88, "dateByAddingTimeInterval:", (double)arc4random_uniform(0xE10u) + 1800.0);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = v95->_reportHighFrequencyMemoryStatsAfterTime;
          v95->_reportHighFrequencyMemoryStatsAfterTime = (NSDate *)v46;

          -[PLCoalitionAgent logToCAProcessMemory:andAccumulatedMemory:dailyReport:systemUptime:](v95, "logToCAProcessMemory:andAccumulatedMemory:dailyReport:systemUptime:", v91, v90, v87 == NSOrderedAscending, v86);
        }
        +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("CoalitionMemory"), v85);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v107 = v48;
          v108 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLOperator logEntries:withGroupID:](v95, "logEntries:withGroupID:", v49, v48);

        }
        free(v92);

      }
    }
  }

}

id __30__PLCoalitionAgent_logToAggd___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("bytes_read"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("bytes_written"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("logical_writes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("fs_metadata_writes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[9]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("pm_writes"));

  return v2;
}

id __30__PLCoalitionAgent_logToAggd___block_invoke_2(_QWORD *a1)
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
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[4], CFSTR("label"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("cpu_time"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("wakeups"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("interrupts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("disk_bytes_read"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[9]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("bytes_written_immediate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[10]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("bytes_written_deferred"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[11]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("bytes_written_meta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[12]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("bytes_written_inv"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[13]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("gpu_time"));

  return v2;
}

uint64_t __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_40 = result;
  return result;
}

uint64_t __49__PLCoalitionAgent_logCoalitionObjectDifference___block_invoke_567(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837A1 = result;
  return result;
}

- (double)getCPUVoucherTimeFromEntry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double result;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cpu_time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cpu_time_billed_to_me"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v6 + v8;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cpu_time_billed_to_others"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v9 - v11;

  result = 0.0;
  if (v12 >= 0.0)
    return v12;
  return result;
}

- (double)getGPUEnergyFromEntry:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double result;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gpu_energy_nj"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gpu_energy_nj_billed_to_me"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v6 + v8;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gpu_energy_nj_billed_to_others"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v9 - v11;

  result = 0.0;
  if (v12 >= 0.0)
    return v12;
  return result;
}

uint64_t __42__PLCoalitionAgent_getCPUWeightFromEntry___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassIsOneOf:", 1001003, 1001004, 1001005, 1001006, 1001007, 1001008, 1001009, 0);
  if ((_DWORD)result)
    byte_1ED8837A2 = 1;
  return result;
}

- (double)getGPUWeightFromEntry:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (qword_1ED8837D0 != -1)
    dispatch_once(&qword_1ED8837D0, &__block_literal_global_572);
  if (byte_1ED8837A3 == 1)
    -[PLCoalitionAgent getGPUEnergyFromEntry:](self, "getGPUEnergyFromEntry:", v4);
  else
    -[PLCoalitionAgent getGPUTimeFromEntry:](self, "getGPUTimeFromEntry:", v4);
  v6 = v5;

  return v6;
}

uint64_t __42__PLCoalitionAgent_getGPUWeightFromEntry___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
  if ((int)result >= 1001021)
    byte_1ED8837A3 = 1;
  return result;
}

uint64_t __48__PLCoalitionAgent_getCoalitionInfoWithHFLFlag___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837A4 = result;
  return result;
}

- (double)getANEEnergyFromEntry:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ane_energy_nj"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (id)processPerAppLogicalWritesWithInfo:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  __int128 *p_buf;
  _QWORD *v38;
  _QWORD v39[3];
  int v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[2];
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -1209600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_msgSend(v5, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSince1970");
  v10 = v9;

  +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("NANDStats"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v11, 86400.0, v8, v10 - v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("LogicalWriteThresholdPerDay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");
  if (v15)
    v16 = v15;
  else
    v16 = 104857600;

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "LogicalWriteThresholdPerDay: %lu", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke;
  v41[3] = &unk_1E857D570;
  v43 = v16;
  v20 = v18;
  v42 = v20;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v41);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 14;
  do
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v23);

    --v22;
  }
  while (v22);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__9;
  v49 = __Block_byref_object_dispose__9;
  v50 = 0;
  v33[0] = v19;
  v33[1] = 3221225472;
  v33[2] = __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke_587;
  v33[3] = &unk_1E857D598;
  v24 = v20;
  v34 = v24;
  p_buf = &buf;
  v38 = v39;
  v25 = v5;
  v35 = v25;
  v26 = v21;
  v36 = v26;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v33);
  v44[0] = CFSTR("responseStartTimestamp");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v25, "timeIntervalSince1970");
  objc_msgSend(v27, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = CFSTR("queryResultsPerDay");
  v45[0] = v28;
  v45[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v39, 8);

  return v29;
}

void __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("Unspecified"));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LogicalWrites"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    v7 = *(_QWORD *)(a1 + 40);

    if (v6 > v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

void __55__PLCoalitionAgent_processPerAppLogicalWritesWithInfo___block_invoke_587(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v16 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v16, "entryDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v16, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertFromMonotonicToSystem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (int)((double)(int)v10 / 86400.0);
      if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) & 0x80000000) != 0)
      {
LABEL_6:

        goto LABEL_7;
      }
      objc_msgSend(v16, "entryDate");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LogicalWrites"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BundleId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

    goto LABEL_6;
  }
LABEL_7:

}

- (void)log
{
  id v3;

  -[PLCoalitionAgent logEventIntervalCoalitionIntervalWithHFLFlag:](self, "logEventIntervalCoalitionIntervalWithHFLFlag:", 0);
  -[PLCoalitionAgent lastCoalitionObjectDictionary](self, "lastCoalitionObjectDictionary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLCoalitionAgent logCoalitionObjectMemory:](self, "logCoalitionObjectMemory:", v3);

}

- (void)logEventIntervalCoalitionIntervalWithoutHighFreqLogging
{
  -[PLCoalitionAgent logEventIntervalCoalitionIntervalWithHFLFlag:](self, "logEventIntervalCoalitionIntervalWithHFLFlag:", 0);
}

- (void)logAggregateNANDStatsWithInfo:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("logical_deferred_writes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("logical_immediate_writes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue") + v5;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("logical_metadata_writes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + objc_msgSend(v8, "intValue");
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("logical_invalidated_writes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 - objc_msgSend(v10, "intValue");

  if ((int)v11 >= 102400)
  {
    +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("NANDStats"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(v18, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithEntryKey:withDate:", v12, v14);

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("LaunchdName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("BundleId"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("LogicalWrites"));

    -[PLOperator logEntry:](self, "logEntry:", v15);
  }

}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setDriveCapacity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCResponderOperatorComposition)logicalWritesResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogicalWritesResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDate)reportMemoryStatsAfterTime
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReportMemoryStatsAfterTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)reportHighFrequencyMemoryStatsAfterTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReportHighFrequencyMemoryStatsAfterTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_reportHighFrequencyMemoryStatsAfterTime, 0);
  objc_storeStrong((id *)&self->_reportMemoryStatsAfterTime, 0);
  objc_storeStrong((id *)&self->_logicalWritesResponder, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_driveCapacity, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_lastDate, 0);
  objc_storeStrong((id *)&self->_lastCoalitionObjectDictionary, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end
