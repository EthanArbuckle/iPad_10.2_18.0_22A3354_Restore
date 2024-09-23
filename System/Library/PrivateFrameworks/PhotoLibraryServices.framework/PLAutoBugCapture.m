@implementation PLAutoBugCapture

+ (id)_bucketCountDescriptionForCount:(int64_t)a3 policy:(unint64_t)a4
{
  unint64_t v4;
  BOOL v5;
  __CFString *v6;

  if (a4)
  {
    if (a4 != 1)
      return CFSTR("invalid");
    v4 = 10;
    while (v4 <= a3)
    {
      v5 = v4 >= 0x186A1;
      v4 *= 10;
      if (v5)
        goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%tu"), v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6)
      return v6;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(">=%tu"), 1000000);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a3)
      return CFSTR("Zero");
    v6 = CFSTR("NonZero");
  }
  return v6;
}

+ (id)_eventWithName:(id)a3 result:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  getkSymptomDiagnosticKeyEventName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v17[0] = v7;
  getkSymptomDiagnosticKeyEventResult();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_eventWithName:(id)a3 result:(id)a4 count:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  getkSymptomDiagnosticKeyEventName();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v21[0] = v9;
  getkSymptomDiagnosticKeyEventResult();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v21[1] = v10;
  getkSymptomDiagnosticKeyEventCount();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  v21[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_countEventWithName:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isSuccess") & 1) != 0)
  {
    objc_msgSend(v7, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_eventWithName:result:count:", v6, CFSTR("Success"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_eventWithName:result:", v6, CFSTR("Failure"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_sThrottleLock_untilDates
{
  void *v2;
  id v3;
  void *v4;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&_sThrottleLock);
  v2 = (void *)_sThrottleLock_untilDates;
  if (!_sThrottleLock_untilDates)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_sThrottleLock_untilDates;
    _sThrottleLock_untilDates = (uint64_t)v3;

    v2 = (void *)_sThrottleLock_untilDates;
  }
  return v2;
}

+ (BOOL)_shouldThrottleReportForType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__95109;
  v20 = __Block_byref_object_dispose__95110;
  v21 = 0;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  PLRunWithUnfairLock();
  if (v17[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "compare:", v17[5]) == -1;

  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v14;
}

+ (void)_registerCompletedReportForType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5 success:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  v10 = v13;
  v11 = v9;
  v12 = v8;
  PLRunWithUnfairLock();

}

+ (id)_actionDictionaryWithLogArchive:(BOOL)a3 networkInfo:(BOOL)a4 crashAndSpinLogs:(BOOL)a5 diagnosticExtensions:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[3];
  id v42;
  _QWORD v43[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v43[4] = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v10 = (id *)getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr;
  v40 = getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr)
  {
    v11 = SymptomDiagnosticReporterLibrary();
    v10 = (id *)dlsym(v11, "kSymptomDiagnosticActionLogArchive");
    v38[3] = (uint64_t)v10;
    getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v37, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticActionLogArchive(void)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PLAutoBugCapture.m"), 39, CFSTR("%s"), dlerror(), v37);

    goto LABEL_18;
  }
  v12 = *v10;
  v41[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v13;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v14 = (id *)getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr;
  v40 = getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr)
  {
    v15 = SymptomDiagnosticReporterLibrary();
    v14 = (id *)dlsym(v15, "kSymptomDiagnosticActionGetNetworkInfo");
    v38[3] = (uint64_t)v14;
    getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v37, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticActionGetNetworkInfo(void)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("PLAutoBugCapture.m"), 41, CFSTR("%s"), dlerror(), v37);

    goto LABEL_18;
  }
  v16 = *v14;
  v41[1] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v17;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v18 = (id *)getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr;
  v40 = getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr)
  {
    v19 = SymptomDiagnosticReporterLibrary();
    v18 = (id *)dlsym(v19, "kSymptomDiagnosticActionCrashAndSpinLogs");
    v38[3] = (uint64_t)v18;
    getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v37, 8);
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticActionCrashAndSpinLogs(void)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PLAutoBugCapture.m"), 43, CFSTR("%s"), dlerror(), v37);

    goto LABEL_18;
  }
  v20 = *v18;
  v41[2] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v21;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v22 = (id *)getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr;
  v40 = getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr)
  {
    v23 = SymptomDiagnosticReporterLibrary();
    v22 = (id *)dlsym(v23, "kSymptomDiagnosticActionDiagnosticExtensions");
    v38[3] = (uint64_t)v22;
    getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v37, 8);
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticActionDiagnosticExtensions(void)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("PLAutoBugCapture.m"), 45, CFSTR("%s"), dlerror(), v37);

