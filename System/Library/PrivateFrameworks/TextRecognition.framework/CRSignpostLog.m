@implementation CRSignpostLog

os_log_t __CRSignpostLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.CoreRecognition", "SignPosts");
  CRSignpostLog_signPostOSLog = (uint64_t)result;
  return result;
}

@end
