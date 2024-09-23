@implementation PLTimeReferenceDynamic

void __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  unint64_t v4;
  double v5;
  int i;
  void *v7;
  unint64_t v8;
  int v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  PLEntry *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id obj;
  _QWORD block[4];
  __CFString *v47;
  char v48;

  objc_msgSend(*(id *)(a1 + 32), "offset");
  v2 = 3.40282347e38;
  if (v3 != 3.40282347e38)
  {
    objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v4 = 0;
    v5 = 0.0;
    for (i = -1; ; --i)
    {
      objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 <= v4)
        break;
      v9 = objc_msgSend(*(id *)(a1 + 32), "offsetHistoryHead");
      objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (i + v9) % (unint64_t)objc_msgSend(v10, "count");

      if ((v11 & 0x80000000) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v12, "count") + v11;

      }
      objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", (int)v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("startReferenceTime"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endReferenceTime"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "nearestDistanceFromDate:toRegionWithStartDate:andEndDate:", *(_QWORD *)(a1 + 40), v15, v16);
      v18 = fabs(v17);
      if (v18 < v2)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("offset"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v5 = v20;

        if (v18 < 1.0)
        {

          break;
        }
        v2 = v18;
      }

      ++v4;
    }
    objc_sync_exit(obj);

    objc_msgSend(*(id *)(a1 + 40), "dateByAddingTimeInterval:", -v5);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "tooFarInFutureDistance");
    if ((objc_msgSend(v24, "isInMonotonicFutureWithDistance:") & 1) != 0
      || (v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40),
          objc_msgSend(*(id *)(a1 + 32), "tooFarInPastDistance"),
          objc_msgSend(v25, "isInMonotonicPastWithDistance:")))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "shouldQueryCurrentTime"))
        v26 = (id)objc_msgSend(*(id *)(a1 + 32), "currentTime");
      v27 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "offset");
      objc_msgSend(v27, "dateByAddingTimeInterval:", -v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

      v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "tooFarInFutureDistance");
      if ((objc_msgSend(v32, "isInMonotonicFutureWithDistance:") & 1) != 0
        || (v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40),
            objc_msgSend(*(id *)(a1 + 32), "tooFarInPastDistance"),
            objc_msgSend(v33, "isInMonotonicPastWithDistance:")))
      {
        if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[2] = __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke_2;
          block[3] = &unk_1E6A534F0;
          block[1] = 3221225472;
          v47 = CFSTR("PLTimeReferenceDynamic_TimeCorrection_Debug");
          v48 = 0;
          if (PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce != -1)
            dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_3_defaultOnce, block);
          v34 = PLSubmissionAnalyticsStateSuccess_block_invoke_3_objectForKey;

          if (v34)
          {
            +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventPoint"), CFSTR("TimeCorrection"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = -[PLEntry initWithEntryKey:]([PLEntry alloc], "initWithEntryKey:", v35);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "timeReferenceType"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLEntry setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v37, CFSTR("TimeReferenceType"));

            -[PLEntry setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("TimeInReference"));
            -[PLEntry setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("ProjectedTimeInMonotonic"));
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "componentsJoinedByString:", CFSTR(", "));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLEntry setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v39, CFSTR("CallStack"));

            +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "storage");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "writeEntry:withCompletionBlock:", v36, &__block_literal_global_41);

          }
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v44 = *(void **)(v43 + 40);
        *(_QWORD *)(v43 + 40) = v42;

      }
    }
  }
}

- (NSMutableArray)offsetHistory
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (double)tooFarInFutureDistance
{
  return self->_tooFarInFutureDistance;
}

- (int)offsetHistoryHead
{
  return self->_offsetHistoryHead;
}

+ (double)nearestDistanceFromDate:(id)a3 toRegionWithStartDate:(id)a4 andEndDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  double v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  v11 = v10;
  objc_msgSend(v7, "timeIntervalSinceDate:", v9);
  v13 = v12;

  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v15 = v14;

  result = -1.0;
  if (v15 >= 0.0)
  {
    if (v11 <= 0.0 || (result = 0.0, v13 <= 0.0))
    {
      result = fabs(v11);
      v17 = fabs(v13);
      if (result >= v17)
        return v17;
    }
  }
  return result;
}

