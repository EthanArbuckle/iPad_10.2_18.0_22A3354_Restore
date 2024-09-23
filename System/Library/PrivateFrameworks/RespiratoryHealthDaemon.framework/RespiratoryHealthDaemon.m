id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_0_0(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_3_0(uint64_t a1, void *a2)
{
  return a2;
}

id HDRPOxygenSaturationRecordingFeatureAvailabilityProvider(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v25;

  v1 = *MEMORY[0x24BDD2E48];
  v2 = (void *)MEMORY[0x24BDD4198];
  v3 = a1;
  objc_msgSend(v2, "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BD3A4341-7090-4622-9694-2AC0F536C478"));
  v7 = objc_alloc(MEMORY[0x24BE40AE0]);
  objc_msgSend(MEMORY[0x24BE808B0], "allowedCountrySet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v7, "initWithFeatureIdentifier:defaultCountrySet:healthDaemon:", v1, v8, v9);

  v10 = objc_alloc(MEMORY[0x24BE40B60]);
  HKRPOxygenSaturationLocalFeatureAttributes();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFeatureIdentifier:localFeatureAttributes:localCountrySetAvailabilityProvider:", v1, v11, v25);

  objc_msgSend(v12, "synchronizeLocalProperties");
  v13 = objc_alloc(MEMORY[0x24BE40A20]);
  objc_msgSend(v3, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (_QWORD *)MEMORY[0x24BDD3050];
  v16 = (void *)objc_msgSend(v13, "initWithDaemon:allowedCountriesDataSource:loggingCategory:", v14, v12, *MEMORY[0x24BDD3050]);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40CE8]), "initWithAllowedCountriesDataSource:profile:featureCapability:loggingCategory:", v16, v3, v6, *v15);
  v18 = objc_alloc(MEMORY[0x24BE40B50]);
  objc_msgSend(v3, "daemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithDaemon:featureIdentifier:", v19, v1);

  v21 = objc_alloc(MEMORY[0x24BE40AB8]);
  HKRPOxygenSaturationFeatureAvailabilityRequirements();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithProfile:featureIdentifier:availabilityRequirements:currentOnboardingVersion:pairedDeviceCapability:regionAvailabilityProvider:disableAndExpiryProvider:loggingCategory:", v3, v1, v22, 1, v6, v17, v20, *v15);

  return v23;
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x24BE1A1A8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t HDDataEntityPredicateForObjectsFromAppleWatchSources()
{
  return MEMORY[0x24BE40848]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x24BE40920]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x24BDD2B20]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x24BDD2B28]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x24BDD2F40]();
}

uint64_t HKOxygenSaturationLowBarometricPressureThresholdQuantity()
{
  return MEMORY[0x24BDD32C8]();
}

uint64_t HKRPOxygenSaturationFeatureAvailabilityRequirements()
{
  return MEMORY[0x24BE80890]();
}

uint64_t HKRPOxygenSaturationLocalFeatureAttributes()
{
  return MEMORY[0x24BE80898]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

