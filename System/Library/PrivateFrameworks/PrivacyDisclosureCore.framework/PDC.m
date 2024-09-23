@implementation PDC

void __PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivacyDisclosureCore", "PrivacyDisclosureCore");
  v1 = (void *)PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_log;
  PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore_log = (uint64_t)v0;

}

@end
