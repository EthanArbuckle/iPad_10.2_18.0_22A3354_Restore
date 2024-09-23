@implementation SBLogAccessory

void __SBLogAccessory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "Accessory");
  v1 = (void *)SBLogAccessory___logObj;
  SBLogAccessory___logObj = (uint64_t)v0;

}

@end
