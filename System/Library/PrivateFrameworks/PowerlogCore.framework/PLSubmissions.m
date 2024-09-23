@implementation PLSubmissions

- (id)enqueueFileForUpload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PLSubmissionRecord *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PLSubmissionRecord *v20;
  NSObject *v21;
  PLSubmissionRecord *v22;
  PLSubmissionRecord *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[5];
  PLSubmissionRecord *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogSubmission();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "filePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ckTagConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "File enqueued for submission: %@ %@", buf, 0x16u);

  }
  objc_msgSend(v4, "filePath");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v4, "ckTagConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v4, "tagUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = [PLSubmissionRecord alloc];
        objc_msgSend(v4, "filePath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "tagUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ckTagConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "configUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "configDateReceived");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "configDateApplied");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[PLSubmissionRecord initWithCKFilePath:tagUUID:tagConfig:configUUID:configDateReceived:configDateApplied:](v13, "initWithCKFilePath:tagUUID:tagConfig:configUUID:configDateReceived:configDateApplied:", v14, v15, v16, v17, v18, v19);

        -[PLSubmissionRecord emitAttemptEvent](v20, "emitAttemptEvent");
        -[PLSubmissions workQueue](self, "workQueue");
        v21 = objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __53__PLSubmissions_XPCScheduling__enqueueFileForUpload___block_invoke;
        v27[3] = &unk_1E6A521A0;
        v27[4] = self;
        v22 = v20;
        v28 = v22;
        dispatch_async(v21, v27);

        v23 = v28;
        v24 = v22;

        v25 = v24;
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  PLLogSubmission();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[PLSubmissions(XPCScheduling) enqueueFileForUpload:].cold.1();
  v25 = 0;
LABEL_11:

  return v25;
}

uint64_t __53__PLSubmissions_XPCScheduling__enqueueFileForUpload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "submissionQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 32), "xpcActivityStarted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "registerUploadSchedulingActivity");
  return result;
}

- (void)enqueueSubmissionRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLSubmissions workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PLSubmissions_XPCScheduling__enqueueSubmissionRecord___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __56__PLSubmissions_XPCScheduling__enqueueSubmissionRecord___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "submissionQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 32), "xpcActivityStarted");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "registerUploadSchedulingActivity");
  return result;
}

- (void)registerUploadSchedulingActivity
{
  NSObject *v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Registering submission scheduler", buf, 2u);
  }

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808C8], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80828], (const char *)*MEMORY[0x1E0C80838]);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80850], 20971520);
  v5 = +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("submissionActivityDelayInSecs"), 0);
  if (!v5)
    v5 = 60 * arc4random_uniform(0x3Du);
  PLLogSubmission();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = v5;
    _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "Delay of %lld secs", buf, 0xCu);
  }

  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80760], v5);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807D8]);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[PLSubmissions setLastXPCActivityTimestamp:](self, "setLastXPCActivityTimestamp:");

  -[PLSubmissions setXpcActivityDelay:](self, "setXpcActivityDelay:", (double)v5);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke;
  handler[3] = &unk_1E6A53CB0;
  handler[4] = self;
  xpc_activity_register("com.apple.powerlogd.XPCScheduler", v4, handler);
  -[PLSubmissions setXpcActivityStarted:](self, "setXpcActivityStarted:", 1);

}

void __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  _xpc_activity_s *v8;
  uint8_t buf[16];

  v3 = a2;
  PLLogSubmission();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling for background work", buf, 2u);
  }

  if (xpc_activity_get_state(v3) != 2)
  {
    PLLogSubmission();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "Activity state: not to run", buf, 2u);
    }
    goto LABEL_10;
  }
  if (!xpc_activity_set_state(v3, 4))
  {
    PLLogSubmission();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_cold_1();
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_11;
  v7[3] = &unk_1E6A521A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  dispatch_async(v5, v7);

LABEL_11:
}

uint64_t __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleXPCActivityCallback:", *(_QWORD *)(a1 + 40));
}

- (void)attemptToUnregisterUploadSchedulingActivity
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!-[PLSubmissions internalSubmissionBehavior](self, "internalSubmissionBehavior"))
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v3);
  v6 = v5;
  v7 = (double)(uint64_t)*MEMORY[0x1E0C807D8];

  if (v6 >= v7)
  {
LABEL_3:
    PLLogSubmission();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Unregistering submission scheduler", v9, 2u);
    }

    xpc_activity_unregister("com.apple.powerlogd.XPCScheduler");
    -[PLSubmissions setXpcActivityStarted:](self, "setXpcActivityStarted:", 0);
    -[PLSubmissions setLastXPCActivityTimestamp:](self, "setLastXPCActivityTimestamp:", 0.0);
  }
}

- (void)handleXPCActivityCallback:(id)a3
{
  _xpc_activity_s *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (_xpc_activity_s *)a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PLSubmissions submissionQueue](self, "submissionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
      if (!objc_msgSend(v10, "inSubmission"))
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if ((v14 & 1) != 0)
    {
      if (v4 && xpc_activity_should_defer(v4))
        -[PLSubmissions deferXPCActivity:](self, "deferXPCActivity:", v4);
      else
        -[PLSubmissions submitRecord:withActivity:](self, "submitRecord:withActivity:", v11, v4);
    }
    else
    {
      PLLogSubmission();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_DEFAULT, "Submission record does not exist", v19, 2u);
      }

      -[PLSubmissions fileCleanupWithRecord:](self, "fileCleanupWithRecord:", v11);
      -[PLSubmissions finishXPCActivity:](self, "finishXPCActivity:", v4);
    }

  }
  else
  {
LABEL_9:

LABEL_15:
    PLLogSubmission();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_DEFAULT, "Nothing to submit", v19, 2u);
    }

    -[PLSubmissions finishXPCActivity:](self, "finishXPCActivity:", v4);
    -[PLSubmissions submissionQueue](self, "submissionQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
      -[PLSubmissions attemptToUnregisterUploadSchedulingActivity](self, "attemptToUnregisterUploadSchedulingActivity");
  }

}

