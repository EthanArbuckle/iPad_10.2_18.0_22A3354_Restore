@implementation PLAirPlayGetLog

void __PLAirPlayGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D71100], "AirPlay");
  v1 = (void *)PLAirPlayGetLog_log;
  PLAirPlayGetLog_log = (uint64_t)v0;

}

@end
