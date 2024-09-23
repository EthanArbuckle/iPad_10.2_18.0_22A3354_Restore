@implementation NETRBLogCreate

void __NETRBLogCreate_block_invoke()
{
  __netrbLog = (uint64_t)os_log_create("com.apple.MobileInternetSharing", "framework.netrb");
  if (!__netrbLog)
  {
    NETRBLogCreate_error = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __NETRBLogCreate_block_invoke_cold_1();
  }
}

void __NETRBLogCreate_block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219FC8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

@end