- (void)submitRecord:(id)a3 withActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
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
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD block[4];
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  uint8_t buf[4];
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  -[PLSubmissions lastXPCActivityTimestamp](self, "lastXPCActivityTimestamp");
  v12 = v10 - v11;
  -[PLSubmissions xpcActivityDelay](self, "xpcActivityDelay");
  if (v12 >= v13)
  {
    -[PLSubmissions setLastXPCActivityTimestamp:](self, "setLastXPCActivityTimestamp:", v10);
    PLLogSubmission();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v6;
      _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_DEFAULT, "Submit record: %@", buf, 0xCu);
    }

    objc_msgSend(v6, "setInSubmission:", 1);
    objc_msgSend(v6, "filePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tagConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.perfpowerservices.tasking"), 1);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v18);
    objc_msgSend(v19, "publicCloudDatabase");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("Attachment"));
    v21 = objc_alloc(MEMORY[0x1E0C94BB8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithFileURL:", v22);

    if (v23)
    {
      v61 = v18;
      v59 = (void *)v23;
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("asset"));
      v62 = v16;
      objc_msgSend(v16, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("fileName"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Internal"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "isEqualToString:", CFSTR("true")))
        v26 = &unk_1E6ABAD60;
      else
        v26 = &unk_1E6ABAD78;
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("internal"));

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Beta"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isEqualToString:", CFSTR("true")))
        v28 = &unk_1E6ABAD60;
      else
        v28 = &unk_1E6ABAD78;
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("seed"));

      objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("iOS"), CFSTR("machineType"));
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("machineType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("iOS"));

      if (v30 && +[PLPlatform isiPad](PLPlatform, "isiPad"))
        objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("iPadOS"), CFSTR("machineType"));
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Model"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Model"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, CFSTR("deviceModel"));

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TagUUID"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("TagUUID"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v34, CFSTR("UUID"));

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Reason"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Reason"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v36, CFSTR("reason"));

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Build"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Build"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v38, CFSTR("build"));

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Date"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Date"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v40, CFSTR("date"));

      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ExtendedAttributes"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ExtendedAttributes"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v42, CFSTR("extendedAttributes"));

      }
      v60 = v19;
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SubmittedFilesMask"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SubmittedFilesMask"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v44, CFSTR("submittedFilesMask"));

      }
      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v45, "addObject:", v20);
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v45, 0);
      objc_msgSend(v46, "configuration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setAllowsCellularAccess:", 0);

      objc_msgSend(v46, "configuration");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setDiscretionaryNetworkBehavior:", 0);

      objc_msgSend(v46, "configuration");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setPreferAnonymousRequests:", 1);

      objc_msgSend(v46, "configuration");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setXpcActivity:", v7);

      objc_msgSend(v46, "setPerRecordCompletionBlock:", &__block_literal_global_20);
      v51 = MEMORY[0x1E0C809B0];
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_77;
      v66[3] = &unk_1E6A53D18;
      v66[4] = self;
      v52 = v6;
      v67 = v52;
      v53 = v7;
      v68 = v53;
      objc_msgSend(v46, "setModifyRecordsCompletionBlock:", v66);
      if (v53 && xpc_activity_should_defer((xpc_activity_t)v53))
      {
        -[PLSubmissions workQueue](self, "workQueue");
        v58 = v7;
        v54 = objc_claimAutoreleasedReturnValue();
        block[0] = v51;
        block[1] = 3221225472;
        block[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_2;
        block[3] = &unk_1E6A52050;
        v65 = v52;
        dispatch_async(v54, block);

        v7 = v58;
        -[PLSubmissions deferXPCActivity:](self, "deferXPCActivity:", v53);

        v18 = v61;
        v16 = v62;
        v55 = v63;
      }
      else
      {
        v55 = v63;
        objc_msgSend(v63, "addOperation:", v46);
        v18 = v61;
        v16 = v62;
      }
      v56 = v59;

      v19 = v60;
    }
    else
    {
      PLLogSubmission();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[PLSubmissions(XPCScheduling) submitRecord:withActivity:].cold.1((uint64_t)v16, v57);

      -[PLSubmissions fileCleanupWithRecord:](self, "fileCleanupWithRecord:", v6);
      -[PLSubmissions finishXPCActivity:](self, "finishXPCActivity:", v7);
      v55 = v63;
      v56 = 0;
    }

  }
  else
  {
    PLLogSubmission();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "Upload activity triggered earlier than delay. Deferring...", buf, 2u);
    }

    -[PLSubmissions finishXPCActivity:](self, "finishXPCActivity:", v7);
  }

}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  PLLogSubmission();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_cold_1();

}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_77(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  _QWORD block[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  PLLogSubmission();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Failed to submit ck records %@, error: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_78;
    block[3] = &unk_1E6A52050;
    v28 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    objc_msgSend(v7, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C947D8];
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C947D8]))
    {
      v13 = objc_msgSend(v7, "code");

      if (v13 != 20)
      {
LABEL_25:
        objc_msgSend(*(id *)(a1 + 32), "finishXPCActivity:", *(_QWORD *)(a1 + 48));
LABEL_26:
        v20 = v28;
        goto LABEL_27;
      }
      objc_msgSend(v7, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v12);

      if (v16)
      {
        if (objc_msgSend(v11, "code") == 130)
        {
          PLLogSubmission();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_77_cold_1();
        }
        else
        {
          if (objc_msgSend(v11, "code") == 131)
          {
            PLLogSubmission();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6AB6000, v21, OS_LOG_TYPE_DEFAULT, "Activity needs to be deferred", buf, 2u);
            }

            objc_msgSend(*(id *)(a1 + 32), "deferXPCActivity:", *(_QWORD *)(a1 + 48));
            goto LABEL_26;
          }
          if (objc_msgSend(v11, "code") != 2000
            && objc_msgSend(v11, "code") != 2001
            && objc_msgSend(v11, "code") != 2002
            && objc_msgSend(v11, "code") != 2009
            && objc_msgSend(v11, "code") != 2022
            || +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("submissionActivityDelayInSecs"), 0))
          {
            goto LABEL_24;
          }
          v22 = arc4random_uniform(0xB4u);
          v23 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 48));
          v17 = v23;
          if (v23)
          {
            xpc_dictionary_set_int64(v23, (const char *)*MEMORY[0x1E0C80760], (uint64_t)((double)v22 * 60.0 + 3600.0));
            xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 48), v17);
          }
          else
          {
            PLLogSubmission();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_77_cold_2();

          }
        }

      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v9)
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Submission of ck records %@ succeeded", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "emitSuccessEvent");
  objc_msgSend(*(id *)(a1 + 32), "logSubmissionStateToAnalytics:", CFSTR("success"));
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_79;
  v25[3] = &unk_1E6A521A0;
  v19 = *(void **)(a1 + 40);
  v25[4] = *(_QWORD *)(a1 + 32);
  v26 = v19;
  dispatch_async(v18, v25);

  objc_msgSend(*(id *)(a1 + 32), "finishXPCActivity:", *(_QWORD *)(a1 + 48));
  v20 = v26;
LABEL_27:

}

uint64_t __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInSubmission:", 0);
}

uint64_t __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_79(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fileCleanupWithRecord:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInSubmission:", 0);
}

- (void)finishXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 4)
    {
      v5 = xpc_activity_set_state(v4, 5);
      PLLogSubmission();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Set background state to done", v8, 2u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[PLSubmissions(XPCScheduling) finishXPCActivity:].cold.1();
      }
    }
    else
    {
      PLLogSubmission();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[PLSubmissions(XPCScheduling) finishXPCActivity:].cold.2();
    }

  }
}

- (void)deferXPCActivity:(id)a3
{
  _xpc_activity_s *v3;
  _xpc_activity_s *v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  __int16 v10;
  uint8_t buf[2];
  __int16 v12;

  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 3)
    {
      PLLogSubmission();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v6 = "Background state already in defer";
        v7 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else
    {
      v8 = xpc_activity_set_state(v4, 3);
      PLLogSubmission();
      v5 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v9)
        {
          v12 = 0;
          v6 = "Set background state to defer";
          v7 = (uint8_t *)&v12;
          goto LABEL_10;
        }
      }
      else if (v9)
      {
        *(_WORD *)buf = 0;
        v6 = "Failed to set background state to defer";
        v7 = buf;
        goto LABEL_10;
      }
    }

  }
}

- (void)fileCleanupWithRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogSubmission();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Removing submission record %@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(v4, "filePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions removeFileAtPath:](self, "removeFileAtPath:", v6);

  objc_msgSend(v4, "daFileDirPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions removeFileAtPath:](self, "removeFileAtPath:", v7);

  objc_msgSend(v4, "ckFileDirPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions removeFileAtPath:](self, "removeFileAtPath:", v8);

  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("PLSubmissionConfig"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tagUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions removeFileAtPath:](self, "removeFileAtPath:", v12);

  -[PLSubmissions submissionQueue](self, "submissionQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObject:", v4);

}

- (void)removeFileAtURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
  v6 = v9;

  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Removed file at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[PLSubmissions(XPCScheduling) removeFileAtURL:].cold.1();
  }

}

- (void)removeFileAtPath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v9);
  v6 = v9;

  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Removed file at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[PLSubmissions(XPCScheduling) removeFileAtURL:].cold.1();
  }

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLSubmissions_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (id)sharedInstance_instance_2;
}

void __31__PLSubmissions_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v0;

}

- (id)workQueue
{
  return +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
}

- (PLSubmissions)init
{
  PLSubmissions *v3;
  PLSubmissions *v4;
  uint64_t v5;
  PLSQLiteConnection *connection;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  PLSubmissions *v11;
  objc_super v12;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v3 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLSubmissions;
    v4 = -[PLSubmissions init](&v12, sel_init);
    if (v4)
    {
      +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
      v5 = objc_claimAutoreleasedReturnValue();
      connection = v4->_connection;
      v4->_connection = (PLSQLiteConnection *)v5;

      -[PLSubmissions setXpcActivityStarted:](v4, "setXpcActivityStarted:", 0);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSubmissions setSubmissionQueue:](v4, "setSubmissionQueue:", v7);

      -[PLSubmissions workQueue](v4, "workQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __21__PLSubmissions_init__block_invoke;
      block[3] = &unk_1E6A52050;
      v11 = v4;
      dispatch_async(v8, block);

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

uint64_t __21__PLSubmissions_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "initSubmissionQueue");
  return objc_msgSend(*(id *)(a1 + 32), "setupDRTasking");
}

- (void)setupDRTasking
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0D1D260]);
  -[PLSubmissions workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__PLSubmissions_setupDRTasking__block_invoke;
  v7[3] = &unk_1E6A53A98;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithTeamID:targetQueue:configProcessingBlock:", CFSTR("perfpowerservices.config"), v4, v7);
  -[PLSubmissions setTaskingMonitor:](self, "setTaskingMonitor:", v5);

  -[PLSubmissions taskingMonitor](self, "taskingMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startMonitoring");

}

