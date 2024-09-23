PDCFileBackedConsentStore *PDCGlobalConsentStoreInstance()
{
  PDCFileBackedConsentStore *v0;
  void *v1;
  PDCFileBackedConsentStore *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v0 = [PDCFileBackedConsentStore alloc];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/com.apple.PrivacyDisclosure/consents/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[PDCFileBackedConsentStore initWithConsentStoreURL:](v0, "initWithConsentStoreURL:", v1);

  PDCGlobalBackupManager();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __PDCGlobalConsentStoreInstance_block_invoke;
    v6[3] = &unk_2515A2CD8;
    v7 = v3;
    -[PDCFileBackedConsentStore setChangeObserver:](v2, "setChangeObserver:", v6);

  }
  return v2;
}

uint64_t PDCGlobalBackupManager()
{
  return 0;
}

id PDCGlobalDeviceSettings()
{
  if (PDCGlobalDeviceSettings_once != -1)
    dispatch_once(&PDCGlobalDeviceSettings_once, &__block_literal_global);
  return (id)PDCGlobalDeviceSettings_result;
}

void sub_244A00DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244A0138C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBSRemoteAlertPresentationTargetClass()
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
  v0 = (void *)getSBSRemoteAlertPresentationTargetClass_softClass;
  v7 = getSBSRemoteAlertPresentationTargetClass_softClass;
  if (!getSBSRemoteAlertPresentationTargetClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertPresentationTargetClass_block_invoke;
    v3[3] = &unk_2515A2C50;
    v3[4] = &v4;
    __getSBSRemoteAlertPresentationTargetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_244A01458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getBSMutableSettingsClass_block_invoke(uint64_t a1)
{
  BaseBoardLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BSMutableSettings");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBSMutableSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBSMutableSettingsClass_block_invoke_cold_1();
    BaseBoardLibrary();
  }
}

void BaseBoardLibrary()
{
  void *v0;

  if (!BaseBoardLibraryCore_frameworkLibrary)
    BaseBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BaseBoardLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void __getSBSRemoteAlertDefinitionClass_block_invoke(uint64_t a1)
{
  SpringBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SBSRemoteAlertDefinition");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertDefinitionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1();
    SpringBoardServicesLibrary();
  }
}

void SpringBoardServicesLibrary()
{
  void *v0;

  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSBSRemoteAlertConfigurationContextClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertConfigurationContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertConfigurationContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1();
    return (Class)__getBSActionClass_block_invoke(v3);
  }
  return result;
}

Class __getBSActionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  BaseBoardLibrary();
  result = objc_getClass("BSAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBSActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getBSActionClass_block_invoke_cold_1();
    return (Class)__getSBSRemoteAlertHandleClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertHandleClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSBSRemoteAlertHandleClass_block_invoke_cold_1();
    return (Class)__getSBSRemoteAlertActivationContextClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertActivationContextClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertActivationContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertActivationContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1();
    return __getSBSRemoteAlertPresentationTargetClass_block_invoke(v3);
  }
  return result;
}

Class __getSBSRemoteAlertPresentationTargetClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertPresentationTarget");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertPresentationTargetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1();
    return (Class)__getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke(v3);
  }
  return result;
}

