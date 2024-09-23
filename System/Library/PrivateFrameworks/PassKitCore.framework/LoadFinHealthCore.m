@implementation LoadFinHealthCore

void *__LoadFinHealthCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FinHealthCore.framework/FinHealthCore", 2);
  qword_1EE1DB6C8 = (uint64_t)result;
  return result;
}

@end