uint64_t __31__PLSubmissions_setupDRTasking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDRConfigUpdate:error:", a2, a3);
}

- (id)configFromMonitor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  v3 = a3;
  v9 = 0;
  objc_msgSend(v3, "currentConfigSnapshotWithErrorOut:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    PLLogSubmission();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PLSubmissions configFromMonitor:].cold.1(v3, (uint64_t)v5, v6);

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (void)stopDRTasking
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring DRConfig", v5, 2u);
  }

  -[PLSubmissions taskingMonitor](self, "taskingMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopMonitoring");

}

- (BOOL)taskingBlobDRExists
{
  PLSubmissions *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[PLSubmissions taskingMonitor](self, "taskingMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions configFromMonitor:](v2, "configFromMonitor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)taskingBlobLegacyExists
{
  void *v2;
  BOOL v3;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingFiles"), CFSTR("com.apple.powerlogd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)taskingBlobExists
{
  return -[PLSubmissions taskingBlobDRExists](self, "taskingBlobDRExists")
      || -[PLSubmissions taskingBlobLegacyExists](self, "taskingBlobLegacyExists");
}

- (BOOL)taskingTypeSpecified
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PLSubmissions getCurrentDRConfig](self, "getCurrentDRConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "payloadDictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v5 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)internalSubmissionBehavior
{
  _BOOL4 v3;

  v3 = +[PLPlatform internalBuild](PLPlatform, "internalBuild");
  if (v3)
  {
    if (-[PLSubmissions taskingBlobDRExists](self, "taskingBlobDRExists"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PLSubmissions taskingBlobLegacyExists](self, "taskingBlobLegacyExists");
  }
  return v3;
}

- (BOOL)fullModeSubmissionBehavior
{
  return +[PLPlatform internalBuild](PLPlatform, "internalBuild")
      && +[PLDefaults fullMode](PLDefaults, "fullMode")
      && -[PLSubmissions taskingBlobExists](self, "taskingBlobExists");
}

- (void)handleDRConfigUpdate:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLRapidController handleDRConfigUpdate:error:].cold.1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "teamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receivedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", (uint8_t *)&v12, 0x20u);

  }
}

- (id)getCurrentDRConfig
{
  void *v3;
  void *v4;

  -[PLSubmissions taskingMonitor](self, "taskingMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions configFromMonitor:](self, "configFromMonitor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (signed)submitReasonForToday
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  signed __int16 v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD v33[5];
  uint8_t buf[8];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLSubmissions_submitReasonForToday__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (submitReasonForToday_defaultOnce != -1)
      dispatch_once(&submitReasonForToday_defaultOnce, block);
    if (submitReasonForToday_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("submission check: taskMode = %d"), +[PLDefaults taskMode](PLDefaults, "taskMode"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions submitReasonForToday]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 254);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v9 = objc_opt_class();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __37__PLSubmissions_submitReasonForToday__block_invoke_58;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v9;
      if (submitReasonForToday_defaultOnce_56 != -1)
        dispatch_once(&submitReasonForToday_defaultOnce_56, v36);
      if (submitReasonForToday_classDebugEnabled_57)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tasking submission configured"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions submitReasonForToday]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 256);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v15 = -[PLSubmissions checkTaskingCompletionStatus](self, "checkTaskingCompletionStatus");
    v16 = (_DWORD)v15 ? 2 : 1;
    -[PLSubmissions logTaskingStatus:withAction:](self, "logTaskingStatus:withAction:", v15, v16);
    if (!(_DWORD)v15)
      return 3;
  }
  if (-[PLSubmissions internalSubmissionBehavior](self, "internalSubmissionBehavior"))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v17 = objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __37__PLSubmissions_submitReasonForToday__block_invoke_63;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v17;
      if (submitReasonForToday_defaultOnce_61 != -1)
        dispatch_once(&submitReasonForToday_defaultOnce_61, v35);
      if (submitReasonForToday_classDebugEnabled_62)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("internal submission configured"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions submitReasonForToday]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 266);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    return 1;
  }
  if (-[PLSubmissions fullModeSubmissionBehavior](self, "fullModeSubmissionBehavior"))
  {
    PLLogSubmission();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v24, OS_LOG_TYPE_DEFAULT, "Tasking blob received for internal device in Full Mode.", buf, 2u);
    }

    if (-[PLSubmissions taskingTypeSpecified](self, "taskingTypeSpecified"))
      return 4;
    else
      return 3;
  }
  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    PLLogSubmission();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v25, OS_LOG_TYPE_DEFAULT, "Tasking blob received for internal device", buf, 2u);
    }

  }
  if (-[PLSubmissions taskingTypeSpecified](self, "taskingTypeSpecified"))
    return 4;
  if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    return 0;
  v26 = objc_opt_class();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __37__PLSubmissions_submitReasonForToday__block_invoke_68;
  v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v33[4] = v26;
  if (submitReasonForToday_defaultOnce_66 != -1)
    dispatch_once(&submitReasonForToday_defaultOnce_66, v33);
  v23 = submitReasonForToday_classDebugEnabled_67;
  if (submitReasonForToday_classDebugEnabled_67)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("submission not configured"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions submitReasonForToday]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v29, v30, 279);

    PLLogCommon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    return 0;
  }
  return v23;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitReasonForToday_classDebugEnabled = result;
  return result;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke_58(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitReasonForToday_classDebugEnabled_57 = result;
  return result;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke_63(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitReasonForToday_classDebugEnabled_62 = result;
  return result;
}

BOOL __37__PLSubmissions_submitReasonForToday__block_invoke_68(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitReasonForToday_classDebugEnabled_67 = result;
  return result;
}

- (void)generateOTASubmissionAndSendTaskingEndSubmission:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  PLSubmissionConfig *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  dispatch_time_t v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  int v33;
  _BOOL4 v34;
  void *v35;
  _QWORD v36[5];
  PLSubmissionConfig *v37;
  __int16 v38;
  _QWORD block[5];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v3 = a3;
  v54 = *MEMORY[0x1E0C80C00];
  v5 = -[PLSubmissions submitReasonForToday](self, "submitReasonForToday");
  -[PLSubmissions getCurrentDRConfig](self, "getCurrentDRConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLSubmissions taskingBlobLegacyExists](self, "taskingBlobLegacyExists"))
  {
    -[PLSubmissions emitCollisionEvent:](self, "emitCollisionEvent:", v6);

    -[PLSubmissions rejectTaskingDRConfig](self, "rejectTaskingDRConfig");
    v6 = 0;
  }
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = v5;
    _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Submit reason type: %hd", buf, 8u);
  }

  PLLogSubmission();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "teamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v41 = v9;
    v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Current DRConfig teamID: %@, UUID: %@", buf, 0x16u);

  }
  PLLogSubmission();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "payloadDictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v12;
    _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "DRConfig payload: %@", buf, 0xCu);

  }
  v13 = -[PLSubmissionConfig initWithReasonType:DRConfig:]([PLSubmissionConfig alloc], "initWithReasonType:DRConfig:", v5, v6);
  -[PLSubmissions getLastBatteryTimestampSystem](self, "getLastBatteryTimestampSystem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setLastBatteryTimestampSystem:](v13, "setLastBatteryTimestampSystem:", v14);

  PLLogSubmission();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig hasFileToSubmit](v13, "hasFileToSubmit"));
    v35 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig submitPLL](v13, "submitPLL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig submitMSS](v13, "submitMSS"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig submitSP](v13, "submitSP"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig submitBDC](v13, "submitBDC"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig submitCE](v13, "submitCE"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLSubmissionConfig submitXC](v13, "submitXC"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v41 = v16;
    v42 = 2112;
    v43 = v17;
    v44 = 2112;
    v45 = v18;
    v46 = 2112;
    v47 = v19;
    v48 = 2112;
    v49 = v20;
    v50 = 2112;
    v51 = v5;
    v52 = 2112;
    v53 = v21;
    _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_DEFAULT, "tasking config BOOLs: %@, %@, %@, %@, %@, %@, %@", buf, 0x48u);

    v3 = v34;
    LODWORD(v5) = v33;

    v6 = v35;
  }

  if (!(_DWORD)v5)
    -[PLSubmissions emitBlobDetectedEvent:](self, "emitBlobDetectedEvent:", v13);
  if (-[PLSubmissionConfig hasFileToSubmit](v13, "hasFileToSubmit"))
  {
    if (-[PLSubmissionConfig submitPLL](v13, "submitPLL") && (_DWORD)v5 == 3 && v3)
    {
      PLLogSubmission();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v22, OS_LOG_TYPE_DEFAULT, "On demand tasking about to end, giving grace period of 10 secs...", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:", CFSTR("kPLTaskingEndNotification"), self);

      v24 = dispatch_time(0, 10000000000);
      -[PLSubmissions workQueue](self, "workQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke;
      block[3] = &unk_1E6A52050;
      block[4] = self;
      dispatch_after(v24, v25, block);

      goto LABEL_39;
    }
    if (-[PLSubmissionConfig submitPLL](v13, "submitPLL")
      || ((_DWORD)v5 == 4 || (unsigned __int16)v5 == 1) && -[PLSubmissionConfig submitXC](v13, "submitXC"))
    {
      if ((v5 - 1) > 2)
      {
        if ((_DWORD)v5 != 4)
        {
LABEL_38:
          -[PLSubmissions workQueue](self, "workQueue");
          v32 = objc_claimAutoreleasedReturnValue();
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_74;
          v36[3] = &unk_1E6A55640;
          v36[4] = self;
          v37 = v13;
          v38 = v5;
          dispatch_async(v32, v36);

          goto LABEL_39;
        }
        v27 = -[PLSubmissionConfig shouldSubmitToday](v13, "shouldSubmitToday");
        PLLogSubmission();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (!v27)
        {
          if (v29)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEFAULT, "Skipping conditional tasking...", buf, 2u);
          }

          goto LABEL_38;
        }
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEFAULT, "Starting conditional tasking...", buf, 2u);
        }

      }
    }
    else
    {
      PLLogSubmission();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6AB6000, v30, OS_LOG_TYPE_DEFAULT, "No powerlog file to submit.", buf, 2u);
      }

      v31 = -[PLSubmissionConfig shouldStartTaskingToday](v13, "shouldStartTaskingToday");
      -[PLSubmissions emitBlobVerifiedEvent:](self, "emitBlobVerifiedEvent:", v13);
      if (!v31)
        goto LABEL_38;
      -[PLSubmissionConfig setSubmitReasonType:](v13, "setSubmitReasonType:", 3);
    }
    -[PLSubmissions submitWithTaskingConfig:](self, "submitWithTaskingConfig:", v13);
    goto LABEL_38;
  }
  PLLogSubmission();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[PLSubmissions generateOTASubmissionAndSendTaskingEndSubmission:].cold.1(v5, v26);

  -[PLSubmissions taskingCleanup](self, "taskingCleanup");
