@implementation PLUtilities

+ (signed)logModeForEntryKey:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v6;
  id v7;
  signed __int16 v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (+[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v6))
  {
    v8 = 0;
  }
  else
  {
    +[PLUtilities modeForEntryKey:withKeyName:](PLUtilities, "modeForEntryKey:withKeyName:", v6, v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[PLUtilities modeForEntryKey:withKeyName:](PLUtilities, "modeForEntryKey:withKeyName:", v6, CFSTR("__Allow_Dynamic__"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if (objc_msgSend(v10, "BOOLValue"))
          v9 = CFSTR("YES");
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }

    }
    v8 = +[PLUtilities canLogMode:fullMode:](PLUtilities, "canLogMode:fullMode:", v9, +[PLDefaults fullMode](PLDefaults, "fullMode"));

  }
  return v8;
}

+ (id)modeForEntryKey:(id)a3 withKeyName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  +[PLUtilities getAllowblocklist](PLUtilities, "getAllowblocklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (signed)canLogMode:(id)a3 fullMode:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  signed __int16 v6;

  v4 = a4;
  v5 = a3;
  if (v4)
  {
    if ((objc_msgSend(CFSTR("NO"), "isEqualToString:", v5) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_17;
    }
    if ((objc_msgSend(CFSTR("HF"), "isEqualToString:", v5) & 1) == 0)
    {
      if ((objc_msgSend(CFSTR("HB"), "isEqualToString:", v5) & 1) == 0)
      {
        v6 = 0;
        goto LABEL_15;
      }
LABEL_13:
      v6 = 4;
      goto LABEL_17;
    }
LABEL_11:
    v6 = 2;
    goto LABEL_17;
  }
  if ((objc_msgSend(CFSTR("YES"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(CFSTR("HL"), "isEqualToString:", v5) & 1) != 0
    || (objc_msgSend(CFSTR("HF"), "isEqualToString:", v5) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((objc_msgSend(CFSTR("HB"), "isEqualToString:", v5) & 1) != 0)
    goto LABEL_13;
  v6 = 1;
LABEL_15:
  if (objc_msgSend(CFSTR("TR"), "isEqualToString:", v5))
    v6 = 3;
LABEL_17:

  return v6;
}

uint64_t __54__PLUtilities_dispatchSyncIfNotCallerQueue_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)workQueueForClass:(Class)a3
{
  void *v3;
  void *v4;

  NSStringFromClass(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)workQueueForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  if (workQueueForKey__sOnceTokenWorkQueue != -1)
    dispatch_once(&workQueueForKey__sOnceTokenWorkQueue, &__block_literal_global_67);
  v4 = (id)workQueueForKey__workQueueDictionary;
  objc_sync_enter(v4);
  if (v3)
  {
    objc_msgSend((id)workQueueForKey__workQueueDictionary, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)workQueueForKey__qos, 0);
      v7 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.powerlog.workqueue.%@"), v3);
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), v7);

      objc_msgSend((id)workQueueForKey__workQueueDictionary, "setObject:forKeyedSubscript:", v5, v3);
    }
  }
  else
  {
    objc_msgSend((id)workQueueForKey__workQueueDictionary, "objectForKeyedSubscript:", CFSTR("__GeneralWorkQueue__"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v4);

  return v5;
}

+ (void)dispatchSyncIfNotCallerQueue:(id)a3 withBlock:(id)a4
{
  const char *label;
  const char *v6;
  void (**v7)(void);
  _QWORD block[4];
  void (**v9)(void);

  v7 = (void (**)(void))a4;
  label = dispatch_queue_get_label(0);
  v6 = dispatch_queue_get_label((dispatch_queue_t)a3);
  if (!strcmp(label, v6))
  {
    v7[2]();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PLUtilities_dispatchSyncIfNotCallerQueue_withBlock___block_invoke;
    block[3] = &unk_1E6A53788;
    v9 = v7;
    dispatch_sync((dispatch_queue_t)a3, block);

  }
}

+ (double)secondsFromMachTime:(unint64_t)a3
{
  double v4;

  +[PLUtilities getMachbaseTimeRatio](PLUtilities, "getMachbaseTimeRatio");
  return v4 * (double)a3 / 1000000000.0;
}

+ (double)getMachbaseTimeRatio
{
  if (getMachbaseTimeRatio_once != -1)
    dispatch_once(&getMachbaseTimeRatio_once, &__block_literal_global_78);
  return *(double *)&getMachbaseTimeRatio_ratio;
}

+ (void)getCurrentMonotonicAndMachAbsTime:(id *)a3 machAbsTime:(unint64_t *)a4 machContTime:(unint64_t *)a5
{
  unsigned int *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD block[5];
  _QWORD v26[5];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = 0;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  v8 = (unsigned int *)objc_msgSend(a1, "getMachTimebase");
  if (mach_get_times())
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke_103;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce_101 != -1)
        dispatch_once(&getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce_101, block);
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled_102)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mach_get_times() call failed."));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 894);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = mach_absolute_time() * *v8 / v8[1];
    if (a5)
      *a5 = mach_continuous_time() * *v8 / v8[1];
  }
  else
  {
    +[PLUtilities dateFromTimeval:](PLUtilities, "dateFromTimeval:", v29, ((int)v30 / 1000));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v16 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v16;
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce != -1)
        dispatch_once(&getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__defaultOnce, v26);
      if (getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Converted monotonic time: %@, reference monotonic time: %@."), v15, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 883);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v24 = objc_retainAutorelease(v15);
    *a3 = v24;
    if (a4)
      *a4 = v28 * (unint64_t)*v8 / v8[1];
    if (a5)
      *a5 = v27 * (unint64_t)*v8 / v8[1];

  }
}

+ (mach_timebase_info)getMachTimebase
{
  if (getMachTimebase_onceToken != -1)
    dispatch_once(&getMachTimebase_onceToken, &__block_literal_global_106);
  return (mach_timebase_info *)&getMachTimebase_machTimeInfo;
}

+ (id)dateFromTimeval:(timeval)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3.tv_usec / 1000000.0 + (double)a3.tv_sec);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertFromSystemToMonotonic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isPowerlogHelperd
{
  if (isPowerlogHelperd_onceToken != -1)
    dispatch_once(&isPowerlogHelperd_onceToken, &__block_literal_global_289);
  return isPowerlogHelperd_isPowerlogHelperd;
}

+ (BOOL)shouldLogForEntryKey:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (+[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3)
    || +[PLDefaults fullMode](PLDefaults, "fullMode"))
  {
    v4 = 1;
  }
  else
  {
    +[PLUtilities getAllowblocklist](PLUtilities, "getAllowblocklist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7 != 0;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (BOOL)shouldLogForEntryKey:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  int v5;

  v5 = +[PLUtilities logModeForEntryKey:withKey:andValue:](PLUtilities, "logModeForEntryKey:withKey:andValue:", a3, a4, a5);
  return !v5 || v5 == 3;
}

+ (BOOL)OverrideAllowlistEnabled
{
  if (OverrideAllowlistEnabled_onceToken != -1)
    dispatch_once(&OverrideAllowlistEnabled_onceToken, &__block_literal_global_304);
  return OverrideAllowlistEnabled_overrideAllowlistEnabled;
}

void __52__PLUtilities_postNotificationName_object_userInfo___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

+ (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (postNotificationName_object_userInfo__onceToken != -1)
    dispatch_once(&postNotificationName_object_userInfo__onceToken, &__block_literal_global_74);
  v10 = postNotificationName_object_userInfo__notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PLUtilities_postNotificationName_object_userInfo___block_invoke_2;
  block[3] = &unk_1E6A53760;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, block);

}

+ (BOOL)isAppAnalyticsEnabled
{
  if (isAppAnalyticsEnabled_onceToken != -1)
    dispatch_once(&isAppAnalyticsEnabled_onceToken, &__block_literal_global_329);
  return isAppAnalyticsEnabled_appAnalyticsEnabled;
}

+ (BOOL)gasGaugeEnabled
{
  if (+[PLDefaults isDevBoard](PLDefaults, "isDevBoard"))
    return 0;
  else
    return !+[PLPlatform isiPod](PLPlatform, "isiPod");
}

void __32__PLUtilities_MavRevStringQuery__block_invoke()
{
  unsigned int v0;
  __CFString *v1;
  void *v2;

  v0 = +[PLPlatform kPLBasebandClassOfDevice](PLPlatform, "kPLBasebandClassOfDevice") - 1003001;
  if (v0 > 0x10)
    v1 = 0;
  else
    v1 = off_1E6A54850[v0];
  v2 = (void *)MavRevStringQuery_plMavRevString;
  MavRevStringQuery_plMavRevString = (uint64_t)v1;

}

+ (id)getIdentifierFromEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", &stru_1E6A56538) & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LaunchdName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities launchdNameToProcessName:](PLUtilities, "launchdNameToProcessName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else if ((unint64_t)objc_msgSend(v5, "length") > 9)
    {
      objc_msgSend(v5, "substringFromIndex:", 10);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

+ (id)launchdNameToProcessName:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = launchdNameToProcessName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&launchdNameToProcessName__onceToken, &__block_literal_global_259);
  objc_msgSend((id)launchdNameToProcessName__launchdNameToProcessNameDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)containerPath
{
  if (containerPath_onceToken != -1)
    dispatch_once(&containerPath_onceToken, &__block_literal_global_24);
  return (id)containerPath_containerPath;
}

+ (id)powerModelForOperatorName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (+[PLPlatform isHomePod](PLPlatform, "isHomePod"))
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    getPowermodels();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)sanitizeCAPayload:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "rangeOfString:", CFSTR("-"), (_QWORD)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v11, v12);

          objc_msgSend(v4, "removeObjectForKey:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)allowQueryFromPeer:(id)a3
{
  _xpc_connection_s *v3;
  __SecTask *v4;
  __SecTask *v5;
  uint32_t CodeSignStatus;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t pid;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  BOOL v18;
  NSObject *v19;
  _BYTE token[34];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (_xpc_connection_s *)a3;
  xpc_connection_get_audit_token();
  memset(token, 0, 32);
  v4 = SecTaskCreateWithAuditToken(0, (audit_token_t *)token);
  if (!v4)
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PLUtilities allowQueryFromPeer:].cold.1();
    goto LABEL_20;
  }
  v5 = v4;
  CodeSignStatus = SecTaskGetCodeSignStatus(v4);
  v7 = SecTaskCopyValueForEntitlement(v5, CFSTR("com.apple.private.perfpowerservices.query.internal"), 0);
  CFRelease(v5);
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    pid = xpc_connection_get_pid(v3);
    +[PLUtilities processNameForPid:](PLUtilities, "processNameForPid:", pid);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", pid);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)token = 67109890;
      *(_DWORD *)&token[4] = pid;
      *(_WORD *)&token[8] = 2112;
      *(_QWORD *)&token[10] = v11;
      *(_WORD *)&token[18] = 2112;
      *(_QWORD *)&token[20] = v12;
      *(_WORD *)&token[28] = 1024;
      *(_DWORD *)&token[30] = CodeSignStatus;
      _os_log_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_INFO, "query from pid:%d procName:%@ bundleID:%@ csStatus:%d", token, 0x22u);
    }

  }
  if ((CodeSignStatus & 0xC000001) == 0x4000001)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)token = 67109120;
      *(_DWORD *)&token[4] = CodeSignStatus;
      v15 = "allowing query %d";
      v16 = v14;
      v17 = 8;
