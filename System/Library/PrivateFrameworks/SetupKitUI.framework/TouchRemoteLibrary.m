@implementation TouchRemoteLibrary

void *__TouchRemoteLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/TouchRemote.framework/TouchRemote", 2);
  TouchRemoteLibrary_sLib = (uint64_t)result;
  return result;
}

@end