LABEL_39:

}

uint64_t __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "generateOTASubmissionAndSendTaskingEndSubmission:", 0);
}

uint64_t __66__PLSubmissions_generateOTASubmissionAndSendTaskingEndSubmission___block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  PLLogSubmission();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "Starting mode check...", buf, 2u);
  }

  if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
  {
    PLLogSubmission();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "End mode", v10, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "taskingCleanup");
    return PowerlogControlSwitchMode();
  }
  if (objc_msgSend(*(id *)(a1 + 40), "submitPLL"))
  {
    if (*(_WORD *)(a1 + 48) != 4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "shouldStartTaskingToday");
      objc_msgSend(*(id *)(a1 + 32), "emitBlobVerifiedEvent:", *(_QWORD *)(a1 + 40));
      if (v5)
      {
        PLLogSubmission();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "Start mode", v9, 2u);
        }

        return PowerlogControlSwitchMode();
      }
    }
  }
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Defaults cleanup", v8, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "taskingCleanup");
}

- (void)performSubmission:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLSubmissions createWatchdogForSubmissionActivity:](self, "createWatchdogForSubmissionActivity:", CFSTR("OTA"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions prepareAndEnqueueSubmissionFilesWithConfig:](self, "prepareAndEnqueueSubmissionFilesWithConfig:", v4);

  -[PLSubmissions stopWatchdogForSubmissionActivity:](self, "stopWatchdogForSubmissionActivity:", v5);
}

- (void)submitWithTaskingConfig:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLSubmissions logSubmissionStateToAnalytics:](self, "logSubmissionStateToAnalytics:", CFSTR("attempt"));
  objc_msgSend(v4, "submitFileStatsToAnalytics");
  -[PLSubmissions workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PLSubmissions_submitWithTaskingConfig___block_invoke;
  v7[3] = &unk_1E6A521A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__PLSubmissions_submitWithTaskingConfig___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v2 = (void *)os_transaction_create();
  v3 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "performSubmission:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v3);
  v4 = dispatch_time(0, 60000000000);
  +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PLSubmissions_submitWithTaskingConfig___block_invoke_2;
  block[3] = &unk_1E6A52050;
  v8 = v2;
  v6 = v2;
  dispatch_after(v4, v5, block);

}

- (void)prepareAndEnqueueSubmissionFilesWithConfig:(id)a3
{
  int *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  PLSubmissionFilePLL *v7;
  PLSubmissionFilePLL *v8;
  NSObject *v9;
  PLSubmissionFileMSS *v10;
  PLSubmissionFileMSS *v11;
  NSObject *v12;
  PLSubmissionFileBDC *v13;
  PLSubmissionFileBDC *v14;
  NSObject *v15;
  PLSubmissionFileCE *v16;
  PLSubmissionFileCE *v17;
  NSObject *v18;
  PLSubmissionFileXC *v19;
  PLSubmissionFileXC *v20;
  NSObject *v21;
  PLSubmissionFileBG *v22;
  PLSubmissionFileBG *v23;
  NSObject *v24;
  PLSubmissionFileSP *v25;
  PLSubmissionFileSP *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  int *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  PLSubmissionRecord *v42;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  PLSubmissionFileMSS *v50;
  PLSubmissionFilePLL *v51;
  PLSubmissionFileBDC *v52;
  uint8_t v53;
  char v54[15];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(a3, "splitBySubmissionType");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v49)
  {
    v3 = &dword_1B6AB6000;
    v48 = *(_QWORD *)v56;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v4);
        PLLogSubmission();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "getSubmitReasonTypeToReasonLog");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v5, "submittedFilesMask");
          objc_msgSend(v5, "submissionMaskToString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v60 = v38;
          v61 = 2048;
          v62 = v39;
          v63 = 2112;
          v64 = v40;
          _os_log_debug_impl(v3, v6, OS_LOG_TYPE_DEBUG, "Starting submission of type '%@' (mask: %llu = %@)", buf, 0x20u);

        }
        v7 = -[PLSubmissionFilePLL initWithConfig:]([PLSubmissionFilePLL alloc], "initWithConfig:", v5);
        v8 = v7;
        if (v7)
        {
          -[PLSubmissionFilePLL submit](v7, "submit");
          PLLogSubmission();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v9, OS_LOG_TYPE_DEFAULT, "Finished preparing PLL", buf, 2u);
          }

        }
        v10 = -[PLSubmissionFileMSS initWithConfig:]([PLSubmissionFileMSS alloc], "initWithConfig:", v5);
        v11 = v10;
        if (v10)
        {
          -[PLSubmissionFileMSS submit](v10, "submit");
          PLLogSubmission();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v12, OS_LOG_TYPE_DEFAULT, "Finished preparing MSS", buf, 2u);
          }

        }
        v13 = -[PLSubmissionFileBDC initWithConfig:]([PLSubmissionFileBDC alloc], "initWithConfig:", v5);
        v14 = v13;
        if (v13)
        {
          -[PLSubmissionFileBDC submit](v13, "submit");
          PLLogSubmission();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v15, OS_LOG_TYPE_DEFAULT, "Finished preparing BDC", buf, 2u);
          }

        }
        v52 = v14;
        v16 = -[PLSubmissionFileCE initWithConfig:]([PLSubmissionFileCE alloc], "initWithConfig:", v5);
        v17 = v16;
        if (v16)
        {
          -[PLSubmissionFileCE submit](v16, "submit");
          PLLogSubmission();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v18, OS_LOG_TYPE_DEFAULT, "Finished preparing CE", buf, 2u);
          }

        }
        v19 = -[PLSubmissionFileXC initWithConfig:]([PLSubmissionFileXC alloc], "initWithConfig:", v5);
        v20 = v19;
        if (v19)
        {
          -[PLSubmissionFileXC submit](v19, "submit");
          PLLogSubmission();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v21, OS_LOG_TYPE_DEFAULT, "Finished preparing XC", buf, 2u);
          }

        }
        v51 = v8;
        v22 = -[PLSubmissionFileBG initWithConfig:]([PLSubmissionFileBG alloc], "initWithConfig:", v5);
        v23 = v22;
        if (v22)
        {
          -[PLSubmissionFileBG submit](v22, "submit");
          PLLogSubmission();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v24, OS_LOG_TYPE_DEFAULT, "Finished preparing BG", buf, 2u);
          }

        }
        v50 = v11;
        v25 = -[PLSubmissionFileSP initWithConfig:]([PLSubmissionFileSP alloc], "initWithConfig:", v5);
        v26 = v25;
        if (v25)
        {
          -[PLSubmissionFile submit](v25, "submit");
          PLLogSubmission();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v3, v27, OS_LOG_TYPE_DEFAULT, "Finished preparing SP", buf, 2u);
          }

        }
        objc_msgSend(v5, "filePath");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          v30 = v3;
          objc_msgSend(v5, "ckTagConfig");
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = (void *)v31;
            objc_msgSend(v5, "tagUUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v3 = v30;
            if (v33)
            {
              if (objc_msgSend(v5, "enableDPUpload"))
              {
                v42 = [PLSubmissionRecord alloc];
                objc_msgSend(v5, "filePath");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "tagUUID");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "ckTagConfig");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "configUUID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "configDateReceived");
                v34 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "configDateApplied");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = (void *)v34;
                v37 = -[PLSubmissionRecord initWithCKFilePath:tagUUID:tagConfig:configUUID:configDateReceived:configDateApplied:](v42, "initWithCKFilePath:tagUUID:tagConfig:configUUID:configDateReceived:configDateApplied:", v46, v45, v44, v41, v34, v35);

                -[PLSubmissions submitRecordToDiagnosticPipeline:withConfig:](self, "submitRecordToDiagnosticPipeline:withConfig:", v37, v5);
              }
              else
              {
                -[PLSubmissions enqueueFileForUpload:](self, "enqueueFileForUpload:", v5);
                v37 = objc_claimAutoreleasedReturnValue();
                -[PLSubmissions persistSubmissionInfo:](self, "persistSubmissionInfo:", v37);
              }
              v3 = v30;
              goto LABEL_46;
            }
          }
          else
          {

          }
        }
        PLLogSubmission();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[PLSubmissions prepareAndEnqueueSubmissionFilesWithConfig:].cold.1(&v53, v54, v37);
