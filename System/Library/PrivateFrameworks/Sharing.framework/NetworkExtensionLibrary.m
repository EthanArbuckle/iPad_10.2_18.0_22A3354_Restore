@implementation NetworkExtensionLibrary

void *__NetworkExtensionLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/NetworkExtension.framework/NetworkExtension", 2);
  NetworkExtensionLibrary_sLib = (uint64_t)result;
  return result;
}

@end
