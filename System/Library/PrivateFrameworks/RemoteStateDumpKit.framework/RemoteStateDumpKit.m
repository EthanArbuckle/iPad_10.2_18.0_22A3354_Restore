void sub_21950FC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCNearbyServiceBrowserClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
  {
    MultipeerConnectivityLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MultipeerConnectivityLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getMCNearbyServiceBrowserClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("MCNearbyServiceBrowser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getMCNearbyServiceBrowserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2195103B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCPeerIDClass_block_invoke(uint64_t a1)
{
  Class result;

  MultipeerConnectivityLibrary();
  result = objc_getClass("MCPeerID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCPeerIDClass_block_invoke_cold_1();
  getMCPeerIDClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void MultipeerConnectivityLibrary()
{
  void *v0;

  if (!MultipeerConnectivityLibraryCore_frameworkLibrary_0)
    MultipeerConnectivityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!MultipeerConnectivityLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getMCSessionClass_block_invoke(uint64_t a1)
{
  Class result;

  MultipeerConnectivityLibrary();
  result = objc_getClass("MCSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getMCSessionClass_block_invoke_cold_1();
  getMCSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_219511800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCNearbyServiceAdvertiserClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!MultipeerConnectivityLibraryCore_frameworkLibrary_1)
  {
    MultipeerConnectivityLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!MultipeerConnectivityLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
LABEL_6:
      __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("MCNearbyServiceAdvertiser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getMCNearbyServiceAdvertiserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getMCNearbyServiceBrowserClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMCPeerIDClass_block_invoke_cold_1(v0);
}

void __getMCPeerIDClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMCSessionClass_block_invoke_cold_1(v0);
}

void __getMCSessionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1(v0);
}

void __getMCNearbyServiceAdvertiserClass_block_invoke_cold_1()
{
  objc_class *v0;

  v0 = (objc_class *)abort_report_np();
  NSStringFromClass(v0);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
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