LABEL_46:

        ++v4;
      }
      while (v49 != v4);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
    }
    while (v49);
  }

}

- (void)submitRecordToDiagnosticPipeline:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  id *v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "getSubmitReasonTypeToReasonLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions generateCKRecordDictionaryWithRecord:](self, "generateCKRecordDictionaryWithRecord:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "submissionCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = CFSTR("com.apple.perfpowerservices");
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Submitting '%@:%@' record for %@ via DiagnosticPipeline", buf, 0x20u);

  }
  objc_msgSend(v6, "emitAttemptEvent");
  objc_msgSend(v7, "submissionCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21 = v9;
  v22 = &v23;
  v19 = CFSTR("attachment");
  v20 = CFSTR("asset");
  v14 = DRSubmitLogToCKContainer();
  v15 = v23;

  PLLogSubmission();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "filePath", CFSTR("attachment"), CFSTR("asset"), v9, &v23);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_1B6AB6000, v17, OS_LOG_TYPE_DEFAULT, "Successfully submitted %@ to DiagnosticPipeline for upload", buf, 0xCu);

    }
    objc_msgSend(v6, "emitSuccessEvent");
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLSubmissions submitRecordToDiagnosticPipeline:withConfig:].cold.1();

  }
  objc_msgSend(v6, "cleanup", v19, v20, v21, v22);

}

- (id)generateCKRecordDictionaryWithRecord:(id)a3
{
  id v3;
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
  int v14;
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

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("fileName"));

  objc_msgSend(v3, "tagConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Internal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("true")))
    v9 = &unk_1E6ABB1B0;
  else
    v9 = &unk_1E6ABB180;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("internal"));

  objc_msgSend(v3, "tagConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Beta"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("true")))
    v12 = &unk_1E6ABB1B0;
  else
    v12 = &unk_1E6ABB180;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("seed"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("iOS"), CFSTR("machineType"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("machineType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("iOS"));

  if (v14 && +[PLPlatform isiPad](PLPlatform, "isiPad"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("iPadOS"), CFSTR("machineType"));
  objc_msgSend(v3, "tagConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Model"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "tagConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Model"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("deviceModel"));

  }
  objc_msgSend(v3, "tagConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("TagUUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "tagConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TagUUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("UUID"));

  }
  objc_msgSend(v3, "tagConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Reason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v3, "tagConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Reason"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("reason"));

  }
  objc_msgSend(v3, "tagConfig");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Build"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v3, "tagConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Build"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("build"));

  }
  objc_msgSend(v3, "tagConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Date"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "tagConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Date"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("date"));

  }
  objc_msgSend(v3, "tagConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("SubmittedFilesMask"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v3, "tagConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("SubmittedFilesMask"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("submittedFilesMask"));

  }
  objc_msgSend(v3, "tagConfig");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("ExtendedAttributes"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v3, "tagConfig");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ExtendedAttributes"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSubmissionConfig getDateMarkerFromSystemDate:](PLSubmissionConfig, "getDateMarkerFromSystemDate:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("HandoverDate"));

    objc_msgSend(v43, "serializedJSONString");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("extendedAttributes"));

  }
  v47 = (void *)objc_msgSend(v4, "copy");

  return v47;
}