LABEL_15:
      _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_INFO, v15, token, v17);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v7 || !+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)token = 67109120;
      *(_DWORD *)&token[4] = CodeSignStatus;
      _os_log_impl(&dword_1B6AB6000, v19, OS_LOG_TYPE_INFO, "query denied %d", token, 8u);
    }

LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)token = 0;
    v15 = "alloiwng query becaues internal build and has proper entitlements";
    v16 = v14;
    v17 = 2;
    goto LABEL_15;
  }
LABEL_16:

  v18 = 1;
LABEL_21:

  return v18;
}

+ (BOOL)isPingPongChargingWith:(BOOL)a3 andBatteryLevelPercent:(double)a4
{
  return a4 > 95.0 && a3;
}

+ (id)MavRevStringQuery
{
  if (MavRevStringQuery_onceToken != -1)
    dispatch_once(&MavRevStringQuery_onceToken, &__block_literal_global_472);
  return (id)MavRevStringQuery_plMavRevString;
}

+ (int64_t)roundToSigFig:(int)a3 withSigFig:(int)a4
{
  double v4;

  objc_msgSend(a1, "roundToSigFigDouble:withSigFig:", *(_QWORD *)&a4, (double)a3);
  return (uint64_t)v4;
}

+ (double)roundToSigFigDouble:(double)a3 withSigFig:(int)a4
{
  double result;
  double v7;
  double v8;
  double v9;

  result = 0.0;
  if (a3 != 0.0)
  {
    v7 = -a3;
    if (a3 >= 0.0)
      v7 = a3;
    v8 = log10(v7);
    v9 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)round(v9 * a3) / v9;
  }
  return result;
}

+ (id)transactionWorkQueue
{
  return +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("transaction-release"));
}

+ (BOOL)isFullModeDaemon
{
  if (isFullModeDaemon_onceToken != -1)
    dispatch_once(&isFullModeDaemon_onceToken, &__block_literal_global_288);
  return isFullModeDaemon_isFullModeDaemon;
}

+ (id)bundleIDFromURL:(id)a3
{
  __CFBundle *Unique;
  __CFBundle *v4;
  void *v5;

  if (a3)
  {
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    v4 = Unique;
    if (Unique)
    {
      CFBundleGetIdentifier(Unique);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __28__PLUtilities_containerPath__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1BCC9E9B4]();
  v1 = container_system_group_path_for_identifier();
  if (v1)
  {
    v2 = (void *)v1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)containerPath_containerPath;
    containerPath_containerPath = v3;

    free(v2);
  }
  else
  {
    NSLog(CFSTR("Error fetching group container systemgroup.com.apple.powerlog : %llu"), 1);
    +[PLUtilities exitSafe:](PLUtilities, "exitSafe:", 1);
  }
  objc_autoreleasePoolPop(v0);
}

+ (BOOL)moveItemAtPath:(id)a3 toPath:(id)a4 withName:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    v19 = CFSTR("override-fileName");
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = *MEMORY[0x1E0D1BD58];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = PLOSAMoveFileForSubmissions(v13, v12, v14);

  if (v15)
  {
    objc_msgSend(v8, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v17, 32);

  }
  return v15;
}

+ (BOOL)PLCopyItemsFromPath:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v5, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (v9)
  {
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[PLUtilities PLCopyItemsFromPath:toPath:].cold.1();

    v11 = *((unsigned __int8 *)v26 + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke;
    v17[3] = &unk_1E6A54000;
    v14 = v12;
    v18 = v14;
    v15 = v13;
    v19 = v15;
    v23 = &v25;
    v20 = v7;
    v21 = v5;
    v22 = v6;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);
    v11 = *((unsigned __int8 *)v26 + 24);

  }
  _Block_object_dispose(&v25, 8);

  return v11 != 0;
}

void __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 48);
  v15 = 0;
  v11 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v8, v9, &v15);
  v12 = v15;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v11;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(v9, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v13, 32);

  }
  else
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke_cold_1(a1, (uint64_t)v12, v14);

    *a4 = 1;
  }

}

+ (BOOL)createAndChownDirectory:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v13);
  v6 = v13;

  if ((v5 & 1) != 0)
  {
    +[PLUtilities setMobileOwnerForFile:](PLUtilities, "setMobileOwnerForFile:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error=%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities createAndChownDirectory:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 208);

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  return v5;
}

+ (BOOL)createAndChownDirectoryIfDirectoryDoesNotExist:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  char v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v8);

  v6 = 0;
  if ((v5 & 1) == 0)
    v6 = +[PLUtilities createAndChownDirectory:](PLUtilities, "createAndChownDirectory:", v3);

  return v6;
}

+ (void)setMobileOwnerForFile:(id)a3
{
  id v3;
  passwd *v4;
  id v5;
  const char *v6;

  v3 = a3;
  v4 = getpwnam("mobile");
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");

  chown(v6, v4->pw_uid, v4->pw_gid);
}

+ (void)setPermissionsForFile:(id)a3 toValue:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v4 = a4;
  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_retainAutorelease(v5);
  objc_msgSend(v9, "stringWithUTF8String:", objc_msgSend(v10, "UTF8String"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v8, v11, &v16);
  v13 = v16;

  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[PLUtilities setPermissionsForFile:toValue:].cold.1();
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    +[PLUtilities setPermissionsForFile:toValue:].cold.2();
  }

}

+ (BOOL)compressWithSource:(id)a3 withDestination:(id)a4 withLevel:(int)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  FILE *v10;
  FILE *v11;
  id v12;
  FILE *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  FILE *v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLLogZlib();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "compressWithSource: source file = %@, destination file = %@", (uint8_t *)&v22, 0x16u);
  }

  v9 = objc_retainAutorelease(v6);
  v10 = fopen((const char *)objc_msgSend(v9, "UTF8String"), "r");
  if (!v10)
  {
    PLLogZlib();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[PLUtilities compressWithSource:withDestination:withLevel:].cold.1();

    goto LABEL_18;
  }
  v11 = v10;
  v12 = objc_retainAutorelease(v7);
  v13 = fopen((const char *)objc_msgSend(v12, "UTF8String"), "w");
  PLLogZlib();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[PLUtilities compressWithSource:withDestination:withLevel:].cold.2();

    v17 = v11;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    +[PLUtilities compressWithSource:withDestination:withLevel:].cold.4();

  if (+[PLUtilities compressWithSourceStream:withDestination:withLevel:](PLUtilities, "compressWithSourceStream:withDestination:withLevel:", v11, v13, 4))
  {
    PLLogZlib();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[PLUtilities compressWithSource:withDestination:withLevel:].cold.3();

    fclose(v11);
    v17 = v13;
LABEL_17:
    fclose(v17);
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  fclose(v11);
  fclose(v13);
  PLLogZlib();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1B6AB6000, v21, OS_LOG_TYPE_DEFAULT, "compressWithSource: successfully decompressed %@ to %@", (uint8_t *)&v22, 0x16u);
  }

  v19 = 1;
LABEL_19:

  return v19;
}

+ (int)compressWithSourceStream:(__sFILE *)a3 withDestination:(__sFILE *)a4 withLevel:(int)a5
{
  uint64_t v8;
  int v9;
  size_t v10;
  int v11;
  int v12;
  int v13;
  size_t v14;
  z_stream v16;
  _BYTE __ptr[8192];
  _QWORD v18[1026];

  v18[1024] = *MEMORY[0x1E0C80C00];
  memset(&v16, 0, sizeof(v16));
  v8 = deflateInit2_(&v16, a5, 8, 31, 8, 0, "1.2.12", 112);
  if ((_DWORD)v8)
  {
    v9 = v8;
    objc_msgSend(a1, "reportZlibResultToCA:forEvent:", v8, CFSTR("com.apple.powerlog.zlib.compress"));
  }
  else
  {
LABEL_3:
    v10 = fread(v18, 1uLL, 0x2000uLL, a3);
    if (v10 >= 0xFFFFFFFF)
      +[PLUtilities compressWithSourceStream:withDestination:withLevel:].cold.1();
    v16.avail_in = v10;
    if (!ferror(a3))
    {
      v11 = feof(a3);
      v16.next_in = (Bytef *)v18;
      while (1)
      {
        v16.avail_out = 0x2000;
        v16.next_out = __ptr;
        v12 = deflate(&v16, 4 * (v11 != 0));
        if (v12 == -2)
          +[PLUtilities compressWithSourceStream:withDestination:withLevel:].cold.2();
        v13 = v12;
        v14 = 0x2000 - v16.avail_out;
        if (fwrite(__ptr, 1uLL, v14, a4) != v14 || ferror(a4))
          break;
        if (v16.avail_out)
        {
          if (v16.avail_in)
            +[PLUtilities compressWithSourceStream:withDestination:withLevel:].cold.4();
          if (v11)
          {
            if (v13 != 1)
              +[PLUtilities compressWithSourceStream:withDestination:withLevel:].cold.3();
            deflateEnd(&v16);
            return 0;
          }
          goto LABEL_3;
        }
      }
    }
    v9 = -1;
    objc_msgSend(a1, "reportZlibResultToCA:forEvent:", 0xFFFFFFFFLL, CFSTR("com.apple.powerlog.zlib.compress"), v16.next_in);
    deflateEnd(&v16);
  }
  return v9;
}

