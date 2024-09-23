@implementation SBLogDodging

void __SBLogDodging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "Dodging");
  v1 = (void *)SBLogDodging___logObj;
  SBLogDodging___logObj = (uint64_t)v0;

}

@end