- (void)generatePLLSubmissionWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLSubmissionConfig *v14;
  void *v15;
  PLSubmissionFilePLL *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  dispatch_time_t v50;
  NSObject *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  PLSubmissions *v57;
  void *v58;
  void *context;
  void *v60;
  _QWORD block[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[2];
  _QWORD v67[2];
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60 = (void *)os_transaction_create();
  context = (void *)MEMORY[0x1BCC9E9B4]();
  -[PLSubmissions createWatchdogForSubmissionActivity:](self, "createWatchdogForSubmissionActivity:", CFSTR("PLL"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GenerateOTASubmissionWithPayload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions generatePLLSubmissionWithPayload:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 547);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v5;
    _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v10 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cache_size"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("cache_size"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PLSubmissionConfig initWithPayload:]([PLSubmissionConfig alloc], "initWithPayload:", v10);
  -[PLSubmissions getLastBatteryTimestampSystem](self, "getLastBatteryTimestampSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setLastBatteryTimestampSystem:](v14, "setLastBatteryTimestampSystem:", v15);

  v16 = -[PLSubmissionFilePLL initWithConfig:]([PLSubmissionFilePLL alloc], "initWithConfig:", v14);
  v66[0] = CFSTR("Type");
  -[PLSubmissionConfig getSubmitReasonTypeToStorageEventOTAType](v14, "getSubmitReasonTypeToStorageEventOTAType");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v66[1] = CFSTR("Success");
  v19 = MEMORY[0x1E0C9AAB0];
  if (!v16)
    v19 = MEMORY[0x1E0C9AAA0];
  v67[0] = v17;
  v67[1] = v19;
  v20 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = self;
  -[PLSubmissions logOTAStatus:](self, "logOTAStatus:", v21);

  -[PLSubmissionFile filePath](v16, "filePath");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v54 = v10;
    v56 = v4;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    v55 = v13;
    v24 = objc_msgSend(v23, "moveItemAtPath:toPath:error:", v22, v13, &v65);
    v25 = v65;

    if ((v24 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error moving file %@"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions generatePLLSubmissionWithPayload:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v28, v29, 567);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v26;
        _os_log_impl(&dword_1B6AB6000, v30, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v20 = 0x1E0C99000;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionFile directory](v16, "directory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v25;
    v33 = objc_msgSend(v31, "removeItemAtPath:error:", v32, &v64);
    v34 = v64;

    if ((v33 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error removing file %@"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions generatePLLSubmissionWithPayload:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v37, v38, 572);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v69 = v35;
        _os_log_impl(&dword_1B6AB6000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v20 = 0x1E0C99000uLL;
    }
    v4 = v56;
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("user"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "length"))
    {
      objc_msgSend(*(id *)(v20 + 3456), "dictionaryWithObjectsAndKeys:", v40, *MEMORY[0x1E0CB2A98], 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v34;
      v43 = objc_msgSend(v42, "setAttributes:ofItemAtPath:error:", v41, v55, &v63);
      v44 = v63;

      if ((v43 & 1) == 0)
      {
        v53 = v41;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error setting attr %@"), v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions generatePLLSubmissionWithPayload:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v47, v48, 579);

        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v45;
          _os_log_impl(&dword_1B6AB6000, v49, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        v41 = v53;
      }

      v4 = v56;
    }
    else
    {
      v44 = v34;
    }
    v13 = v55;

    v10 = v54;
  }
  -[PLSubmissionFile cleanupTmpDirectory](v16, "cleanupTmpDirectory");
  -[PLSubmissions stopWatchdogForSubmissionActivity:](v57, "stopWatchdogForSubmissionActivity:", v58);

  objc_autoreleasePoolPop(context);
  v50 = dispatch_time(0, 60000000000);
  +[PLUtilities transactionWorkQueue](PLUtilities, "transactionWorkQueue");
  v51 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PLSubmissions_generatePLLSubmissionWithPayload___block_invoke;
  block[3] = &unk_1E6A52050;
  v62 = v60;
  v52 = v60;
  dispatch_after(v50, v51, block);

}

- (id)generateMSSSubmissionWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  PLSubmissionConfig *v14;
  void *v15;
  PLSubmissionFileMSS *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)os_transaction_create();
  v6 = (void *)MEMORY[0x1BCC9E9B4]();
  -[PLSubmissions createWatchdogForSubmissionActivity:](self, "createWatchdogForSubmissionActivity:", CFSTR("MSS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GenerateMSSSubmissionWithPayload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions generateMSSSubmissionWithPayload:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 596);

  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v13 = (void *)objc_msgSend(v4, "mutableCopy");
  v14 = -[PLSubmissionConfig initWithPayload:]([PLSubmissionConfig alloc], "initWithPayload:", v13);
  -[PLSubmissions getLastBatteryTimestampSystem](self, "getLastBatteryTimestampSystem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setLastBatteryTimestampSystem:](v14, "setLastBatteryTimestampSystem:", v15);

  v16 = -[PLSubmissionFileMSS initWithConfig:]([PLSubmissionFileMSS alloc], "initWithConfig:", v14);
  -[PLSubmissionFile filePath](v16, "filePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v17, CFSTR("microstackshots"), 0);
  else
    v18 = 0;
  -[PLSubmissions stopWatchdogForSubmissionActivity:](self, "stopWatchdogForSubmissionActivity:", v7);

  objc_autoreleasePoolPop(v6);
  return v18;
}

- (id)getLastBatteryTimestampSystem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastEntryForKey:", CFSTR("PLBatteryAgent_EventBackward_Battery"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFromMonotonicToSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)logTaskingStatus:(int)a3 withAction:(int)a4
{
  -[PLSubmissions logTaskingStatus:withAction:withTables:](self, "logTaskingStatus:withAction:withTables:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (void)logTaskingStatus:(int)a3 withAction:(int)a4 withTables:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  _QWORD v21[3];
  _QWORD v22[4];

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v22[3] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLSubmissions_logTaskingStatus_withAction_withTables___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (logTaskingStatus_withAction_withTables__defaultOnce != -1)
      dispatch_once(&logTaskingStatus_withAction_withTables__defaultOnce, block);
    if (logTaskingStatus_withAction_withTables__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error=%d, action=%d, taskingTables=%@"), v6, v5, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions logTaskingStatus:withAction:withTables:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 624);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("taskingTablesPayload=%@"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions storageOperator](self, "storageOperator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("Action");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v17;
  v21[1] = CFSTR("ErrorType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = CFSTR("TaskingTablesPayload");
  v22[1] = v18;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logEventForwardTaskingMode:", v19);

}

BOOL __56__PLSubmissions_logTaskingStatus_withAction_withTables___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logTaskingStatus_withAction_withTables__classDebugEnabled = result;
  return result;
}

- (void)enableHangtracer
{
  const __CFString *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("PLTasking.HangTracerEnableAppActivationLogging"), &unk_1E6ABB1B0, CFSTR("com.apple.hangtracer"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(CFSTR("com.apple.hangtracer"), CFSTR("mobile"), v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.hangtracer.pref_changed"), 0, 0, 0);
}

- (void)disableHangtracer
{
  const __CFString *v2;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("PLTasking.HangTracerEnableAppActivationLogging"), 0, CFSTR("com.apple.hangtracer"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(CFSTR("com.apple.hangtracer"), CFSTR("mobile"), v2);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.hangtracer.pref_changed"), 0, 0, 0);
}

- (void)logTaskingTablesTurnedOn:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t block;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __42__PLSubmissions_logTaskingTablesTurnedOn___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (logTaskingTablesTurnedOn__defaultOnce != -1)
      dispatch_once(&logTaskingTablesTurnedOn__defaultOnce, &block);
    if (logTaskingTablesTurnedOn__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TaskingTablesTurnedOn=%@"), v4, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions logTaskingTablesTurnedOn:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 654);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLSubmissions storageOperator](self, "storageOperator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventNoneAdditionalTablesTurnedOn:", v4);

}

BOOL __42__PLSubmissions_logTaskingTablesTurnedOn___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logTaskingTablesTurnedOn__classDebugEnabled = result;
  return result;
}

- (void)logOTAStatus:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("OTAStatus=%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions logOTAStatus:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 659);

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  -[PLSubmissions storageOperator](self, "storageOperator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventPointOTA:", v5);

}

- (void)clearTaskingDRConfig
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PLSubmissions getCurrentDRConfig](self, "getCurrentDRConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "No DRConfig to clear", buf, 2u);
    }
    goto LABEL_10;
  }
  if (v5)
  {
    objc_msgSend(v3, "configUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to mark DRConfig %@ as completed", buf, 0xCu);

  }
  -[PLSubmissions taskingMonitor](self, "taskingMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "markCompletedConfigUUID:errorOut:", v8, &v10);
  v4 = v10;

  if (v4)
  {
    PLLogSubmission();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PLRapidController completeTaskingConfig:].cold.1();

LABEL_10:
  }

}

- (void)rejectTaskingDRConfig
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PLSubmissions getCurrentDRConfig](self, "getCurrentDRConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "No DRConfig to reject", buf, 2u);
    }
    goto LABEL_10;
  }
  if (v5)
  {
    objc_msgSend(v3, "configUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Rejecting DRConfig %@", buf, 0xCu);

  }
  -[PLSubmissions taskingMonitor](self, "taskingMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "rejectConfigUUID:errorOut:", v8, &v10);
  v4 = v10;

  if (v4)
  {
    PLLogSubmission();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PLRapidController rejectTaskingConfig:].cold.1();

LABEL_10:
  }

}

- (void)taskingCleanup
{
  -[PLSubmissions disableHangtracer](self, "disableHangtracer");
  +[PLSubmissionConfig clearTaskingDefaults](PLSubmissionConfig, "clearTaskingDefaults");
  -[PLSubmissions clearTaskingDRConfig](self, "clearTaskingDRConfig");
}

- (int)checkTaskingCompletionStatus
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD block[5];

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", CFSTR("PLTaskingOnDemandStartDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (checkTaskingCompletionStatus_defaultOnce != -1)
      dispatch_once(&checkTaskingCompletionStatus_defaultOnce, block);
    if (checkTaskingCompletionStatus_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("taskingStartDate=%@, now=%@"), v2, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions checkTaskingCompletionStatus]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 702);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (objc_msgSend(v2, "compare:", v3) == 1)
  {
    v10 = 1;
    PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.OTATasking.monotonicTimeReset"), 1);
    AnalyticsSendEventLazy();
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v11 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v11;
      if (checkTaskingCompletionStatus_defaultOnce_207 != -1)
        dispatch_once(&checkTaskingCompletionStatus_defaultOnce_207, v26);
      if (checkTaskingCompletionStatus_classDebugEnabled_208)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Abort Tasking: monotonic time moved back"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions checkTaskingCompletionStatus]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 710);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
      v10 = 1;
    }
  }
  else
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v2);
    if (v17 >= 604800.0)
    {
      PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.OTATasking.timeout7Days"), 1);
      AnalyticsSendEventLazy();
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v18 = objc_opt_class();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2_222;
        v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v25[4] = v18;
        if (checkTaskingCompletionStatus_defaultOnce_220 != -1)
          dispatch_once(&checkTaskingCompletionStatus_defaultOnce_220, v25);
        if (checkTaskingCompletionStatus_classDebugEnabled_221)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Abort Tasking: 7 days since tasking start"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions checkTaskingCompletionStatus]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 721);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      v10 = 2;
    }
    else
    {
      PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.OTATasking.onDemandTaskingFinish"), 1);
      AnalyticsSendEventLazy();
      v10 = 0;
    }
  }

  return v10;
}

BOOL __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  checkTaskingCompletionStatus_classDebugEnabled = result;
  return result;
}

void *__45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_202()
{
  return &unk_1E6AF7688;
}

BOOL __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  checkTaskingCompletionStatus_classDebugEnabled_208 = result;
  return result;
}

