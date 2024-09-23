uint64_t WebAppMainEntry(int a1, char **a2)
{
  char __value[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  getpid();
  if (!sandbox_container_path_for_pid())
  {
    setenv("HOME", __value, 1);
    setenv("CFFIXED_USER_HOME", __value, 1);
    if ((unint64_t)__strlcat_chk() >= 0x400)
      exit(1);
    setenv("TMPDIR", __value, 1);
  }
  return UIApplicationMain(a1, a2, 0, CFSTR("AppDelegate"));
}

id viewServiceLog()
{
  if (viewServiceLog_onceToken != -1)
    dispatch_once(&viewServiceLog_onceToken, &__block_literal_global);
  return (id)viewServiceLog_log;
}

void __viewServiceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.mobilesafari", "ViewService");
  v1 = (void *)viewServiceLog_log;
  viewServiceLog_log = (uint64_t)v0;

}

id getCPSPromiseClass()
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
  v0 = (void *)getCPSPromiseClass_softClass;
  v7 = getCPSPromiseClass_softClass;
  if (!getCPSPromiseClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCPSPromiseClass_block_invoke;
    v3[3] = &unk_24FA28590;
    v3[4] = &v4;
    __getCPSPromiseClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22E2913A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E291610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCPSPromiseClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FA285B0;
    v5 = 0;
    ClipServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ClipServicesLibraryCore_frameworkLibrary)
    __getCPSPromiseClass_block_invoke_cold_1(&v3);
  result = objc_getClass("CPSPromise");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCPSPromiseClass_block_invoke_cold_2();
  getCPSPromiseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id webClipIdentifierFromLaunchURL(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(a1, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", v3))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v3, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __getCPSPromiseClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ClipServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WebAppViewController.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCPSPromiseClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;
  CGRect v2;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCPSPromiseClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WebAppViewController.m"), 22, CFSTR("Unable to find class %s"), "CPSPromise");

  __break(1u);
  CGRectGetHeight(v2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x24BE74F60]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x24BE74F68]();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return MEMORY[0x24BDF7560](*(_QWORD *)&argc, argv, principalClassName, delegateClassName);
}

uint64_t UIStatusBarStyleFromUIWebClipStatusBarStyle()
{
  return MEMORY[0x24BDF7DB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x24BDAFBF0]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x24BDAFD10](__name, __value, *(_QWORD *)&__overwrite);
}

