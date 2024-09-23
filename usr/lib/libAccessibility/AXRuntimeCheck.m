@implementation AXRuntimeCheck

void __AXRuntimeCheck_HasANE_block_invoke()
{
  if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  if (AppleNeuralEngineLibraryCore_frameworkLibrary)
    AXRuntimeCheck_HasANE__hasANE = objc_msgSend(get_ANEDeviceInfoClass(), "hasANE");
}

void __AXRuntimeCheck_isANEDeviceH13plus_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  unint64_t v4;

  if (!AppleNeuralEngineLibraryCore_frameworkLibrary)
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  if (AppleNeuralEngineLibraryCore_frameworkLibrary)
  {
    objc_msgSend(get_ANEDeviceInfoClass(), "aneSubType");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "uppercaseString");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("H"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    AXRuntimeCheck_isANEDeviceH13plus_isANEH13plus = v4 > 0xC;
  }
}

uint64_t __AXRuntimeCheck_SupportsMedina_block_invoke()
{
  uint64_t (*v0)(const __CFString *);
  uint64_t result;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(const __CFString *))getMGGetBoolAnswerSymbolLoc_ptr;
  v6 = getMGGetBoolAnswerSymbolLoc_ptr;
  if (!getMGGetBoolAnswerSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getMGGetBoolAnswerSymbolLoc_block_invoke;
    v2[3] = &unk_1E2939F70;
    v2[4] = &v3;
    __getMGGetBoolAnswerSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(const __CFString *))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    __AXRuntimeCheck_SupportsMedina_block_invoke_cold_1();
  result = v0(CFSTR("ExclaveCapability"));
  AXRuntimeCheck_SupportsMedina__supportsMedina = result;
  return result;
}

uint64_t __AXRuntimeCheck_SupportsMacAXV2_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsMacAXV2__supportsMacAXV2 = result;
  return result;
}

void __AXRuntimeCheck_VoiceOverSupportsNeuralVoices_block_invoke()
{
  BOOL v0;

  if (_os_feature_enabled_impl())
  {
    if (AXRuntimeCheck_HasANE_onceToken != -1)
      dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
    v0 = AXRuntimeCheck_HasANE__hasANE != 0;
  }
  else
  {
    v0 = 0;
  }
  AXRuntimeCheck_VoiceOverSupportsNeuralVoices__supportsMacAXV2 = v0;
}

uint64_t __AXRuntimeCheck_MauiSSE_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_MauiSSE__mauiSSE = result;
  return result;
}

uint64_t __AXRuntimeCheck_PerVoiceSettings_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_PerVoiceSettings__ffEnabled_PerVoiceSettings = result;
  return result;
}

uint64_t __AXRuntimeCheck_MauiSSEOnly_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_MauiSSEOnly__ffEnabled_MauiSSEOnly = result;
  return result;
}

uint64_t __AXRuntimeCheck_SiriSSEOnly_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SiriSSEOnly__ffEnabled_SiriSSEOnly = result;
  return result;
}

uint64_t __AXRuntimeCheck_SpeakUp_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SpeakUp__ffEnabled_SpeakUp = result;
  return result;
}

uint64_t __AXRuntimeCheck_MediaAnalysisSupport_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_MediaAnalysisSupport__supportsMediaAnalysisServices = result;
  return result;
}

void __AXRuntimeCheck_ScreenRecognitionSupport_block_invoke()
{
  BOOL v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "physicalMemory") < 0x77359400)
  {
    v0 = 0;
  }
  else
  {
    if (AXRuntimeCheck_HasANE_onceToken != -1)
      dispatch_once(&AXRuntimeCheck_HasANE_onceToken, &__block_literal_global_3);
    v0 = AXRuntimeCheck_HasANE__hasANE != 0;
  }
  AXRuntimeCheck_ScreenRecognitionSupport__supportsScreenRecognition = v0;

}

uint64_t __AXRuntimeCheck_SupportsIncreaseBrightnessFloor_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsIncreaseBrightnessFloor__supportsIncreaseBrightnessFloor = result;
  return result;
}

uint64_t __AXRuntimeCheck_SupportsDoseAnalysis_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsDoseAnalysis__supportsDoseAnalysis = result;
  return result;
}

uint64_t __AXRuntimeCheck_SupportsVoiceoverIndepedentVolume_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AXRuntimeCheck_SupportsVoiceoverIndepedentVolume__supportsVoiceoverIndepedentVolume = result;
  return result;
}

void __AXRuntimeCheck_SupportsMedina_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_MGGetBoolAnswer(CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXFeatureRuntimeSupport.m"), 37, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
