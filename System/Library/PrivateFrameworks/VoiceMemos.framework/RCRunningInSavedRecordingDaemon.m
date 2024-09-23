@implementation RCRunningInSavedRecordingDaemon

Class __RCRunningInSavedRecordingDaemon_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("SavedRecordingService"));
  RCRunningInSavedRecordingDaemon_runningInDaemon = result != 0;
  return result;
}

@end
