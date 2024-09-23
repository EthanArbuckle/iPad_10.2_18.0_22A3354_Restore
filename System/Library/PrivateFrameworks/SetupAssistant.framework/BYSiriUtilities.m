@implementation BYSiriUtilities

+ (void)requiresAcknowledgementForDataSharing:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a3;
  objc_msgSend(getVTPreferencesClass(), "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voiceTriggerEnabled");

  v23 = 0;
  v24 = (uint64_t)&v23;
  v25 = 0x2050000000;
  v6 = (void *)getAFPreferencesClass_softClass;
  v26 = (void *)getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = (uint64_t)__getAFPreferencesClass_block_invoke;
    v20 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v21 = (void (*)(uint64_t))&v23;
    __getAFPreferencesClass_block_invoke((uint64_t)&v17);
    v6 = *(void **)(v24 + 24);
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v7, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assistantIsEnabled");

  if (((v5 | v9) & 1) != 0)
  {
    v17 = 0;
    v18 = (uint64_t)&v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v10 = (void *)getAFSettingsConnectionClass_softClass;
    v31 = getAFSettingsConnectionClass_softClass;
    v11 = MEMORY[0x1E0C809B0];
    if (!getAFSettingsConnectionClass_softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = (uint64_t)__getAFSettingsConnectionClass_block_invoke;
      v26 = &unk_1E4E26900;
      v27 = &v28;
      __getAFSettingsConnectionClass_block_invoke((uint64_t)&v23);
      v10 = (void *)v29[3];
    }
    v12 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v28, 8);
    v22 = objc_alloc_init(v12);
    v13 = *(void **)(v18 + 40);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke;
    v14[3] = &unk_1E4E268D8;
    v16 = &v17;
    v15 = v3;
    objc_msgSend(v13, "getSiriDataSharingOptInStatusWithCompletion:", v14);

    _Block_object_dispose(&v17, 8);
  }
  else if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

void __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  if (v5)
  {
    _BYLoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke_cold_1((uint64_t)v5, v8);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, a3 == 0);

}

+ (BOOL)isVoiceTriggerEnabled
{
  void *v2;
  char v3;

  objc_msgSend(getVTPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v3;
}

+ (BOOL)deviceSupportsSystemAssistantExperience
{
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  v10 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr)
  {
    v3 = (void *)AssistantServicesLibrary();
    v2 = dlsym(v3, "AFDeviceSupportsSystemAssistantExperience");
    v8[3] = (uint64_t)v2;
    getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return ((uint64_t (*)(uint64_t))v2)(v4);
}

+ (BOOL)currentVoiceIsDefaultVoice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _Unwind_Exception *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v14 = 0;
  v15 = (uint64_t)&v14;
  v16 = 0x2020000000;
  v2 = get_AFPreferencesOutputVoiceSymbolLoc_ptr;
  v17 = get_AFPreferencesOutputVoiceSymbolLoc_ptr;
  if (!get_AFPreferencesOutputVoiceSymbolLoc_ptr)
  {
    v3 = (void *)AssistantServicesLibrary();
    v2 = dlsym(v3, "_AFPreferencesOutputVoice");
    *(_QWORD *)(v15 + 24) = v2;
    get_AFPreferencesOutputVoiceSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v14, 8);
  if (!v2)
  {
    v13 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  ((void (*)(void))v2)();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)getAFVoiceInfoClass_softClass;
  v22 = getAFVoiceInfoClass_softClass;
  if (!getAFVoiceInfoClass_softClass)
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = (uint64_t)__getAFVoiceInfoClass_block_invoke;
    v17 = &unk_1E4E26900;
    v18 = &v19;
    __getAFVoiceInfoClass_block_invoke((uint64_t)&v14);
    v5 = (void *)v20[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v4, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceInfoForSessionLanguageCode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  return v11;
}

+ (BOOL)isIntelligenceVoiceSelectionCompleted
{
  return CFPreferencesGetAppBooleanValue(CFSTR("SiriIntelligenceVoiceSelectionCompleted"), CFSTR("com.apple.purplebuddy.notbackedup"), 0) != 0;
}

+ (void)intelligenceVoiceSelectionDidComplete
{
  CFPreferencesSetAppValue(CFSTR("SiriIntelligenceVoiceSelectionCompleted"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.purplebuddy.notbackedup"));
}

void __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_ERROR, "Failed to get Siri data sharing opt-in status: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (uint64_t)deviceSupportsSystemAssistantExperience
{
  dlerror();
  abort_report_np();
  return __getVTPreferencesClass_block_invoke_cold_1();
}

@end
