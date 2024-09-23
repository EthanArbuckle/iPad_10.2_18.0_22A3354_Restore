@implementation RCSharedLog

void __RCSharedLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)RCLogSubsystemIdentifier, "RemoteConfiguration");
  v1 = (void *)RCSharedLog_result;
  RCSharedLog_result = (uint64_t)v0;

}

@end
