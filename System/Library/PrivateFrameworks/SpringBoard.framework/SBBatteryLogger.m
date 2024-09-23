@implementation SBBatteryLogger

+ (void)saveLowBatteryLogWithCapacity:(int)a3 voltage:(int)a4 completion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  _SBBatteryLogContext *v10;
  id v11;
  id v12;
  _SBBatteryLogContext *v13;
  void *v14;
  uint8_t buf[16];

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v7 = a5;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Begin saving battery level log...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    BSPthreadCurrentEffectiveQualityOfService();
  v10 = objc_alloc_init(_SBBatteryLogContext);
  -[_SBBatteryLogContext setCapacity:](v10, "setCapacity:", v6);
  -[_SBBatteryLogContext setVoltage:](v10, "setVoltage:", v5);
  v14 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v10;
  BSDispatchMain();

}

void __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setUsageTimeInSeconds:", _SBWorkspaceGetBatteryUsageTimeInSeconds());
  objc_msgSend(*(id *)(a1 + 32), "setStandbyTimeInSeconds:", _SBWorkspaceGetBatteryStandbyTimeInSeconds());
  objc_msgSend(*(id *)(a1 + 32), "setHasChargedPartially:", _SBWorkspaceHaveChargedPartially());
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "sceneIfExists");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "settings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isForeground");

        if (v11)
        {
          objc_msgSend(v8, "application");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "setForegroundApplications:", v2);
  dispatch_get_global_queue(*(unsigned int *)(a1 + 56), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2;
  block[3] = &unk_1E8E9F7B8;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  dispatch_async(v14, block);

}