- (id)removeTimeOffsetFromReferenceTime:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("PLTimeReferenceDynamic::removeTimeOffsetFromReferenceTime"));
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke;
  block[3] = &unk_1E6A521C8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (double)tooFarInPastDistance
{
  return self->_tooFarInPastDistance;
}

- (BOOL)shouldQueryCurrentTime
{
  void *v2;
  double v3;
  BOOL v4;

  -[PLTimeReferenceDynamic lastQueryTime](self, "lastQueryTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceMonitonicNow");
  v4 = fabs(v3) > 600.0;

  return v4;
}

- (NSDate)lastQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

void __36__PLTimeReferenceDynamic_setOffset___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  objc_super v40;
  _QWORD v41[5];
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "offset");
  if (v2 != 3.40282347e38)
  {
    v3 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "offset");
    v5 = v3 - v4;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLTimeReferenceDynamic_setOffset___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0 != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_0, block);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceDynamic::setOffset: delta=%f"), *(_QWORD *)&v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic setOffset:]_block_invoke");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 176);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (fabs(v5) >= 1.0)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v12 = objc_opt_class();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __36__PLTimeReferenceDynamic_setOffset___block_invoke_39;
        v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v41[4] = v12;
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_37 != -1)
          dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce_37, v41);
        if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_38)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "timeReferenceType"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "offset");
          objc_msgSend(v13, "stringWithFormat:", CFSTR("PLTimeReferenceDynamic::setOffset: timeReferenceType=%@, oldOffset=%f, newOffset=%f"), v14, v15, *(_QWORD *)(a1 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic setOffset:]_block_invoke_2");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 180);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v21);
      objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "offset");
        objc_msgSend(v24, "dateByAddingTimeInterval:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = objc_msgSend(*(id *)(a1 + 32), "offsetHistoryHead");
          objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (v26 - 1) % (unint64_t)objc_msgSend(v27, "count");

          if ((v28 & 0x80000000) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v28) = objc_msgSend(v29, "count") + v28;

          }
          objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", (int)v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, CFSTR("endReferenceTime"));
        }

      }
      objc_sync_exit(v21);

      v32 = *(double *)(a1 + 40);
      v40.receiver = *(id *)(a1 + 32);
      v40.super_class = (Class)PLTimeReferenceDynamic;
      objc_msgSendSuper2(&v40, sel_setOffset_, v32);
      objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v33);
      v34 = (void *)objc_msgSend(*(id *)(a1 + 32), "newOffsetEntryWithCurrentTime");
      if (v34)
      {
        objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36 == 3)
          objc_msgSend(v37, "setObject:atIndexedSubscript:", v34, (int)objc_msgSend(*(id *)(a1 + 32), "offsetHistoryHead"));
        else
          objc_msgSend(v37, "addObject:", v34);

        v38 = objc_msgSend(*(id *)(a1 + 32), "offsetHistoryHead");
        objc_msgSend(*(id *)(a1 + 32), "offsetHistory");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setOffsetHistoryHead:", ((v38 + 1) % (unint64_t)objc_msgSend(v39, "count")));

      }
      objc_sync_exit(v33);

      objc_msgSend(*(id *)(a1 + 32), "notifyTimeChange:", v5);
    }
  }
}

