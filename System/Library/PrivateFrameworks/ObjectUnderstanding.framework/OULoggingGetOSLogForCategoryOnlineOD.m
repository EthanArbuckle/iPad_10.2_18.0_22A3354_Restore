@implementation OULoggingGetOSLogForCategoryOnlineOD

os_log_t ___OULoggingGetOSLogForCategoryOnlineOD_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.ObjectUnderstanding", "OnlineOD");
  _OULoggingGetOSLogForCategoryOnlineOD_oslog = (uint64_t)result;
  return result;
}

@end
