uint64_t HKRPShouldSkipHardwareCheck()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("HKRPSkipHardwareCheck"));

  return v1;
}

id HKRPOxygenSaturationFeatureAvailabilityRequirements()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[9];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)*MEMORY[0x24BDD2E48];
  v15 = objc_alloc(MEMORY[0x24BDD3BC8]);
  v25[0] = *MEMORY[0x24BDD2C28];
  objc_msgSend(MEMORY[0x24BDD3BD0], "notInStoreDemoMode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  objc_msgSend(MEMORY[0x24BDD3BD0], "profileIsNotFamilySetupPairingProfile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x24BDD3BD0], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x24BDD2F60]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v19;
  objc_msgSend(MEMORY[0x24BDD3BD0], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
  objc_msgSend(MEMORY[0x24BDD3BD0], "capabilityIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:", v0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v17;
  objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v16;
  objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v14;
  objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v13;
  objc_msgSend(MEMORY[0x24BDD3BD0], "activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:", v0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v1;
  v25[1] = *MEMORY[0x24BDD2C30];
  objc_msgSend(MEMORY[0x24BDD3BD0], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v0, MGGetBoolAnswer());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v2;
  objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v3;
  objc_msgSend(MEMORY[0x24BDD3BD0], "currentCountryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v5;
  v25[2] = *MEMORY[0x24BDD2C80];
  HKRPUsageRequirementsForFeatureIdentifier(v0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  v25[3] = *MEMORY[0x24BDD2CA8];
  HKRPUsageRequirementsForFeatureIdentifier(v0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v15, "initWithRequirementsByContext:", v9);

  return v10;
}

id HKRPUsageRequirementsForFeatureIdentifier(void *a1)
{
  void *v1;
  id v2;
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
  void *v14;
  void *v15;
  _QWORD v16[12];

  v16[11] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD3BD0];
  v2 = a1;
  objc_msgSend(v1, "profileIsNotFamilySetupPairingProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x24BDD3BD0], "notAgeGatedForUserDefaultsKey:", *MEMORY[0x24BDD2F60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend(MEMORY[0x24BDD3BD0], "activeRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapabilityForFeatureWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  objc_msgSend(MEMORY[0x24BDD3BD0], "capabilityIsSupportedOnActiveWatchForFeatureWithIdentifier:supportedOnLocalDevice:", v2, MGGetBoolAnswer());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  objc_msgSend(MEMORY[0x24BDD3BD0], "bloodOxygenRecordingsAreEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  objc_msgSend(MEMORY[0x24BDD3BD0], "onboardingRecordIsPresentForFeatureWithIdentifier:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v6;
  objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnActiveRemoteDeviceForFeatureWithIdentifier:isSupportedIfCountryListMissing:", v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v7;
  objc_msgSend(MEMORY[0x24BDD3BD0], "countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v8;
  objc_msgSend(MEMORY[0x24BDD3BD0], "featureIsNotRemotelyDisabledWithIdentifier:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v9;
  objc_msgSend(MEMORY[0x24BDD3BD0], "healthAppIsNotHidden");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v10;
  objc_msgSend(MEMORY[0x24BDD3BD0], "activeWatchIsNotUnderInternalDevelopmentImportExclusionForFeatureWithIdentifier:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[10] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_21219AE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21219B214(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

id HKRPLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24CD49E00, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *HKRPStringFromHKRPOxygenSaturationSessionEndReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Completed");
  else
    return off_24CD49728[a1 - 1];
}

uint64_t HKRPShouldSkipRegionCheck()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("HKRPSkipRegionCheck"));

  return v1;
}

uint64_t HKRPShouldSkipOnboardingCompletedCheck()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("HKRPSkipOnboardingCompletedCheck"));

  return v1;
}

uint64_t HKRPShouldInstallOxygenSaturationWatchAppOnPairedWatch(void *a1)
{
  id v1;
  HKRPWatchAppInstallability *v2;
  uint64_t v3;

  v1 = a1;
  v2 = -[HKRPWatchAppInstallability initWithDevice:]([HKRPWatchAppInstallability alloc], "initWithDevice:", v1);

  v3 = -[HKRPWatchAppInstallability shouldInstallWatchApp](v2, "shouldInstallWatchApp");
  return v3;
}

uint64_t HKRPOxygenSaturationLocalFeatureAttributes()
{
  return objc_msgSend(MEMORY[0x24BDD3BA8], "featureAttributesDerivedFromOSBuildAndFeatureVersion:", *MEMORY[0x24BDD32D0]);
}

uint64_t sub_21219CE80()
{
  uint64_t v0;

  v0 = sub_21219D650();
  __swift_allocate_value_buffer(v0, qword_254B48310);
  __swift_project_value_buffer(v0, (uint64_t)qword_254B48310);
  return sub_21219D644();
}

uint64_t static Logger.bloodOxygen.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254B48308 != -1)
    swift_once();
  v2 = sub_21219D650();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254B48310);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_21219D644()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21219D650()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKFeatureFlagBloodOxygenSaturationEnabled()
{
  return MEMORY[0x24BDD2DC0]();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return MEMORY[0x24BDD32F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromHKFeatureAvailabilityOnboardedCountrySupportedState()
{
  return MEMORY[0x24BDD38A8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