void *__45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_213()
{
  return &unk_1E6AF76B0;
}

BOOL __45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_2_222(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  checkTaskingCompletionStatus_classDebugEnabled_221 = result;
  return result;
}

void *__45__PLSubmissions_checkTaskingCompletionStatus__block_invoke_227()
{
  return &unk_1E6AF76D8;
}

- (void)taskingModeSafeguard
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD block[5];

  if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
  {
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PLTaskingRestartCount"), 0.0);
    v4 = v3 + 1.0;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__PLSubmissions_taskingModeSafeguard__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (taskingModeSafeguard_defaultOnce != -1)
        dispatch_once(&taskingModeSafeguard_defaultOnce, block);
      if (taskingModeSafeguard_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("powerlog restartCount=%f"), *(_QWORD *)&v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions taskingModeSafeguard]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 737);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (v4 <= 10.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v17, CFSTR("PLTaskingRestartCount"), 1);

    }
    else
    {
      PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.OTATasking.restartCountLimitHit"), 1);
      AnalyticsSendEventLazy();
      -[PLSubmissions logTaskingStatus:withAction:](self, "logTaskingStatus:withAction:", 4, 2);
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v11 = objc_opt_class();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __37__PLSubmissions_taskingModeSafeguard__block_invoke_2;
        v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v18[4] = v11;
        if (taskingModeSafeguard_defaultOnce_247 != -1)
          dispatch_once(&taskingModeSafeguard_defaultOnce_247, v18);
        if (taskingModeSafeguard_classDebugEnabled_248)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("restartCount over limit, exiting tasking mode"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions taskingModeSafeguard]");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 744);

          PLLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      PowerlogControlSwitchMode();
    }
  }
}

BOOL __37__PLSubmissions_taskingModeSafeguard__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  taskingModeSafeguard_classDebugEnabled = result;
  return result;
}

void *__37__PLSubmissions_taskingModeSafeguard__block_invoke_240()
{
  return &unk_1E6AF7700;
}

BOOL __37__PLSubmissions_taskingModeSafeguard__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  taskingModeSafeguard_classDebugEnabled_248 = result;
  return result;
}

- (void)taskingModeSetup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t block;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  self->_taskingStarted = 0;
  if (+[PLDefaults taskMode](PLDefaults, "taskMode"))
  {
    if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", CFSTR("PLTaskingOnDemandStartDate")))
    {
      -[PLSubmissions logTaskingStatus:withAction:](self, "logTaskingStatus:withAction:", 0, 3);
    }
    else
    {
      PLADClientAddValueForScalarKey(CFSTR("com.apple.powerlog.OTATasking.onDemandTaskingStart"), 1);
      AnalyticsSendEventLazy();
      +[PLSubmissionConfig submitTaskingDefaultsCheckStateToCA:](PLSubmissionConfig, "submitTaskingDefaultsCheckStateToCA:", CFSTR("OnDemandTaskingStart"));
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v3, CFSTR("PLTaskingOnDemandStartDate"), 1);
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v4 = objc_opt_class();
        block = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __33__PLSubmissions_taskingModeSetup__block_invoke_2;
        v15 = &__block_descriptor_40_e5_v8__0lu32l8;
        v16 = v4;
        if (taskingModeSetup_defaultOnce != -1)
          dispatch_once(&taskingModeSetup_defaultOnce, &block);
        if (taskingModeSetup_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("starting on demand logging with startTime=%@"), v3, block, v13, v14, v15, v16);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "lastPathComponent");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions taskingModeSetup]");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 765);

          PLLogCommon();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      +[PLCoreStorage additionalTables](PLCoreStorage, "additionalTables");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSubmissions logTaskingStatus:withAction:withTables:](self, "logTaskingStatus:withAction:withTables:", 0, 0, v10);
      +[PLEntryKey PLEntryKeyStringsForTasking](PLEntryKey, "PLEntryKeyStringsForTasking");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSubmissions logTaskingTablesTurnedOn:](self, "logTaskingTablesTurnedOn:", v11);
      -[PLSubmissions enableHangtracer](self, "enableHangtracer");
      +[PLEntryKey PLEntryKeyStringsForTaskingReset](PLEntryKey, "PLEntryKeyStringsForTaskingReset");
      self->_taskingStarted = 1;

    }
  }
}

void *__33__PLSubmissions_taskingModeSetup__block_invoke()
{
  return &unk_1E6AF7728;
}

BOOL __33__PLSubmissions_taskingModeSetup__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  taskingModeSetup_classDebugEnabled = result;
  return result;
}

- (id)createWatchdogForSubmissionActivity:(id)a3
{
  id v4;
  PLTimer *v5;
  void *v6;
  void *v7;
  id v8;
  PLTimer *v9;
  _QWORD v11[4];
  id v12;
  PLSubmissions *v13;

  v4 = a3;
  v5 = [PLTimer alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PLSubmissions_createWatchdogForSubmissionActivity___block_invoke;
  v11[3] = &unk_1E6A55708;
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v5, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v6, 0, 0, v7, v11, 0.0, 0.0);

  return v9;
}

uint64_t __53__PLSubmissions_createWatchdogForSubmissionActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ERROR] Watchdog fired %@"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions createWatchdogForSubmissionActivity:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v4, v5, 791);

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v2;
    _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "sendSubmissionIssueSignature:", *(_QWORD *)(a1 + 32));
  return +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", 1002);
}

- (void)stopWatchdogForSubmissionActivity:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setTimerActive:", 0);
  objc_msgSend(v3, "invalidate");

}

- (void)sendSubmissionIssueSignature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("PowerlogSubmission"), CFSTR("Timeout"), v7, &stru_1E6A56538, v5, CFSTR("3600"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "snapshotWithSignature:duration:events:payload:actions:reply:", v6, 0, 0, 0, &__block_literal_global_277, 600.0);
  }

}

void __46__PLSubmissions_sendSubmissionIssueSignature___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A0]);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SDRDiagnosticReporter response = %@, sessionID = %@"), v2, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions sendSubmissionIssueSignature:]_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 816);

    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SDRDiagnosticReporter dampened"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissions.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissions sendSubmissionIssueSignature:]_block_invoke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v12, v13, 819);

    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }

}

