@implementation SBLogLabels

void __SBLogLabels_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "Labels");
  v1 = (void *)SBLogLabels___logObj;
  SBLogLabels___logObj = (uint64_t)v0;

}

@end