+ (BOOL)decompressWithSource:(id)a3 withDestination:(id)a4 withRemoveSrc:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  FILE *v16;
  FILE *v17;
  id v18;
  FILE *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  NSObject *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR(".%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR(".gz"));
  PLLogZlib();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.6();

    goto LABEL_24;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "decompressWithSource: source file = %@, destination file = %@", buf, 0x16u);
  }

  v15 = objc_retainAutorelease(v7);
  v16 = fopen((const char *)objc_msgSend(v15, "UTF8String"), "r");
  if (!v16)
  {
    PLLogZlib();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.1();
    goto LABEL_20;
  }
  v17 = v16;
  v18 = objc_retainAutorelease(v8);
  v19 = fopen((const char *)objc_msgSend(v18, "UTF8String"), "w");
  PLLogZlib();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.2();

    fclose(v17);
    goto LABEL_24;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.5();

  if (+[PLUtilities decompressWithSourceStream:withDestinationStream:](PLUtilities, "decompressWithSourceStream:withDestinationStream:", v17, v19))
  {
    PLLogZlib();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.4();

    fclose(v17);
    fclose(v19);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v23, "removeItemAtPath:error:", v18, &v30);
    v24 = v30;

    if (v24)
    {
      PLLogZlib();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[PLUtilities decompressWithSource:withDestination:withRemoveSrc:].cold.3();

    }
LABEL_20:

LABEL_24:
    v26 = 0;
    goto LABEL_25;
  }
  fclose(v17);
  fclose(v19);
  PLLogZlib();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = v15;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEFAULT, "decompressWithSource: successfully decompressed %@ to %@", buf, 0x16u);
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeItemAtPath:error:", v15, 0);

  }
  v26 = 1;
LABEL_25:

  return v26;
}

+ (int)decompressWithSourceStream:(__sFILE *)a3 withDestinationStream:(__sFILE *)a4
{
  uint64_t v7;
  uInt v8;
  uint64_t v9;
  size_t v10;
  int v11;
  id v12;
  uint64_t v13;
  z_stream strm;
  _BYTE __ptr[8192];
  _QWORD v17[1025];

  v17[1024] = *MEMORY[0x1E0C80C00];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = 0;
  strm.next_in = 0;
  v7 = inflateInit2_(&strm, 31, "1.2.12", 112);
  if ((_DWORD)v7)
  {
    objc_msgSend(a1, "reportZlibResultToCA:forEvent:", v7, CFSTR("com.apple.powerlog.zlib.decompress"));
  }
  else
  {
    while (2)
    {
      v8 = fread(v17, 1uLL, 0x2000uLL, a3);
      strm.avail_in = v8;
      if (ferror(a3))
      {
LABEL_18:
        LODWORD(v7) = -1;
        v12 = a1;
        v13 = 0xFFFFFFFFLL;
LABEL_16:
        objc_msgSend(v12, "reportZlibResultToCA:forEvent:", v13, CFSTR("com.apple.powerlog.zlib.decompress"));
        inflateEnd(&strm);
      }
      else
      {
        if (v8)
        {
          strm.next_in = (Bytef *)v17;
          do
          {
            strm.avail_out = 0x2000;
            strm.next_out = __ptr;
            v9 = inflate(&strm, 0);
            v7 = v9;
            if ((v9 + 4) < 2)
              goto LABEL_15;
            if ((_DWORD)v9 == 2)
            {
              v7 = 4294967293;
LABEL_15:
              v12 = a1;
              v13 = v7;
              goto LABEL_16;
            }
            if ((_DWORD)v9 == -2)
              +[PLUtilities decompressWithSourceStream:withDestinationStream:].cold.1();
            v10 = 0x2000 - strm.avail_out;
            if (fwrite(__ptr, 1uLL, v10, a4) != v10 || ferror(a4))
              goto LABEL_18;
          }
          while (!strm.avail_out);
          if ((_DWORD)v7 != 1)
            continue;
          v11 = 0;
        }
        else
        {
          v11 = v7 != 1;
          if (v7 >= 2)
          {
            objc_msgSend(a1, "reportZlibResultToCA:forEvent:", v7, CFSTR("com.apple.powerlog.zlib.decompress"));
            v11 = 1;
          }
        }
        inflateEnd(&strm);
        LODWORD(v7) = v11 << 31 >> 31;
      }
      break;
    }
  }
  return v7;
}

+ (void)reportZlibResultToCA:(int)a3 forEvent:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  PLLogZlib();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[PLUtilities reportZlibResultToCA:forEvent:].cold.1();

  AnalyticsSendEventLazy();
}

id __45__PLUtilities_reportZlibResultToCA_forEvent___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("errorID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)extractDateStringAndUUIDStringFromFilePath:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("."));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v7, "count") - 2, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (unint64_t)directorySize:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subpathsOfDirectoryAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 0;
    do
    {
      objc_msgSend(v3, "stringByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attributesOfItemAtPath:error:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v9 += objc_msgSend(v11, "fileSize");
      objc_msgSend(v6, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    while (v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)numFilesAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PLUtilities numFilesAtPath:].cold.1();
    v8 = -1;
  }
  else
  {
    v8 = objc_msgSend(v5, "count");
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 1024;
      v14 = v8;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Num files at %@ = %d", buf, 0x12u);
    }
  }

  return v8;
}

+ (int64_t)compareFilesByKey:(id)a3 file1:(id)a4 file2:(id)a5 sortAscending:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int64_t v14;
  void *v16;
  id v17;

  v6 = a6;
  v17 = 0;
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "getResourceValue:forKey:error:", &v17, v10, 0);
  v11 = v17;
  v16 = 0;
  objc_msgSend(v9, "getResourceValue:forKey:error:", &v16, v10, 0);

  v12 = v16;
  if (v6)
  {
    v13 = v11;
  }
  else
  {
    v13 = v16;
    v12 = v11;
  }
  v14 = objc_msgSend(v13, "compare:", v12);

  return v14;
}

+ (int)remove:(int)a3 oldestFilesFromDirectory:(id)a4 containingFileNameSubstring:(id)a5
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  uint8_t buf[4];
  void *v40;
  uint8_t v41[24];
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  if (a3 >= 1 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__10;
    v33[4] = __Block_byref_object_dispose__10;
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = *MEMORY[0x1E0C998E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, v12, 4, &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v32;

    if (v14)
    {
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[PLUtilities remove:oldestFilesFromDirectory:containingFileNameSubstring:].cold.3();

      v9 = *((_DWORD *)v36 + 6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke;
        v29[3] = &unk_1E6A54048;
        v17 = v8;
        v30 = v17;
        v18 = v16;
        v31 = v18;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v29);
        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          +[PLUtilities remove:oldestFilesFromDirectory:containingFileNameSubstring:].cold.2((uint64_t)v17, v41, objc_msgSend(v18, "count"), v19);

        v20 = v30;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          +[PLUtilities remove:oldestFilesFromDirectory:containingFileNameSubstring:].cold.1();
      }

      objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_65);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "subarrayWithRange:", 0, a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v22;
        _os_log_impl(&dword_1B6AB6000, v23, OS_LOG_TYPE_INFO, "Removing files: %@", buf, 0xCu);
      }

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_66;
      v25[3] = &unk_1E6A54090;
      v27 = v33;
      v26 = v10;
      v28 = &v35;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v25);
      v9 = *((_DWORD *)v36 + 6);

    }
    _Block_object_dispose(v33, 8);

  }
  _Block_object_dispose(&v35, 8);

  return v9;
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

uint64_t __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;

  v4 = a2;
  v5 = a3;
  v19 = 0;
  v6 = *MEMORY[0x1E0C998E8];
  v18 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v19, v6, &v18);
  v7 = v19;
  v8 = (unint64_t)v18;
  v16 = 0;
  v17 = 0;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v17, v6, &v16);
  v9 = v17;
  v10 = (unint64_t)v16;
  if (v8 | v10)
  {
    if (v8)
    {
      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_63_cold_2();

    }
    if (v10)
    {
      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_63_cold_2();

    }
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_63_cold_1();

    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v7, "compare:", v9);
  }

  return v14;
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_66(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = (void *)a1[4];
  v7 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "removeItemAtURL:error:", v3, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_66_cold_1();

  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

+ (BOOL)markFilesInDirectoryAsPurgeable:(id)a3 ofType:(id)a4 withUrgency:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  unsigned __int8 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v7, &v36);
  v11 = v36;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[PLUtilities markFilesInDirectoryAsPurgeable:ofType:withUrgency:].cold.2();
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v7, &v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v35;

    if (v16)
    {
      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[PLUtilities markFilesInDirectoryAsPurgeable:ofType:withUrgency:].cold.1();
      v13 = 0;
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v17 = v15;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      if (v18)
      {
        v19 = v18;
        v29 = v15;
        v30 = v7;
        v20 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v22, "pathExtension");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR(".%@"), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v8 && (objc_msgSend(v8, "containsObject:", v25) & 1) == 0)
            {
              PLLogCommon();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v22, "pathExtension");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v38 = v22;
                v39 = 2112;
                v40 = v27;
                _os_log_debug_impl(&dword_1B6AB6000, v26, OS_LOG_TYPE_DEBUG, "Skipping %@ for marking as purgeable -- file is of type '%@' & doesn't not match given extension filter.", buf, 0x16u);

              }
            }
            else if (!+[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v22, a5))
            {

              v13 = 0;
              goto LABEL_27;
            }

          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
          v13 = 1;
        }
        while (v19);
LABEL_27:
        v16 = 0;
        v7 = v30;
        v15 = v29;
      }
      else
      {
        v13 = 1;
      }
    }

  }
  return v13;
}

+ (BOOL)markFilesAsPurgeable:(id)a3 withUrgency:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!+[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), a4, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

+ (BOOL)markFileAsPurgeable:(id)a3 withUrgency:(unint64_t)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  int *v12;
  char *v13;
  BOOL v14;
  unint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = a4 | 0x10005;
  v5 = objc_retainAutorelease(a3);
  v6 = open((const char *)objc_msgSend(v5, "UTF8String"), 0);
  if (v6 < 0)
  {
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[PLUtilities markFileAsPurgeable:withUrgency:].cold.1((uint64_t)v5, v10);
    goto LABEL_7;
  }
  v7 = v6;
  v8 = ffsctl(v6, 0xC0084A44uLL, &v16, 0);
  close(v7);
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = v16;
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 138413058;
      v18 = v5;
      v19 = 2048;
      v20 = v11;
      v21 = 1024;
      v22 = v8;
      v23 = 2080;
      v24 = v13;
      _os_log_error_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_ERROR, "Failed to mark %@ purgeable - flags 0x%llx returned %d (%s)", buf, 0x26u);
    }
