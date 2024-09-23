@implementation SBLogBanners

void __SBLogBanners_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "Banners");
  v1 = (void *)SBLogBanners___logObj;
  SBLogBanners___logObj = (uint64_t)v0;

}

@end
