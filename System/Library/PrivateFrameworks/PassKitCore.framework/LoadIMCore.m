@implementation LoadIMCore

void *__LoadIMCore_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IMCore.framework/IMCore", 2);
  qword_1EE1C56D8 = (uint64_t)result;
  return result;
}

@end