LABEL_7:
    v14 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Marked %@ purgeable with urgency: %llu", buf, 0x16u);
  }
  v14 = 1;
LABEL_11:

  return v14;
}

void __31__PLUtilities_workQueueForKey___block_invoke()
{
  int v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  NSObject *attr;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    v0 = 25;
  else
    v0 = 9;
  workQueueForKey__qos = v0;
  v1 = objc_opt_new();
  v2 = (void *)workQueueForKey__workQueueDictionary;
  workQueueForKey__workQueueDictionary = v1;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)workQueueForKey__qos, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v4 = dispatch_queue_create("com.apple.powerlog.workqueue.general", attr);
  objc_msgSend((id)workQueueForKey__workQueueDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("__GeneralWorkQueue__"));

}

+ (id)workQueue
{
  return +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("__GeneralWorkQueue__"));
}

+ (unint64_t)dispatchTimeInSeconds:(double)a3
{
  return dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
}

void __52__PLUtilities_postNotificationName_object_userInfo___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("PostNotificationQueue"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)postNotificationName_object_userInfo__notificationQueue;
  postNotificationName_object_userInfo__notificationQueue = v0;

}

uint64_t __35__PLUtilities_getMachbaseTimeRatio__block_invoke()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  double v3;
  mach_timebase_info info;

  info = 0;
  result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    result = _os_assumes_log();
    v3 = 1.0;
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    v3 = (double)v1 / (double)v2;
  }
  getMachbaseTimeRatio_ratio = *(_QWORD *)&v3;
  return result;
}

+ (id)dateFromTimevalSystemTime:(timeval)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3.tv_usec / 1000000.0 + (double)a3.tv_sec);
}

+ (id)deviceBootTime
{
  if (deviceBootTime_onceToken != -1)
    dispatch_once(&deviceBootTime_onceToken, &__block_literal_global_80);
  return (id)objc_msgSend((id)deviceBootTime_bootTime, "convertFromSystemToMonotonic");
}

void __29__PLUtilities_deviceBootTime__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  int v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v3 = 0;
  *(_QWORD *)v5 = 0x1500000001;
  v4 = 16;
  if (sysctl(v5, 2u, &v2, &v4, 0, 0) != -1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)v3 / 1000000.0 + (double)v2);
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)deviceBootTime_bootTime;
    deviceBootTime_bootTime = v0;

  }
}

+ (id)deviceBootUUID
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  _QWORD block[5];
  size_t v23;
  _BYTE v24[37];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  memset(v24, 0, sizeof(v24));
  v23 = 37;
  v2 = sysctlbyname("kern.bootsessionuuid", v24, &v23, 0, 0);
  if (v2)
  {
    if (v2 == -1)
      +[PLUtilities deviceBootUUID].cold.2();
    if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      goto LABEL_18;
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__PLUtilities_deviceBootUUID__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (deviceBootUUID_defaultOnce != -1)
      dispatch_once(&deviceBootUUID_defaultOnce, block);
    if (!deviceBootUUID_classDebugEnabled)
    {
LABEL_18:
      v9 = 0;
      return v9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to get system boot session uuid %d"), *__error());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities deviceBootUUID]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 821);

    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    v9 = 0;
    goto LABEL_17;
  }
  v24[36] = 0;
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v12 = objc_opt_class();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __29__PLUtilities_deviceBootUUID__block_invoke_89;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v12;
    if (deviceBootUUID_defaultOnce_87 != -1)
      dispatch_once(&deviceBootUUID_defaultOnce_87, &v17);
    if (deviceBootUUID_classDebugEnabled_88)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("system boot session uuid: %@"), v9, v17, v18, v19, v20, v21);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities deviceBootUUID]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v14, v15, 826);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_17:

    }
  }
  return v9;
}

BOOL __29__PLUtilities_deviceBootUUID__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  deviceBootUUID_classDebugEnabled = result;
  return result;
}

BOOL __29__PLUtilities_deviceBootUUID__block_invoke_89(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  deviceBootUUID_classDebugEnabled_88 = result;
  return result;
}

+ (BOOL)deviceRebooted
{
  if (deviceRebooted_onceToken != -1)
    dispatch_once(&deviceRebooted_onceToken, &__block_literal_global_92);
  return deviceRebooted___deviceRebooted;
}

void __29__PLUtilities_deviceRebooted__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  +[PLUtilities deviceBootUUID](PLUtilities, "deviceBootUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", CFSTR("BootSessionUUID"));
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (v0)
    {
      v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v0);
      deviceRebooted___deviceRebooted = objc_msgSend(v1, "isEqual:", v3) ^ 1;

      if (!deviceRebooted___deviceRebooted)
        goto LABEL_8;
    }
    else
    {
      deviceRebooted___deviceRebooted = 1;
    }
    objc_msgSend(v3, "UUIDString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v2, CFSTR("BootSessionUUID"), 1);

LABEL_8:
    goto LABEL_9;
  }
  deviceRebooted___deviceRebooted = 0;
LABEL_9:

}

+ (double)getLastSystemTimeOffset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("TimeOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEntryForKey:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("system"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[PLUtilities getLastSystemTimeOffset].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  return v8;
}

+ (id)getLastBatteryTimestamp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastEntryForKey:", CFSTR("PLBatteryAgent_EventBackward_Battery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled = result;
  return result;
}

BOOL __74__PLUtilities_getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime___block_invoke_103(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getCurrentMonotonicAndMachAbsTime_machAbsTime_machContTime__classDebugEnabled_102 = result;
  return result;
}

double __30__PLUtilities_getMachTimebase__block_invoke()
{
  double result;

  if (mach_timebase_info((mach_timebase_info_t)&getMachTimebase_machTimeInfo))
  {
    _os_assumes_log();
  }
  else if (dword_1ED5398EC)
  {
    return result;
  }
  *(_QWORD *)&result = 0x100000001;
  getMachTimebase_machTimeInfo = 0x100000001;
  return result;
}

+ (unint64_t)getCurrMachAbsTimeInSecs
{
  uint64_t v3;
  unsigned int *v4;

  v3 = mach_absolute_time();
  v4 = (unsigned int *)objc_msgSend(a1, "getMachTimebase");
  return v3 * *v4 / v4[1] / 0x3B9ACA00;
}

+ (signed)connectionToQuarantine:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  signed __int16 v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  int v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "filePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasSuffix:", CFSTR(".PLSQL"));

    if ((v6 & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v4, "filePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasSuffix:", CFSTR(".EPSQL"));

      if ((v9 & 1) != 0)
      {
        v7 = 2;
      }
      else
      {
        objc_msgSend(v4, "filePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "hasSuffix:", CFSTR(".CESQL"));

        if ((v11 & 1) != 0)
        {
          v7 = 3;
        }
        else
        {
          objc_msgSend(v4, "filePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "hasSuffix:", CFSTR(".XCSQL"));

          if ((v13 & 1) != 0)
          {
            v7 = 4;
          }
          else
          {
            objc_msgSend(v4, "filePath");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "hasSuffix:", CFSTR(".BGSQL"));

            if (v15)
              v7 = 5;
            else
              v7 = 0;
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)exitWithReason:(signed __int16)a3
{
  +[PLUtilities exitWithReason:action:](PLUtilities, "exitWithReason:action:", a3, 0);
}

+ (void)exitWithReason:(signed __int16)a3 connection:(id)a4
{
  +[PLUtilities exitWithReason:action:](PLUtilities, "exitWithReason:action:", a3, +[PLUtilities connectionToQuarantine:](PLUtilities, "connectionToQuarantine:", a4));
}

+ (void)exitWithReason:(signed __int16)a3 action:(signed __int16)a4
{
  NSObject *v6;
  _QWORD block[4];
  signed __int16 v8;
  signed __int16 v9;

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PLUtilities_exitWithReason_action___block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v8 = a3;
  v9 = a4;
  dispatch_async(v6, block);

}

void __37__PLUtilities_exitWithReason_action___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  __int16 v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  NSObject *v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("exitReason=%i"), *(__int16 *)(a1 + 32));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities exitWithReason:action:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v4, v5, 974);

    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v2;
      _os_log_debug_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  v7 = *(_WORD *)(a1 + 34);
  if (+[PLUtilities PreUnlockTelemetryEnabled](PLUtilities, "PreUnlockTelemetryEnabled"))
  {
    v8 = 0;
  }
  else
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "storageLocked");

  }
  v11 = *(__int16 *)(a1 + 32);
  if (v11 > 99 || (v8 & 1) != 0)
  {
    if (v11 >= 1001)
    {
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities createAndChownDirectory:](PLUtilities, "createAndChownDirectory:", v16);

      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities createAndChownDirectory:](PLUtilities, "createAndChownDirectory:", v18);

      v19 = CFSTR("%@CorruptPowerlog_%f%@");
      v20 = CFSTR("PLExitReasonCorrupt");
      v21 = CFSTR("com.apple.power.error.corruptDB");
      switch(*(_WORD *)(a1 + 32))
      {
        case 0x3E9:
          goto LABEL_24;
        case 0x3EA:
          v7 = 0;
          v19 = CFSTR("%@SubmissionTimeoutPowerlog_%f%@");
          v20 = CFSTR("PLExitReasonSubmissionTimeout");
          v21 = CFSTR("com.apple.power.error.SubmissionTimeoutDB");
          goto LABEL_24;
        case 0x3EB:
          v19 = CFSTR("%@ArchiveTimeoutPowerlog_%f%@");
          v20 = CFSTR("PLExitReasonArchiveTimeout");
          v21 = CFSTR("com.apple.power.error.ArchiveTimeoutDB");
          goto LABEL_24;
        case 0x3EC:
          v19 = CFSTR("%@ArchiveMaxAttemptsPowerlog_%f%@");
          v20 = CFSTR("PLExitReasonArchiveMaxAttempts");
          v21 = CFSTR("com.apple.power.error.ArchiveMaxAttemptsDB");
          goto LABEL_24;
        case 0x3ED:
          v19 = CFSTR("%@TooLargePowerlog_%f%@");
          v20 = CFSTR("PLExitReasonTooLarge");
          v21 = CFSTR("com.apple.power.error.tooLargeDB");
          goto LABEL_24;
        case 0x3EE:
          v19 = CFSTR("%@MonotonicTimePowerlog_%f%@");
          v7 = 6;
          v20 = CFSTR("PLExitReasonMonotonicTime");
          v21 = CFSTR("com.apple.power.error.monotonicTimeDB");
          goto LABEL_24;
        case 0x3EF:
          v19 = CFSTR("%@SQLVersionMismatchPowerlog_%f%@");
          v20 = CFSTR("PLExitReasonSQLVersionMismatch");
          v21 = CFSTR("com.apple.power.error.SQLVersionMismatchDB");
          goto LABEL_24;
        case 0x3F0:
          v19 = CFSTR("%@NewFileRequiredPowerlog_%f%@");
          v20 = CFSTR("PLExitReasonNewFileRequired");
          v21 = CFSTR("com.apple.power.error.NewFileRequiredDB");
          goto LABEL_24;
        case 0x3F1:
          v19 = CFSTR("%@KernelTimePowerlog_%f%@");
          v7 = 6;
          v20 = CFSTR("kPLExitReasonDescKernelTime");
          v21 = CFSTR("com.apple.power.error.kernelTimeDB");
LABEL_24:
          PLADClientAddValueForScalarKey(v21, 1);
          AnalyticsSendEventLazy();
          break;
        default:
          v20 = 0;
          v19 = 0;
          break;
      }
      if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
        v7 = 0;
      +[PLUtilities quarantineToPath:action:](PLUtilities, "quarantineToPath:action:", v19, v7);
      +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("PLUUID"), 1);
