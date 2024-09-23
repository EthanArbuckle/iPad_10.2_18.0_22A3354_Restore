@implementation PLMomentsGetLog

void __PLMomentsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "Moments");
  v1 = (void *)PLMomentsGetLog_log;
  PLMomentsGetLog_log = (uint64_t)v0;

}

@end
