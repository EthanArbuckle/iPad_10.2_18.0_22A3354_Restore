@implementation WebKitLibrary

void *__WebKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/WebKit.framework/WebKit", 2);
  WebKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
