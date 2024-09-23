@implementation VSGetLogEvent

void __VSGetLogEvent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.voiceserviceslogging", "event");
  v1 = (void *)VSGetLogEvent___profile_log_event;
  VSGetLogEvent___profile_log_event = (uint64_t)v0;

}

@end