- (void)setOffset:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("PLTimeReferenceDynamic::setOffset"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PLTimeReferenceDynamic_setOffset___block_invoke;
  v6[3] = &unk_1E6A527D8;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)setLastQueryTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)checkForTimeChangeWithCurrentTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  uint64_t block;
  uint64_t v19;
  BOOL (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeReference offset](self, "offset");
  objc_msgSend(v5, "dateByAddingTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v7 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __60__PLTimeReferenceDynamic_checkForTimeChangeWithCurrentTime___block_invoke;
      v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      v22 = v7;
      if (checkForTimeChangeWithCurrentTime__defaultOnce != -1)
        dispatch_once(&checkForTimeChangeWithCurrentTime__defaultOnce, &block);
      if (checkForTimeChangeWithCurrentTime__classDebugEnabled)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLTimeReference timeReferenceType](self, "timeReferenceType"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("PLTimeReferenceDynamic::checkForTimeChangeWithCurrentTime: timeReferenceType=%@, prevTimeInReference=%@, currentTimeInReference=%@"), v9, v6, v4, block, v19, v20, v21, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic checkForTimeChangeWithCurrentTime:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 147);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[PLTimeReference offset](self, "offset");
    v16 = v15;
    objc_msgSend(v4, "timeIntervalSinceDate:", v6);
    -[PLTimeReferenceDynamic setOffset:](self, "setOffset:", v16 + v17);
  }

}

- (PLTimeReferenceDynamic)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5
{
  PLTimeReferenceDynamic *v5;
  uint64_t v6;
  NSMutableDictionary *timeChangeBlocks;
  uint64_t v8;
  NSMutableArray *offsetHistory;
  uint64_t v10;
  NSDate *lastQueryTime;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PLTimeReferenceDynamic;
  v5 = -[PLTimeReference initWithTimeManager:entryDefinitionKey:timeReferenceType:](&v13, sel_initWithTimeManager_entryDefinitionKey_timeReferenceType_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    timeChangeBlocks = v5->_timeChangeBlocks;
    v5->_timeChangeBlocks = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    offsetHistory = v5->_offsetHistory;
    v5->_offsetHistory = (NSMutableArray *)v8;

    v5->_offsetHistoryHead = 0;
    v5->_tooFarInFutureDistance = 2147483650.0;
    v5->_tooFarInPastDistance = 2147483650.0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    lastQueryTime = v5->_lastQueryTime;
    v5->_lastQueryTime = (NSDate *)v10;

  }
  return v5;
}

- (void)initializeOffsetWithEntries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  PLTimer *v9;
  void *v10;
  void *v11;
  PLTimer *v12;
  _QWORD v13[5];
  _QWORD block[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PLTimeReferenceDynamic;
  v4 = a3;
  -[PLTimeReference initializeOffsetWithEntries:](&v15, sel_initializeOffsetWithEntries_, v4);
  -[PLTimeReferenceDynamic initializeOffsetHistoryWithEntries:](self, "initializeOffsetHistoryWithEntries:", v4);

  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v5 = objc_opt_class();
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (initializeOffsetWithEntries__defaultOnce != -1)
      dispatch_once(&initializeOffsetWithEntries__defaultOnce, block);
    if (initializeOffsetWithEntries__classDebugEnabled)
      v7 = 10.0;
    else
      v7 = 1800.0;
    if (initializeOffsetWithEntries__classDebugEnabled)
      v8 = 10.0;
    else
      v8 = 60.0;
    v9 = [PLTimer alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_2;
    v13[3] = &unk_1E6A535C0;
    v13[4] = self;
    v12 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v9, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v10, 1, 0, v11, v13, v7, 0.0);
    -[PLTimeReferenceDynamic setPeriodicCurrentTime:](self, "setPeriodicCurrentTime:", v12);

  }
}

BOOL __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initializeOffsetWithEntries__classDebugEnabled = result;
  return result;
}

id __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v12;
  BOOL (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_3;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_6 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_6, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_6)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "timeReferenceType"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("PLTimeReferenceDynamic::periodicCurrentTime: timeReferenceType=%@"), v4, block, v12, v13, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic initializeOffsetWithEntries:]_block_invoke_2");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 71);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  return (id)objc_msgSend(*(id *)(a1 + 32), "currentTime");
}

BOOL __54__PLTimeReferenceDynamic_initializeOffsetWithEntries___block_invoke_3(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_6 = result;
  return result;
}