LABEL_28:
      if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)(a1 + 32));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v22, CFSTR("PLExitReasonKey"), 1);

      }
      v23 = *(__int16 *)(a1 + 32);
      if (v23 >= 1001)
      {
        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v26 = v20;
          v27 = 1024;
          v28 = v7;
          _os_log_fault_impl(&dword_1B6AB6000, v24, OS_LOG_TYPE_FAULT, "Exiting due to %{public}@ action=%d", buf, 0x12u);
        }

        LOWORD(v23) = *(_WORD *)(a1 + 32);
      }
      exit((__int16)v23 > 99);
    }
  }
  else if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ExitReason=%i"), *(__int16 *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "blockingFlushCachesWithReason:", v14);

  }
  v20 = 0;
  goto LABEL_28;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_131()
{
  return &unk_1E6AF7390;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_2()
{
  return &unk_1E6AF73B8;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_3()
{
  return &unk_1E6AF73E0;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_4()
{
  return &unk_1E6AF7408;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_5()
{
  return &unk_1E6AF7430;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_6()
{
  return &unk_1E6AF7458;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_7()
{
  return &unk_1E6AF7480;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_8()
{
  return &unk_1E6AF74A8;
}

void *__37__PLUtilities_exitWithReason_action___block_invoke_9()
{
  return &unk_1E6AF74D0;
}

+ (void)exitWithReasonSync:(signed __int16)a3
{
  uint64_t v3;
  NSObject *dsema;

  v3 = a3;
  dsema = dispatch_semaphore_create(0);
  objc_msgSend(a1, "exitWithReason:", v3);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);

}

+ (void)exitSafe:(int)a3
{
  exit(a3);
}

+ (void)quarantineToPath:(id)a3 action:(signed __int16)a4
{
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  BOOL v53;
  uint8_t buf[4];
  _BOOL4 v55;
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v55 = v4;
    _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "quarantine action: %hd", buf, 8u);
  }

  if (v4 == 6 || v4 == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v5, v13, v8, CFSTR(".PLSQL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "PLSQLConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v14);

  }
  else
  {
    v14 = 0;
  }
  if ((v4 | 4) == 6)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v5, v19, v8, CFSTR(".EPSQL"));
    v20 = objc_claimAutoreleasedReturnValue();

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "EPSQLConnection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v20);

    v14 = (void *)v20;
  }
  if (v4 == 6 || v4 == 3)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v5, v25, v8, CFSTR(".CESQL"));
    v26 = objc_claimAutoreleasedReturnValue();

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "CESQLConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, v26);

    v14 = (void *)v26;
  }
  if ((v4 | 2) == 6)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v5, v31, v8, CFSTR(".XCSQL"));
    v32 = objc_claimAutoreleasedReturnValue();

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "XCSQLConnection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, v32);

    v14 = (void *)v32;
  }
  if ((unsigned __int16)(v4 - 5) <= 1u)
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", v5, v37, v8, CFSTR(".BGSQL"));
    v38 = objc_claimAutoreleasedReturnValue();

    +[PPSCoreStorage sharedSQLStorage](PPSCoreStorage, "sharedSQLStorage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "BGSQLConnection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, v38);

    v14 = (void *)v38;
  }
  v41 = +[PLUtilities shouldCreateQuarantine](PLUtilities, "shouldCreateQuarantine");
  PLLogCommon();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v55 = v41;
    _os_log_impl(&dword_1B6AB6000, v42, OS_LOG_TYPE_DEFAULT, "should quarantine: %d", buf, 8u);
  }

  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __39__PLUtilities_quarantineToPath_action___block_invoke;
  v51[3] = &unk_1E6A54298;
  v43 = v9;
  v52 = v43;
  v53 = v41;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v51);
  if (+[PLDefaults fullMode](PLDefaults, "fullMode") && (v4 == 6 || v4 == 1))
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", v5, v46, v8, CFSTR(".PLSQL"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "lastPathComponent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "lastPathComponent");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities moveItemAtPath:toPath:withName:error:](PLUtilities, "moveItemAtPath:toPath:withName:error:", v47, v49, v50, 0);

    +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v49, 32);
    v14 = v47;
  }

}

void __39__PLUtilities_quarantineToPath_action___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __39__PLUtilities_quarantineToPath_action___block_invoke_cold_2(v4, v5);

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __39__PLUtilities_quarantineToPath_action___block_invoke_cold_1();

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v4, "moveDatabaseToPath:", v3);
    objc_msgSend((id)objc_opt_class(), "removeAdditionalFiles:", v3);
    +[PLUtilities markFileAsPurgeable:withUrgency:](PLUtilities, "markFileAsPurgeable:withUrgency:", v3, 32);
  }
  else
  {
    objc_msgSend(v4, "truncateDB");
  }

}

+ (BOOL)shouldCreateQuarantine
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v6;
  void *v7;
  unsigned int v8;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PLUtilities numFilesAtPath:](PLUtilities, "numFilesAtPath:", v3);

  if (v4 > 9)
    return 0;
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/Quarantine/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PLUtilities numFilesAtPath:](PLUtilities, "numFilesAtPath:", v7);

  return v8 < 0xA;
}

+ (id)getPerfStatsForProcess:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[PLUtilities getPerfStatsForProcess:].cold.2();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "timeIntervalSince1970");
  v10 = v9;
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("SELECT LaunchdName AS BundleID, SUM(cpu_time) AS cpu_seconds, SUM(cpu_instructions) AS cpu_instructions, SUM(cpu_cycles) AS cpu_cycles FROM %@ where LaunchdName = '%@' AND timestamp >= %f and timestamp < %f"), CFSTR("PLCoalitionAgent_EventInterval_CoalitionInterval"), v4, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_DEFAULT, "[Perf Stats Query] %@", buf, 0xCu);
  }

  +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performQuery:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count")
    && (objc_msgSend(v15, "firstObject"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BundleID")),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isNil"),
        v17,
        v16,
        !v18))
  {
    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_impl(&dword_1B6AB6000, v21, OS_LOG_TYPE_DEFAULT, "Report perf stats to CA for %@", buf, 0xCu);

    }
    objc_msgSend(v15, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[PLUtilities getPerfStatsForProcess:].cold.1();

    v20 = 0;
  }

  return v20;
}

void __40__PLUtilities_launchdNameToProcessName___block_invoke()
{
  void *v0;

  v0 = (void *)launchdNameToProcessName__launchdNameToProcessNameDict;
  launchdNameToProcessName__launchdNameToProcessNameDict = (uint64_t)&unk_1E6AF74F8;

}

