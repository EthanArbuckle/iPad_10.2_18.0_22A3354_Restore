@implementation SBLogBacklight

void __SBLogBacklight_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "Backlight");
  v1 = (void *)SBLogBacklight___logObj;
  SBLogBacklight___logObj = (uint64_t)v0;

}

@end
