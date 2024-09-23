@implementation UIFaultDebugAssertLog

os_log_t ____UIFaultDebugAssertLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.UIKit", "DebugAssertion");
  qword_1ECD81E18 = (uint64_t)result;
  return result;
}

@end
