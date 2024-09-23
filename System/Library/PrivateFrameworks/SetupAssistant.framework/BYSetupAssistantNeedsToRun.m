@implementation BYSetupAssistantNeedsToRun

uint64_t __BYSetupAssistantNeedsToRun_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)BYSetupAssistantNeedsToRun_dateFormatter;
  BYSetupAssistantNeedsToRun_dateFormatter = v0;

  return objc_msgSend((id)BYSetupAssistantNeedsToRun_dateFormatter, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ssZ"));
}

@end
