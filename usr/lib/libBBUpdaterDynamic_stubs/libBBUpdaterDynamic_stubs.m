uint64_t (*BBUpdaterExtremeCreate())(void)
{
  uint64_t (*result)(void);

  if (_MergedGlobals == -1)
  {
    result = (uint64_t (*)(void))off_25570AE80;
    if (!off_25570AE80)
      return result;
    return (uint64_t (*)(void))result();
  }
  dispatch_once(&_MergedGlobals, &__block_literal_global);
  result = (uint64_t (*)(void))off_25570AE80;
  if (off_25570AE80)
    return (uint64_t (*)(void))result();
  return result;
}

void sBBUpdaterLoadLibrary()
{
  void *v0;
  const char *v1;
  const char *v2;

  if (access("/System/Library/Frameworks/CoreTelephony.framework", 0))
  {
    v0 = dlopen("/usr/lib/libBBUpdaterDynamic.dylib", 261);
    if (!v0)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "failed loading %s\n", "/usr/lib/libBBUpdaterDynamic.dylib");
      off_25570AE88 = 0;
      off_25570AE90 = 0;
      off_25570AE80 = 0;
    }
    v1 = "BBUpdaterExtremeCreate";
    off_25570AE80 = dlsym(v0, "BBUpdaterExtremeCreate");
    if (!off_25570AE80
      || (v1 = "BBUpdaterSetOptions", (off_25570AE88 = dlsym(v0, "BBUpdaterSetOptions")) == 0)
      || (v1 = "BBUpdaterExecCommand", (off_25570AE90 = dlsym(v0, "BBUpdaterExecCommand")) == 0))
    {
      syslog(3, "failed loading %s from %s\n", v1, "/usr/lib/libBBUpdaterDynamic.dylib");
      off_25570AE80 = 0;
      off_25570AE88 = 0;
      off_25570AE90 = 0;
    }
  }
  else
  {
    v2 = getprogname();
    syslog(5, "ummm...why is %s linking with libBBUpdaterDynamic.dylib?\n", v2);
  }
}

uint64_t BBUpdaterSetOptions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  if (_MergedGlobals == -1)
  {
    v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_25570AE88;
    if (off_25570AE88)
      return v6(a1, a2, a3);
  }
  else
  {
    dispatch_once(&_MergedGlobals, &__block_literal_global_2);
    v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_25570AE88;
    if (off_25570AE88)
      return v6(a1, a2, a3);
  }
  return 0;
}

uint64_t BBUpdaterExecCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (_MergedGlobals == -1)
  {
    v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))off_25570AE90;
    if (off_25570AE90)
      return v8(a1, a2, a3, a4);
  }
  else
  {
    dispatch_once(&_MergedGlobals, &__block_literal_global_4);
    v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))off_25570AE90;
    if (off_25570AE90)
      return v8(a1, a2, a3, a4);
  }
  return 0;
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

