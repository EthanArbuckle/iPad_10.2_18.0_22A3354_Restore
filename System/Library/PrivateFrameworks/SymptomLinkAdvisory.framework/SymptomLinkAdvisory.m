id aluManagerLogHandle()
{
  if (aluManagerLogHandle_aluManagerHandlePred != -1)
    dispatch_once(&aluManagerLogHandle_aluManagerHandlePred, &__block_literal_global);
  return (id)aluManagerLogHandle_aluManagerHandle;
}

void __aluManagerLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsframework", "alumanager");
  v1 = (void *)aluManagerLogHandle_aluManagerHandle;
  aluManagerLogHandle_aluManagerHandle = (uint64_t)v0;

}

id connManagerLogHandle()
{
  if (connManagerLogHandle_connManagerHandlePred != -1)
    dispatch_once(&connManagerLogHandle_connManagerHandlePred, &__block_literal_global_3);
  return (id)connManagerLogHandle_connManagerHandle;
}

void __connManagerLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsframework", "connmanager");
  v1 = (void *)connManagerLogHandle_connManagerHandle;
  connManagerLogHandle_connManagerHandle = (uint64_t)v0;

}

id nwActReporterLogHandle()
{
  if (nwActReporterLogHandle_nwActReporterHandlePred != -1)
    dispatch_once(&nwActReporterLogHandle_nwActReporterHandlePred, &__block_literal_global_5);
  return (id)nwActReporterLogHandle_nwActReporterLogHandle;
}

void __nwActReporterLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.symptomsframework", "nwactreporter");
  v1 = (void *)nwActReporterLogHandle_nwActReporterLogHandle;
  nwActReporterLogHandle_nwActReporterLogHandle = (uint64_t)v0;

}

void sub_247C48308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *ALULinkAdvisoryToString()
{
  return CFSTR("None");
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

