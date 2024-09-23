id HDSleepHealthDaemonPluginServerInterface()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FC408);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_updateCurrentSleepSchedules_sleepDurationGoal_completion_, 0, 0);
  v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion_, 0, 0);
  return v0;
}

uint64_t HKSleepHealthStoreInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FB3F0);
}

void sub_20A367FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_20A36813C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_20A3682A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

id _HKSHSafeAverageDurationRoundedToNearestMinute(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v10;

  if (a1 < 1)
    return 0;
  v10 = v4;
  v6 = a2 / (double)a1;
  v7 = fmod(v6, 60.0);
  if (v7 >= 30.0)
    v8 = 60.0 - v7;
  else
    v8 = -v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 + v8, v5, v10, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_20A36AB68(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

id HKSHCreatePossibleSleepApneaDetectedNotificationRequest(void *a1)
{
  id v1;
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

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("POSSIBLE_SLEEP_APNEA_DETECTED_TITLE"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("POSSIBLE_SLEEP_APNEA_DETECTED_BODY"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBody:", v4);

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSound:", v5);

  objc_msgSend(v2, "setCategoryIdentifier:", CFSTR("PossibleSleepApnea"));
  objc_msgSend(v2, "setThreadIdentifier:", CFSTR("SleepApneaNotificationsThreadCategory"));
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24C304390, *MEMORY[0x24BDD46A8]);
    HKSHSleepApneaEventSampleDetailsLink((uint64_t)v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD46B0]);

    objc_msgSend(v2, "setUserInfo:", v6);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDate:", v9);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_dateByAddingDays:toDate:", 1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExpirationDate:", v11);

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("HealthApp.SleepApneaNotifications"), v2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id HKSHSleepApneaEventSampleDetailsLink(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x-apple-health://SleepHealthAppPlugin.healthplugin/%@/%@"), CFSTR("SleepApneaEventSampleDetail"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t HKSHSleepApneaControlClientInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FA7F0);
}

id HKSHSleepApneaControlServerInterface()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FC468);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_getBreathingDisturbanceSamplesInDateInterval_completion_, 0, 1);
  return v0;
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x24BDD27F0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _HKCategoryValueSleepAnalysisAsleepValues()
{
  return MEMORY[0x24BDD42B8]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x24BDD4338]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x24BDD4340]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

