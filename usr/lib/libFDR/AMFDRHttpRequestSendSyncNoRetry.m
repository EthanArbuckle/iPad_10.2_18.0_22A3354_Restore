@implementation AMFDRHttpRequestSendSyncNoRetry

const __CFString *___AMFDRHttpRequestSendSyncNoRetry_block_invoke()
{
  const __CFString *result;

  result = AMFDRSealingMapCallMGCopyAnswer(CFSTR("HWModelStr"), 0);
  _AMFDRHttpRequestSendSyncNoRetry_hardwareModel = (uint64_t)result;
  if (!result)
    return (const __CFString *)AMSupportLogInternal();
  return result;
}

@end
