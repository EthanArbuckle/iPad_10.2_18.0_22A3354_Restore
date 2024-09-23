@implementation SBLogAppPlaceholder

void __SBLogAppPlaceholder_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D22BF8], "sb.placeholder");
  v1 = (void *)SBLogAppPlaceholder___logObj;
  SBLogAppPlaceholder___logObj = (uint64_t)v0;

}

@end
