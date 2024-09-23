@implementation WBSAutomaticBugCaptureManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  return (id)sharedManager_sharedManager;
}

void __46__WBSAutomaticBugCaptureManager_sharedManager__block_invoke()
{
  WBSAutomaticBugCaptureManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSAutomaticBugCaptureManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (WBSAutomaticBugCaptureManager)init
{
  SDRDiagnosticReporter *v3;
  SDRDiagnosticReporter *reporter;
  WBSAutomaticBugCaptureManager *v5;
  objc_super v7;

  if (isABCAvailable_onceToken != -1)
    dispatch_once(&isABCAvailable_onceToken, &__block_literal_global_29);
  if (isABCAvailable_isABCAvailable
    && (v7.receiver = self,
        v7.super_class = (Class)WBSAutomaticBugCaptureManager,
        (self = -[WBSAutomaticBugCaptureManager init](&v7, sel_init)) != 0))
  {
    v3 = (SDRDiagnosticReporter *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFF28]), "initWithQueue:", 0);
    reporter = self->_reporter;
    self->_reporter = v3;

    self = self;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)captureLoadingStallWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5
{
  -[WBSAutomaticBugCaptureManager captureLoadingStallWithDomain:detectedProcess:context:duration:](self, "captureLoadingStallWithDomain:detectedProcess:context:duration:", a3, a4, a5, 60.0);
}

- (void)captureLoadingStallWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5 duration:(double)a6
{
  -[WBSAutomaticBugCaptureManager _startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:](self, "_startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:", a3, a4, *MEMORY[0x1E0DB0110], CFSTR("Loading Stall"), a5, a6);
}

- (void)captureProcessTerminationDueToResourceLimitsWithDomain:(id)a3 detectedProcess:(id)a4 resourceType:(id)a5
{
  -[WBSAutomaticBugCaptureManager _startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:](self, "_startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:", a3, a4, *MEMORY[0x1E0DB0110], CFSTR("Resource Limit Termination"), a5, 0.0);
}

- (void)captureDeferredNavigationWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5
{
  -[WBSAutomaticBugCaptureManager _startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:](self, "_startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:", a3, a4, *MEMORY[0x1E0DB0110], CFSTR("Deferred Navigation"), a5, 60.0);
}

- (void)capturePerformanceTimeoutWithDomain:(id)a3 detectedProcess:(id)a4 context:(id)a5
{
  -[WBSAutomaticBugCaptureManager _startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:](self, "_startLoggingSessionForDomain:detectedProcess:type:subType:context:duration:", a3, a4, *MEMORY[0x1E0DB0120], CFSTR("Timeout"), a5, 60.0);
}

- (void)_startLoggingSessionForDomain:(id)a3 detectedProcess:(id)a4 type:(id)a5 subType:(id)a6 context:(id)a7 duration:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  dispatch_get_global_queue(9, 0);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke;
  block[3] = &unk_1E4B29D68;
  block[4] = self;
  v26 = v14;
  v27 = v16;
  v28 = v17;
  v29 = v15;
  v30 = v18;
  v31 = a8;
  v20 = v18;
  v21 = v15;
  v22 = v17;
  v23 = v16;
  v24 = v14;
  dispatch_async(v19, block);

}

void __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke(_QWORD *a1)
{
  void *v2;
  double *v3;
  void *v4;
  double v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1[4] + 8), "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", a1[5], a1[6], a1[7], a1[8], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (double *)(a1 + 9);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[9], *MEMORY[0x1E0DB00F0]);
  v4 = *(void **)(a1[4] + 8);
  v5 = v3[1];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_2;
  v7[3] = &unk_1E4B29D40;
  v8 = *(id *)v3;
  if ((objc_msgSend(v4, "snapshotWithSignature:duration:event:payload:reply:", v2, 0, 0, v7, v5) & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAutoBugCapture();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_cold_1((uint64_t *)v3, v6);
  }

}

void __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXAutoBugCapture();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543619;
    v7 = v5;
    v8 = 2113;
    v9 = v3;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Got a response from -[SDRDiagnosticReporter snapshotWithSignature:...] with context '%{public}@': %{private}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
}

void __109__WBSAutomaticBugCaptureManager__startLoggingSessionForDomain_detectedProcess_type_subType_context_duration___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Calling -[SDRDiagnosticReporter snapshotWithSignature:...] with context '%{public}@' failed", (uint8_t *)&v3, 0xCu);
}

@end
