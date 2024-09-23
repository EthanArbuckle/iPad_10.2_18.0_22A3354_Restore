@implementation SBLogIconDragging

void __SBLogIconDragging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "IconDragging");
  v1 = (void *)SBLogIconDragging___logObj;
  SBLogIconDragging___logObj = (uint64_t)v0;

}

@end