LABEL_18:
    __break(1u);
  }
  v42 = *v22;
  v24 = (void *)MEMORY[0x1E0CB37E8];
  v25 = v42;
  objc_msgSend(v24, "numberWithBool:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v41, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (void)_captureSnapshotWithType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5 subtypeContextModifier:(id)a6 triggerThresholdValues:(id)a7 events:(id)a8 actions:(id)a9 completion:(id)a10
{
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void (**v47)(id, id);
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  void (**v52)(id, id);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  _BYTE buf[24];
  void *v61;
  uint64_t *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v45 = a6;
  v43 = a7;
  v44 = a8;
  v46 = a9;
  v47 = (void (**)(id, id))a10;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subType"));

    if (v19)
      goto LABEL_4;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  if (!v18)
    goto LABEL_21;
LABEL_3:
  if (v19)
    goto LABEL_4;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLAutoBugCapture.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtypeContextBase"));

LABEL_4:
  if (objc_msgSend(a1, "_shouldThrottleReportForType:subType:subtypeContextBase:", v17, v18, v19))
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v61 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Auto bug capture for %{public}@/%{public}@/%{public}@ throttled because a similar report was made recently", buf, 0x20u);
    }

    v21 = (void *)MEMORY[0x1E0D732B8];
    v22 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v23 = (int *)getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr;
    v61 = (void *)getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr;
    if (!getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr)
    {
      v24 = SymptomDiagnosticReporterLibrary();
      v23 = (int *)dlsym(v24, "kSymptomDiagnosticErrorRequestThrottled");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
      getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr = (uint64_t)v23;
    }
    _Block_object_dispose(buf, 8);
    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const int getkSymptomDiagnosticErrorRequestThrottled(void)");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PLAutoBugCapture.m"), 48, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v25 = *v23;
    v58 = *MEMORY[0x1E0CB2938];
    v59 = CFSTR("Throttled by client");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PLAutoBugCaptureErrorDomain"), v25, v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "failureWithError:", v27);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v47[2](v47, v28);
  }
  else
  {
    if (v45)
    {
      objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(":%@"), v45);
      v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = v19;
    }
    v26 = v29;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "processName");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    v33 = CFSTR("unknown");
    if (v31)
      v33 = (__CFString *)v31;
    v27 = v33;

    v54 = 0;
    v55 = &v54;
    v56 = 0x2050000000;
    v34 = (void *)getSDRDiagnosticReporterClass_softClass;
    v57 = getSDRDiagnosticReporterClass_softClass;
    v35 = MEMORY[0x1E0C809B0];
    if (!getSDRDiagnosticReporterClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSDRDiagnosticReporterClass_block_invoke;
      v61 = &unk_1E3677580;
      v62 = &v54;
      __getSDRDiagnosticReporterClass_block_invoke((uint64_t)buf);
      v34 = (void *)v55[3];
    }
    v36 = objc_retainAutorelease(v34);
    _Block_object_dispose(&v54, 8);
    v28 = objc_alloc_init(v36);
    objc_msgSend(v28, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("PhotosBackend"), v17, v18, v26, v27, v43);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v35;
    v48[1] = 3221225472;
    v48[2] = __144__PLAutoBugCapture__captureSnapshotWithType_subType_subtypeContextBase_subtypeContextModifier_triggerThresholdValues_events_actions_completion___block_invoke;
    v48[3] = &unk_1E3675D78;
    v53 = a1;
    v49 = v17;
    v50 = v18;
    v51 = v19;
    v52 = v47;
    objc_msgSend(v28, "snapshotWithSignature:delay:events:payload:actions:reply:", v37, v44, 0, v46, v48, 0.0);

  }
}

