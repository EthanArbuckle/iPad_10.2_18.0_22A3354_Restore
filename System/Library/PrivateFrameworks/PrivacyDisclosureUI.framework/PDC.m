@implementation PDC

void __PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivacyDisclosureUI", "PrivacyDisclosureUI");
  v1 = (void *)PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_log;
  PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_log = (uint64_t)v0;

}

@end
