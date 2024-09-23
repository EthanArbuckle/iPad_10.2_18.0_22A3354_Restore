@implementation DarkShadowCache

id ___DarkShadowCache_block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  qword_1ECD78B48 = (uint64_t)result;
  return result;
}

@end