+ (void)captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult:(id)a3 searchIndexingEvents:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isSuccess"))
  {
    objc_msgSend(v8, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    v13 = (id)objc_msgSend(a1, "_bucketCountDescriptionForCount:policy:", v12, 0);
    v14 = 0;
  }
  else
  {
    v14 = CFSTR("Failed");
  }
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_95057);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v21), "autoBugCaptureEventDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

  objc_msgSend(a1, "_countEventWithName:result:", CFSTR("SpotlightAssetCountQuery"), v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v23);

  objc_msgSend(a1, "_actionDictionaryWithLogArchive:networkInfo:crashAndSpinLogs:diagnosticExtensions:", 1, 0, 1, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_captureSnapshotWithType:subType:subtypeContextBase:subtypeContextModifier:triggerThresholdValues:events:actions:completion:", CFSTR("Search"), CFSTR("SpotlightClientStateMissing"), CFSTR("SpotlightAssetCount"), v14, 0, v16, v24, v10, (_QWORD)v25);

}

+ (void)_captureSpotlightClientHandlerReindexItemsWithCountDescription:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  __CFString *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  if (a4)
  {
    objc_msgSend(CFSTR("SpotlightReindex"), "stringByAppendingFormat:", CFSTR(":%@"), a4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("SpotlightReindex");
  }
  objc_msgSend(a1, "_actionDictionaryWithLogArchive:networkInfo:crashAndSpinLogs:diagnosticExtensions:", 1, 0, 1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_captureSnapshotWithType:subType:subtypeContextBase:subtypeContextModifier:triggerThresholdValues:events:actions:completion:", CFSTR("Search"), v9, CFSTR("ItemCount"), v11, 0, 0, v10, v8);

}

+ (void)captureSpotlightClientHandlerReindexAllItemsWithReason:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "_captureSpotlightClientHandlerReindexItemsWithCountDescription:reason:completion:", CFSTR("All"), a3, a4);
}

+ (void)captureSpotlightClientHandlerReindexItemsWithIdentifiers:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a1, "_bucketCountDescriptionForCount:policy:", objc_msgSend(a3, "count"), 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_captureSpotlightClientHandlerReindexItemsWithCountDescription:reason:completion:", v10, v9, v8);

}

uint64_t __124__PLAutoBugCapture_captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult_searchIndexingEvents_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __144__PLAutoBugCapture__captureSnapshotWithType_subType_subtypeContextBase_subtypeContextModifier_triggerThresholdValues_events_actions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE buf[24];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v4 = (_QWORD *)getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  v24 = getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySuccessSymbolLoc_ptr)
  {
    v5 = SymptomDiagnosticReporterLibrary();
    v4 = dlsym(v5, "kSymptomDiagnosticReplySuccess");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v4;
    getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(buf, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticReplySuccess(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PLAutoBugCapture.m"), 25, CFSTR("%s"), dlerror());

    goto LABEL_17;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 64), "_registerCompletedReportForType:subType:subtypeContextBase:success:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7);
  if ((v7 & 1) != 0)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Auto bug capture finished sending snapshot, received response: %@", buf, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "successWithResult:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v12 = (_QWORD *)getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  v24 = getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonSymbolLoc_ptr)
  {
    v13 = SymptomDiagnosticReporterLibrary();
    v12 = dlsym(v13, "kSymptomDiagnosticReplyReason");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
    getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(buf, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkSymptomDiagnosticReplyReason(void)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PLAutoBugCapture.m"), 27, CFSTR("%s"), dlerror());

LABEL_17:
    __break(1u);
  }
  objc_msgSend(v3, "valueForKey:", *v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  PLBackendGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Auto bug capture failed with code: %lu, %{public}@", buf, 0x16u);
  }

  v17 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PLAutoBugCaptureErrorDomain"), v15, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "failureWithError:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v18 = (void *)v11;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __87__PLAutoBugCapture__registerCompletedReportForType_subType_subtypeContextBase_success___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", dbl_199B9FE20[*(_BYTE *)(a1 + 64) == 0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_sThrottleLock_untilDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pl_mutableDictionaryCreateAndInsertIfNeededForKey:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pl_mutableDictionaryCreateAndInsertIfNeededForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));

}

void __76__PLAutoBugCapture__shouldThrottleReportForType_subType_subtypeContextBase___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 64), "_sThrottleLock_untilDates");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
