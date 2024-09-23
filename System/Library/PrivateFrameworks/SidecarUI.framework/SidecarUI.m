id SidecarPresenterLogSubsystem(os_log_type_t type)
{
  uint64_t v2;
  void *v3;

  if (SidecarPresenterLogSubsystem_once != -1)
    dispatch_once(&SidecarPresenterLogSubsystem_once, &__block_literal_global_156);
  v2 = SidecarPresenterLogSubsystem_subsystem;
  if (os_log_type_enabled((os_log_t)SidecarPresenterLogSubsystem_subsystem, type))
    v3 = (void *)v2;
  else
    v3 = 0;
  return v3;
}

uint64_t SidecarOptOutOfReconnect()
{
  return MEMORY[0x24BE90638]();
}

uint64_t SidecarRegisterServiceProvider()
{
  return MEMORY[0x24BE90640]();
}

uint64_t SidecarServiceProviderReady()
{
  return MEMORY[0x24BE90648]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

