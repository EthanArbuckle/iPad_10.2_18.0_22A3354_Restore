@implementation NFHardwareSerialCreateSources

void ___NFHardwareSerialCreateSources_block_invoke()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "_NFHardwareSerialCreateSources_block_invoke", 1067);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialCreateSources_block_invoke";
    v5 = 1024;
    v6 = 1067;
    _os_log_impl(&dword_2295E9000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

void ___NFHardwareSerialCreateSources_block_invoke_2()
{
  const void **v0;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (const void **)MEMORY[0x24BEDCDB0];
  dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(3, "%s:%i Error ! Unexpected invocation of write handler", "_NFHardwareSerialCreateSources_block_invoke_2", 1077);
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialCreateSources_block_invoke_2";
    v5 = 1024;
    v6 = 1077;
    _os_log_impl(&dword_2295E9000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of write handler", buf, 0x12u);
  }
}

uint64_t ___NFHardwareSerialCreateSources_block_invoke_131(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

@end
