@implementation RCUserDefaultLoadAllTestValues

void ___RCUserDefaultLoadAllTestValues_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  uint64_t v32;
  id v33;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestSlowMessageServiceSleepAmount"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestSlowMessageServiceSleepAmount"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "doubleValue");
    _RCTestSlowMessageServiceSleepAmount = v2;

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestSlowMessageExportSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestSlowMessageExportSeconds"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    _RCTestSlowMessageExportSeconds = v5;

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestAlwaysShowLockScreenPlugin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestAlwaysShowLockScreenPlugin"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestAlwaysShowLockScreenPlugin = objc_msgSend(v7, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestEditInTrimSheetAllowed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestEditInTrimSheetAllowed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestEditInTrimSheetAllowed = objc_msgSend(v9, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestResetSyncs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestResetSyncs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestResetSyncs = objc_msgSend(v11, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestResetSyncsAlwaysResetSync"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestResetSyncsAlwaysResetSync"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestResetSyncsAlwaysResetSync = objc_msgSend(v13, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestBeginPreviewDelay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestBeginPreviewDelay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    _RCTestBeginPreviewDelay = v16;

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestAudioTrimmingProgressWithDuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestAudioTrimmingProgressWithDuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    _RCTestAudioTrimmingProgressWithDuration = v19;

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestAutoSelectedRecordingIndex"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestAutoSelectedRecordingIndex"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestAutoSelectedRecordingIndex = objc_msgSend(v21, "integerValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestDebugAutolayout"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestDebugAutolayout"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestDebugAutolayout = objc_msgSend(v23, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestDebugAutolayout_Show"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestDebugAutolayout_Show"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestDebugAutolayout_Show = objc_msgSend(v25, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestDebugAutolayout_Logging"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestDebugAutolayout_Logging"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestDebugAutolayout_Logging = objc_msgSend(v27, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestRunningAutomatedUITests"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestRunningAutomatedUITests"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _RCTestRunningAutomatedUITests = objc_msgSend(v29, "BOOLValue");

  }
  objc_msgSend(v33, "objectForKey:", CFSTR("RCTestResetNavigationStateThresholdSeconds"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v33, "objectForKey:", CFSTR("RCTestResetNavigationStateThresholdSeconds"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    _RCTestResetNavigationStateThresholdSeconds = v32;

  }
  _RCTestDebugAutolayout_Show = (_RCTestDebugAutolayout_Show | _RCTestDebugAutolayout) != 0;
  _RCTestDebugAutolayout_Logging = (_RCTestDebugAutolayout_Logging | _RCTestDebugAutolayout) != 0;
  if (_RCTestRunningAutomatedUITests)
  {
    _RCTestEditInTrimSheetAllowed = 1;
    _RCTestAudioTrimmingProgressWithDuration = fmax(*(double *)&_RCTestAudioTrimmingProgressWithDuration, 5.0);
  }

}

@end
