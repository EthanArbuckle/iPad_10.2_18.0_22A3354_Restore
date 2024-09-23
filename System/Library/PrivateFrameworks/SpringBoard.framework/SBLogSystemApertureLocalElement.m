@implementation SBLogSystemApertureLocalElement

void __SBLogSystemApertureLocalElement_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemApertureLocalElement");
  v1 = (void *)SBLogSystemApertureLocalElement___logObj;
  SBLogSystemApertureLocalElement___logObj = (uint64_t)v0;

}

@end
