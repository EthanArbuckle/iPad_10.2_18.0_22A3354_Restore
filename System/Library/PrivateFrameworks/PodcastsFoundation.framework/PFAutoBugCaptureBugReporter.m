@implementation PFAutoBugCaptureBugReporter

+ (id)sharedInstance
{
  if (sharedInstance_dispatchToken != -1)
    dispatch_once(&sharedInstance_dispatchToken, &__block_literal_global_9);
  return (id)sharedInstance_singleton;
}

void __45__PFAutoBugCaptureBugReporter_sharedInstance__block_invoke()
{
  PFAutoBugCaptureBugReporter *v0;
  void *v1;

  v0 = objc_alloc_init(PFAutoBugCaptureBugReporter);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;

}

- (PFAutoBugCaptureBugReporter)init
{
  PFAutoBugCaptureBugReporter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *reportQueue;
  NSObject *v5;
  _QWORD block[4];
  PFAutoBugCaptureBugReporter *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFAutoBugCaptureBugReporter;
  v2 = -[PFAutoBugCaptureBugReporter init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Podcasts.AutoBugCapture", 0);
    reportQueue = v2->_reportQueue;
    v2->_reportQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_reportQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PFAutoBugCaptureBugReporter_init__block_invoke;
    block[3] = &unk_1E54D0DE0;
    v8 = v2;
    dispatch_sync(v5, block);

  }
  return v2;
}

void __35__PFAutoBugCaptureBugReporter_init__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getSDRDiagnosticReporterClass_softClass;
  v11 = getSDRDiagnosticReporterClass_softClass;
  if (!getSDRDiagnosticReporterClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getSDRDiagnosticReporterClass_block_invoke;
    v7[3] = &unk_1E54D2070;
    v7[4] = &v8;
    __getSDRDiagnosticReporterClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  v4 = objc_alloc_init(v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

- (void)submitBugReport:(id)a3 userInfo:(id)a4 withMaximumSubmissionCadence:(double)a5
{
  id v8;
  id v9;
  NSObject *reportQueue;
  NSObject *v11;
  uint8_t v12[16];
  _QWORD block[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    reportQueue = self->_reportQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PFAutoBugCaptureBugReporter_submitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke;
    block[3] = &unk_1E54D1FB0;
    block[4] = self;
    v14 = v8;
    v16 = a5;
    v15 = v9;
    dispatch_async(reportQueue, block);

  }
  else
  {
    _MTLogCategoryMetrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
    }

  }
}

uint64_t __85__PFAutoBugCaptureBugReporter_submitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canSubmitNewReport:withMinimumElapsedTime:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_executeSubmitBugReport:userInfo:withMaximumSubmissionCadence:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
  return result;
}

- (BOOL)canSubmitNewReport:(id)a3 withMinimumElapsedTime:(double)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  v7 = (objc_msgSend(v6, "forceSubmissionAttempt") & 1) != 0
    || -[PFAutoBugCaptureBugReporter _timeSinceLastSimilarReport:hasExceededElapsedTimeThreshold:](self, "_timeSinceLastSimilarReport:hasExceededElapsedTimeThreshold:", v6, a4);

  return v7;
}

- (BOOL)_timeSinceLastSimilarReport:(id)a3 hasExceededElapsedTimeThreshold:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  -[PFAutoBugCaptureBugReporter _lastSubmissionTimeForReport:](self, "_lastSubmissionTimeForReport:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = v7 > a4;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_lastSubmissionTimeForReport:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_setLastSubmissionTime:(id)a3 forReport:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, v8);
}

- (void)_executeSubmitBugReport:(id)a3 userInfo:(id)a4 withMaximumSubmissionCadence:(double)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location[2];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (self->_reporter)
  {
    if (v8)
    {
      objc_initWeak(location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __93__PFAutoBugCaptureBugReporter__executeSubmitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke;
      v12[3] = &unk_1E54D1FD8;
      objc_copyWeak(&v14, location);
      v13 = v7;
      ((void (**)(_QWORD, _QWORD *))v9)[2](v9, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(location);
    }
    else
    {
      v11 = (void *)objc_opt_new();
      -[PFAutoBugCaptureBugReporter _submitBugReport:withUserInfo:](self, "_submitBugReport:withUserInfo:", v7, v11);

    }
  }
  else
  {
    _MTLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_DEFAULT, "Unable to report bug automatically. Unable to load ABC framework.", (uint8_t *)location, 2u);
    }

  }
}

void __93__PFAutoBugCaptureBugReporter__executeSubmitBugReport_userInfo_withMaximumSubmissionCadence___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_scheduleSubmissionOfBugReport:withUserInfo:", *(_QWORD *)(a1 + 32), v4);

}

- (void)_scheduleSubmissionOfBugReport:(id)a3 withUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *reportQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  reportQueue = self->_reportQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PFAutoBugCaptureBugReporter__scheduleSubmissionOfBugReport_withUserInfo___block_invoke;
  block[3] = &unk_1E54D2000;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(reportQueue, block);

}

uint64_t __75__PFAutoBugCaptureBugReporter__scheduleSubmissionOfBugReport_withUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitBugReport:withUserInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_submitBugReport:(id)a3 withUserInfo:(id)a4
{
  id v6;
  id v7;
  SDRDiagnosticReporter *reporter;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  reporter = self->_reporter;
  objc_msgSend(v6, "domainString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorKindString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAutoBugCaptureBugReporter _processName](self, "_processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDRDiagnosticReporter signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:](reporter, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", v9, v10, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v13, "addEntriesFromDictionary:", v7);
  _MTLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = 138543362;
    v16 = v13;
    _os_log_impl(&dword_1A904E000, v14, OS_LOG_TYPE_INFO, "Automatic bug identified, signature: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  -[PFAutoBugCaptureBugReporter _reportSignature:forReport:](self, "_reportSignature:forReport:", v13, v6);
}

- (void)_reportSignature:(id)a3 forReport:(id)a4
{
  id v6;
  SDRDiagnosticReporter *reporter;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  reporter = self->_reporter;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PFAutoBugCaptureBugReporter__reportSignature_forReport___block_invoke;
  v9[3] = &unk_1E54D2028;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[SDRDiagnosticReporter snapshotWithSignature:duration:event:payload:reply:](reporter, "snapshotWithSignature:duration:event:payload:reply:", a3, 0, 0, v9, 300.0);

}

void __58__PFAutoBugCaptureBugReporter__reportSignature_forReport___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getkSymptomDiagnosticReplySuccess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  getkSymptomDiagnosticReplySuccess();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setLastSubmissionTime:forReport:", v10, *(_QWORD *)(a1 + 40));

    getkSymptomDiagnosticReplySuccess();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    _MTLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_INFO, "Bug report accepted, session identifier: %{public}@", (uint8_t *)&v14, 0xCu);
    }

  }
  else
  {
LABEL_6:
    _MTLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543362;
      v15 = v3;
      _os_log_impl(&dword_1A904E000, v12, OS_LOG_TYPE_ERROR, "Bug report was rejected. Response: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (id)_processName
{
  void *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3 || -[__CFString isEqualToString:](v3, "isEqualToString:", &stru_1E5500770))
  {

    v3 = CFSTR("com.apple.podcasts");
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportQueue, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
}

@end
