@implementation SignpostReporterAllowlistedStringSet

void __SignpostReporterAllowlistedStringSet_block_invoke()
{
  void *v0;
  void *v1;
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
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;

  v0 = (void *)MEMORY[0x1E0C99E20];
  SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterAllowlistedStringSet_allowlistSet = v2;

  v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterMacOsPerfLoggingOperationNameAllowlist();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  if (SignpostReporterMacOsBundleIdAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterMacOsBundleIdAllowlist_onceToken, &__block_literal_global_315);
  objc_msgSend(v6, "addObjectsFromArray:", SignpostReporterMacOsBundleIdAllowlist_allowlistedBundleIdArray);
  v7 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  if (SignpostReporterMacOsSpotlightAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterMacOsSpotlightAllowlist_onceToken, &__block_literal_global_1864);
  objc_msgSend(v7, "addObjectsFromArray:", SignpostReporterMacOsSpotlightAllowlist_spotlightStringArray);
  v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformAppleAccountAllowlist();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformAuthKitAllowlist();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformSiriAudioStringPasslist();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformSharedAllowlist();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformIntelligencePlatformAllowlist();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformSpeechProfileAllowlist();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v29);

  v30 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet;
  SignpostReporterCrossPlatformWidgetAllowlist();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v31);

  SRStringFilter_debugLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    __SignpostReporterAllowlistedStringSet_block_invoke_cold_1();

}

void __SignpostReporterAllowlistedStringSet_block_invoke_9()
{
  void *v0;
  id v1;
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
  void *v13;
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
  NSObject *v50;

  v0 = (void *)MEMORY[0x1E0C99E20];
  if (SignpostReporteriPhoneOSSpringBoardAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSSpringBoardAllowlist_onceToken, &__block_literal_global_1928);
  v1 = (id)SignpostReporteriPhoneOSSpringBoardAllowlist_sbStringArray;
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterAllowlistedStringSet_allowlistSet_7 = v2;

  v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSCameraAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSCameraAllowlist_onceToken, &__block_literal_global_1995);
  objc_msgSend(v4, "addObjectsFromArray:", SignpostReporteriPhoneOSCameraAllowlist_cameraStringArray);
  v5 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSUIKitAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSUIKitAllowlist_onceToken, &__block_literal_global_2054);
  objc_msgSend(v5, "addObjectsFromArray:", SignpostReporteriPhoneOSUIKitAllowlist_uiKitStringArray);
  v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSBundleIdAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSBundleIdAllowlist_onceToken, &__block_literal_global_2111);
  objc_msgSend(v6, "addObjectsFromArray:", SignpostReporteriPhoneOSBundleIdAllowlist_bundleIdArray);
  v7 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSCalendarAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSCalendarAllowlist_onceToken, &__block_literal_global_2542);
  objc_msgSend(v7, "addObjectsFromArray:", SignpostReporteriPhoneOSCalendarAllowlist_calendarStringArray);
  v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSRemindersAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSRemindersAllowlist_onceToken, &__block_literal_global_2557);
  objc_msgSend(v8, "addObjectsFromArray:", SignpostReporteriPhoneOSRemindersAllowlist_remindersStringArray);
  v9 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSMobileMailAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSMobileMailAllowlist_onceToken, &__block_literal_global_2568);
  objc_msgSend(v9, "addObjectsFromArray:", SignpostReporteriPhoneOSMobileMailAllowlist_mobileMailStringArray);
  v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSSplashBoardAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSSplashBoardAllowlist_onceToken, &__block_literal_global_2591);
  objc_msgSend(v10, "addObjectsFromArray:", SignpostReporteriPhoneOSSplashBoardAllowlist_splashBoardStringArray);
  v11 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  if (SignpostReporteriPhoneOSWakeReasonsAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriPhoneOSWakeReasonsAllowlist_onceToken, &__block_literal_global_2602);
  objc_msgSend(v11, "addObjectsFromArray:", SignpostReporteriPhoneOSWakeReasonsAllowlist_wakeReasonStringArray);
  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporteriOSSystemEnvironmentsAllowlist();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporteriOSPoirotAllowlist();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterEmbeddedOSHangTracerAllowlist();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterEmbeddedOSMusicWaitTimeAllowlist();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformAppleAccountAllowlist();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformAuthKitAllowlist();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v29);

  v30 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSiriAudioStringPasslist();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v31);

  v32 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObjectsFromArray:", v33);

  v34 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObjectsFromArray:", v35);

  v36 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v37);

  v38 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSharedAllowlist();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v39);

  v40 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObjectsFromArray:", v41);

  v42 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformIntelligencePlatformAllowlist();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObjectsFromArray:", v43);

  v44 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformSpeechProfileAllowlist();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObjectsFromArray:", v45);

  v46 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformWidgetAllowlist();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObjectsFromArray:", v47);

  v48 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_7;
  SignpostReporterCrossPlatformZelkovaAllowlist();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObjectsFromArray:", v49);

  SRStringFilter_debugLog();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    __SignpostReporterAllowlistedStringSet_block_invoke_9_cold_1();

}

