uint64_t SPXPCGetNextClientID()
{
  unsigned int v0;
  uint64_t result;

  if (SPXPCGetNextClientID_sOnce != -1)
    dispatch_once(&SPXPCGetNextClientID_sOnce, &__block_literal_global);
  do
  {
    v0 = __ldaxr((unsigned int *)&SPXPCGetNextClientID_sNext);
    result = v0 + 1;
  }
  while (__stlxr(result, (unsigned int *)&SPXPCGetNextClientID_sNext));
  return result;
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x24BE29650]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x24BE29668]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x24BE29688]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x24BE29910]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x24BDB0440]();
}

