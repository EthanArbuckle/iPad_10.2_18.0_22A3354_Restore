Class __initMKMapItem_block_invoke()
{
  Class result;

  if (!MapKitLibrary_frameworkLibrary)
  {
    MapKitLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/MapKit.framework/MapKit", 2);
    if (!MapKitLibrary_frameworkLibrary)
      __assert_rtn("MapKitLibrary", "STMapItem.m", 22, "frameworkLibrary");
  }
  result = objc_getClass("MKMapItem");
  classMKMapItem = (uint64_t)result;
  if (!result)
    __assert_rtn("initMKMapItem_block_invoke", "STMapItem.m", 23, "classMKMapItem");
  return result;
}

id INVocabularyUpdaterFunction()
{
  return (id)classINVocabularyUpdater;
}

id initINVocabularyUpdater()
{
  if (initINVocabularyUpdater_sOnce != -1)
    dispatch_once(&initINVocabularyUpdater_sOnce, &__block_literal_global_276);
  return (id)classINVocabularyUpdater;
}

Class __initINVocabularyUpdater_block_invoke()
{
  Class result;

  if (!IntentsLibrary_frameworkLibrary)
  {
    IntentsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Intents.framework/Intents", 2);
    if (!IntentsLibrary_frameworkLibrary)
      __assert_rtn("IntentsLibrary", "STGenericIntentUtilities.m", 28, "frameworkLibrary");
  }
  result = objc_getClass("INVocabularyUpdater");
  classINVocabularyUpdater = (uint64_t)result;
  if (!result)
    __assert_rtn("initINVocabularyUpdater_block_invoke", "STGenericIntentUtilities.m", 29, "classINVocabularyUpdater");
  getINVocabularyUpdaterClass = INVocabularyUpdaterFunction;
  return result;
}

id HKQuantityFunction()
{
  return (id)classHKQuantity;
}

id initHKQuantity()
{
  if (initHKQuantity_sOnce != -1)
    dispatch_once(&initHKQuantity_sOnce, &__block_literal_global_1285);
  return (id)classHKQuantity;
}

Class __initHKQuantity_block_invoke()
{
  Class result;

  if (HealthKitLibrary_sOnce != -1)
    dispatch_once(&HealthKitLibrary_sOnce, &__block_literal_global_54);
  result = objc_getClass("HKQuantity");
  classHKQuantity = (uint64_t)result;
  getHKQuantityClass = HKQuantityFunction;
  return result;
}

id STStringFromGenericIntentResponseCode(unint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (a1 >= 3)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("INVALID_STGenericIntentResponseCode_%@"), v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1 = *(&off_24DB769D0 + a1);
  }
  return v1;
}

uint64_t AFLogInitIfNeeded()
{
  return MEMORY[0x24BE08E08]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

