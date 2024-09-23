@implementation OSARTCIsProcessOfInterest

void __OSARTCIsProcessOfInterest_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("analyticsd"), CFSTR("SubmitDiagInfo"), CFSTR("osanalyticshelper"), CFSTR("OTACrashCopier"), CFSTR("ProxiedCrashCopier"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)OSARTCIsProcessOfInterest_processSet;
  OSARTCIsProcessOfInterest_processSet = v0;

}

@end