+ (id)binaryPathForPid:(int)a3
{
  void *v3;
  void *v4;
  _BYTE buffer[4096];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bundleIDFromProcessName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "length"))
  {
    if (bundleIDFromProcessName__onceToken != -1)
      dispatch_once(&bundleIDFromProcessName__onceToken, &__block_literal_global_267);
    objc_msgSend((id)bundleIDFromProcessName__processNameToBundleID, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend((id)bundleIDFromProcessName__processNameToBundleID, "objectForKeyedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __39__PLUtilities_bundleIDFromProcessName___block_invoke_2;
      v14[3] = &unk_1E6A54300;
      v7 = v3;
      v15 = v7;
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCC9EB70](v14);
      ((void (**)(_QWORD, const __CFString *, const __CFString *))v8)[2](v8, CFSTR("PLProcessMonitorAgent_EventForward_ProcessID"), CFSTR("ProcessName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9
        && (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BundleID")),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        ((void (**)(_QWORD, const __CFString *, const __CFString *))v8)[2](v8, CFSTR("PLApplicationAgent_EventNone_AllApps"), CFSTR("AppExecutable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v13;
      }
      objc_msgSend((id)bundleIDFromProcessName__processNameToBundleID, "setObject:forKeyedSubscript:", v12, v7);

      objc_msgSend((id)bundleIDFromProcessName__processNameToBundleID, "objectForKeyedSubscript:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __39__PLUtilities_bundleIDFromProcessName___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bundleIDFromProcessName__processNameToBundleID;
  bundleIDFromProcessName__processNameToBundleID = v0;

}

id __39__PLUtilities_bundleIDFromProcessName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PLValueComparison *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:]([PLValueComparison alloc], "initWithKey:withValue:withComparisonOperation:", v5, *(_QWORD *)(a1 + 32), 0);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastEntryForKey:withComparisons:isSingleton:", v6, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)bundleIDFromPid:(int)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "binaryPathForPid:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    objc_msgSend(a1, "bundleIDFromURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)bundleVersionFromURL:(id)a3
{
  __CFBundle *Unique;
  __CFBundle *v4;
  void *v5;

  if (a3)
  {
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    v4 = Unique;
    if (Unique)
    {
      CFBundleGetValueForInfoDictionaryKey(Unique, (CFStringRef)*MEMORY[0x1E0C9AAF0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)processNameForPid:(int)a3
{
  void *v3;
  size_t v5;
  int v6[2];
  int v7;
  int v8;
  _OWORD v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 512);
  v5 = 648;
  *(_QWORD *)v6 = 0xE00000001;
  v7 = 1;
  v8 = a3;
  if (sysctl(v6, 4u, v9, &v5, 0, 0) < 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)&v9[15] + 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)fullProcessNameForPid:(int)a3
{
  void *v4;
  char buffer[4096];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 < 1 || (bzero(buffer, 0x1000uLL), proc_pidpath(a3, buffer, 0x1000u) < 1))
  {
    v4 = 0;
  }
  else
  {
    buffer[4095] = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", basename(buffer));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (unint64_t)maxProcessCount
{
  NSObject *v2;
  size_t v4;
  unint64_t v5;

  v4 = 8;
  v5 = 0;
  if (!sysctlbyname("kern.maxproc", &v5, &v4, 0, 0))
    return v5;
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[PLUtilities maxProcessCount].cold.1(v2);

  return 0;
}

+ (BOOL)isDaemonOrAppleXPCService:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v13;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)MEMORY[0x1E0D87D68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "handleForIdentifier:error:", v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[PLUtilities isDaemonOrAppleXPCService:].cold.2((uint64_t)v7, v3, v9);
  if ((objc_msgSend(v8, "isDaemon") & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v8, "isXPCService"))
  {
    objc_msgSend(v8, "xpcServiceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple"));

  }
  else
  {
    v10 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[PLUtilities isDaemonOrAppleXPCService:].cold.1(v10, v3);

  return v10;
}

+ (unint64_t)coalitionIDForPid:(int)a3
{
  int v3;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = proc_pidinfo(a3, 20, 1uLL, v5, 40);
  if (v3 == 40)
    return *(_QWORD *)&v5[0];
  else
    return -v3;
}

+ (id)liteModeDaemonName
{
  return CFSTR("PerfPowerServices");
}

+ (BOOL)isLiteModeDaemon
{
  if (isLiteModeDaemon_onceToken != -1)
    dispatch_once(&isLiteModeDaemon_onceToken, &__block_literal_global_284);
  return isLiteModeDaemon_isLiteModeDaemon;
}

void __31__PLUtilities_isLiteModeDaemon__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities liteModeDaemonName](PLUtilities, "liteModeDaemonName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isLiteModeDaemon_isLiteModeDaemon = objc_msgSend(v0, "isEqualToString:", v1);

}

+ (id)fullModeDaemonName
{
  return CFSTR("PerfPowerServicesExtended");
}

void __31__PLUtilities_isFullModeDaemon__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities fullModeDaemonName](PLUtilities, "fullModeDaemonName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  isFullModeDaemon_isFullModeDaemon = objc_msgSend(v0, "isEqualToString:", v1);

}

void __32__PLUtilities_isPowerlogHelperd__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isPowerlogHelperd_isPowerlogHelperd = objc_msgSend(v0, "isEqualToString:", CFSTR("powerlogHelperd"));

}

+ (BOOL)runningAsMobileUser
{
  if (runningAsMobileUser_onceToken != -1)
    dispatch_once(&runningAsMobileUser_onceToken, &__block_literal_global_292);
  return runningAsMobileUser_runningAsMobileUser;
}

void __34__PLUtilities_runningAsMobileUser__block_invoke()
{
  id v0;

  +[PLUtilities runningAsUser](PLUtilities, "runningAsUser");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  runningAsMobileUser_runningAsMobileUser = objc_msgSend(v0, "caseInsensitiveCompare:", CFSTR("mobile")) == 0;

}

+ (id)runningAsUser
{
  if (runningAsUser_onceToken != -1)
    dispatch_once(&runningAsUser_onceToken, &__block_literal_global_295);
  return NSUserName();
}

void __28__PLUtilities_runningAsUser__block_invoke()
{
  uint64_t v0;
  void *v1;

  NSUserName();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)runningAsUser_userName;
  runningAsUser_userName = v0;

}

+ (BOOL)shouldLogPreUnlockTelemetry
{
  if (shouldLogPreUnlockTelemetry_onceToken != -1)
    dispatch_once(&shouldLogPreUnlockTelemetry_onceToken, &__block_literal_global_296);
  return shouldLogPreUnlockTelemetry___shouldLogPreUnlockTelemetry;
}

void __42__PLUtilities_shouldLogPreUnlockTelemetry__block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  if (+[PLUtilities PreUnlockTelemetryEnabled](PLUtilities, "PreUnlockTelemetryEnabled"))
  {
    +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "storage");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "storageLocked");

    if (v2)
      shouldLogPreUnlockTelemetry___shouldLogPreUnlockTelemetry = 1;
  }
}

+ (BOOL)AppDeletionEnabled
{
  if (AppDeletionEnabled_onceToken != -1)
    dispatch_once(&AppDeletionEnabled_onceToken, &__block_literal_global_297);
  return AppDeletionEnabled_appDeletionEnabled;
}

uint64_t __33__PLUtilities_AppDeletionEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AppDeletionEnabled_appDeletionEnabled = result;
  return result;
}

+ (BOOL)SwitchToIncrementalVacuumEnabled
{
  if (SwitchToIncrementalVacuumEnabled_onceToken != -1)
    dispatch_once(&SwitchToIncrementalVacuumEnabled_onceToken, &__block_literal_global_300);
  return SwitchToIncrementalVacuumEnabled_incrementalVacuumEnabled;
}

uint64_t __47__PLUtilities_SwitchToIncrementalVacuumEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  SwitchToIncrementalVacuumEnabled_incrementalVacuumEnabled = result;
  return result;
}

+ (BOOL)PreUnlockTelemetryEnabled
{
  if (PreUnlockTelemetryEnabled_onceToken != -1)
    dispatch_once(&PreUnlockTelemetryEnabled_onceToken, &__block_literal_global_302);
  return PreUnlockTelemetryEnabled_preUnlockTelemetryEnabled;
}

uint64_t __40__PLUtilities_PreUnlockTelemetryEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  PreUnlockTelemetryEnabled_preUnlockTelemetryEnabled = result;
  return result;
}

uint64_t __39__PLUtilities_OverrideAllowlistEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  OverrideAllowlistEnabled_overrideAllowlistEnabled = result;
  return result;
}

+ (BOOL)hasGasGauge
{
  if (hasGasGauge_onceToken != -1)
    dispatch_once(&hasGasGauge_onceToken, &__block_literal_global_306);
  return hasGasGauge___hasGasGauge;
}

uint64_t __26__PLUtilities_hasGasGauge__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasGasGauge___hasGasGauge = result;
  return result;
}

+ (BOOL)hasBattery
{
  if (hasBattery_onceToken != -1)
    dispatch_once(&hasBattery_onceToken, &__block_literal_global_309);
  return hasBattery___hasBattery;
}

void __25__PLUtilities_hasBattery__block_invoke()
{
  NSObject *v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  hasBattery___hasBattery = MGGetBoolAnswer();
  PLLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = hasBattery___hasBattery;
    _os_log_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEFAULT, "Battery detected: %d", (uint8_t *)v1, 8u);
  }

}

+ (BOOL)inBUIDemoMode
{
  if (inBUIDemoMode_defaultOnce != -1)
    dispatch_once(&inBUIDemoMode_defaultOnce, &__block_literal_global_312);
  return inBUIDemoMode_demoMode;
}

void __28__PLUtilities_inBUIDemoMode__block_invoke()
{
  id v0;

  +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", CFSTR("BUI_DEMO_MODE"), CFSTR("com.apple.powerlogd"), 1);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  inBUIDemoMode_demoMode = objc_msgSend(v0, "BOOLValue");

}

+ (double)defaultBatteryEnergyCapacity
{
  double result;

  +[PLModelingUtilities defaultBatteryEnergyCapacity](PLModelingUtilities, "defaultBatteryEnergyCapacity");
  return result;
}

+ (BOOL)isHeySiriEnabled
{
  if (isHeySiriEnabled_onceToken != -1)
    dispatch_once(&isHeySiriEnabled_onceToken, &__block_literal_global_318);
  return isHeySiriEnabled_retValue;
}

void __31__PLUtilities_isHeySiriEnabled__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("VoiceTrigger Enabled"), CFSTR("com.apple.voicetrigger"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v0)
  {
    v1 = v0;
    isHeySiriEnabled_retValue = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

+ (BOOL)isSiriEnabled
{
  if (isSiriEnabled_onceToken != -1)
    dispatch_once(&isSiriEnabled_onceToken, &__block_literal_global_323);
  return isSiriEnabled_retValue;
}

void __28__PLUtilities_isSiriEnabled__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("Assistant Enabled"), CFSTR("com.apple.assistant.support"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v0)
  {
    v1 = v0;
    isSiriEnabled_retValue = objc_msgSend(v0, "BOOLValue");
    v0 = v1;
  }

}

+ (BOOL)isHealthDataSubmissionAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHealthDataSubmissionAllowed");

  return v3;
}

+ (BOOL)isSafetyDataSubmissionAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSafetyDataSubmissionAllowed");

  return v3;
}

+ (BOOL)isImproveFitnessPlusEnabled
{
  NSObject *v2;

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[PLUtilities isImproveFitnessPlusEnabled].cold.1();

  return 0;
}

uint64_t __36__PLUtilities_isAppAnalyticsEnabled__block_invoke()
{
  uint64_t result;

  result = AppAnalyticsEnabled();
  isAppAnalyticsEnabled_appAnalyticsEnabled = result;
  return result;
}

+ (BOOL)isEduMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)MKBUserTypeDeviceMode();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5A0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4E5A8]))
      v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D4E5E8]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isALSCurveHigherThanDefault
{
  return +[PLModelingUtilities alsCurveHigherThanDefault](PLModelingUtilities, "alsCurveHigherThanDefault");
}

+ (id)hashString:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PLUtilities_hashString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v4 = hashString__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&hashString__onceToken, block);
  objc_msgSend(a1, "generateHashValue:withSalt:", v5, hashString__salt);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __26__PLUtilities_hashString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", CFSTR("PLSalt")))
    +[PLDefaults objectForKey:synchronize:](PLDefaults, "objectForKey:synchronize:", CFSTR("PLSalt"), 1);
  else
    objc_msgSend(*(id *)(a1 + 32), "generateAndUpdateSaltValue:", CFSTR("PLSalt"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hashString__salt;
  hashString__salt = v2;

}

+ (id)hashBundleID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!saltBundleID)
  {
    if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", CFSTR("PLSaltBundleID")))
      +[PLDefaults objectForKey:synchronize:](PLDefaults, "objectForKey:synchronize:", CFSTR("PLSaltBundleID"), 1);
    else
      objc_msgSend(a1, "generateAndUpdateSaltValue:", CFSTR("PLSaltBundleID"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)saltBundleID;
    saltBundleID = v5;

  }
  objc_msgSend(a1, "generateHashValue:withSalt:", v4, saltBundleID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)generateAndUpdateSaltValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v6, v4, 1);
  LODWORD(v5) = objc_msgSend(v4, "isEqualToString:", CFSTR("PLSaltBundleID"));

  if ((_DWORD)v5)
    objc_storeStrong((id *)&saltBundleID, v6);
  return v6;
}

