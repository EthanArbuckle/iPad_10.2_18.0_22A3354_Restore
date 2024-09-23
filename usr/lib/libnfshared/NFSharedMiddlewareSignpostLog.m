@implementation NFSharedMiddlewareSignpostLog

os_log_t __NFSharedMiddlewareSignpostLog_block_invoke()
{
  os_log_t result;

  qword_1ECFF6A70 = (uint64_t)os_log_create("com.apple.nfc.middleware.signpost", "Primary");
  result = os_log_create("com.apple.nfc.middleware.signpost", "Secondary");
  qword_1ECFF6A78 = (uint64_t)result;
  return result;
}

@end