void __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  SpringBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SBSRemoteAlertPresentationTargetPredicate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBSRemoteAlertPresentationTargetPredicateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  }
  else
  {
    v10 = (void *)__getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore()
{
  if (PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_onceToken != -1)
    dispatch_once(&PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_onceToken, &__block_literal_global_2);
  return PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_log;
}

id PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;

  v1 = a1;
  v7 = 0;
  objc_msgSend(v1, "findApplicationRecordWithError:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v3)
  {
    v4 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity_cold_1((uint64_t)v1, (uint64_t)v3, v4);
    v5 = 0;
  }
  else
  {
    PDCCurrentRegulatoryDisclosureVersionForApplicationRecord(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id PDCCurrentRegulatoryDisclosureVersionForApplicationRecord(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "regulatoryPrivacyDisclosureVersion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v1, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "bundleWithURL:", v4);
    v1 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PDCCurrentRegulatoryDisclosureVersionForInfoPlistContent(v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id PDCCurrentRegulatoryDisclosureVersionForInfoPlistContent(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("NSRegulatoryPrivacyDisclosure"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSRegulatoryPrivacyDisclosureVersion"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t PDCSetOneTimeImplicitConsentState(void *a1, const char *a2)
{
  if ((_DWORD)a2)
    return objc_msgSend(a1, "setInteger:forKey:", 2, CFSTR("kOneTimeImplicitConsentGranted"));
  else
    return objc_msgSend(a1, "removeObjectForKey:", CFSTR("kOneTimeImplicitConsentGranted"));
}

uint64_t PDCSetOneTimeImplicitConsentGranted(void *a1, const char *a2)
{
  if ((_DWORD)a2)
    return objc_msgSend(a1, "setInteger:forKey:", 2, CFSTR("kOneTimeImplicitConsentGranted"));
  else
    return objc_msgSend(a1, "removeObjectForKey:", CFSTR("kOneTimeImplicitConsentGranted"));
}

uint64_t PDCPerformOneTimeImplicitConsentGrant(char a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "integerForKey:", CFSTR("kOneTimeImplicitConsentGranted")) == 2)
    goto LABEL_17;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v7, "setInteger:forKey:", 2, CFSTR("kOneTimeImplicitConsentGranted"));
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v9, "allApplications", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "regulatoryPrivacyDisclosureVersion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16)
          v19 = v17 == 0;
        else
          v19 = 1;
        if (!v19)
          v20 = (id)objc_msgSend(v8, "writeUserConsentedRegulatoryDisclosureVersion:forBundleIdentifier:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "setInteger:forKey:", 2, CFSTR("kOneTimeImplicitConsentGranted"));
  v21 = 1;
LABEL_18:

  return v21;
}

uint64_t __isGreenTea_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isGreenTea_result = result;
  return result;
}

void __isRunningInDemoMode_block_invoke()
{
  void *v0;
  CFPropertyListRef v1;
  const void *v2;
  CFTypeID v3;

  v0 = (void *)MEMORY[0x24951C428]();
  v1 = CFPreferencesCopyValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v1)
  {
    v2 = v1;
    CFAutorelease(v1);
    v3 = CFGetTypeID(v2);
    if (v3 == CFBooleanGetTypeID())
      isRunningInDemoMode_result = CFBooleanGetValue((CFBooleanRef)v2) != 0;
  }
  objc_autoreleasePoolPop(v0);
}

id PDCGlobalApplicationEnvironment()
{
  if (PDCGlobalApplicationEnvironment_once != -1)
    dispatch_once(&PDCGlobalApplicationEnvironment_once, &__block_literal_global_5);
  return (id)PDCGlobalApplicationEnvironment_result;
}

id PDCApplicationIdentityToLSApplicationIdentity(void *a1)
{
  id v1;

  v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      PDCApplicationIdentityToLSApplicationIdentity_cold_1();
  }
  return v1;
}

uint64_t __getBSMutableSettingsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getBSActionClass_block_invoke_cold_1(v0);
}

uint64_t __getBSActionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSBSRemoteAlertHandleClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertHandleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1();
}

uint64_t __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke_cold_1(v0);
}

uint64_t __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PDCFileBackedConsentStore userConsentedRegulatoryDisclosureVersionForBundleIdentifier:].cold.1(v0);
}

void PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2449FF000, log, OS_LOG_TYPE_ERROR, "Attempt to locate app %@ failed: %@", (uint8_t *)&v3, 0x16u);
}

void PDCApplicationIdentityToLSApplicationIdentity_cold_1()
{
  __assert_rtn("PDCApplicationIdentityToLSApplicationIdentity", "PDCApplicationEnvironment.m", 147, "!identity || [identity isKindOfClass:[LSApplicationIdentity class]]");
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x24BED3BE8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