- (void)initializeOffsetHistoryWithEntries:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  double v8;
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
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = v3;
  if (v3 && (v4 = v3, objc_msgSend(v3, "count")))
  {
    v5 = objc_msgSend(v4, "count");
    if (v5 < 1)
    {
      v6 = 0;
      v35 = 0;
      v24 = 0;
    }
    else
    {
      v36 = 0;
      v35 = 0;
      v6 = 0;
      v7 = v5;
      v8 = 3.40282347e38;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", (v7 - 1), v33);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLTimeReference entryDefinitionKey](self, "entryDefinitionKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        if (vabdd_f64(v13, v8) > 1.0)
        {
          objc_msgSend(v9, "entryDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            objc_msgSend(v35, "dateByAddingTimeInterval:", v13);
          else
            objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLTimeReferenceDynamic offsetHistory](self, "offsetHistory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(v16);
          -[PLTimeReferenceDynamic offsetHistory](self, "offsetHistory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = CFSTR("offset");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = v18;
          v38[1] = CFSTR("startReferenceTime");
          objc_msgSend(v14, "dateByAddingTimeInterval:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v38[2] = CFSTR("endReferenceTime");
          v39[1] = v19;
          v39[2] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v20, "mutableCopy");
          objc_msgSend(v17, "insertObject:atIndex:", v21, 0);

          objc_sync_exit(v16);
          objc_msgSend(v9, "entryDate");
          v22 = objc_claimAutoreleasedReturnValue();

          ++v36;
          v8 = v13;
          v6 = v14;
          v35 = (void *)v22;
        }

        v4 = v33;
        if (v36 > 2)
          break;
      }
      while (v7-- > 1);
      if (v36 >= 3)
        v24 = 0;
      else
        v24 = v36;
    }
    -[PLTimeReferenceDynamic setOffsetHistoryHead:](self, "setOffsetHistoryHead:", v24, v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLTimeReference offset](self, "offset");
    objc_msgSend(v25, "dateByAddingTimeInterval:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLTimeReferenceDynamic offsetHistory](self, "offsetHistory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v26);
      -[PLTimeReferenceDynamic offsetHistory](self, "offsetHistory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = CFSTR("offset");
      v28 = (void *)MEMORY[0x1E0CB37E8];
      -[PLTimeReference offset](self, "offset");
      objc_msgSend(v28, "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v29;
      v41[1] = v6;
      v40[1] = CFSTR("startReferenceTime");
      v40[2] = CFSTR("endReferenceTime");
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v41[2] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "mutableCopy");
      objc_msgSend(v27, "addObject:", v32);

      objc_sync_exit(v26);
      -[PLTimeReferenceDynamic setOffsetHistoryHead:](self, "setOffsetHistoryHead:", 1);
    }
  }

}

- (void)registerForTimeChangedNotification
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PLTimeReferenceDynamic_registerForTimeChangedNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (registerForTimeChangedNotification_defaultOnce != -1)
      dispatch_once(&registerForTimeChangedNotification_defaultOnce, block);
    if (registerForTimeChangedNotification_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceDynamic::registerForTimeChangedNotification WARNING: inherited class must implement"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic registerForTimeChangedNotification]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 132);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __60__PLTimeReferenceDynamic_registerForTimeChangedNotification__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerForTimeChangedNotification_classDebugEnabled = result;
  return result;
}

- (void)registerForClockSetNotification
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PLTimeReferenceDynamic_registerForClockSetNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (registerForClockSetNotification_defaultOnce != -1)
      dispatch_once(&registerForClockSetNotification_defaultOnce, block);
    if (registerForClockSetNotification_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceDynamic::registerForClockSetNotification WARNING: inherited class must implement"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic registerForClockSetNotification]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 137);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __57__PLTimeReferenceDynamic_registerForClockSetNotification__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerForClockSetNotification_classDebugEnabled = result;
  return result;
}

BOOL __60__PLTimeReferenceDynamic_checkForTimeChangeWithCurrentTime___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  checkForTimeChangeWithCurrentTime__classDebugEnabled = result;
  return result;
}

- (id)newOffsetEntryWithCurrentTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeReference offset](self, "offset");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v11[0] = CFSTR("offset");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PLTimeReference offset](self, "offset");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = v4;
    v11[1] = CFSTR("startReferenceTime");
    v11[2] = CFSTR("endReferenceTime");
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __36__PLTimeReferenceDynamic_setOffset___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_0 = result;
  return result;
}

BOOL __36__PLTimeReferenceDynamic_setOffset___block_invoke_39(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled_38 = result;
  return result;
}

BOOL __60__PLTimeReferenceDynamic_removeTimeOffsetFromReferenceTime___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  PLSubmissionAnalyticsStateSuccess_block_invoke_3_objectForKey = result;
  return result;
}

- (void)registerForTimeChangedCallbackWithIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
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
  NSObject *v25;
  _QWORD v26[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v9);
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v10 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce != -1)
        dispatch_once(&registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce, block);
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier=%@"), v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic registerForTimeChangedCallbackWithIdentifier:usingBlock:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v13, v14, 322);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v16 = (void *)MEMORY[0x1BCC9EB70](v8);
    -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v18 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke_60;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v18;
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce_58 != -1)
        dispatch_once(&registerForTimeChangedCallbackWithIdentifier_usingBlock__defaultOnce_58, v26);
      if (registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled_59)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("self.timeChangeBlocks=%@"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic registerForTimeChangedCallbackWithIdentifier:usingBlock:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v23, v24, 324);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_sync_exit(v9);

  }
}

BOOL __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled = result;
  return result;
}

BOOL __82__PLTimeReferenceDynamic_registerForTimeChangedCallbackWithIdentifier_usingBlock___block_invoke_60(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerForTimeChangedCallbackWithIdentifier_usingBlock__classDebugEnabled_59 = result;
  return result;
}

- (void)unregisterForTimeChangedCallbackWithIdentifier:(id)a3
{
  id v4;
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
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (unregisterForTimeChangedCallbackWithIdentifier__defaultOnce != -1)
        dispatch_once(&unregisterForTimeChangedCallbackWithIdentifier__defaultOnce, block);
      if (unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifier=%@"), v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic unregisterForTimeChangedCallbackWithIdentifier:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 331);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v4);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v13 = objc_opt_class();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke_65;
      v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v21[4] = v13;
      if (unregisterForTimeChangedCallbackWithIdentifier__defaultOnce_63 != -1)
        dispatch_once(&unregisterForTimeChangedCallbackWithIdentifier__defaultOnce_63, v21);
      if (unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled_64)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("self.timeChangeBlocks=%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceDynamic.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceDynamic unregisterForTimeChangedCallbackWithIdentifier:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 333);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_sync_exit(v5);

  }
}

BOOL __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled = result;
  return result;
}

BOOL __73__PLTimeReferenceDynamic_unregisterForTimeChangedCallbackWithIdentifier___block_invoke_65(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  unregisterForTimeChangedCallbackWithIdentifier__classDebugEnabled_64 = result;
  return result;
}

- (void)notifyTimeChange:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3 != 0.0)
  {
    -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PLTimeReferenceDynamic timeChangeBlocks](self, "timeChangeBlocks", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x1BCC9E9B4]();
          (*(void (**)(uint64_t, double))(v11 + 16))(v11, a3);
          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
}

- (NSMutableDictionary)timeChangeBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeChangeBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setTooFarInFutureDistance:(double)a3
{
  self->_tooFarInFutureDistance = a3;
}

- (void)setTooFarInPastDistance:(double)a3
{
  self->_tooFarInPastDistance = a3;
}

- (void)setOffsetHistory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setOffsetHistoryHead:(int)a3
{
  self->_offsetHistoryHead = a3;
}

- (PLTimer)periodicCurrentTime
{
  return (PLTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPeriodicCurrentTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicCurrentTime, 0);
  objc_storeStrong((id *)&self->_offsetHistory, 0);
  objc_storeStrong((id *)&self->_lastQueryTime, 0);
  objc_storeStrong((id *)&self->_timeChangeBlocks, 0);
}

@end
