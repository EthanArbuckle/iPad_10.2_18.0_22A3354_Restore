void sub_2479AF930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SearchLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SearchLibraryCore_frameworkLibrary)
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SearchLibraryCore_frameworkLibrary;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2479AFEFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t SearchLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!SearchLibraryCore_frameworkLibrary_0)
    SearchLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = SearchLibraryCore_frameworkLibrary_0;
  if (!SearchLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2479B16DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

uint64_t SearchLibrary_1()
{
  uint64_t v0;
  void *v2;

  if (!SearchLibraryCore_frameworkLibrary_1)
    SearchLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = SearchLibraryCore_frameworkLibrary_1;
  if (!SearchLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
    if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SBSCopyDisplayIdentifiers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t PSApplicationSpecifierForAssistantSection()
{
  return MEMORY[0x24BE75880]();
}

uint64_t PSTableSectionFooterBottomPad()
{
  return MEMORY[0x24BE75D30]();
}

uint64_t PSTextViewInsets()
{
  return MEMORY[0x24BE75D40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

