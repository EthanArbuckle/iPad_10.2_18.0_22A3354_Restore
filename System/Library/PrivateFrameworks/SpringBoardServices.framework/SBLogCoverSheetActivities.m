@implementation SBLogCoverSheetActivities

void __SBLogCoverSheetActivities_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "CoverSheetActivities");
  v1 = (void *)SBLogCoverSheetActivities___logObj;
  SBLogCoverSheetActivities___logObj = (uint64_t)v0;

}

@end
