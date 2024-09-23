@implementation SBLogAppLibrary

void __SBLogAppLibrary_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D22BF8], "sb.default");
  v1 = (void *)SBLogAppLibrary___logObj;
  SBLogAppLibrary___logObj = (uint64_t)v0;

}

@end
