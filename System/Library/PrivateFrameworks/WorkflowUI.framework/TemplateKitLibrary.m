@implementation TemplateKitLibrary

void *__TemplateKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/TemplateKit.framework/TemplateKit", 2);
  TemplateKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
