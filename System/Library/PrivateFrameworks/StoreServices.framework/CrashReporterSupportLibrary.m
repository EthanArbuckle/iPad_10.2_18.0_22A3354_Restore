@implementation CrashReporterSupportLibrary

void *__CrashReporterSupportLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  CrashReporterSupportLibrary_sLib = (uint64_t)result;
  return result;
}

@end
