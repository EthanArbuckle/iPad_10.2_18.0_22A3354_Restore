@implementation IOReportCreateSubscription

uint64_t __IOReportCreateSubscription_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __IOReportSubscriptionTypeID = result;
  return result;
}

uint64_t __IOReportCreateSubscription_block_invoke_2()
{
  return 0;
}

@end
