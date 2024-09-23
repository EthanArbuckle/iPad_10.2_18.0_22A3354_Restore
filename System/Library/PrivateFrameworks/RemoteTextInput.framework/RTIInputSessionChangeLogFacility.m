@implementation RTIInputSessionChangeLogFacility

void __RTIInputSessionChangeLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.RemoteTextInput", "InputSessionChange");
  v1 = (void *)RTIInputSessionChangeLogFacility_logFacility;
  RTIInputSessionChangeLogFacility_logFacility = (uint64_t)v0;

}

@end