+ (id)generateHashValue:(id)a3 withSalt:(id)a4
{
  id v4;
  const char *v5;
  CC_LONG v6;
  unsigned __int8 md[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, a4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  *(_QWORD *)md = 0;
  v9 = 0;
  v6 = strlen(v5);
  CC_MD5(v5, v6, md);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v9, BYTE1(v9), BYTE2(v9), BYTE3(v9), BYTE4(v9), BYTE5(v9), BYTE6(v9), HIBYTE(v9));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)buildVersion
{
  return (id)MGCopyAnswer();
}

+ (id)supplementalBuildVersion
{
  return (id)MGCopyAnswer();
}

+ (id)automatedDeviceGroup
{
  return +[PLUtilities mobileUserADG](PLUtilities, "mobileUserADG");
}

+ (id)crashReporterKey
{
  if (crashReporterKey_onceToken != -1)
    dispatch_once(&crashReporterKey_onceToken, &__block_literal_global_356);
  return (id)crashReporterKey_crkey;
}

void __31__PLUtilities_crashReporterKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)crashReporterKey_crkey;
  crashReporterKey_crkey = v0;

}

+ (id)mobileUserADG
{
  void *v2;
  id v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("AutomatedDeviceGroup"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

+ (id)allSubClassesForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  Class *v10;
  unint64_t i;
  objc_class *Superclass;
  unsigned int outCount;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**allSubclassesFire!**"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities allSubClassesForClass:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 1933);

    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v10 = objc_copyClassList(&outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Superclass = v10[i];
      do
        Superclass = class_getSuperclass(Superclass);
      while (Superclass && Superclass != a3);
      if (Superclass)
        objc_msgSend(v9, "addObject:", v10[i]);
    }
  }
  free(v10);
  return v9;
}

+ (id)shortUUIDString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "length") >= 8)
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)JSONSanitizeDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3) & 1) == 0)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Non JSON-able object:%@"), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities JSONSanitizeDictionary:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 1984);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
    v9 = (void *)objc_opt_new();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__PLUtilities_JSONSanitizeDictionary___block_invoke;
    v13[3] = &unk_1E6A53478;
    v10 = v9;
    v14 = v10;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = v10;

    v3 = v11;
  }
  return v3;
}

void __38__PLUtilities_JSONSanitizeDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isNil") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "timeIntervalSince1970");
      objc_msgSend(v7, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v5);

    }
    else if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v6))
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
    }
    else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("JSON: unable to serialize key=%@ value=%@"), v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLUtilities.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLUtilities JSONSanitizeDictionary:]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 1995);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

+ (BOOL)isValidString:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend(v3, "isEqualToString:", &stru_1E6A56538) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

+ (id)getKVPairsForCASubmissionFromEntry:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PLUtilities_getKVPairsForCASubmissionFromEntry___block_invoke;
  v9[3] = &unk_1E6A53478;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

void __50__PLUtilities_getKVPairsForCASubmissionFromEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
    }
  }

}

+ (jetsam_priority_info)getJetamPriority:(int)a3
{
  unsigned int v3;

  if (memorystatus_control() == 24)
  {
    v3 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[PLUtilities getJetamPriority:].cold.1();
    v3 = -1;
  }
  return (jetsam_priority_info)(v3 | 0x100000000);
}

+ (process_memory_limit_info)getProcessMemoryLimit:(int)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  if (memorystatus_control() != 24 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[PLUtilities getJetamPriority:].cold.1();
  if (memorystatus_control())
  {
    v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v4)
      +[PLUtilities getProcessMemoryLimit:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = 0;
    v13 = 0;
    v14 = -1;
  }
  else
  {
    v14 = v16;
    v12 = (unint64_t)((_DWORD)v18 != 0) << 48;
    v13 = (unint64_t)(BYTE4(v16) & 1) << 32;
  }
  if (v14 != (_DWORD)v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v23 = a3;
    v24 = 1024;
    v25 = v14;
    v26 = 1024;
    v27 = v21;
    _os_log_impl(&dword_1B6AB6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "memory limits do not match for pid %i (get_prio_list=%i, get_memlimit_props=%i)", buf, 0x14u);
  }
  return (process_memory_limit_info)(v12 | 0x10000000000 | v13 | v14);
}

+ (id)cleanLaunchdApplicationMacOS:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "count") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v4 = &stru_1E6A56538;
  }
  else
  {
    v5 = &stru_1E6A56538;
    v6 = 1;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "count") - 2 > ++v6)
      {
        -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("."));
        v8 = objc_claimAutoreleasedReturnValue();

        v4 = (__CFString *)v8;
      }
      v5 = v4;
    }
    while (objc_msgSend(v3, "count") - 2 > v6);
  }

  return v4;
}

+ (id)cleanLaunchdName:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("system/"));
    v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("user/"));
    v7 = objc_msgSend(v4, "hasPrefix:", CFSTR("gui/"));
    v8 = objc_msgSend(v4, "hasPrefix:", CFSTR("pid/"));
    v9 = v4;
    if ((unint64_t)objc_msgSend(v9, "length") <= 0x23)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "length") - 36);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10
        && objc_msgSend(v10, "length") == 36
        && objc_msgSend(v11, "characterAtIndex:", 8) == 45
        && objc_msgSend(v11, "characterAtIndex:", 13) == 45
        && objc_msgSend(v11, "characterAtIndex:", 18) == 45
        && objc_msgSend(v11, "characterAtIndex:", 23) == 45)
      {
        if (stringIsUUID_onceToken != -1)
          dispatch_once(&stringIsUUID_onceToken, &__block_literal_global_688);
        objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v25)
        {
          v24 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v27 != v24)
                objc_enumerationMutation(obj);
              objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend((id)stringIsUUID_hexChars, "isSupersetOfSet:", v13);

              if (!v14)
              {

                goto LABEL_22;
              }
            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            if (v25)
              continue;
            break;
          }
        }

        objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 37);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
        if (v5)
        {
          objc_msgSend(v15, "substringFromIndex:", objc_msgSend(CFSTR("system/"), "length"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_40;
        }
        else
        {
          if ((v6 | v8 | v7) != 1)
            goto LABEL_40;
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("/"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count") == 3)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v6 && objc_msgSend(v19, "hasPrefix:", CFSTR("UIKitApplication:")))
            {
              objc_msgSend(v20, "substringWithRange:", objc_msgSend(CFSTR("UIKitApplication:"), "length"), objc_msgSend(v20, "length") - objc_msgSend(CFSTR("UIKitApplication:"), "length") - 17);
              v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            else if (v7 && objc_msgSend(v20, "hasPrefix:", CFSTR("application.")))
            {
              +[PLUtilities cleanLaunchdApplicationMacOS:](PLUtilities, "cleanLaunchdApplicationMacOS:", v20);
              v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v21 = v20;
            }
            v17 = v21;

          }
          else
          {
            v17 = 0;
          }

          if (!v17)
            goto LABEL_40;
        }
        if (!objc_msgSend(v17, "containsString:", CFSTR("/")))
        {
LABEL_43:
          v16 = v17;

          goto LABEL_44;
        }

LABEL_40:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          +[PLUtilities cleanLaunchdName:].cold.1();
        v17 = 0;
        goto LABEL_43;
      }
    }
LABEL_22:

    v15 = v9;
    goto LABEL_23;
  }
  v16 = 0;
LABEL_44:

  return v16;
}

+ (id)intervalPeakCADictionaryForLaunchdName:(id)a3 intervalMaxKB:(unint64_t)a4
{
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  if (a3)
    v6 = (const __CFString *)a3;
  else
    v6 = CFSTR("UNKNOWN");
  v13[0] = CFSTR("launchd_name");
  v13[1] = CFSTR("interval_peak_footprint_kb");
  v14[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)refreshBUI
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (!+[PLPlatform isHomePod](PLPlatform, "isHomePod"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.powerlogd.refreshBUI"), 0, 0, 4u);
  }
}

+ (unint64_t)convertToBase10:(id)a3 fromBaseN:(int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  uint64_t v11;
  int v12;
  unint64_t v13;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = (double)a4;
    v11 = -1;
    do
    {
      v12 = objc_msgSend(v5, "characterAtIndex:", v8);
      if ((v12 - 65) >= 0x1A)
        v13 = v12 - 48;
      else
        v13 = (v12 - 55);
      v9 = (unint64_t)((double)v9 + (double)v13 * pow(v10, (double)(unint64_t)(v7 + v11)));
      ++v8;
      --v11;
    }
    while (v7 != v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)powerlogDefaultForKey:(id)a3
{
  return +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", a3, CFSTR("com.apple.powerlogd"), 1);
}

+ (id)removeFirstPartyBundleIDPrefix:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple."), &stru_1E6A56538);
}

+ (double)scaledPowerBasedOnPoint:(double)a3 withPowerModel:(id)a4
{
  id v5;
  double v6;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = 0.0;
  if (!+[PLPlatform isHomePod](PLPlatform, "isHomePod") && a3 > 0.0 && v5 != 0)
  {
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compareFloat_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v34;
LABEL_8:
      v15 = 0;
      v16 = v13;
      while (1)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
        objc_msgSend(v17, "doubleValue", (_QWORD)v33);
        v19 = v18;
        v13 = v17;
        if (v19 > a3)
          break;

        ++v15;
        v16 = v13;
        if (v12 == v15)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v12)
            goto LABEL_8;
          goto LABEL_18;
        }
      }

      if (!v13)
        goto LABEL_19;
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = v21;

      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;

      objc_msgSend(v16, "doubleValue");
      v27 = a3 - v26;
      objc_msgSend(v13, "doubleValue");
      v29 = v28;
      objc_msgSend(v16, "doubleValue");
      v6 = v22 + v27 / (v29 - v30) * (v25 - v22);
    }
    else
    {
      v13 = 0;
LABEL_18:

      v16 = v13;
LABEL_19:
      objc_msgSend(v5, "objectForKeyedSubscript:", v16, (_QWORD)v33);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v6 = v31;
    }

  }
  return v6;
}

