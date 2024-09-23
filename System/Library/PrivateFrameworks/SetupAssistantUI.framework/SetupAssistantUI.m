void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_214879470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCAMediaTimingFunctionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCAMediaTimingFunctionClass_softClass;
  v7 = getCAMediaTimingFunctionClass_softClass;
  if (!getCAMediaTimingFunctionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCAMediaTimingFunctionClass_block_invoke;
    v3[3] = &unk_24D234208;
    v3[4] = &v4;
    __getCAMediaTimingFunctionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21487952C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getkCAFillModeBackwards()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkCAFillModeBackwardsSymbolLoc_ptr;
  v7 = getkCAFillModeBackwardsSymbolLoc_ptr;
  if (!getkCAFillModeBackwardsSymbolLoc_ptr)
  {
    v1 = (void *)QuartzCoreLibrary();
    v0 = (id *)dlsym(v1, "kCAFillModeBackwards");
    v5[3] = (uint64_t)v0;
    getkCAFillModeBackwardsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)getkCAFillModeBackwards_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

Class __getCASpringAnimationClass_block_invoke(uint64_t a1)
{
  Class result;

  QuartzCoreLibrary();
  result = objc_getClass("CASpringAnimation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCASpringAnimationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCASpringAnimationClass_block_invoke_cold_1();
    return (Class)QuartzCoreLibrary();
  }
  return result;
}

uint64_t QuartzCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!QuartzCoreLibraryCore_frameworkLibrary)
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = QuartzCoreLibraryCore_frameworkLibrary;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getCAMediaTimingFunctionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  QuartzCoreLibrary();
  result = objc_getClass("CAMediaTimingFunction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCAMediaTimingFunctionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCAMediaTimingFunctionClass_block_invoke_cold_1();
    return (Class)__getCABasicAnimationClass_block_invoke(v3);
  }
  return result;
}

Class __getCABasicAnimationClass_block_invoke(uint64_t a1)
{
  Class result;
  BFFFinishSetupFlowItemDispositionProvider *v3;
  SEL v4;

  QuartzCoreLibrary();
  result = objc_getClass("CABasicAnimation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCABasicAnimationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (BFFFinishSetupFlowItemDispositionProvider *)__getCABasicAnimationClass_block_invoke_cold_1();
    return (Class)-[BFFFinishSetupFlowItemDispositionProvider dispositions](v3, v4);
  }
  return result;
}

id getPKSetupAssistantContextClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPKSetupAssistantContextClass_softClass;
  v7 = getPKSetupAssistantContextClass_softClass;
  if (!getPKSetupAssistantContextClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPKSetupAssistantContextClass_block_invoke;
    v3[3] = &unk_24D234208;
    v3[4] = &v4;
    __getPKSetupAssistantContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21487A9B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPKPaymentSetupAssistantControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPKPaymentSetupAssistantControllerClass_softClass;
  v7 = getPKPaymentSetupAssistantControllerClass_softClass;
  if (!getPKPaymentSetupAssistantControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPKPaymentSetupAssistantControllerClass_block_invoke;
    v3[3] = &unk_24D234208;
    v3[4] = &v4;
    __getPKPaymentSetupAssistantControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21487AA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPKSetupAssistantContextClass_block_invoke(uint64_t a1)
{
  PassKitUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PKSetupAssistantContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKSetupAssistantContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKSetupAssistantContextClass_block_invoke_cold_1();
    PassKitUILibrary();
  }
}

void PassKitUILibrary()
{
  void *v0;

  if (!PassKitUILibraryCore_frameworkLibrary)
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

BFFPaneHeaderView *__getPKPaymentSetupAssistantControllerClass_block_invoke(uint64_t a1)
{
  BFFPaneHeaderView *result;
  BFFPaneHeaderView *v3;
  SEL v4;
  CGRect v5;

  PassKitUILibrary();
  result = (BFFPaneHeaderView *)objc_getClass("PKPaymentSetupAssistantController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentSetupAssistantControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (BFFPaneHeaderView *)__getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1();
    return -[BFFPaneHeaderView initWithFrame:](v3, v4, v5);
  }
  return result;
}

double BFFRoundToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&BFFRoundToPixel_scale;
  if (*(double *)&BFFRoundToPixel_scale == -1.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", *(double *)&BFFRoundToPixel_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    BFFRoundToPixel_scale = v4;

    v2 = *(double *)&BFFRoundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

double BFFRoundToPixel_0(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&BFFRoundToPixel_scale_0;
  if (*(double *)&BFFRoundToPixel_scale_0 == -1.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", *(double *)&BFFRoundToPixel_scale_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    BFFRoundToPixel_scale_0 = v4;

    v2 = *(double *)&BFFRoundToPixel_scale_0;
  }
  return round(v2 * a1) / v2;
}

double BFFRoundRectToPixel(double a1, double a2)
{
  double v3;

  v3 = BFFRoundToPixel_0(a1);
  BFFRoundToPixel_0(a2);
  return v3;
}

id getBKUIPearlEnrollControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBKUIPearlEnrollControllerClass_softClass;
  v7 = getBKUIPearlEnrollControllerClass_softClass;
  if (!getBKUIPearlEnrollControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBKUIPearlEnrollControllerClass_block_invoke;
    v3[3] = &unk_24D234208;
    v3[4] = &v4;
    __getBKUIPearlEnrollControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2148807C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214880DEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id getBKUIPearlEnrollErrorDomain()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getBKUIPearlEnrollErrorDomainSymbolLoc_ptr;
  v7 = getBKUIPearlEnrollErrorDomainSymbolLoc_ptr;
  if (!getBKUIPearlEnrollErrorDomainSymbolLoc_ptr)
  {
    v1 = (void *)BiometricKitUILibrary();
    v0 = (id *)dlsym(v1, "BKUIPearlEnrollErrorDomain");
    v5[3] = (uint64_t)v0;
    getBKUIPearlEnrollErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)getkCAFillModeBackwards_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

Class __getBKUIPearlEnrollControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  BiometricKitUILibrary();
  result = objc_getClass("BKUIPearlEnrollController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKUIPearlEnrollControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKUIPearlEnrollControllerClass_block_invoke_cold_1();
    return (Class)BiometricKitUILibrary();
  }
  return result;
}

uint64_t BiometricKitUILibrary()
{
  uint64_t v0;
  void *v2;

  if (!BiometricKitUILibraryCore_frameworkLibrary)
    BiometricKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = BiometricKitUILibraryCore_frameworkLibrary;
  if (!BiometricKitUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getBKDeviceClass_block_invoke(uint64_t a1)
{
  BiometricKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BKDevice");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBKDeviceClass_block_invoke_cold_1();
    BiometricKitLibrary();
  }
}

void BiometricKitLibrary()
{
  void *v0;

  if (!BiometricKitLibraryCore_frameworkLibrary)
    BiometricKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BiometricKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBKDeviceDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BiometricKitLibrary();
  result = objc_getClass("BKDeviceDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKDeviceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBKDeviceDescriptorClass_block_invoke_cold_1();
    return (Class)__getBKUIPeriocularEnableSplashViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BiometricKitUILibrary();
  result = objc_getClass("BKUIPeriocularEnableSplashViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKUIPeriocularEnableSplashViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24);
  }
  else
  {
    v3 = __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_1();
    return (Class)__getBKUIFaceIDSplashViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getBKUIFaceIDSplashViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  BFFFinishSetupRunState *v3;
  SEL v4;

  BiometricKitUILibrary();
  result = objc_getClass("BKUIFaceIDSplashViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBKUIFaceIDSplashViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (BFFFinishSetupRunState *)__getBKUIFaceIDSplashViewControllerClass_block_invoke_cold_1();
    return (Class)-[BFFFinishSetupRunState hasCompletedInitialRun](v3, v4);
  }
  return result;
}

void sub_214882694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_24D234208;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_214882AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214882BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVTUIEnrollTrainingViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerUILibraryCore_frameworkLibrary)
  {
    VoiceTriggerUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VoiceTriggerUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTUIEnrollTrainingViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getVTUIEnrollTrainingViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("OBPrivacyPresenter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
    free(v3);
  }
  getOBPrivacyPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21488617C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _BFFHeightByDeviceSize(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  _BOOL4 v5;

  v1 = a1;
  v2 = enclosingSizeForView(v1);
  v4 = v3;
  v5 = _useCompactMetrics(v1);

  if (v5)
  {
    if (v4 <= 568.0)
    {
      return 0;
    }
    else if (v4 <= 667.0)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  else if (v2 >= v4)
  {
    if (v4 <= 768.0)
    {
      return 3;
    }
    else if (v4 <= 834.0)
    {
      return 6;
    }
    else
    {
      return 8;
    }
  }
  else if (v4 <= 1024.0)
  {
    return 4;
  }
  else if (v4 <= 1112.0)
  {
    return 5;
  }
  else
  {
    return 7;
  }
}

double enclosingSizeForView(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(v1, "window");
  else
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  return v5;
}

BOOL _useCompactMetrics(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  if (!BFFIsiPad())
    goto LABEL_5;
  if (!v1)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if (!BFFIsiPad()
    || (objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "bundleIdentifier"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE85848]),
        v3,
        v2,
        (v4 & 1) == 0))
  {
    objc_msgSend(v1, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "horizontalSizeClass");

    v5 = v7 == 1;
    if (v7)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_5:
  v5 = 1;
LABEL_8:

  return v5;
}

uint64_t _BFFWidthByDeviceSize(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  _BOOL4 v5;

  v1 = a1;
  v2 = enclosingSizeForView(v1);
  v4 = v3;
  v5 = _useCompactMetrics(v1);

  if (v5)
  {
    if (v2 <= 320.0)
    {
      return 0;
    }
    else if (v2 <= 375.0)
    {
      return 1;
    }
    else
    {
      return 2;
    }
  }
  else if (v2 >= v4)
  {
    if (v2 <= 1024.0)
    {
      return 4;
    }
    else if (v2 <= 1112.0)
    {
      return 6;
    }
    else
    {
      return 8;
    }
  }
  else if (v2 <= 768.0)
  {
    return 3;
  }
  else if (v2 <= 834.0)
  {
    return 5;
  }
  else
  {
    return 7;
  }
}

double _BFFCGFloatByDeviceHeight(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v17;

  v17 = a1;
  if (MGGetSInt32Answer() != 4)
  {
    a9 = a2;
    switch(_BFFHeightByDeviceSize(v17))
    {
      case 1:
        a9 = a3;
        break;
      case 2:
        a9 = a4;
        break;
      case 3:
      case 6:
        a9 = a5;
        break;
      case 4:
      case 5:
        a9 = a6;
        break;
      case 7:
        a9 = a7;
        break;
      case 8:
        a9 = a8;
        break;
      default:
        break;
    }
  }

  return a9;
}

id _BFFHeaderTextStyle()
{
  void *v0;
  double v1;
  double v2;
  id *v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  v2 = v1;

  v3 = (id *)MEMORY[0x24BEBE238];
  if (v2 <= 568.0)
    v3 = (id *)MEMORY[0x24BEBE248];
  return *v3;
}

double _BFFIconTitleBaselineOffset(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v1 = (void *)MEMORY[0x24BEBD5F0];
  v2 = a1;
  _BFFHeaderTextStyle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = _CGFloatByIdiom(v2, 44.0, 56.0, 0.0);
  objc_msgSend(v4, "scaledValueForValue:", v5);
  v7 = v6;

  return v7;
}

void _BFFTableInset(void *a1)
{
  id v1;

  v1 = a1;
  if (_useCompactMetrics(v1))
    _BFFCGFloatByDeviceHeight(v1, 16.0, 24.0, 24.0, 0.0, 0.0, 0.0, 0.0, 0.0);
  else
    enclosingSizeForView(v1);

}

double _CGFloatByIdiom(void *a1, double a2, double a3, double a4)
{
  id v7;

  v7 = a1;
  if (MGGetSInt32Answer() != 4)
  {
    if (_useCompactMetrics(v7))
      a4 = a2;
    else
      a4 = a3;
  }

  return a4;
}

void sub_214888BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_214889454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21488A4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_21488B170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_21488B324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBiometricKitUIClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BiometricKitUILibraryCore_frameworkLibrary_0)
  {
    BiometricKitUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!BiometricKitUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BiometricKitUI");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBiometricKitUIClass_block_invoke_cold_1();
    free(v3);
  }
  getBiometricKitUIClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBiometricKitClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!BiometricKitLibraryCore_frameworkLibrary_0)
  {
    BiometricKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!BiometricKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BiometricKit");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBiometricKitClass_block_invoke_cold_1();
    free(v3);
  }
  getBiometricKitClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21488D404(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21488FE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t isDeviceXL()
{
  if (isDeviceXL_onceToken != -1)
    dispatch_once(&isDeviceXL_onceToken, &__block_literal_global_2);
  return isDeviceXL__isDeviceXL;
}

void __isDeviceXL_block_invoke()
{
  double v0;
  id v1;

  if (BFFIsiPad())
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_referenceBounds");
    isDeviceXL__isDeviceXL = v0 > 834.0;

  }
  else
  {
    isDeviceXL__isDeviceXL = 0;
  }
}

BOOL BFFIsiPad()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

id BFFPointImageOfColor(void *a1)
{
  id v1;
  void *v2;
  CGSize v4;
  CGRect v5;

  v1 = a1;
  v4.width = 1.0;
  v4.height = 1.0;
  UIGraphicsBeginImageContext(v4);
  objc_msgSend(v1, "set");

  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 1.0;
  UIRectFill(v5);
  UIGraphicsGetImageFromCurrentImageContext();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v2;
}

BOOL BFFIsiPhone()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  return v1;
}

void *Logger.purpleBuddySubsystem.unsafeMutableAddressor()
{
  return &static Logger.purpleBuddySubsystem;
}

unint64_t static Logger.purpleBuddySubsystem.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_21489117C(uint64_t a1)
{
  return sub_214891210(a1, static Logger.purpleBuddyGeneral);
}

uint64_t Logger.purpleBuddyGeneral.unsafeMutableAddressor()
{
  return sub_2148912A0(&qword_254D929D0, (uint64_t)static Logger.purpleBuddyGeneral);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.purpleBuddyGeneral.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2148912FC(&qword_254D929D0, (uint64_t)static Logger.purpleBuddyGeneral, a1);
}

uint64_t sub_2148911EC(uint64_t a1)
{
  return sub_214891210(a1, static Logger.purpleBuddyAppearance);
}

uint64_t sub_214891210(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_214894AC8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_214894ABC();
}

uint64_t Logger.purpleBuddyAppearance.unsafeMutableAddressor()
{
  return sub_2148912A0(&qword_254D929D8, (uint64_t)static Logger.purpleBuddyAppearance);
}

uint64_t sub_2148912A0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_214894AC8();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.purpleBuddyAppearance.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2148912FC(&qword_254D929D8, (uint64_t)static Logger.purpleBuddyAppearance, a1);
}

uint64_t sub_2148912FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_214894AC8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

id variable initialization expression of ViewControllerSpinnerManager.weakObjectHashTable()
{
  return objc_msgSend((id)objc_opt_self(), sel_strongToWeakObjectsMapTable);
}

uint64_t variable initialization expression of ViewControllerSpinnerManager.navigationController()
{
  return 0;
}

uint64_t variable initialization expression of ViewControllerSpinnerManager.exceptionClassList()
{
  uint64_t v0;

  v0 = sub_2148913DC((uint64_t)&unk_24D234800);
  swift_arrayDestroy();
  return v0;
}

uint64_t sub_2148913DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D929E8);
    v3 = sub_214894B94();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_214894BF4();
      swift_bridgeObjectRetain();
      sub_214894B04();
      result = sub_214894C00();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_214894BE8(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_214894BE8();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D7E40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2148915FC()
{
  void *v0;
  id v1;
  uint64_t v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  swift_beginAccess();
  v1 = objc_getAssociatedObject(v0, &unk_254D929F0);
  swift_endAccess();
  if (v1)
  {
    sub_214894B88();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_2148944E0((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast())
      return v3;
    else
      return 0;
  }
  else
  {
    sub_214894528((uint64_t)v5);
    return 0;
  }
}

id sub_2148916D8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ViewControllerSpinnerManager()), sel_init);
  qword_254D929F8 = (uint64_t)result;
  return result;
}

id ViewControllerSpinnerManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_214891754(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;
  IMP *p_imp;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  const char *v35;
  id v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  unint64_t v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  id v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  objc_class *ObjCClassFromMetadata;
  NSString *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;

  v4 = v3;
  v76 = a2;
  v7 = (_QWORD *)sub_214894AD4();
  p_imp = (IMP *)*(v7 - 1);
  MEMORY[0x24BDAC7A8]();
  v10 = (uint64_t *)((char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2148944A8(0, &qword_254D92AA0);
  *v10 = sub_214894B58();
  ((void (*)(uint64_t *, _QWORD, _QWORD *))p_imp[13])(v10, *MEMORY[0x24BEE5610], v7);
  v11 = sub_214894AE0();
  ((void (*)(uint64_t *, _QWORD *))p_imp[1])(v10, v7);
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_43;
  }
  v12 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController;
  if (!*(_QWORD *)(v4 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController))
  {
    v23 = objc_msgSend((id)objc_opt_self(), sel_sharedSpinnerManager);
    if (v23)
    {
      v24 = v23;
      v25 = (void *)sub_214894AEC();
      objc_msgSend(v24, sel_startAnimatingInNavigationItemOfViewController_forIdentifier_, a1, v25);

      if (qword_254D929D0 != -1)
        swift_once();
      v26 = sub_214894AC8();
      __swift_project_value_buffer(v26, (uint64_t)static Logger.purpleBuddyGeneral);
      v27 = a1;
      swift_bridgeObjectRetain_n();
      v28 = a1;
      v29 = v27;
      v30 = sub_214894AB0();
      v31 = sub_214894B40();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = swift_slowAlloc();
        v33 = (_QWORD *)swift_slowAlloc();
        v75 = swift_slowAlloc();
        v78 = (uint64_t)v29;
        v79 = v75;
        *(_DWORD *)v32 = 138412546;
        v34 = v29;
        sub_214894B70();
        *v33 = v28;

        *(_WORD *)(v32 + 12) = 2080;
        swift_bridgeObjectRetain();
        v78 = sub_21489348C(v76, a3, &v79);
        sub_214894B70();
        swift_bridgeObjectRelease_n();
        v35 = "Showing legacy spinner for view controller %@ with identifier %s without navigationController.";
LABEL_40:
        _os_log_impl(&dword_214875000, v30, v31, v35, (uint8_t *)v32, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254D92AA8);
        swift_arrayDestroy();
        MEMORY[0x2199D7E7C](v33, -1, -1);
        v73 = v75;
        swift_arrayDestroy();
        MEMORY[0x2199D7E7C](v73, -1, -1);
        MEMORY[0x2199D7E7C](v32, -1, -1);

        return;
      }
      goto LABEL_41;
    }
    goto LABEL_46;
  }
  v13 = *(id *)(v4 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable);
  v14 = (void *)sub_214894AEC();
  objc_msgSend(v13, sel_setObject_forKey_, a1, v14);

  v15 = *(void **)(v4 + v12);
  if (!v15)
  {
    __break(1u);
    goto LABEL_45;
  }
  v16 = objc_msgSend(v15, sel_navigationBar);
  v17 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  objc_msgSend(v16, sel_setTintColor_, v17);

  v18 = *(void **)(v4 + v12);
  if (!v18)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    return;
  }
  v19 = objc_msgSend(v18, sel_navigationBar);
  objc_msgSend(v19, sel_setUserInteractionEnabled_, 0);

  objc_opt_self();
  v7 = (_QWORD *)swift_dynamicCastObjCClass();
  if (v7)
    v20 = a1;
  v77 = &unk_254DA6418;
  v21 = swift_dynamicCastObjCProtocolConditional();
  if (v21)
  {
    v11 = v21;
    v22 = a1;
    if (!v7)
    {
LABEL_25:
      objc_msgSend((id)v11, sel_startIndeterminateProgressIndicator);
      swift_unknownObjectRelease();
      if (qword_254D929D0 != -1)
        swift_once();
      v52 = sub_214894AC8();
      __swift_project_value_buffer(v52, (uint64_t)static Logger.purpleBuddyGeneral);
      v53 = a1;
      swift_bridgeObjectRetain_n();
      v54 = a1;
      v29 = v53;
      v30 = sub_214894AB0();
      v31 = sub_214894B4C();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = swift_slowAlloc();
        v33 = (_QWORD *)swift_slowAlloc();
        v75 = swift_slowAlloc();
        v78 = (uint64_t)v29;
        v79 = v75;
        *(_DWORD *)v32 = 138412546;
        v55 = v29;
        sub_214894B70();
        *v33 = v54;

        *(_WORD *)(v32 + 12) = 2080;
        swift_bridgeObjectRetain();
        v78 = sub_21489348C(v76, a3, &v79);
        sub_214894B70();
        swift_bridgeObjectRelease_n();
        v35 = "Showing second party spinner for view controller %@ with identifier %s.";
        goto LABEL_40;
      }
      goto LABEL_41;
    }
  }
  else
  {
    if (!v7)
    {
LABEL_29:
      v56 = objc_msgSend((id)objc_opt_self(), sel_sharedSpinnerManager);
      if (v56)
      {
        v57 = v56;
        v58 = (void *)sub_214894AEC();
        objc_msgSend(v57, sel_startAnimatingInNavigationItemOfViewController_forIdentifier_, a1, v58);

        v59 = *(_QWORD *)(v4 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_exceptionClassList);
        swift_getObjectType();
        ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        v61 = NSStringFromClass(ObjCClassFromMetadata);
        v62 = sub_214894AF8();
        v64 = v63;

        LOBYTE(v59) = sub_2148930B8(v62, v64, v59);
        swift_bridgeObjectRelease();
        if ((v59 & 1) != 0)
        {
          if (qword_254D929D0 != -1)
            swift_once();
          v65 = sub_214894AC8();
          __swift_project_value_buffer(v65, (uint64_t)static Logger.purpleBuddyGeneral);
          v66 = a1;
          swift_bridgeObjectRetain_n();
          v67 = a1;
          v29 = v66;
          v30 = sub_214894AB0();
          v31 = sub_214894B4C();
          if (os_log_type_enabled(v30, v31))
          {
            v32 = swift_slowAlloc();
            v33 = (_QWORD *)swift_slowAlloc();
            v75 = swift_slowAlloc();
            v78 = (uint64_t)v29;
            v79 = v75;
            *(_DWORD *)v32 = 138412546;
            v68 = v29;
            sub_214894B70();
            *v33 = v67;

            *(_WORD *)(v32 + 12) = 2080;
            swift_bridgeObjectRetain();
            v78 = sub_21489348C(v76, a3, &v79);
            sub_214894B70();
            swift_bridgeObjectRelease_n();
            v35 = "Showing legacy spinner for view controller %@ with identifier %s.";
            goto LABEL_40;
          }
        }
        else
        {
          if (qword_254D929D0 != -1)
            swift_once();
          v69 = sub_214894AC8();
          __swift_project_value_buffer(v69, (uint64_t)static Logger.purpleBuddyGeneral);
          v70 = a1;
          swift_bridgeObjectRetain_n();
          v71 = a1;
          v29 = v70;
          v30 = sub_214894AB0();
          v31 = sub_214894B40();
          if (os_log_type_enabled(v30, v31))
          {
            v32 = swift_slowAlloc();
            v33 = (_QWORD *)swift_slowAlloc();
            v75 = swift_slowAlloc();
            v78 = (uint64_t)v29;
            v79 = v75;
            *(_DWORD *)v32 = 138412546;
            v72 = v29;
            sub_214894B70();
            *v33 = v71;

            *(_WORD *)(v32 + 12) = 2080;
            swift_bridgeObjectRetain();
            v78 = sub_21489348C(v76, a3, &v79);
            sub_214894B70();
            swift_bridgeObjectRelease_n();
            v35 = "Showing legacy spinner for view controller %@ with identifier %s. Please move to use SecondPartyProgre"
                  "ssIndicatorDisplayable";
            goto LABEL_40;
          }
        }
LABEL_41:

        swift_bridgeObjectRelease_n();
        return;
      }
      goto LABEL_47;
    }
    v11 = 0;
  }
  p_imp = &stru_24D23BFF0.imp;
  v36 = objc_msgSend(v7, sel_buttonTray);
  v37 = objc_msgSend(v36, sel_allButtons);

  sub_2148944A8(0, &qword_254D92B10);
  v38 = sub_214894B1C();

  if (!(v38 >> 62))
  {
    v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_19;
  }