- (void)initSubmissionQueue
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  BOOL v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  uint64_t v61;
  id obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  PLLogSubmission();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "Initializing submission queue", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PLSubmissionConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v75;
    v11 = CFSTR("PLSubmissionConfig");
    do
    {
      v12 = 0;
      v61 = v9;
      do
      {
        if (*(_QWORD *)v75 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v12);
        NSTemporaryDirectory();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingPathComponent:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingPathComponent:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = 0;
        objc_msgSend(*(id *)(v7 + 1568), "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = objc_msgSend(v17, "fileExistsAtPath:isDirectory:", v16, &v73);

        if ((_DWORD)v14)
          v18 = v73 == 0;
        else
          v18 = 0;
        if (v18)
        {
          v19 = v11;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v16);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB3710];
          v22 = objc_opt_class();
          v72 = 0;
          objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v20, &v72);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v72;
          if (v24)
          {
            PLLogSubmission();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v81 = v16;
              v82 = 2112;
              v83 = v24;
              _os_log_error_impl(&dword_1B6AB6000, v25, OS_LOG_TYPE_ERROR, "Failed to read record from file: %@, error: %@", buf, 0x16u);
            }
            goto LABEL_21;
          }
          objc_msgSend(*(id *)(v7 + 1568), "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "filePath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

          if ((v28 & 1) != 0)
          {
            objc_msgSend(v59, "addObject:", v23);
            objc_msgSend(v23, "tagUUID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "addObject:", v29);
            v24 = (id)v20;
            v7 = 0x1E0CB3000;
          }
          else
          {
            PLLogSubmission();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v23, "filePath");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v81 = v30;
              v82 = 2112;
              v83 = v23;
              _os_log_error_impl(&dword_1B6AB6000, v25, OS_LOG_TYPE_ERROR, "File %@ does not exist for record %@", buf, 0x16u);

            }
            v7 = 0x1E0CB3000uLL;
LABEL_21:

            v29 = v23;
            v23 = (void *)v20;
          }

          v11 = v19;
          v9 = v61;
        }

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(v7 + 1568), "defaultManager");
  v31 = v7;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  objc_msgSend(v32, "contentsOfDirectoryAtPath:error:", CFSTR("/tmp/powerlog/"), &v71);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v71;

  if (v34)
  {
    PLLogSubmission();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v81 = v34;
      _os_log_impl(&dword_1B6AB6000, v35, OS_LOG_TYPE_DEFAULT, "Failed to read contents at tmp: %@", buf, 0xCu);
    }
  }
  else
  {
    v57 = v33;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v36 = v33;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v37)
    {
      v38 = v37;
      v39 = v31;
      v40 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v68 != v40)
            objc_enumerationMutation(v36);
          v42 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v42);
          if (v43)
          {
            objc_msgSend(CFSTR("/tmp/powerlog/"), "stringByAppendingPathComponent:", v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = 0;
            objc_msgSend(*(id *)(v39 + 1568), "defaultManager");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "fileExistsAtPath:isDirectory:", v44, &v73);

            if (v46)
              v47 = v73 == 0;
            else
              v47 = 1;
            if (!v47 && (objc_msgSend(v42, "containsString:", CFSTR("cloud")) & 1) == 0)
            {
              objc_msgSend(v42, "lastPathComponent");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v60, "containsObject:", v48) & 1) == 0)
              {
                PLLogSubmission();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v81 = v48;
                  _os_log_impl(&dword_1B6AB6000, v49, OS_LOG_TYPE_DEFAULT, "Removing temporary files for: %@", buf, 0xCu);
                }

                -[PLSubmissions cleanupTemporarySubmissionFilesForTag:](self, "cleanupTemporarySubmissionFilesForTag:", v48);
              }

            }
            v39 = 0x1E0CB3000;
          }

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v38);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v35 = v59;
    v50 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v64 != v52)
            objc_enumerationMutation(v35);
          v54 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          PLLogSubmission();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v54, "tagUUID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v81 = v56;
            _os_log_impl(&dword_1B6AB6000, v55, OS_LOG_TYPE_DEFAULT, "Initialized and enqueued record from disk: %@", buf, 0xCu);

          }
          -[PLSubmissions enqueueSubmissionRecord:](self, "enqueueSubmissionRecord:", v54);
        }
        v51 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
      }
      while (v51);
    }
    v34 = 0;
    v33 = v57;
  }

}

- (void)cleanupTemporarySubmissionFilesForTag:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[PLSubmissionRecord getDASubmissionDirPathForTag:](PLSubmissionRecord, "getDASubmissionDirPathForTag:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissions removeFileAtPath:](self, "removeFileAtPath:", v5);

  +[PLSubmissionRecord getCKSubmissionDirPathForTag:](PLSubmissionRecord, "getCKSubmissionDirPathForTag:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PLSubmissions removeFileAtPath:](self, "removeFileAtPath:", v6);
}

- (void)persistSubmissionInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PLSubmissionConfig"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "tagUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", v7))
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;
      if (v9)
      {
        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[PLSubmissions persistSubmissionInfo:].cold.2();
      }
      else
      {
        objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("record"));
        v10 = objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "writeToFile:atomically:", v10, 1) & 1) == 0)
        {
          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[PLSubmissions persistSubmissionInfo:].cold.1();

        }
      }

    }
    else
    {
      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create dir: %@", buf, 0xCu);
      }
    }

  }
}

- (void)logSubmissionStateToAnalytics:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.iCloudTaskingSubmission"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLADClientAddValueForScalarKey(v5, 1);
  AnalyticsSendEventLazy();

}

id __47__PLSubmissions_logSubmissionStateToAnalytics___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("state");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)emitCollisionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  if (v3)
  {
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("TaskingBlobCollision"));
    objc_msgSend(v10, "configUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v10, "configUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("DPTaskingUUID"));

    }
    objc_msgSend(v10, "payloadDictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLTaskingRequest"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("TaskingReason"));
    _submitTaskingCAEventPayload(v4, CFSTR("Collision with DA tasking"));

    v3 = v10;
  }

}

- (void)emitBlobDetectedEvent:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    v5 = -[PLSubmissions internalSubmissionBehavior](self, "internalSubmissionBehavior");
    v4 = v12;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("TaskingBlobDetected"), CFSTR("TaskingState"));
      if (objc_msgSend(v12, "isDRTasking"))
      {
        objc_msgSend(v12, "configUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v12, "configUUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUIDString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("DPTaskingUUID"));

        }
      }
      objc_msgSend(v12, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v12, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("TaskingReason"));

      }
      _submitTaskingCAEventPayload(v6, CFSTR("Tasking blob detected"));

      v4 = v12;
    }
  }

}

- (void)emitBlobVerifiedEvent:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    v5 = -[PLSubmissions internalSubmissionBehavior](self, "internalSubmissionBehavior");
    v4 = v14;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("TaskingBlobVerified"), CFSTR("TaskingState"));
      if (objc_msgSend(v14, "isDRTasking"))
      {
        objc_msgSend(v14, "configUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v14, "configUUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUIDString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("DPTaskingUUID"));

        }
      }
      objc_msgSend(v14, "blobFailureReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v14, "blobFailureReason");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("TaskingBlobFailureReason"));

      }
      objc_msgSend(v14, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v14, "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("TaskingReason"));

      }
      _submitTaskingCAEventPayload(v6, CFSTR("Tasking blob verified"));

      v4 = v14;
    }
  }

}

- (PLStorageOperator)storageOperator
{
  return (PLStorageOperator *)objc_loadWeakRetained((id *)&self->_storageOperator);
}

- (void)setStorageOperator:(id)a3
{
  objc_storeWeak((id *)&self->_storageOperator, a3);
}

- (BOOL)xpcActivityStarted
{
  return self->_xpcActivityStarted;
}

- (void)setXpcActivityStarted:(BOOL)a3
{
  self->_xpcActivityStarted = a3;
}

- (NSMutableArray)submissionQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSubmissionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)lastXPCActivityTimestamp
{
  return self->_lastXPCActivityTimestamp;
}

- (void)setLastXPCActivityTimestamp:(double)a3
{
  self->_lastXPCActivityTimestamp = a3;
}

- (double)xpcActivityDelay
{
  return self->_xpcActivityDelay;
}

- (void)setXpcActivityDelay:(double)a3
{
  self->_xpcActivityDelay = a3;
}

- (BOOL)taskingStarted
{
  return self->_taskingStarted;
}

- (PLSQLiteConnection)connection
{
  return (PLSQLiteConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)request
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)filterQuery
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFilterQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)onDemandTasking
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOnDemandTasking:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)capValue
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCapValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (DRConfigMonitor)taskingMonitor
{
  return (DRConfigMonitor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTaskingMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingMonitor, 0);
  objc_storeStrong((id *)&self->_capValue, 0);
  objc_storeStrong((id *)&self->_onDemandTasking, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_destroyWeak((id *)&self->_storageOperator);
}

void __64__PLSubmissions_XPCScheduling__registerUploadSchedulingActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "Failed to set background state to continue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  _os_log_debug_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEBUG, "Record %@ completed: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "xpcActivity passed not in continue state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __58__PLSubmissions_XPCScheduling__submitRecord_withActivity___block_invoke_77_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, v0, v1, "XPC activity criteria dict is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)configFromMonitor:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, a3, v6, "Error getting current config from DRConfigMonitor <%@> : %@", (uint8_t *)&v7);

}

- (void)generateOTASubmissionAndSendTaskingEndSubmission:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_ERROR, "Nothing to submit for reason %d", (uint8_t *)v2, 8u);
}

- (void)prepareAndEnqueueSubmissionFilesWithConfig:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_ERROR, "Not submitting submission record to DiagnosticPipeline due to missing info", buf, 2u);
}

- (void)submitRecordToDiagnosticPipeline:withConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Error occurred when submitting to DiagnosticPipeline: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistSubmissionInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Failed to write record %@ to file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)persistSubmissionInfo:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, v0, (uint64_t)v0, "Failed to serialize record: %@, error: %@", v1);
  OUTLINED_FUNCTION_1_0();
}

@end
