@implementation SBLogWallet

void __SBLogWallet_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "Wallet");
  v1 = (void *)SBLogWallet___logObj;
  SBLogWallet___logObj = (uint64_t)v0;

}

@end
