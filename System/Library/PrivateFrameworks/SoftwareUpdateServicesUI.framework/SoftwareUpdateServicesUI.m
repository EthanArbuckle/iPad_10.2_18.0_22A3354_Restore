uint64_t SUSUISetupAssistantNeedsToRun()
{
  char v1;

  v1 = 0;
  if (MEMORY[0x24BE85858])
    v1 = BYSetupAssistantNeedsToRun() & 1;
  return v1 & 1;
}

uint64_t SUSUIRequiresAlertPresentationAfterUpdate()
{
  int v1;
  char v2;
  SUSUIPreferences *v3;
  char v4;
  SUSUIPreferences *v5;
  id location;
  char v7;

  location = objc_alloc_init(SUSUISoftwareUpdateDefaults);
  v4 = 0;
  v2 = 0;
  if ((objc_msgSend(location, "needsAlertPresentationAfterOTAUpdate") & 1) != 0
    || (v5 = +[SUSUIPreferences sharedInstance](SUSUIPreferences, "sharedInstance"),
        v4 = 1,
        LOBYTE(v1) = 0,
        -[SUSUIPreferences needsAlertPresentationAfterOTAUpdate](v5, "needsAlertPresentationAfterOTAUpdate")))
  {
    LOBYTE(v1) = 0;
    if ((SUSUISetupAssistantNeedsToRun() & 1) == 0)
    {
      v3 = +[SUSUIPreferences sharedInstance](SUSUIPreferences, "sharedInstance");
      v2 = 1;
      v1 = !-[SUSUIPreferences preventPostUpdateAlert](v3, "preventPostUpdateAlert");
    }
  }
  v7 = v1 & 1;
  if ((v2 & 1) != 0)

  if ((v4 & 1) != 0)
  objc_storeStrong(&location, 0);
  return v7 & 1;
}

void SUSUICreateInstallationKeybagWithSecret(id obj)
{
  NSObject *queue;
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(_QWORD *);
  void *v6;
  id v7;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  queue = dispatch_get_global_queue(21, 0);
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __SUSUICreateInstallationKeybagWithSecret_block_invoke;
  v6 = &unk_24DA407F0;
  v7 = location;
  dispatch_async(queue, &v2);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void SUSUICreateInstallationKeybagWithSecretAndHandler(void *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *);
  void *v8;
  id v9;
  id v10;
  id v11;
  id location;

  location = 0;
  objc_storeStrong(&location, a1);
  v11 = 0;
  objc_storeStrong(&v11, a2);
  queue = dispatch_get_global_queue(21, 0);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __SUSUICreateInstallationKeybagWithSecretAndHandler_block_invoke;
  v8 = &unk_24DA40818;
  v9 = location;
  v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

void SUSUIGetPasscodePolicy(id obj)
{
  NSObject *queue;
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(id *);
  void *v6;
  id v7;
  int v8;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  if (location)
  {
    queue = dispatch_get_global_queue(21, 0);
    v2 = MEMORY[0x24BDAC760];
    v3 = -1073741824;
    v4 = 0;
    v5 = __SUSUIGetPasscodePolicy_block_invoke;
    v6 = &unk_24DA40868;
    v7 = location;
    dispatch_async(queue, &v2);

    objc_storeStrong(&v7, 0);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  objc_storeStrong(&location, 0);
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_218F4AE18()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t suPasscodePolicyToSUSUIPasscodePolicyType(uint64_t a1)
{
  uint64_t v2;

  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
  }
  return v2;
}

void sub_218F4CBC8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __SUSUIPreferencesChanged(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v5;
  uint64_t block;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = a1;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  v12 = a5;
  v5 = MEMORY[0x24BDAC9B8];
  block = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = ____SUSUIPreferencesChanged_block_invoke;
  v10 = &__block_descriptor_40_e5_v8__0l;
  v11 = v15;
  dispatch_async(v5, &block);

}

id SUSUILog()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILog___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_1);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILog___instance;
}

id SUSUILogAuthenticationUI()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILogAuthenticationUI___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_2);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILogAuthenticationUI___instance;
}

id SUSUILogEmergencyCallUI()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILogEmergencyCallUI___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_4);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILogEmergencyCallUI___instance;
}

id SUSUILogKeybagInterface()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILogKeybagInterface___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_6);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILogKeybagInterface___instance;
}

id SUSUILogPostUpdateAlert()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILogPostUpdateAlert___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_8);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILogPostUpdateAlert___instance;
}

id SUSUILogLaggardsUI()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILogLaggardsUI___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_10);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILogLaggardsUI___instance;
}

id SUSUILogExtension()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&SUSUILogExtension___once;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_12);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)SUSUILogExtension___instance;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE0BD28]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x24BE0BD30]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x24BE85858]();
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

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x24BE3D620]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x24BE67170]();
}

uint64_t MKBLockDeviceNow()
{
  return MEMORY[0x24BE671D0]();
}

uint64_t MKBUnlockDevice()
{
  return MEMORY[0x24BE671D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

