@implementation OSASubmissionScheduler

+ (void)scheduleSubmission
{
  +[OSASubmissionScheduler _scheduleSubmissionWithPermissive:](OSASubmissionScheduler, "_scheduleSubmissionWithPermissive:", 1);
  +[OSASubmissionScheduler _scheduleSubmissionWithPermissive:](OSASubmissionScheduler, "_scheduleSubmissionWithPermissive:", 0);
}

+ (void)_scheduleSubmissionWithPermissive:(BOOL)a3
{
  const char *v3;
  void *v4;
  _QWORD v5[5];
  BOOL v6;

  v3 = "com.apple.osanalytics.submissions.submit";
  if (a3)
    v3 = "com.apple.osanalytics.submissions.submit-permissive";
  v4 = (void *)*MEMORY[0x1E0C80748];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke;
  v5[3] = &__block_descriptor_41_e33_v16__0__NSObject_OS_xpc_object__8l;
  v6 = a3;
  v5[4] = a1;
  xpc_activity_register(v3, v4, v5);
}

void __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  double v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  void *v9;
  void *v10;
  char v11;
  xpc_object_t v12;
  int64_t int64;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  BOOL v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _xpc_activity_s *v26;
  _BYTE *v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  _BYTE buf[24];
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (!state)
    {
      +[OSASubmissionScheduler _lastSuccessTime](OSASubmissionScheduler, "_lastSuccessTime");
      if (v5 <= 0.0)
        +[OSASubmissionScheduler _saveLastSuccessTime](OSASubmissionScheduler, "_saveLastSuccessTime");
      v6 = objc_msgSend(MEMORY[0x1E0D64EE0], "fastLane");
      if (v6 >= 1)
        +[OSASubmissionScheduler _resetRetryCount](OSASubmissionScheduler, "_resetRetryCount");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = "YES";
        if (*(_BYTE *)(a1 + 40))
          v8 = "YES";
        else
          v8 = "NO";
        if (v6 <= 0)
          v7 = "NO";
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Initializing submission activity cadence. Permissive: %{public}s. FastLane: %{public}s.", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_calculateNewCadenceParametersWithPermissive:fastLane:", *(unsigned __int8 *)(a1 + 40), v6 > 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[OSASubmissionScheduler _updateCadenceForActivity:newCadenceParameters:](OSASubmissionScheduler, "_updateCadenceForActivity:newCadenceParameters:", v3, v9);

    }
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "optInApple");

  if ((v11 & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
LABEL_19:
      v17 = objc_msgSend(MEMORY[0x1E0D64EE0], "fastLane");
      v18 = v17 > 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v19 = "YES";
        if (*(_BYTE *)(a1 + 40))
          v20 = "YES";
        else
          v20 = "NO";
        if (v17 <= 0)
          v19 = "NO";
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Scheduling submission. Permissive: %{public}s. FastLane: %{public}s.", buf, 0x16u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v32 = 0;
      v21 = dispatch_queue_create("com.apple.osanalytics.submissions.schedulerQueue", 0);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_12;
      v25[3] = &unk_1E97F1AD8;
      v29 = v18;
      v30 = *(_BYTE *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 32);
      v27 = buf;
      v28 = v22;
      v26 = v3;
      dispatch_sync(v21, v25);

      _Block_object_dispose(buf, 8);
      goto LABEL_33;
    }
    v12 = xpc_activity_copy_criteria(v3);
    int64 = xpc_dictionary_get_int64(v12, (const char *)*MEMORY[0x1E0C807A8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v15 = v14;
    +[OSASubmissionScheduler _lastSuccessTime](OSASubmissionScheduler, "_lastSuccessTime");
    if (v15 - v16 >= (double)(int64 + 86400))
    {

      goto LABEL_19;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)MEMORY[0x1E0C99D68];
      +[OSASubmissionScheduler _lastSuccessTime](OSASubmissionScheduler, "_lastSuccessTime");
      objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = int64;
      _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Cancelling permissive submission due to recent success at %{public}@ with interval %{public}lli.", buf, 0x16u);

    }
    xpc_activity_set_state(v3, 5);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Cancelling submission due to opt-out.", buf, 2u);
    }
    xpc_activity_set_state(v3, 5);
  }
LABEL_33:

}

void __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_12(uint64_t a1)
{
  OSASubmissionClient *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(OSASubmissionClient);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[OSASubmissionClient submit](v2, "submit");

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    +[OSASubmissionScheduler _saveLastSuccessTime](OSASubmissionScheduler, "_saveLastSuccessTime");
LABEL_4:
    +[OSASubmissionScheduler _resetRetryCount](OSASubmissionScheduler, "_resetRetryCount");
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 56))
    goto LABEL_4;
  if (!*(_BYTE *)(a1 + 57))
    +[OSASubmissionScheduler _incrementRetryCount](OSASubmissionScheduler, "_incrementRetryCount");
LABEL_5:
  v7 = MEMORY[0x1E0C809B0];
  LOBYTE(v8) = *(_BYTE *)(a1 + 57);
  AnalyticsSendEventLazy();
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance", v7, 3221225472, __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_2, &__block_descriptor_33_e19___NSDictionary_8__0l, v8, CFSTR("crk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crashReporterKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("type");
  v10[0] = v4;
  v10[1] = CFSTR("unified");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  rtcsc_send();

  objc_msgSend(MEMORY[0x1E0D64ED8], "recordEvent:", *MEMORY[0x1E0D64F58]);
  objc_msgSend(*(id *)(a1 + 48), "_calculateNewCadenceParametersWithPermissive:fastLane:", *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_updateCadenceForActivity:newCadenceParameters:", *(_QWORD *)(a1 + 32), v6);

}

