@implementation TTKLogFacility

void __TTKLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "TTKLog");
  v1 = (void *)TTKLogFacility_logFacility;
  TTKLogFacility_logFacility = (uint64_t)v0;

}

@end
