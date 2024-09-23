@implementation SRLogBundleRecord

os_log_t __SRLogBundleRecord_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.SensorKit", "SRBundleRecord");
  qword_254419A88 = (uint64_t)result;
  return result;
}

@end