id __60__OSASubmissionScheduler__scheduleSubmissionWithPermissive___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("action");
  v4[1] = CFSTR("type");
  v5[0] = CFSTR("submit");
  v5[1] = CFSTR("unified");
  v4[2] = CFSTR("permissive");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)scheduleCleanupWithHomeDirectory:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD handler[4];
  id v7;

  v3 = a3;
  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke;
  handler[3] = &unk_1E97F1B68;
  v7 = v3;
  v5 = v3;
  xpc_activity_register("com.apple.osanalytics.submissions.cleanup", v4, handler);

}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[16];

  if (xpc_activity_get_state(activity) == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Scheduling cleanup.", buf, 2u);
    }
    v3 = dispatch_queue_create("com.apple.osanalytics.submissions.schedulerQueue", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36;
    block[3] = &unk_1E97F1B20;
    v5 = *(id *)(a1 + 32);
    dispatch_sync(v3, block);
    AnalyticsSendEventLazy();

  }
}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D64EC8];
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathSubmission");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scanProxies:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D65020], "submissionPathsWithHomeDirectory:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D64EC8], "isDataVaultEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathSubmissionDataVault");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D64EC8], "scanProxies:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v9);

      v11 = (id)objc_msgSend(v6, "arrayByAddingObject:", v8);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36_cold_1();
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(MEMORY[0x1E0D64EC8], "cleanupRetired:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  if (OSAIsRSDDisplay())
    objc_msgSend(MEMORY[0x1E0D64EC8], "cleanupForUser:", 0);

}

void *__59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_39()
{
  return &unk_1E97F26E8;
}

+ (id)_calculateNewCadenceParametersWithPermissive:(BOOL)a3 fastLane:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v4 = a4;
  v5 = a3;
  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = +[OSASubmissionScheduler _retryCount](OSASubmissionScheduler, "_retryCount");
  v7 = *MEMORY[0x1E0C807C0];
  if (v5 && v4)
  {
    v8 = *MEMORY[0x1E0C807C0];
    v7 *= 12;
    goto LABEL_10;
  }
  v9 = *MEMORY[0x1E0C807B8];
  if (v5)
  {
    v8 = *MEMORY[0x1E0C807C0];
LABEL_6:
    v7 = v9;
    goto LABEL_10;
  }
  if (v4 || OSAIsACDCDevice())
  {
    v8 = *MEMORY[0x1E0C807D0];
    goto LABEL_10;
  }
  if (v6 < 1)
  {
    v8 = 3 * v7;
    goto LABEL_6;
  }
  v18 = v7;
  if (v6 != 1)
  {
    if (v6 == 2)
      v18 = 2 * v7;
    else
      v18 = *MEMORY[0x1E0C807D8];
  }
  v19 = v18 + arc4random_uniform(0xE10u);
  v8 = v7;
  v7 = v19 - 1800;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80760]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C807A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80790]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_getCurrentCadenceParametersFromActivity:(id)a3
{
  xpc_object_t v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);
  v4 = (const char *)*MEMORY[0x1E0C80760];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80760]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(v3, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v7 = (const char *)*MEMORY[0x1E0C807A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C807A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(v3, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  v10 = (const char *)*MEMORY[0x1E0C80790];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80790]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_dictionary_get_int64(v3, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)_updateCadenceForActivity:(id)a3 newCadenceParameters:(id)a4
{
  _xpc_activity_s *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  xpc_activity_state_t state;
  xpc_object_t v13;
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_activity_s *)a3;
  v7 = a4;
  objc_msgSend(a1, "_getCurrentCadenceParametersFromActivity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = xpc_activity_copy_identifier();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    free(v10);
  }
  else
  {
    v11 = 0;
  }
  state = xpc_activity_get_state(v6);
  if (!state)
    goto LABEL_11;
  if (state != 2)
    goto LABEL_15;
  if (xpc_activity_set_state(v6, 5))
    usleep(0xAu);
  if ((objc_msgSend(v8, "isEqualToDictionary:", v7) & 1) != 0)
  {
LABEL_15:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543618;
      v24 = v11;
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Submission cadences were unchanged for activity %{public}@. Keeping current cadences parameters %{public}@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
LABEL_11:
    v13 = xpc_activity_copy_criteria(v6);
    v14 = (const char *)*MEMORY[0x1E0C80760];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80760]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v13, v14, objc_msgSend(v16, "longLongValue"));

    v17 = (const char *)*MEMORY[0x1E0C807A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C807A8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v13, v17, objc_msgSend(v19, "longLongValue"));

    v20 = (const char *)*MEMORY[0x1E0C80790];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80790]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v13, v20, objc_msgSend(v22, "longLongValue"));

    xpc_activity_set_criteria(v6, v13);
  }

}

+ (void)_saveLastSuccessTime
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "setDouble:forKey:", CFSTR("lastSuccess"));

}

+ (double)_lastSuccessTime
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("lastSuccess"));
  v4 = v3;

  return v4;
}

+ (int64_t)_retryCount
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("retryCount"));

  return v3;
}

+ (void)_incrementRetryCount
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint8_t buf[16];

  v3 = +[OSASubmissionScheduler _retryCount](OSASubmissionScheduler, "_retryCount");
  if (v3 > 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Maxed out on retries. Resetting retry count", buf, 2u);
    }
    objc_msgSend(a1, "_resetRetryCount");
  }
  else
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteger:forKey:", v4 + 1, CFSTR("retryCount"));

  }
}

+ (void)_resetRetryCount
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", 0, CFSTR("retryCount"));

}

void __59__OSASubmissionScheduler_scheduleCleanupWithHomeDirectory___block_invoke_36_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D4663000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get the data vault submission path.", v0, 2u);
}

@end