+ (id)torchTypeString
{
  if (!+[PLPlatform isHomePod](PLPlatform, "isHomePod") && torchTypeString_onceToken != -1)
    dispatch_once(&torchTypeString_onceToken, &__block_literal_global_431);
  return (id)torchTypeString__torchTypeString;
}

void __30__PLUtilities_torchTypeString__block_invoke()
{
  unsigned int v0;
  const __CFString *v1;
  void *v2;

  v0 = +[PLPlatform kPLTorchClassOfDevice](PLPlatform, "kPLTorchClassOfDevice") - 1007002;
  if (v0 > 2)
    v1 = CFSTR("N41");
  else
    v1 = off_1E6A54838[v0];
  v2 = (void *)torchTypeString__torchTypeString;
  torchTypeString__torchTypeString = (uint64_t)v1;

}

+ (id)hardwareModel
{
  if (hardwareModel_onceToken != -1)
    dispatch_once(&hardwareModel_onceToken, &__block_literal_global_473);
  return (id)hardwareModel__hardwareModel;
}

void __28__PLUtilities_hardwareModel__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v0 = (void *)MGCopyAnswer();
  PLLogCommon();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __28__PLUtilities_hardwareModel__block_invoke_cold_2();

  +[PLUtilities hardwareModelSMC:](PLUtilities, "hardwareModelSMC:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "length");
  if ((objc_msgSend(v2, "hasSuffix:", CFSTR("AP")) & 1) != 0)
  {
    v4 = -2;
  }
  else
  {
    if (!objc_msgSend(v2, "hasSuffix:", CFSTR("DEV")))
      goto LABEL_8;
    v4 = -3;
  }
  v3 = objc_msgSend(v2, "length") + v4;
LABEL_8:
  objc_msgSend(v2, "substringWithRange:", 0, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)hardwareModel__hardwareModel;
  hardwareModel__hardwareModel = v5;

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __28__PLUtilities_hardwareModel__block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

}

+ (id)hardwareModelSMC:(id)a3
{
  return a3;
}

+ (BOOL)devBoardDevice
{
  if (devBoardDevice_onceToken != -1)
    dispatch_once(&devBoardDevice_onceToken, &__block_literal_global_480);
  return devBoardDevice__devBoard;
}

void __29__PLUtilities_devBoardDevice__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = (void *)MGCopyAnswer();
  +[PLUtilities hardwareModelSMC:](PLUtilities, "hardwareModelSMC:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "hasSuffix:", CFSTR("DEV")))
    devBoardDevice__devBoard = 1;
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __29__PLUtilities_devBoardDevice__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

}

+ (id)productType
{
  if (productType_onceToken != -1)
    dispatch_once(&productType_onceToken, &__block_literal_global_481);
  return (id)productType__productType;
}

void __26__PLUtilities_productType__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!productType__productType)
  {
    v0 = MGCopyAnswer();
    v1 = (void *)productType__productType;
    productType__productType = v0;

  }
}

+ (id)getDeviceSoC
{
  if (getDeviceSoC_onceToken != -1)
    dispatch_once(&getDeviceSoC_onceToken, &__block_literal_global_484);
  return (id)getDeviceSoC__soc;
}

void __27__PLUtilities_getDeviceSoC__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)getDeviceSoC__soc;
  getDeviceSoC__soc = v0;

}

+ (unsigned)getHardwarePerfLevels
{
  if (getHardwarePerfLevels_levels_once != -1)
    dispatch_once(&getHardwarePerfLevels_levels_once, &__block_literal_global_487);
  return getHardwarePerfLevels_perf_levels;
}

void __36__PLUtilities_getHardwarePerfLevels__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;

  v9 = 4;
  v0 = sysctlbyname("hw.nperflevels", &getHardwarePerfLevels_perf_levels, &v9, 0, 0);
  if ((_DWORD)v0)
  {
    v1 = v0;
    getHardwarePerfLevels_perf_levels = 0;
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __36__PLUtilities_getHardwarePerfLevels__block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
}

+ (void)PLCopyItemsFromPath:toPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Could not retrieve source files from %@ with error %@");
  OUTLINED_FUNCTION_1_0();
}

void __42__PLUtilities_PLCopyItemsFromPath_toPath___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_ERROR, "Error copying files from source path %@ to destination path %@ with error: %@", (uint8_t *)&v5, 0x20u);
}

+ (void)setPermissionsForFile:toValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Successfully set permissions for file %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)setPermissionsForFile:toValue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Cannot set permissions for file %@, error = %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)compressWithSource:withDestination:withLevel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "compressWithSource: Cannot read %@ for compression\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)compressWithSource:withDestination:withLevel:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "compressWithSource: Cannot write to %@ for compression\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)compressWithSource:withDestination:withLevel:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "compressWithSource: Cannot compress file at %@ to %@\n");
  OUTLINED_FUNCTION_1_0();
}

+ (void)compressWithSource:withDestination:withLevel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "compressWithSource: attempting to compress source stream to destination stream...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.1()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 307, "sizeof(strm.avail_in) == sizeof && length < UINT_MAX");
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.2()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 322, "ret != Z_STREAM_ERROR");
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.3()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 334, "ret == Z_STREAM_END");
}

+ (void)compressWithSourceStream:withDestination:withLevel:.cold.4()
{
  __assert_rtn("+[PLUtilities compressWithSourceStream:withDestination:withLevel:]", "PLUtilities.m", 330, "strm.avail_in == 0");
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "decompressWithSource: Cannot read %@ for decompression\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "decompressWithSource: Cannot write to %@ for decompression\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "decompressWithSource: error when removing failed output file '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "decompressWithSource: Cannot decompress from %@ to %@\n");
  OUTLINED_FUNCTION_1_0();
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "decompressWithSource: attempting to decompress source stream to destination stream...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)decompressWithSource:withDestination:withRemoveSrc:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "decompressWithSource: invalid source file, %@ with extension %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)decompressWithSourceStream:withDestinationStream:.cold.1()
{
  __assert_rtn("+[PLUtilities decompressWithSourceStream:withDestinationStream:]", "PLUtilities.m", 444, "result != Z_STREAM_ERROR");
}

+ (void)reportZlibResultToCA:forEvent:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_8_0(&dword_1B6AB6000, v1, (uint64_t)v1, "%@ ERROR = %d", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)numFilesAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to get num files at path: %@ error: %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)remove:oldestFilesFromDirectory:containingFileNameSubstring:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "No file name substring provided, assuming all files in directory are candidate files", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)remove:(uint64_t)a3 oldestFilesFromDirectory:(os_log_t)log containingFileNameSubstring:.cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "Found %lu files with %@ in the name", buf, 0x16u);
}

+ (void)remove:oldestFilesFromDirectory:containingFileNameSubstring:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to get contents of directory %@ with error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_63_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_1B6AB6000, v0, v1, "Assuming %@ and %@ have the same creation date");
  OUTLINED_FUNCTION_1_0();
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_63_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to get creation date of file %@ with error: %@");
  OUTLINED_FUNCTION_1_0();
}

void __75__PLUtilities_remove_oldestFilesFromDirectory_containingFileNameSubstring___block_invoke_66_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to remove %@ with error: %@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)markFilesInDirectoryAsPurgeable:ofType:withUrgency:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1B6AB6000, v0, v1, "Failed to mark files in directory %@ purgeable -- error when retrieving contents of directory: '%@'");
  OUTLINED_FUNCTION_1_0();
}

+ (void)markFilesInDirectoryAsPurgeable:ofType:withUrgency:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Failed to mark files in directory %@ purgeable -- path is not directory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)markFileAsPurgeable:(uint64_t)a1 withUrgency:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int *v4;
  char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = __error();
  v5 = strerror(*v4);
  v6 = 138412546;
  v7 = a1;
  v8 = 2080;
  v9 = v5;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Failed to mark %@ purgeable - can't open error: %s", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_2_1();
}

+ (uint64_t)deviceBootUUID
{
  __error();
  return _os_assumes_log();
}

+ (void)getLastSystemTimeOffset
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a1, a3, "Returning last known system time offset %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __39__PLUtilities_quarantineToPath_action___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Quarantine dst: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __39__PLUtilities_quarantineToPath_action___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "Quarantine src: %@", v4, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

+ (void)allowQueryFromPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "failure creating sec task from token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)getPerfStatsForProcess:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "[Perf Stats Query] Coalitions does not have aggregated data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)getPerfStatsForProcess:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_1B6AB6000, v0, v1, "[Perf Stats Query] QueryStartDate=%@, QueryEndDate=%@");
  OUTLINED_FUNCTION_1_0();
}

+ (void)maxProcessCount
{
  int v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4 = 136315394;
  v5 = "kern.maxproc";
  v6 = 1024;
  v7 = v2;
  OUTLINED_FUNCTION_8_0(&dword_1B6AB6000, a1, v3, "failed to query %s: %d", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_1();
}

+ (void)isDaemonOrAppleXPCService:(char)a1 .cold.1(char a1, uint64_t a2)
{
  int v3;
  void *v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1 & 1;
  +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities processNameForPid:](PLUtilities, "processNameForPid:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109890;
  v6[1] = a2;
  v7 = 1024;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  _os_log_debug_impl(&dword_1B6AB6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Pid:%i isDaemonAppleXPCService:%{BOOL}i\t\tBundle:%@\t\t\tBinary:%@", (uint8_t *)v6, 0x22u);

}

+ (void)isDaemonOrAppleXPCService:(uint64_t)a3 .cold.2(uint64_t a1, int a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  OUTLINED_FUNCTION_8_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "Error to identify (pid%i) isDaemonOrAppleXPCService %@", (uint8_t *)v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)isImproveFitnessPlusEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Fitness plus libraries not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)getJetamPriority:.cold.1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "Error with MEMORYSTATUS_CMD_GET_PRIORITY_LIST. Size %d and sizeof(entry) %lu", v1);
  OUTLINED_FUNCTION_1_0();
}

+ (void)getProcessMemoryLimit:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "Error with MEMORYSTATUS_CMD_GET_MEMLIMIT_PROPERTIES", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)cleanLaunchdName:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], v0, "cleanLaunchdName: Unknown launchd service name: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void __28__PLUtilities_hardwareModel__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a1, a3, "hardwareModel: returning %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __28__PLUtilities_hardwareModel__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "hardwareModel: HWModelStr = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __29__PLUtilities_devBoardDevice__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, a1, a3, "devBoardDevice: returning %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __36__PLUtilities_getHardwarePerfLevels__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1B6AB6000, a2, a3, "getHardwarePerfLevels failed, sysctlbyname retval = %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