LABEL_43:
  swift_bridgeObjectRetain();
  v39 = sub_214894BD0();
  swift_bridgeObjectRelease();
LABEL_19:
  swift_bridgeObjectRelease();
  if (v39 < 1)
  {

    if (v11)
      goto LABEL_25;
    goto LABEL_29;
  }
  swift_unknownObjectRelease();
  v40 = objc_msgSend(v7, (SEL)p_imp[281]);
  objc_msgSend(v40, sel_showButtonsBusy);

  if (qword_254D929D0 != -1)
    swift_once();
  v41 = sub_214894AC8();
  __swift_project_value_buffer(v41, (uint64_t)static Logger.purpleBuddyGeneral);
  v42 = a1;
  swift_bridgeObjectRetain_n();
  v43 = a1;
  v44 = a3;
  v45 = v42;
  v46 = sub_214894AB0();
  v47 = sub_214894B4C();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = swift_slowAlloc();
    v74 = (_QWORD *)swift_slowAlloc();
    v75 = swift_slowAlloc();
    v78 = (uint64_t)v45;
    v79 = v75;
    *(_DWORD *)v48 = 138412546;
    v49 = v45;
    sub_214894B70();
    v50 = v74;
    *v74 = v43;

    *(_WORD *)(v48 + 12) = 2080;
    swift_bridgeObjectRetain();
    v78 = sub_21489348C(v76, v44, &v79);
    sub_214894B70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_214875000, v46, v47, "Showing OnBoardingKit button spinner for view controller %@ with identifier %s.", (uint8_t *)v48, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D92AA8);
    swift_arrayDestroy();
    MEMORY[0x2199D7E7C](v50, -1, -1);
    v51 = v75;
    swift_arrayDestroy();
    MEMORY[0x2199D7E7C](v51, -1, -1);
    MEMORY[0x2199D7E7C](v48, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void static ViewControllerSpinnerManager.stopAnimatingSpinner(for:)(void *a1, unint64_t a2)
{
  if (qword_254D929E0 != -1)
    swift_once();
  sub_21489242C(a1, a2);
}

void sub_21489242C(id a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  id v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  os_log_type_t v48;
  uint64_t v49;
  os_log_t v50;
  const char *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD *v65;
  os_log_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;

  v3 = v2;
  v6 = sub_214894AD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (uint64_t *)((char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2148944A8(0, &qword_254D92AA0);
  *v9 = sub_214894B58();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5610], v6);
  v10 = sub_214894AE0();
  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v9, v6);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_50;
  }
  v11 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController;
  if (!*(_QWORD *)(v3 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController))
  {
    v23 = objc_msgSend((id)objc_opt_self(), sel_sharedSpinnerManager);
    if (!v23)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    v24 = v23;
    v25 = (void *)sub_214894AEC();
    objc_msgSend(v24, sel_stopAnimatingForIdentifier_, v25);

    if (qword_254D929D0 == -1)
    {
LABEL_11:
      v26 = sub_214894AC8();
      __swift_project_value_buffer(v26, (uint64_t)static Logger.purpleBuddyGeneral);
      swift_bridgeObjectRetain_n();
      v27 = sub_214894AB0();
      v28 = sub_214894B40();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v73 = v30;
        *(_DWORD *)v29 = 136315138;
        swift_bridgeObjectRetain();
        v72 = sub_21489348C((uint64_t)a1, a2, &v73);
        sub_214894B70();
        swift_bridgeObjectRelease_n();
        v31 = "Stopped legacy spinner with identifier %s without navigationController.";
LABEL_17:
        _os_log_impl(&dword_214875000, v27, v28, v31, v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199D7E7C](v30, -1, -1);
        MEMORY[0x2199D7E7C](v29, -1, -1);

        return;
      }
LABEL_18:

      swift_bridgeObjectRelease_n();
      return;
    }
