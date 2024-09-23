@implementation VSGetLogDefault

void __VSGetLogDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.voiceserviceslogging", "default");
  v1 = (void *)VSGetLogDefault___profile_log_default;
  VSGetLogDefault___profile_log_default = (uint64_t)v0;

}

@end
