@implementation OSLogInit

void __OSLogInit_block_invoke()
{
  os_log_t v0;
  void *v1;
  void *v2;

  v0 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  v1 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v0;

  v2 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __OSLogInit_block_invoke_cold_1();
    v2 = (void *)__osLogPearlLib;
  }
  objc_storeStrong((id *)&__osLogPearlLibTrace, v2);
}

void __OSLogInit_block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2218D1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

@end