LABEL_50:
    swift_once();
    goto LABEL_11;
  }
  v12 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable;
  v13 = *(id *)(v3 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable);
  v14 = (void *)sub_214894AEC();
  v15 = objc_msgSend(v13, sel_objectForKey_, v14);

  if (!v15)
  {
    if (qword_254D929D0 != -1)
      swift_once();
    v32 = sub_214894AC8();
    __swift_project_value_buffer(v32, (uint64_t)static Logger.purpleBuddyGeneral);
    swift_bridgeObjectRetain_n();
    v27 = sub_214894AB0();
    v28 = sub_214894B28();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v73 = v30;
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain();
      v72 = sub_21489348C((uint64_t)a1, a2, &v73);
      sub_214894B70();
      swift_bridgeObjectRelease_n();
      v31 = "Unnecessary call to stopAnimating as no controller was found identifier %s";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v16 = *(id *)(v3 + v12);
  v17 = (void *)sub_214894AEC();
  objc_msgSend(v16, sel_removeObjectForKey_, v17);

  objc_opt_self();
  v18 = (void *)swift_dynamicCastObjCClass();
  if (v18)
    v19 = v15;
  v71 = &unk_254DA6418;
  v20 = swift_dynamicCastObjCProtocolConditional();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = v15;
    if (!v18)
    {
LABEL_29:
      v68 = (uint64_t)a1;
      objc_msgSend(v21, sel_stopIndeterminateProgressIndicator);
      swift_unknownObjectRelease();
      if (qword_254D929D0 != -1)
        swift_once();
      v46 = sub_214894AC8();
      __swift_project_value_buffer(v46, (uint64_t)static Logger.purpleBuddyGeneral);
      v47 = v15;
      swift_bridgeObjectRetain_n();
      a1 = v47;
      v41 = sub_214894AB0();
      v48 = sub_214894B4C();
      if (!os_log_type_enabled(v41, v48))
        goto LABEL_40;
      v49 = swift_slowAlloc();
      v66 = (os_log_t)swift_slowAlloc();
      v67 = swift_slowAlloc();
      v72 = (uint64_t)a1;
      v73 = v67;
      *(_DWORD *)v49 = 138412546;
      v69 = v11;
      a1 = a1;
      sub_214894B70();
      v50 = v66;
      v66->isa = (Class)v15;

      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      v72 = sub_21489348C(v68, a2, &v73);
      v11 = v69;
      sub_214894B70();
      swift_bridgeObjectRelease_n();
      v51 = "Stopped second party spinner for view controller %@ with identifier %s.";
      goto LABEL_38;
    }
  }
  else
  {
    if (!v18)
      goto LABEL_33;
    v21 = 0;
  }
  v33 = objc_msgSend(v18, sel_buttonTray);
  v34 = objc_msgSend(v33, sel_allButtons);

  sub_2148944A8(0, &qword_254D92B10);
  v35 = sub_214894B1C();

  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    v36 = sub_214894BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v36 >= 1)
  {
    v69 = v11;
    swift_unknownObjectRelease();
    v37 = objc_msgSend(v18, sel_buttonTray);
    objc_msgSend(v37, sel_showButtonsAvailable);

    if (qword_254D929D0 != -1)
      swift_once();
    v38 = sub_214894AC8();
    __swift_project_value_buffer(v38, (uint64_t)static Logger.purpleBuddyGeneral);
    v39 = v15;
    swift_bridgeObjectRetain_n();
    v40 = v39;
    v41 = sub_214894AB0();
    v42 = sub_214894B4C();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v65 = (_QWORD *)swift_slowAlloc();
      v67 = swift_slowAlloc();
      v72 = (uint64_t)v40;
      v73 = v67;
      *(_DWORD *)v43 = 138412546;
      v68 = (uint64_t)a1;
      v66 = v41;
      v44 = v40;
      sub_214894B70();
      a1 = v65;
      *v65 = v15;

      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain();
      v72 = sub_21489348C(v68, a2, &v73);
      sub_214894B70();
      swift_bridgeObjectRelease_n();
      v41 = v66;
      _os_log_impl(&dword_214875000, v66, v42, "Stopped OnBoardingKit button spinner for view controller %@ with identifier %s", (uint8_t *)v43, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D92AA8);
      swift_arrayDestroy();
      MEMORY[0x2199D7E7C](a1, -1, -1);
      v45 = v67;
      swift_arrayDestroy();
      MEMORY[0x2199D7E7C](v45, -1, -1);
      MEMORY[0x2199D7E7C](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v11 = v69;
    v58 = *(void **)(v3 + v69);
    if (v58)
      goto LABEL_44;
    goto LABEL_39;
  }

  if (v21)
    goto LABEL_29;
LABEL_33:
  v52 = objc_msgSend((id)objc_opt_self(), sel_sharedSpinnerManager);
  if (!v52)
  {
LABEL_54:
    __break(1u);
    return;
  }
  v53 = v52;
  v68 = (uint64_t)a1;
  v54 = (void *)sub_214894AEC();
  objc_msgSend(v53, sel_stopAnimatingForIdentifier_, v54);

  if (qword_254D929D0 != -1)
    swift_once();
  v55 = sub_214894AC8();
  __swift_project_value_buffer(v55, (uint64_t)static Logger.purpleBuddyGeneral);
  v56 = v15;
  swift_bridgeObjectRetain_n();
  a1 = v56;
  v41 = sub_214894AB0();
  v48 = sub_214894B4C();
  if (!os_log_type_enabled(v41, v48))
    goto LABEL_40;
  v49 = swift_slowAlloc();
  v66 = (os_log_t)swift_slowAlloc();
  v67 = swift_slowAlloc();
  v72 = (uint64_t)a1;
  v73 = v67;
  *(_DWORD *)v49 = 138412546;
  v69 = v11;
  a1 = a1;
  sub_214894B70();
  v50 = v66;
  v66->isa = (Class)v15;

  *(_WORD *)(v49 + 12) = 2080;
  swift_bridgeObjectRetain();
  v72 = sub_21489348C(v68, a2, &v73);
  v11 = v69;
  sub_214894B70();
  swift_bridgeObjectRelease_n();
  v51 = "Stopped legacy spinner for view controller %@ with identifier %s.";
LABEL_38:
  _os_log_impl(&dword_214875000, v41, v48, v51, (uint8_t *)v49, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D92AA8);
  swift_arrayDestroy();
  MEMORY[0x2199D7E7C](v50, -1, -1);
  v57 = v67;
  swift_arrayDestroy();
  MEMORY[0x2199D7E7C](v57, -1, -1);
  MEMORY[0x2199D7E7C](v49, -1, -1);

  v58 = *(void **)(v3 + v11);
  if (v58)
    goto LABEL_44;
  do
  {
LABEL_39:
    __break(1u);
LABEL_40:

    swift_bridgeObjectRelease_n();
    v58 = *(void **)(v3 + v11);
  }
  while (!v58);
LABEL_44:
  v59 = objc_msgSend(v58, sel_navigationBar);
  objc_msgSend(v59, sel_setTintColor_, 0);

  v60 = *(void **)(v3 + v11);
  if (!v60)
  {
    __break(1u);
    goto LABEL_53;
  }
  v61 = objc_msgSend(v60, sel_navigationBar);
  objc_msgSend(v61, sel_setUserInteractionEnabled_, 1);

  v70 = &unk_254DBFBD0;
  v62 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v62)
  {
    v63 = v62;
    if ((objc_msgSend(v62, sel_respondsToSelector_, sel_viewControllerSpinnerManagerDidStopAnimatingSpinner_) & 1) != 0)objc_msgSend(v63, sel_viewControllerSpinnerManagerDidStopAnimatingSpinner_, v3);
  }

}