uint64_t __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2(uint64_t a1)
{
  id v1;
  IOReturn v2;
  const void *v3;
  _SBPowerAssertionContext *v4;
  const __CFUUID *v5;
  CFStringRef v6;
  void *v7;
  CFTypeID v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  const void *v37;
  uint64_t Subscription;
  const void *v39;
  const void *Samples;
  NSObject *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFDictionary *v50;
  io_service_t MatchingService;
  io_object_t v52;
  CFTypeRef CFProperty;
  const void *v54;
  CFTypeID v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  double v65;
  uint64_t result;
  const __CFAllocator *alloc;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *cf;
  id v74;
  void *v75;
  size_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  id v83[5];
  CFTypeRef v84;
  CFTypeRef v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _OWORD AssertionsByPID[16];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v74 = *(id *)(a1 + 32);
  v1 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = ___backgroundQueue_collectAndLogFromContext_block_invoke;
  v81[3] = &unk_1E8EA7180;
  v71 = v1;
  v82 = v71;
  *(_QWORD *)&AssertionsByPID[0] = 0;
  v2 = IOPMCopyAssertionsByProcess((CFDictionaryRef *)AssertionsByPID);
  v3 = *(const void **)&AssertionsByPID[0];
  if (!v2 && *(_QWORD *)&AssertionsByPID[0])
  {
    v4 = objc_alloc_init(_SBPowerAssertionContext);
    -[_SBPowerAssertionContext setCollectionBlock:](v4, "setCollectionBlock:", v81);
    CFDictionaryApplyFunction(*(CFDictionaryRef *)&AssertionsByPID[0], (CFDictionaryApplierFunction)_arrayCallback_collectOneTask, v4);

    v3 = *(const void **)&AssertionsByPID[0];
  }
  if (v3)
    CFRelease(v3);
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v6 = CFUUIDCreateString(alloc, v5);
  CFRelease(v5);
  v7 = (void *)MGCopyAnswer();
  cf = v7;
  if (v7)
  {
    v8 = CFGetTypeID(v7);
    if (v8 == CFStringGetTypeID())
      goto LABEL_10;
    CFRelease(cf);
  }
  cf = 0;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (_backgroundQueue_systemVersionDescription___once != -1)
    dispatch_once(&_backgroundQueue_systemVersionDescription___once, &__block_literal_global_79);
  v72 = (id)_backgroundQueue_systemVersionDescription___description;
  v9 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formatDateAsLongYMDHMSZPosixLocaleWithDate:", v69);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Incident Identifier: %@\nCrashReporter Key:   %@\nDate:                %@\nOS Version:          %@\n\n"), v6, cf, v11, v72);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v6);
  if (objc_msgSend(v71, "length"))
  {
    objc_msgSend(v12, "appendString:", v71);
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v74, "foregroundApplications");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v70, "count"))
  {
    objc_msgSend(v12, "appendString:", CFSTR("Foreground Applications: "));
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v13 = v70;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v78 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v17);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "appendString:", CFSTR("\n"));
  }
  BKSDisplayBrightnessGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Screen Brightness: %f\n"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v19);

  _SBWorkspaceCopyRecentSleepsAndWakes();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_35;
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("Recent Sleeps and Wakes\n"));
  v21 = objc_msgSend(v20, "count");
  if (v21)
  {
    for (j = 0; j != v21; ++j)
    {
      objc_msgSend(v20, "objectAtIndex:", j);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", CFSTR("type"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", CFSTR("time"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", CFSTR("reason"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v75, "appendString:", v24);
      objc_msgSend(v75, "appendString:", CFSTR(" "));
      if (v25)
        objc_msgSend(v75, "appendString:", v25);
      objc_msgSend(v75, "appendString:", CFSTR("\n"));
      if (v26)
      {
        objc_msgSend(v75, "appendString:", v26);
        objc_msgSend(v75, "appendString:", CFSTR("\n"));
      }

    }
  }

  if (v75)
  {
    objc_msgSend(v12, "appendString:");
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
  }
  else
  {
LABEL_35:
    v75 = 0;
  }
  memset(AssertionsByPID, 0, sizeof(AssertionsByPID));
  v76 = 256;
  sysctlbyname("hw.model", AssertionsByPID, &v76, 0, 0);
  v27 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v74, "usageTimeInSeconds");
  BSFormattedTimeFromSeconds();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "usageTimeInSeconds");
  v30 = v29;
  objc_msgSend(v74, "standbyTimeInSeconds");
  BSFormattedTimeFromSeconds();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "standbyTimeInSeconds");
  v33 = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v74, "hasChargedPartially"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("Hardware Model: %s\nAwake Time: %@ (%d)\nStandby Time: %@ (%d)\nPartial Charge: %@\nCapacity: %d\nVoltage: %d mV\n"), AssertionsByPID, v28, (int)v30, v31, (int)v33, v35, objc_msgSend(v74, "capacity"), objc_msgSend(v74, "voltage"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:", v36);

  v86 = 0;
  v87 = (uint64_t)&v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__22;
  v90 = __Block_byref_object_dispose__22;
  v91 = (id)objc_opt_new();
  v84 = 0;
  v85 = 0;
  v37 = (const void *)IOReportCopyChannelsInCategories();
  if (v37)
  {
    Subscription = IOReportCreateSubscription();
    v39 = (const void *)Subscription;
    if (Subscription && v84)
    {
      Samples = (const void *)IOReportCreateSamples();
      v83[0] = (id)MEMORY[0x1E0C809B0];
      v83[1] = (id)3221225472;
      v83[2] = ___backgroundQueue_getSOCStats_block_invoke;
      v83[3] = &unk_1E8EA71F0;
      v83[4] = &v86;
      IOReportIterate();
      if (Samples)
        CFRelease(Samples);
    }
    else if (!Subscription)
    {
      goto LABEL_46;
    }
    CFRelease(v39);
  }
  else
  {
    SBLogCommon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_2((uint64_t *)&v85, v41, v42);

  }
LABEL_46:
  if (v85)
    CFRelease(v85);
  if (v84)
    CFRelease(v84);
  if (v37)
    CFRelease(v37);
  v43 = *(id *)(v87 + 40);
  _Block_object_dispose(&v86, 8);

  if (objc_msgSend(v43, "count"))
  {
    objc_msgSend(v43, "objectForKey:", CFSTR("SOCHOT0_ACT"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", CFSTR("SOCHOT0_Transitions"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Voltage Droop Time: %@\n"), v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v46);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Voltage Droop Transitions: %@\n"), v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v47);

  }
  if (objc_msgSend(MEMORY[0x1E0D09930], "isCPMSSupported"))
  {
    v48 = (void *)objc_msgSend(MEMORY[0x1E0D09948], "copyCPMSControlStateSnapshots");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CPMS has keys:\n %@ \n"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendString:", v49);

  }
  else
  {
    v50 = IOServiceMatching("ApplePPM");
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v50);
    v52 = MatchingService;
    if (MatchingService)
    {
      CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("PPMDebug"), alloc, 0);
      v54 = CFProperty;
      if (CFProperty)
      {
        v55 = CFGetTypeID(CFProperty);
        if (v55 == CFArrayGetTypeID())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PPMDebug has keys:\n %@ \n"), v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v56);

        }
        CFRelease(v54);
      }
    }
    IOObjectRelease(v52);
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v72, CFSTR("os_version"), CFSTR("120"), CFSTR("bug_type"), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v57, 0, v83);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v83[0];
  v60 = (void *)objc_msgSend(v58, "mutableCopy");

  objc_msgSend(v60, "appendBytes:length:", "\n", 1);
  objc_msgSend(v12, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "appendData:", v61);

  v86 = MEMORY[0x1E0C809B0];
  v87 = 3221225472;
  v88 = (uint64_t)___backgroundQueue_collectAndLogFromContext_block_invoke_2;
  v89 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E8EA71A8;
  v90 = (void (*)(uint64_t))v60;
  v62 = v60;
  LODWORD(v60) = OSAWriteLogForSubmission();

  SBLogCommon();
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if ((_DWORD)v60)
  {
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
      LODWORD(AssertionsByPID[0]) = 134217984;
      *(double *)((char *)AssertionsByPID + 4) = -v65;
      _os_log_impl(&dword_1D0540000, v64, OS_LOG_TYPE_DEFAULT, "Finished saving battery log after %.2fs", (uint8_t *)AssertionsByPID, 0xCu);
    }
  }
  else if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_1(a1, v64);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  double v3;
  uint64_t v4;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  v5 = 134217984;
  v6 = -v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Failed to save battery log after %.2fs", (uint8_t *)&v5);
}

void __68__SBBatteryLogger_saveLowBatteryLogWithCapacity_voltage_completion___block_invoke_2_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "Error when trying to get voltage droop stats: %{public}@", (uint8_t *)&v4);
}

@end
