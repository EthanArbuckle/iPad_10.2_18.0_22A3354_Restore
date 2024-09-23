@implementation SBLogThermal

void __SBLogThermal_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "Thermal");
  v1 = (void *)SBLogThermal___logObj;
  SBLogThermal___logObj = (uint64_t)v0;

}

@end
