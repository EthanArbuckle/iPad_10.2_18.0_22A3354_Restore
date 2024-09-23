@implementation SBLogSystemApertureOrientation

void __SBLogSystemApertureOrientation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemApertureOrientation");
  v1 = (void *)SBLogSystemApertureOrientation___logObj;
  SBLogSystemApertureOrientation___logObj = (uint64_t)v0;

}

@end
