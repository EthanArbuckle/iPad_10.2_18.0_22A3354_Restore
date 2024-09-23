@implementation LoadFinHealthCore

void *__LoadFinHealthCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FinHealthCore.framework/FinHealthCore", 2);
  qword_1EE4F91C0 = (uint64_t)result;
  return result;
}

void *__LoadFinHealthCore_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FinHealthCore.framework/FinHealthCore", 2);
  qword_1EE4F93E8 = (uint64_t)result;
  return result;
}

@end
