@implementation LoadBusinessChat

void *__LoadBusinessChat_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/BusinessChat.framework/BusinessChat", 2);
  qword_1EE4C83F8 = (uint64_t)result;
  return result;
}

@end
