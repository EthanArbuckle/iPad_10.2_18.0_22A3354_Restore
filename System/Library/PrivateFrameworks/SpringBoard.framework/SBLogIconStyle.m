@implementation SBLogIconStyle

void __SBLogIconStyle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "IconStyle");
  v1 = (void *)SBLogIconStyle___logObj;
  SBLogIconStyle___logObj = (uint64_t)v0;

}

@end
