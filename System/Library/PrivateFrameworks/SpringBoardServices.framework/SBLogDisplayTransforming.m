@implementation SBLogDisplayTransforming

void __SBLogDisplayTransforming_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DisplayTransforming");
  v1 = (void *)SBLogDisplayTransforming___logObj;
  SBLogDisplayTransforming___logObj = (uint64_t)v0;

}

@end
