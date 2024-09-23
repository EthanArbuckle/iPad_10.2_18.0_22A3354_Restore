@implementation OSLogInit

os_log_t __OSLogInit_block_invoke()
{
  os_log_t result;
  NSObject *v1;

  result = os_log_create("com.apple.BiometricKit", "Library-MesaFactory");
  __osLog = (uint64_t)result;
  if (!result)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      __OSLogInit_block_invoke_cold_1(&v1);
      result = v1;
    }
    else
    {
      result = 0;
    }
  }
  __osLogTrace = (uint64_t)result;
  return result;
}

void __OSLogInit_block_invoke_cold_1(_QWORD *a1)
{
  uint8_t v2[16];

  *(_WORD *)v2 = 0;
  _os_log_error_impl(&dword_24B319000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-MesaFactory'!\n", v2, 2u);
  *a1 = __osLog;
}

@end