void __SignpostReporterAllowlistedStringSet_block_invoke_13()
{
  void *v0;
  void *v1;
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
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;

  v0 = (void *)MEMORY[0x1E0C99E20];
  SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterAllowlistedStringSet_allowlistSet_11 = v2;

  v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformAppleAccountAllowlist();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformAuthKitAllowlist();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSiriAudioStringPasslist();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSharedAllowlist();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformWidgetAllowlist();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterEmbeddedOSHangTracerAllowlist();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterEmbeddedOSMusicWaitTimeAllowlist();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_11;
  SignpostReporterCrossPlatformSpeechProfileAllowlist();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v29);

  SRStringFilter_debugLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    __SignpostReporterAllowlistedStringSet_block_invoke_13_cold_1();

}

void __SignpostReporterAllowlistedStringSet_block_invoke_17()
{
  void *v0;
  void *v1;
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
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;

  v0 = (void *)MEMORY[0x1E0C99E20];
  SignpostReporterCrossPlatformLowDiskConditionAllowlist();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterAllowlistedStringSet_allowlistSet_15 = v2;

  v4 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformAppleAccountAllowlist();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  v6 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformAuthKitAllowlist();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  v10 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSiriAudioStringPasslist();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v11);

  v12 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v14 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);

  v16 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSharedAllowlist();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v17);

  v18 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSiriVocabularyStringPasslist();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v19);

  v20 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSpeechProfileAllowlist();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObjectsFromArray:", v21);

  v22 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformWidgetAllowlist();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  v24 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformZelkovaAllowlist();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v25);

  v26 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterEmbeddedOSHangTracerAllowlist();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v27);

  v28 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterEmbeddedOSMusicWaitTimeAllowlist();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObjectsFromArray:", v29);

  v30 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_15;
  SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v31);

  SRStringFilter_debugLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    __SignpostReporterAllowlistedStringSet_block_invoke_17_cold_1();

}

void __SignpostReporterAllowlistedStringSet_block_invoke_21()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_19;
  SignpostReporterAllowlistedStringSet_allowlistSet_19 = v0;

  SRStringFilter_debugLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __SignpostReporterAllowlistedStringSet_block_invoke_21_cold_1();

}

void __SignpostReporterAllowlistedStringSet_block_invoke_25()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SignpostReporterAllowlistedStringSet_allowlistSet_23;
  SignpostReporterAllowlistedStringSet_allowlistSet_23 = v0;

  SRStringFilter_debugLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __SignpostReporterAllowlistedStringSet_block_invoke_25_cold_1();

}

void __SignpostReporterAllowlistedStringSet_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements for macOS platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __SignpostReporterAllowlistedStringSet_block_invoke_9_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet_7, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements for iPhoneOS platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __SignpostReporterAllowlistedStringSet_block_invoke_13_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet_11, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements for tvOS platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __SignpostReporterAllowlistedStringSet_block_invoke_17_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet_15, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements for watchOS platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __SignpostReporterAllowlistedStringSet_block_invoke_21_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet_19, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements for bridgeOS platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __SignpostReporterAllowlistedStringSet_block_invoke_25_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet_23, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements for Unknown platform", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