uint64_t sub_2148930B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_214894BF4();
    sub_214894B04();
    v6 = sub_214894C00();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_214894BE8() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_214894BE8() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

Swift::Void __swiftcall ViewControllerSpinnerManager.navigationController(_:didShow:operation:animated:)(BFFNavigationController *_, UIViewController *didShow, UINavigationControllerOperation operation, Swift::Bool animated)
{
  sub_2148940C0(_, operation);
}

id ViewControllerSpinnerManager.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  void *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable;
  v3 = (void *)objc_opt_self();
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, sel_strongToWeakObjectsMapTable);
  *(_QWORD *)&v4[OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController] = 0;
  v5 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_exceptionClassList;
  v6 = sub_2148913DC((uint64_t)&unk_24D234880);
  swift_arrayDestroy();
  *(_QWORD *)&v4[v5] = v6;

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ViewControllerSpinnerManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21489348C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21489355C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_214894468((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_214894468((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21489355C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_214894B7C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_214893714(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_214894BB8();
  if (!v8)
  {
    sub_214894BC4();
    __break(1u);
LABEL_17:
    result = sub_214894BDC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_214893714(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2148937A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_214893980(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_214893980(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2148937A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21489391C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_214894BA0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_214894BC4();
      __break(1u);
LABEL_10:
      v2 = sub_214894B10();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_214894BDC();
    __break(1u);
LABEL_14:
    result = sub_214894BC4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21489391C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D92B18);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_214893980(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D92B18);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_214894BDC();
  __break(1u);
  return result;
}

void _s16SetupAssistantUI28ViewControllerSpinnerManagerC023configureWithNavigationE0yySo013BFFNavigationE0CFZ_0(void *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (qword_254D929E0 != -1)
    swift_once();
  v2 = *(void **)(qword_254D929F8 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController);
  *(_QWORD *)(qword_254D929F8 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController) = a1;

  v3 = qword_254D929F8;
  v4 = *(void **)(qword_254D929F8 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController);
  if (v4)
  {
    v5 = a1;
    objc_msgSend(v4, sel_addDelegateObserver_, v3);
  }
  else
  {
    __break(1u);
  }
}

void _s16SetupAssistantUI28ViewControllerSpinnerManagerC014startAnimatingF03for10identifierySo06UIViewE0C_SStFZ_0(void *a1, uint64_t a2, unint64_t a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t type;
  os_log_type_t typea;
  id v29;
  id v30;
  uint64_t v31[3];

  if (qword_254D929E0 != -1)
    swift_once();
  v6 = *(id *)(qword_254D929F8 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_weakObjectHashTable);
  v7 = (void *)sub_214894AEC();
  v29 = objc_msgSend(v6, sel_objectForKey_, v7);

  if (!v29)
    goto LABEL_15;
  sub_2148944A8(0, &qword_254D92B20);
  if ((sub_214894B64() & 1) == 0)
  {
    if (qword_254D929D0 != -1)
      swift_once();
    v17 = sub_214894AC8();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.purpleBuddyGeneral);
    swift_bridgeObjectRetain_n();
    v18 = v29;
    v19 = sub_214894AB0();
    v20 = sub_214894B40();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v30 = (id)swift_slowAlloc();
      v31[0] = (uint64_t)v30;
      *(_DWORD *)v21 = 136315394;
      swift_bridgeObjectRetain();
      sub_21489348C(a2, a3, v31);
      sub_214894B70();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 12) = 2080;
      v22 = objc_msgSend(v18, sel_debugDescription);
      v23 = sub_214894AF8();
      typea = v20;
      v25 = v24;

      sub_21489348C(v23, v25, v31);
      sub_214894B70();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_214875000, v19, typea, "Attempting to start spinner animation with a identifier %s that is already used for a controller %s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199D7E7C](v30, -1, -1);
      MEMORY[0x2199D7E7C](v21, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_15:
    swift_bridgeObjectRetain();
    v26 = (void *)sub_214894AEC();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    objc_setAssociatedObject(a1, &unk_254D929F0, v26, (void *)1);
    swift_endAccess();

    sub_214891754(a1, a2, a3);
    return;
  }
  if (qword_254D929D0 != -1)
    swift_once();
  v8 = sub_214894AC8();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.purpleBuddyGeneral);
  swift_bridgeObjectRetain_n();
  v9 = a1;
  v10 = sub_214894AB0();
  v11 = sub_214894B34();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    type = swift_slowAlloc();
    v31[0] = type;
    *(_DWORD *)v12 = 136315394;
    v13 = objc_msgSend(v9, sel_debugDescription);
    v14 = sub_214894AF8();
    v16 = v15;

    sub_21489348C(v14, v16, v31);
    sub_214894B70();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21489348C(a2, a3, v31);
    sub_214894B70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_214875000, v10, v11, "%s already animating spinner for identifier %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199D7E7C](type, -1, -1);
    MEMORY[0x2199D7E7C](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_2148940C0(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;

  v3 = v2;
  v5 = OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController;
  v6 = *(void **)(v3 + OBJC_IVAR___BFFViewControllerSpinnerManagerObjc_navigationController);
  if (!v6)
  {
    __break(1u);
    goto LABEL_22;
  }
  v8 = objc_msgSend(v6, sel_navigationBar);
  objc_msgSend(v8, sel_setTintColor_, 0);

  v9 = *(void **)(v3 + v5);
  if (!v9)
  {
LABEL_22:
    __break(1u);
    return;
  }
  v10 = objc_msgSend(v9, sel_navigationBar);
  objc_msgSend(v10, sel_setUserInteractionEnabled_, 1);

  v11 = objc_msgSend(a1, sel_viewControllers);
  v12 = sub_2148944A8(0, &qword_254D92B20);
  v13 = sub_214894B1C();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_214894BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v15 = v14 - 2;
  if (v14 >= 2 && a2 == 1)
  {
    v16 = objc_msgSend(a1, sel_viewControllers);
    v17 = sub_214894B1C();

    if ((v17 & 0xC000000000000001) != 0)
    {
      v18 = (id)MEMORY[0x2199D77BC](v14 - 2, v17);
    }
    else
    {
      if (v15 >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_20:
        swift_once();
LABEL_12:
        v21 = sub_214894AC8();
        __swift_project_value_buffer(v21, (uint64_t)static Logger.purpleBuddyGeneral);
        swift_bridgeObjectRetain();
        v22 = sub_214894AB0();
        v23 = sub_214894B28();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          v25 = swift_slowAlloc();
          v27 = v25;
          *(_DWORD *)v24 = 136315138;
          swift_bridgeObjectRetain();
          sub_21489348C(v12, (unint64_t)v16, &v27);
          sub_214894B70();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_214875000, v22, v23, "NavigationController.didShow called stop spinner for identifier %s.", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2199D7E7C](v25, -1, -1);
          MEMORY[0x2199D7E7C](v24, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return;
      }
      v18 = *(id *)(v17 + 8 * v15 + 32);
    }
    v26 = v18;
    swift_bridgeObjectRelease();
    v19 = (void *)sub_2148915FC();
    if (!v20)
    {

      return;
    }
    v12 = (uint64_t)v19;
    v16 = (id)v20;
    sub_21489242C(v19, v20);
    if (qword_254D929D0 == -1)
      goto LABEL_12;
    goto LABEL_20;
  }
}

uint64_t type metadata accessor for ViewControllerSpinnerManager()
{
  return objc_opt_self();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_214894468(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2148944A8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2148944E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D92B28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_214894528(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D92B28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_214894568()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t getkCAFillModeBackwards_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getCASpringAnimationClass_block_invoke_cold_1(v0);
}

uint64_t __getCASpringAnimationClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getCAMediaTimingFunctionClass_block_invoke_cold_1();
}

uint64_t __getCAMediaTimingFunctionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCABasicAnimationClass_block_invoke_cold_1(v0);
}

uint64_t __getCABasicAnimationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKSetupAssistantContextClass_block_invoke_cold_1(v0);
}

uint64_t __getPKSetupAssistantContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getPKPaymentSetupAssistantControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKUIPearlEnrollControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getBKUIPearlEnrollControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKDeviceClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKDeviceDescriptorClass_block_invoke_cold_1(v0);
}

uint64_t __getBKDeviceDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getBKUIPeriocularEnableSplashViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBKUIFaceIDSplashViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getBKUIFaceIDSplashViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[BFFFinishSetupViewController _ensureNavigationControllerWithViewController:pushCompletion:].cold.1(v0);
}

uint64_t __getBiometricKitUIClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getBiometricKitClass_block_invoke_cold_1();
}

uint64_t __getBiometricKitClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[BFFNavBarSpinnerManager startAnimatingInNavigationItemOfViewController:forIdentifier:].cold.1(v0);
}

uint64_t sub_214894AB0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_214894ABC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_214894AC8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_214894AD4()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_214894AE0()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_214894AEC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_214894AF8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_214894B04()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_214894B10()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_214894B1C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_214894B28()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_214894B34()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_214894B40()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_214894B4C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_214894B58()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_214894B64()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_214894B70()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_214894B7C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_214894B88()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_214894B94()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_214894BA0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_214894BAC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_214894BB8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_214894BC4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_214894BD0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_214894BDC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_214894BE8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_214894BF4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_214894C00()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BYAssistantScreenShouldRunForPHSUpgrade()
{
  return MEMORY[0x24BE857F0]();
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PSHasStockholmPass()
{
  return MEMORY[0x24BE75A98]();
}

uint64_t PSSupportsMesa()
{
  return MEMORY[0x24BE75CF8]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x24BDE8BD8]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x24BEBE040]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x24BEBE140]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BEBE658]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BEBE698]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BEBE6B0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

uint64_t _BYIsInternalInstall()
{
  return MEMORY[0x24BE858C0]();
}

uint64_t _BYLoggingFacility()
{
  return MEMORY[0x24BE858C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

